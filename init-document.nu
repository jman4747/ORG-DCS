const PROJECT_ROOT = (path self | path dirname)
const ORG_PREFIX = 'ORG'
const DRAFT_DIR_NAME = "draft";

# Initiallize an ORG document. This must be run from the project root.
def main [title: string] {

  let doc_name = ($title | str replace --all " " "_");
  let title = ($title | str replace --all "_" " ");
  let doc_code = $"($ORG_PREFIX)-X";
  let file_name = $"($doc_code)_($doc_name)";
  let draft_dir = ($PROJECT_ROOT | path join $DRAFT_DIR_NAME);

  let document_dir = ($draft_dir | path join $file_name );
  
  if ($document_dir | path exists) {
    print $"Error: A document with the name: ($file_name) already exists."
    return
  }
  print $"New document directory: ($document_dir)";

  mkdir $document_dir

  let new_doc = ($document_dir | path join $"($file_name).typ");
  print $"Creating: ($new_doc)"

  open --raw ($draft_dir | path join "example" | path join $"($ORG_PREFIX)-X_Example.typ") |
  str replace --all "\"<title>\"" $"\"($title)\"" |
  save $new_doc

  # create initial hash
  let input_hash = open $new_doc | hash sha256;
  $input_hash | save -f $"($document_dir)/sha256.txt";
}
