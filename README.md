
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

Use the docker container to have a consistent development environment.

```
docker pull obolibrary/odkfull
docker run -v $PWD:/work -it obolibrary/odkfull bash
cd /work/src/ontology

# if ak-ontology-odk.yaml is updated, then
make update_repo

# build everything
make
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