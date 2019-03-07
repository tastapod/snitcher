#!/bin/bash

TARGET_DIR="../static/rules"
SNITCHER="../../snitcher.sh"

while read FILE URL NAME; do
    echo "Processing $NAME..."
    URL="$URL" NAME="$NAME" "$SNITCHER" > "$TARGET_DIR/$FILE.temp"
    mv "$TARGET_DIR/$FILE.temp" "$TARGET_DIR/$FILE"
done <<-EOT
unified.lsrules     https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts                        Steven Black Unified
fakenews.lsrules    https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts    Steven Black Unified + fake news
gambling.lsrules    https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts    Steven Black Unified + gambling
porn.lsrules        https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts        Steven Black Unified + porn
social.lsrules      https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts      Steven Black Unified + social
everything.lsrules  https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts Steven Black Unified + all lists
EOT
