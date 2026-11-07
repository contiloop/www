# 0002 Record and draft as a Markdown pair in the document folder

Context: the author's documents are mostly English papers written in LaTeX, discussed in Korean. The record and the text had to live where the author works and be editable by hand.

Decision: `design.md` (the record) and `draft.md` (the text, one heading per section) side by side in the document folder; one document per folder; an existing manuscript stays untouched and `draft.md` is its working copy.

Alternatives: writing section text straight into `.tex` sources (ties the first version to typesetting; the argument, not the layout, is what drifts); one Markdown file per section (a revision touches one file, but the whole-document order and the per-turn re-comparison become multi-file).

Consequences: export to LaTeX or slides is a later, separate step; two deliverables about the same research need two folders.
