#import "../template.typ": *

#show: project.with(
	title: "Document Control System",
	authors: (
		(name: "Joshua T.", email: "joshua.turner@frcteamreboot.com"),
	),
	date: "2025-04-26",
	effective_date: "2025-05-03",
	document_number: 1,
	status: "DRAFT",
	purpose: [
		- Define requirements for the Document Control System (DCS).
		- Distinguish working files from organizing documents.
		- Define procedures for documents subject to the DCS:
			- ORGs
			- SDRs
			- TRMs
			- CARs
			- Project Planning Documents (PPD).
			- CWF
	],
	terms: (
		APA: "American Psychological Association",
		CAR: "Corrective Action Report",
		CMD: "Controlled Management Documents",
		CWF: "Controlled Working Files",
		DCS: "Document Control System",
		Directory: "In computing: a location on a hard drive where a files may be stored. Also know as a \"folder\".",
		Git: "The Git version control system",
		GitHub: "A website for managing Git repositories",
		IAW: "In accordance with",
		JSA: "Job Safety Analysis",
		ORG: "Organizational Document type code",
		PPD: "Project Planning Document: either a Project Document (PRJ) or Action Item",
		PRJ: "Project Document type code",
		SHA3-256: "The 256 bit variant of the \"Secure Hash Algorithm\" SHA-3",
	),
)

// This begins the section specific to this document

= Document Control System <dcs>
Certain types of documents - owing to their importance - require a Document Control System (DCS).
The purpose of a DCS is to ensure documents are:
- correct
- easy to locate
- versioned with a transparent history

Control procedures also ensure that team members are know that the document they are referencing is the most up to date version. 

In the context of FRC, the concerns that necessitate building a DCS are as follows:

// move to ORG-0: - Clarify what we do and what we do not do. 
- Find, correct, and prevent future process flaws.
- Manage a complex interdisciplinary project with limited man-hours.
	- Make it easier for mentors to help remotely.
	- Allow all members to work asynchronously.
	- Clearly define roles and expectations between sub-teams.
- Preserve rarely used, but important, processes and techniques.
- Combat the effects of student turnover.

== Controlled Management Documents <dcs_cmd>
Standards (SDR), Training Manuals (TRM), Corrective Action Reports (CAR), Project Documents (PRJ), and Action Items together constitute Controlled Management Documents (CMD).
CMD are distinct because all team activities are defined, planned, and managed through these documents.
All team members will interact with and author some form of CMD throughout normal operations.
Grayson Robotics shall maintain CMD pursuant to the requirements outlined in this standard.

== Controlled Working Files <dcs_cwf>
For these types of files, each sub-team shall maintain its own internal Policy Documents covering proper handling and version control.

These policies shall adhere to the following requirements:
+ Provide a means of versioning files when they are of a type that may be revised.
+ Define a location and procedure for storing the files electronically.
+ Define when and how to notify relevant parties of changes.
+ TODO: what else?

== Common Requirements
For documents written by Grayson Robotics:
+ All documents shall use the Atkinson Hyperlegible Next font when exported or rendered from their source format.
	+  Source code is excluded from this requirement.
+ Authors shall format dates in the ISO 8601 format: yyyy-mm-dd.
+ All documents shall adhere to the Concise Guide to APA Style, seventh Edition, ISBN: 978-1-4338-3273-4, sections 4 and 5.

// TODO: When documents require data external to the source file, such as images,
// the author shall include them in a folder named with the document code with all letters capitalized.

== DCS Repositories <dcs_repo>
DCS repositories (DCSR) are publicly accessible stores of CMD, authored by Grayson Robotics team members.

=== Numbered Document Database (NDD) <ndd>
Numbered documents - ORGs, SDRs, TRMs, CARs, & PRJs - each require a database to keep track of the index.
The file shall be a Tab Separated Value (TSV) spreadsheet file encoded in utf-8. 
The file shall have the following columns:
- document number
- document title
- file name with extension
- document status
- version number
- file name
- date first issued
- date of last change
- SHA3-256 hash of the source file

=== Common DCSR requirements
+ Team members shall publicly review new documents.
+ For each type of CMD, Grayson Robotics shall maintain a public GitHub repository and control procedure.
+ The IT Dept. shall administer control procedures.
+ The Programming Dept. shall, at the request of the IT Dept., assist with creating any software utilities used to aid in administering DCSR.
	+ The Programming and IT Departments shall write all helper scripts and utilities, stored in a DCSR, in the Nushell language.
	+ The Programming and IT Departments shall ensure that all scripts run correctly on Windows and Linux.
