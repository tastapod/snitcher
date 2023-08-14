#!/bin/bash

set -e

if [[ $# != 1 ]]; then
    echo "Usage: $0 target_dir"
    exit 1
fi

TARGET_DIR="$1"
HERE="$(cd $(dirname "$0") && /bin/pwd)"
SNITCHER="$HERE/snitcher.sh"

mkdir -p "$TARGET_DIR" && cd "$TARGET_DIR" && rm -f *.lsrules

while read PREFIX URL NAME; do
    echo "Processing $NAME..."
    URL="$URL" NAME="$NAME" PREFIX="$PREFIX" "$SNITCHER"
done <<-EOT
unified     https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts                        Steven Black Unified
fake-news    https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts    Steven Black Unified + fake news
gambling    https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts    Steven Black Unified + gambling
porn        https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts        Steven Black Unified + porn
social      https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts      Steven Black Unified + social
everything  https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts Steven Black Unified + all lists
EOT
