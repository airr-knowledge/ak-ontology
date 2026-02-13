## Customize Makefile settings for ak-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

clean_exports:
	rm -rf exports

#all_exports: exports/CL.tsv exports/DOID.tsv exports/PATO.tsv exports/UO.tsv exports/UBERON.tsv exports/OBI.tsv exports/MRO.tsv exports/NCBITaxon.tsv
all_exports: exports/Cells.csv exports/Diseases.csv exports/PhenotypeAndTraits.csv exports/Units.csv exports/UberAnatomy.csv 

exports/:
	mkdir -p $@

exports/CL.tsv: imports/CL_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term CL:0000542 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/Cells.csv exports/Cells_parent.csv: exports/CL.tsv
	python3 ../scripts/ontology_table_transform.py exports/CL.tsv Cells

exports/DOID.tsv: imports/DOID_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term DOID:4 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/Diseases.csv export/Diseases_parent.csv: exports/DOID.tsv
	python3 ../scripts/ontology_table_transform.py exports/DOID.tsv Diseases

exports/PATO.tsv: imports/PATO_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term PATO:0020000 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/PhenotypeAndTraits.csv exports/PhenotypeAndTraits_parent.csv: exports/PATO.tsv
	python3 ../scripts/ontology_table_transform.py exports/PATO.tsv PhenotypeAndTraits

exports/UO.tsv: imports/UO_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term UO:0000000 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/Units.csv exports/Units_parent.csv: exports/UO.tsv
	python3 ../scripts/ontology_table_transform.py exports/UO.tsv Units

exports/UBERON.tsv: imports/UBERON_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term UBERON:0001062 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/UberAnatomy.csv exports/UberAnatomy_parent.csv: exports/UBERON.tsv
	python3 ../scripts/ontology_table_transform.py exports/UBERON.tsv UberAnatomy

exports/OBI.tsv: imports/OBI_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term BFO:0000001 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@


exports/BiomedicalInvestigations.csv exports/BiomedicalInvestigations_parents.csv:
	python3 ../scripts/ontology_table_transform.py exports/OBI.tsv BiomedicalInvestigations

exports/MRO.tsv: imports/MRO_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term PR:000000001 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@
	python3 ../scripts/ontology_table_transform.py exports/MRO.tsv TODO

exports/NCBITaxon.tsv: imports/NCBITaxon_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term NCBITaxon:131567 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@
	python3 ../scripts/ontology_table_transform.py exports/NCBITaxon.tsv TODO