+ At least one teacher at Grayson high school shall own - or be a co-owner of - all GitHub repositories.
+ Team members shall obtain unanimous approval from the relevant sub-teams prior to updating a document.
+ The repository shall be impossible to physically update without at least 2 team members intending to do so.
+ The IT team shall notify all team members of any change to the form, structure, implementation, or location of the repository that goes beyond updating a single controlled document prior to said change.
+ Team members shall create all data in formats that are viewable and editable via free software.
+ Team members shall author all CMD in a text format rather than a binary format.
	+ The intent is to keep content viewable via the built-in rendering feature of GitHub or similar services. For example:
		+ #link("https://commonmark.org/", "Markdown")
		+ HTML
		+ #link("https://typst.app/docs", "Typst")
	+ A controlled document, written in one of the above formats, shall reference content in other formats when that content isn't embedded.
	+ For Typst sources, after the file is approved and released, the author shall export the file to PDF and store it in the corresponding release directory.
+ Authors shall name all files free of spaces
	+ Authors shall use underscores in lieu of spaces
+ Authors shall chose titles that are unique from all other documents of the same type.
+ The IT team shall maintain directory structure and files for each DCSR.

=== Requirements for numbered documents
+ Authors shall number documents sequentially, in the order they're created.
+ A document number shall be unique from all other documents of the same type.

==== Standard control information <standard_ctrl_info>
Where applicable, as defined later in this document,
authors shall include the following control information:
- Document Type: ORG, TRN, etc.
- Document Number
- Status
	- Issued: Approved and in use.
	- Draft: New or update suitable for review.
	- Depreciated: Previously issued but no longer for active use.
- Version Number
- Effective Date
- Source Repository (A link to its DCSR).

==== Document Codes <doc_code>
Document Codes uniquely identify all numbered documents.
The document code is the combination of the Type Code and Document Number with a single hyphen in between.
For example: "ORG-1" is the Document Code for this document.

Document codes are constructed as follows:
- Three letter Type Code:
	- ORG: Organizational Standard
	- SDR: Standard
	- TRM: Training Manual
	- CAR: Corrective Action Report
	- PRJ: Project Document
- Hyphen character: "-"
- Document Number:
	- Sequential integer number.
	- Unique between documents of the same type.

All team members shall write, type, or otherwise represent document codes with all letters capitalized.

=== Edit & Pull Request process <pr>
Authors shall use GitHub Pull Requests (PR) to submit documents and updates to each DCSR:
+ Fork the GitHub repository
	+ Clone the fork to your computer locally
+ Make edits
	+ change and add content
	+ check structure against this standard and ORG-0.
	+ update hash file
	+ update NDD
+ Commit
	+ Describe changes in message
+ push to fork
+ Submit PR
	+ reference the PPD
+ Discus and edit using GitHub's PR comment system

At the discretion of the IT Dept., the Author or the IT Dept. shall "squash" and Rebase commits on the fork prior to merging the PR.

== ORG DCSR
+ The GitHub repository is named: ORG-DCS.
+ The URL is: TBD
+ Team members shall author documents using the given template: `draft/template.typ` shown in @org_dir_structure.
+ The IT Dept. shall ensure that the template automatically sets up the document IAW: @sdr_doc_structure.

=== ORG directory structure <org_dir_structure>
All file names are case sensitive.

The IT Dept. shall maintain the structure of the root directory of the repository as follows:
- Team logo: `8100-logo.svg`
- General instructions file: `README.md`
- CC0 license for all documents: `LICENSE`
- NND spreadsheet: `ORG-NDD.tsv`
- Helper script to compile Typst source files: `compile.nu`
- Helper script to generate a hash of the template: `hash-template.nu`
- Helper script to create a new document draft: `init-document.nu`
- Gitignore file (used to tell Git not to track certain files): `.gitignore`
- Git directory (Directory used by the Git software. Not to be edited directly by team members): `.git/`
- Directory containing document sources, example, and template: `draft/`

The `draft/` directory contains the working versions of ORG documents in their source format.
The IT Dept. shall maintain the structure of the `draft/` directory as follows:
- Template for ORG documents: `template.typ`
- Hash of template file: `template.sha256.txt`
- Example document directory: `example/`
	- Example Typst document source file: `ORG-X_Example.typ`
	- Hash of ORG-X_Example.typ: `sha256.txt`
- Document directories (one per document). For example: `ORG-999_some_title/`
	- Typst source file for the document with the name of the directory: `ORG-999_some_title.typ`
	- The draft of document, exported to PDF format. For example: `ORG-999_some_title.pdf`
	- Hash of the Typst source file in this directory: `sha256.txt`
	- Any other files the author needs such as data tables or images.

