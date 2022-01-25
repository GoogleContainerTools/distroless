#/bin/sh

set -o errexit
set -o xtrace

# build our package_manager
(cd debian_package_manager; make update)

# the default config and output files are all in the current working
# working directory
./debian_package_manager/update
