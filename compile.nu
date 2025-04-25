const PROJECT_ROOT = (path self | path dirname)
const ORG_PREFIX = 'ORG'
const DRAFT_DIR = "draft";
const RELEASE_DIR = "released";
const HASH_FILE_NAME = "sha256.txt"

def main [doc_number: int, --release (-r)] {

	let doc_code = $"($ORG_PREFIX)-($doc_number)";
	
	let draft_dir = ($PROJECT_ROOT | path join $DRAFT_DIR);

	let folder_path = (
		ls $draft_dir |
		where type == dir |
		where name =~ $"^($draft_dir)/($doc_code)_.+$" |
		get 0.name
	);

	let target_path = (
		ls $folder_path |
		where type == file |
		where name =~ $"^($draft_dir)/($doc_code)_.*/($doc_code)_.*[.]typ$" |
		get 0.name
	);

	print $"Target file: ($target_path)"

	let target_stem = ($target_path | path parse | $in.stem);

	let output_dir = if $release {
		print "Compiling release"
		$PROJECT_ROOT | path join $RELEASE_DIR
	} else {
		print "Compiling draft"
		$folder_path
	}

	let output = ($output_dir | path join $"($target_stem).pdf");

	# hash the target
	
	let hash_path = ($folder_path | path join $HASH_FILE_NAME);

	print $"Hash file path: ($hash_path)"

	if ($hash_path | path exists) {
		let old_hash = open $hash_path;
		print $"Old hash: ($old_hash)"
		let new_hash = (open $target_path | hash sha256);
		print $"New hash: ($new_hash)"
		if ($old_hash != $new_hash) {
				print $"Updating: ($hash_path)"
				$new_hash | save -f $hash_path
		} else {
			print "No update"
		}
	} else {
		let new_hash = (open $target_path | hash sha256);
		print $"New hash: ($new_hash)"
		print $"Updating: ($hash_path)"
		$new_hash | save -f $hash_path
	}

	typst compile  -f pdf --root $PROJECT_ROOT $target_path $output
	print $"Output: ($output)"
}
