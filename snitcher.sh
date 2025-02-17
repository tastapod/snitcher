#!/usr/bin/env bash

set -e # Bail if anything goes wrong

# Override these in environment or on command line
URL="${URL:-https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts}"
NAME="${NAME:-Steven Black}"
PREFIX="${PREFIX:-unified}"

working_file="$PREFIX.working"

# yyyy-mm-dd
now="$(date -Iseconds -u) UTC"

# Fetch the entries, filter the good ones, chunk into 200k pieces
# due to a limitation in Little Snitch rule group size
curl --silent "$URL" \
    | awk '$1 == "0.0.0.0" && $2 != "0.0.0.0" {printf "    \"%s\",\n", $2}' \
    | sort > "$working_file"
chunk_size=$(( ($(wc -l < "$working_file") + 1) / 2))
split -d -l $chunk_size "$working_file" part-
rm "$working_file"

for part in part-*; do
  part_num="${part#part-}"
  target="$PREFIX-$part_num.lsrules"

  # TODO: replace this with sed -i
  hosts=$(< $part)
  hosts="${hosts%?}" # remove trailing comma

  cat > "$target.tmp" <<-EOT && mv "$target.tmp" "$target"
{
  "name" : "$NAME (part $part_num)",
  "description" : "Generated from $URL",
  "denied-remote-notes" : "Retrieved on $now from list $NAME",
  "denied-remote-hosts" : [
$hosts
  ]
}
EOT
  rm -f "$part"
done
