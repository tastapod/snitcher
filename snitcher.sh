#!/bin/bash

set -e # Bail if anything goes wrong

URL="${URL:-https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts}"
NAME="${NAME:-Steven Black}"

HOSTS=$(curl --silent "$URL" \
    | awk '$1 == "0.0.0.0" && $2 != "0.0.0.0" {printf "    \"%s\",\n", $2}' \
    | sort)

HOSTS="${HOSTS%?}" # remove trailing comma
NOW="$(date --iso-8601=seconds --utc) UTC"

cat <<-EOT
{
  "description" : "Generated from $URL",
  "name" : "$NAME",
  "denied-remote-notes" : "Retrieved on $NOW from list $NAME",
  "denied-remote-hosts" : [
$HOSTS
  ]
}
EOT
