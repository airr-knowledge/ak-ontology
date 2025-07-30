## Customize Makefile settings for ak-ontology
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

exports/:
	mkdir -p $@

exports/CL.tsv: imports/CL_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term CL:0000542 \
	export \
	--header 'ID|Label|SubClassOf' \
	--sort ID \
	--export $@

exports/DOID.tsv: imports/DOID_import.owl | exports/
	$(ROBOT) extract \
	--input $< \
	--method MIREOT \
	--branch-from-term DOID:4 \
	export \
	--header 'ID|Label|SubClassOf' \
	--sort ID \
	--export $@
