#!/bin/bash


URL="${URL:-https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts}"
NAME="${NAME:-Steven Black}"

HOSTS=$(curl "$URL" |\
    awk '$1 == "0.0.0.0" && $2 != "0.0.0.0" {printf "    \"%s\",\n", $2}' |\
    sort
)

HOSTS="${HOSTS%?}" # remove trailing comma
NOW=$(date +'%-s')

cat <<-EOT
{
  "description" : "Generated from $URL",
  "name" : "$NAME",
  "denied-remote-hosts" : [
$HOSTS
  ]
}
EOT