The `released` directory contains the approved & released versions of all ORG documents in PDF format.

== SDR DCSR
+ The GitHub repository is named: SDR-DCS.
+ The URL is: TBD

=== SDR directory structure
Same as ORG DCSR but every instance of the "ORG" document type code shall appear as the "SDR" code.

== TRM DCSR
+ The GitHub repository is named: TRM-DCS.
+ The URL is: TBD

=== TRM directory structure
Same as ORG DCSR but every instance of the "ORG" document type code shall appear as the "TRM" code.

== CAR DCSR
+ The GitHub repository is named: CAR-DCS.
+ The URL is: TBD

=== CAR directory structure
Same as ORG DCSR but every instance of the "ORG" document type code shall appear as the "CAR" code.

== PRJ DCSR
+ The GitHub repository is named: PRJ-DCS.
+ The URL is: TBD

=== PRJ directory Structure
All file names are case sensitive.

The IT Dept. shall maintain the structure of the root directory of the repository as follows:
- Team logo: `8100-logo.svg`
- General instructions  file: `README.md`
- CC0 license for all documents: `LICENSE`
- For each year, a directory containing all projects created that year. For example: `2025/`

For each year, authors shall place new PRJ documents in a directory with the four-digit representation of the year as it's name.
The IT Dept. shall maintain the structure of each yearly directory as follows:
- Document directories, one per document. For example: `PRJ-999_some_title/`
	- Markdown source file document with the name of the directory: `PRJ-999_some_title.md`
	- Any other files the author needs such as data tables, notes, or images.

== Action Item DCSR
+ The GitHub repository is named: ACT-DCS.
+ The URL is: TBD

=== Action Item Titles
+ Authors shall chose a title that is unique from all other Project documents.
+ Authors shall write Action Items in Markdown.

=== Action Item File Names
Authors shall name Action Item files as follows:
+ the date in ISO 8601 format: yyyy-mm-dd
+ underscore character "\_"
+ the title, using underscores in lieu of spaces
+ the files extension ".md"
For example: "2025-04-26_Recycle_old_batteries.md"

=== Action Item Directory Structure
All file names are case sensitive.

The IT Dept. shall maintain the structure of the root directory of the repository as follows:
- Team logo: `8100-logo.svg`
- General instructions  file: `README.md`
- CC0 license for all documents: `LICENSE`
- For each year, a directory containing all Action Items created that year. For example: `2025/`

For each year, authors shall place new Action items in a directory with the four-digit representation of the year as it's name.
The IT Dept. shall maintain the structure of each yearly directory as follows:
- Markdown source files for documents. For example: `2025-04-26_Recycle_old_batteries.md`

= PRJ documents <prj>
Authors shall write project documents in the Markdown format.

Project Documents shall have the number and title as part of the file name in the following format:
+ The letters "PRJ" to denote the document type as a Project Document.
+ A dash character: "-" 
+ The document number
+ An underscore character: "\_"
+ The document title with any spaces replaced with underscores
+ The file extension: ".md"

Given an example PRJ document number five (5) with the title "Battery Recycling": "PRJ-5_Battery_Recycling.md"
#table(
	columns: (auto, auto, auto, auto, auto, auto),
	align: (center, center, center, center, center, center),
	table.header([Type], [Dash], [Number], [Underscore], [Title], [Extension]),
	[PRJ], [-], [5], [\_], [Battery_Recycling], [.md]
)

The text of a PRJ document shall, at minimum, contain the following information in this order:
+ Document number
+ Title
+ The date created
+ List members proposing the project
+ List concerned working groups and roles
+ List measurable project objectives
+ List members working on the project
+ Outline a plan for achieving objectives
+ Outline funding requirements
+ Outline material & parts requirements

Sections specific to the project, shall come after these in the Project Document.

The PRJ document shall have a change log with the following information recorded for each update placed at the end of the document (after the project specific sections):
+ Change date
+ Change author
+ Change summary
+ New status (Draft, Open, Closed)

Authors shall place the change log at the end of the PRJ document.

== PRJ document update process
+ Discus the update with other members of the project to obtain unanimous consent for the update.
+ One of the members of the project will follow the PR process: @pr to update the document.
+ At least one member of the IT Dept. shall check the PR meets the requirements of this standard.
+ IT Dept. or another project member shall accept the PR.

== Including other files

= Action Item documents <action_items>
Authors shall write Action Item documents in the Markdown format.

