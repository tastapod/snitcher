#!/bin/bash

set -e

if [[ $# != 1 ]]; then
    echo "Usage: $0 target_dir"
    exit 1
fi

TARGET_DIR="$1"
HERE="$(cd $(dirname "$0") && /bin/pwd)"
SNITCHER="$HERE/snitcher.sh"

mkdir -p "$TARGET_DIR"

while read FILE URL NAME; do
    echo "Processing $NAME..."
    OUT="$TARGET_DIR/$FILE"
    URL="$URL" NAME="$NAME" "$SNITCHER" > "$OUT.temp" && mv "$OUT.temp" "$OUT"
done <<-EOT
unified.lsrules     https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts                        Steven Black Unified
fakenews.lsrules    https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts    Steven Black Unified + fake news
gambling.lsrules    https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts    Steven Black Unified + gambling
porn.lsrules        https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts        Steven Black Unified + porn
social.lsrules      https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts      Steven Black Unified + social
everything.lsrules  https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts Steven Black Unified + all lists
EOT
