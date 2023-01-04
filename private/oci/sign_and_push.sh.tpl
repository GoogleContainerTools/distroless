#!/usr/bin/env bash
set -o pipefail -o errexit -o nounset

KEY="${KEY:-}"
EXPORT=""

while (( $# > 0 )); do
  case $1 in
    (--key)
      KEY="$2"
      shift
      shift;;
    (--export)
      EXPORT="$2"
      echo -n "" > $EXPORT
      shift
      shift;;
    (*) 
      echo "unknown arg $1"
      exit 1
  esac
done

if [ -z $KEY ]; then
  echo "--key flag or KEY environment variable must be provided"
  exit 1
fi

echo "## Signing and pushing images..."
echo ""

readonly version_file="$(cat "{{VERSION_FILE}}")"

function stamp() {
    local str=$1
    while read -r line; 
    do
        IFS=" " read -r key value <<< "$line"
        str="${str/\{$key\}/$value}"
    done <<< "$version_file"
    echo "$str"
}


{{CMDS}}

echo ""
echo "👌 Finished pushing & signing"
echo ""