The text of an Action Item shall, at minimum, contain the following information in this order:
+ Title
+ The date created
+ List members proposing the project
+ List concerned working groups and roles
+ List measurable objectives
+ List members working on the project
+ Outline material & parts requirements

= SDR documents <sdr>
+ Authors shall write SDR documents in the Typst format.
+ Authors shall export SDR documents in PDF format after drafting edits or releasing them.

== SDR document structure <sdr_doc_structure>
Authors shall start ORG documents with the following in this order:
+ title page with:
	+ document type code: SDR, ORG, or TRM, a hyphen, and the document number (e.g. ORG-1)
	+ document title
	+ date
	+ team logo
	+ team motto: "So let it be written. So let it be done."
+ table of contents
+ "Document Control" section with all information listed in @standard_ctrl_info.
+ "Authors" section with, at least, first and last initials, and up to full name and email address.
+ "Purpose" section
+ "Scope" section
+ "Terms" section

=== SDR document section usage
+ The author shall use the Purpose section to describe what they intend to accomplish by writing the document.
+ The author shall use the Scope section to show what sub-teams and roles are affected by the content.
+ The author shall list all acronyms and domain specific terms in the Terms section.
+ After the Terms section, the author shall write the content of the Policy.
+ Finally, after the content sections, all Policies shall end with the following in this order:
	+ Revision history section
	+ Source file signature section

=== SDR document revision section
The revision history section is a list where each item starts with a second level heading.
The heading for each list item takes has the form:
	+ the letter "V"
	+ the version number
	+ a dash surrounded by spaces " - "
	+ the date the revision was approved.
For example: V2 - 2025-04-18.
After the heading, the author shall write a summary of changes.

=== SDR document source signature
The source file signature section shall contain the SHA3-256 hash of the source document and the template.
This is automatically done so long as the directory structure defined by: @org_dir_structure is maintained,
and the author uses the `compile.nu` script.

== SDR Approval <sdr_approval>
+ Find one other member on the relevant sub-team that agrees that a new document or update is needed.
+ Create Action Item and write goals for new document.
+ Get approval for update form rest of affected sub-teams.
+ Create PRJ for new documents. Action Items are sufficient for updates.
+ Author and IT Dept. shall use the PR process in: @pr.
+ Project members shall review updates on fork.
+ Author shall sync the fork with the original and incorporate any updates.
+ Run compile script against new document for both the draft.
+ Author shall submit the PR to the DCSR.
+ All affected members shall comment approval or disapproval in the PR request.
+ If the document is approved, the IT Dept. shall accept the PR
+ IT Dept. shall build the document using the compile script in release mode.

= ORG documents <org>
ORG document have the same structure and follow the same procedure as SDRs, as defined by: @sdr,
but the entirety of Grayson Robotics must approve any change to an ORG document.

= Corrective Action Reports <car>
CARs have the same structure and contain control information as SDRs (as per: @standard_ctrl_info)
with the exception that the status may be either *Open* or *Closed*:
- Use _Open_ after the document has been created and before the CAR is closed.
- Use _Closed_ *only after* the CAR is closed.

In addition, CAR documents contain the following sections: 
- Incident Description
- Incident Statements: Statements from individuals with knowledge of the incident or potential causes.
- Supporting Content: Pictures, diagrams, code, etc.
- List of Causes
- Resolution Actions: List of PPDs opened to address the subject of the CAR.
- Progress Tracking: Track the progress of any related PPD.

= TRM <trm>
+ Authors shall write and export TRM documents in the same formats as SDRs as defined by: @sdr.

== TRM document structure <trm_doc_structure>
+ Authors shall write TRM documents with the same structure as SDRs, as defined by: @sdr_doc_structure,
but with additions.
+ Disclaimer statement: see @disclaimer
+ Job Safety Analysis (JSA)
+ Intended Outcomes: Whether it takes the form of a tutorial or instructions for a teacher lead class,
summarize the intended outcome for the learner upon completing the training outlined by the document.
+ Training Scope: Detail explicitly what the training is to cover, and note any similar or related topics that
the training is not intended to cover.

=== TRM disclaimer <disclaimer>
Authors shall include the following statement in all TRM documents:

The author(s), maintainer(s), and distributor(s) of this document shall not be liable for any damages, losses, injury, costs or expenses, direct,
indirect or incidental, consequential or special, arising out of, or related to the use of information within
this document, or any material it references.

== TRM Approval
TRM documents shall use the same approval process as SDRs, as defined by: @sdr_approval. 
