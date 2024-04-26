
![Build Status](https://github.com/airr-knowledge/ak-ontology/workflows/CI/badge.svg)
# AIRR Knowledge project ontology

Description: None

More information can be found at http://obofoundry.org/ontology/ak-ontology

## Development setup

Setup the local source code.

```
git clone https://github.com/airr-knowledge/ak-ontology.git
cd ak-ontology
```

Use the ODK docker container to have a consistent development environment. There is
a provided `run.sh` script that runs the docker in an appropriate way.

```
docker pull obolibrary/odkfull
cd src/ontology

# if ak-ontology-odk.yaml is updated, then
sh run.sh make update_repo

# build everything
sh run.sh make
```

Perform git operations outside of docker to avoid permission and gitconfig issues.

## Versions

### Stable release versions

The latest version of the ontology can always be found at:

http://purl.obolibrary.org/obo/ak-ontology.owl

(note this will not show up until the request has been approved by obofoundry.org)

### Editors' version

Editors of this ontology should use the edit version, [src/ontology/ak-ontology-edit.owl](src/ontology/ak-ontology-edit.owl)

## Contact

Please use this GitHub repository's [Issue tracker](https://github.com/airr-knowledge/ak-ontology/issues) to request new terms/classes or report errors or specific concerns related to the ontology.

## Acknowledgements

This ontology repository was created using the [Ontology Development Kit (ODK)](https://github.com/INCATools/ontology-development-kit).