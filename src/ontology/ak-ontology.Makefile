## Customize Makefile settings for ak-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

clean_exports:
	rm -rf exports

all_exports: exports/CL.tsv exports/DOID.tsv exports/PATO.tsv exports/UO.tsv exports/UBERON.tsv exports/OBI.tsv exports/MRO.tsv exports/NCBITaxon.tsv

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

exports/DOID.tsv: imports/DOID_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term DOID:4 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/PATO.tsv: imports/PATO_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term PATO:0020000 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/UO.tsv: imports/UO_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term UO:0000000 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/UBERON.tsv: imports/UBERON_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term UBERON:0001062 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/OBI.tsv: imports/OBI_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term BFO:0000001 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/MRO.tsv: imports/MRO_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term PR:000000001 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@

exports/NCBITaxon.tsv: imports/NCBITaxon_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term NCBITaxon:131567 \
	export \
	--header 'ID|Label|SubClassOf [ID]' \
	--sort ID \
	--export $@
