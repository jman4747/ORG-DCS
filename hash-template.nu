const PROJECT_ROOT = (path self | path dirname);
const TEMPLATE_FILE_NAME = "template.typ";
const HASH_FILE_NAME = "template.sha256.txt";
const ORG_PREFIX = 'ORG'
const DRAFT_DIR_NAME = "draft";

# Update hashes for Policy document templates if they changed.
def main [] {
	let draft_dir = ($PROJECT_ROOT | path join $DRAFT_DIR_NAME)
	let template_path = ($draft_dir | path join $TEMPLATE_FILE_NAME);

	print $"Template file path: ($template_path)"

	let hash_path = ($draft_dir | path join $HASH_FILE_NAME);

	print $"Hash file path: ($hash_path)"

	if ($hash_path | path exists) {
		let old_hash = open $hash_path;
		print $"Old hash: ($old_hash)"
		let new_hash = (open $template_path | hash sha256);
		print $"New hash: ($new_hash)"
		if ($old_hash != $new_hash) {
				print $"Updating: ($hash_path)"
				$new_hash | save -f $hash_path
		} else {
			print "No update"
		}
	} else {
		let new_hash = (open $template_path | hash sha256);
		print $"New: ($new_hash)"
		print $"Updating ($hash_path)"
		$new_hash | save -f $hash_path
	}
}

