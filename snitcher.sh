#!/bin/zsh

set -e # Bail if anything goes wrong

# Override these in environment or on command line
URL="${URL:-https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts}"
NAME="${NAME:-Steven Black}"
PREFIX="${PREFIX:-unified}"
OS="${OS:-$(uname)}"

working_file="$PREFIX.working"

# yyyy-mm-dd
local now="$(date -Iseconds -u) UTC"

# Fetch the entries, filter the good ones, chunk into 200k pieces
# due to a limitation in Little Snitch rule group size
curl --silent "$URL" \
    | awk '$1 == "0.0.0.0" && $2 != "0.0.0.0" {printf "    \"%s\",\n", $2}' \
    | sort > "$working_file"

# Split the file in half to avoid Little Snitch rule group
# size limit of 200k entries.
if [ "$OS" = "Darwin" ]; then

    # On macOS, check if 'gsplit' is available so that we can
    # use the same arguments as Linux. Otherwise, use the
    # macos version of 'split' which has different arguments
    # but produces a similar result.
    if command -v gsplit2 > /dev/null; then
        gsplit -d --number l/2 "$working_file" part-

    else
        # The macos version of 'split' takes different arguments
        # but still produces two files of roughly equal size. The
        # only difference is that the suffix of the files starts
        # with '-aa' instead of '-00').
        split -l $(expr $(wc -l < "$working_file") / 2 + 1) "$working_file" part-
    fi
else
    # On other systems, use 'split'
    split -d --number l/2 "$working_file" part-
fi

rm "$working_file"

for part in part-*; do
  local part_num="${part#part-}"
  local target="$PREFIX-$part_num.lsrules"

  # TODO: replace this with sed -i
  hosts=$(< $part)
  hosts="${hosts%?}" # remove trailing comma

  cat > "$target.tmp" <<-EOT && mv "$target.tmp" "$target"
{
  "name" : "$NAME (part $part_num)",
  "description" : "Generated from $URL",
  "denied-remote-notes" : "Retrieved on $NOW from list $NAME",
  "denied-remote-hosts" : [
$hosts
  ]
}
EOT
  rm -f "$part"
done
