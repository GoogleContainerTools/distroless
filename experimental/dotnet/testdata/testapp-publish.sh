#!/usr/bin/env sh

pushd $scriptDir

export DOTNET_CLI_HOME=/tmp/
scriptDir=$( dirname -- "$( readlink -f -- "$0"; )"; ) && pushd $scriptDir && dotnet publish --framework net6.0 -o ./testapp-bin ./TestApp && popd
# tar -cf testapp.tar ./testapp-bin

popd
