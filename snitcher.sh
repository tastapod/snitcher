#!/bin/bash


URL="${URL:-https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts}"
NAME="${NAME:-Steven Black}"

HOSTS=$(curl "$URL" |\
    grep '^0\.0\.0\.0' | \
    awk '{print $2}' |\
    fgrep -v --line-regexp '0.0.0.0' |\
    sed 's/\(.*\)/    "\1",/' |\
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
