# Snitcher

Generate [rule groups](https://help.obdev.at/littlesnitch/lsc-rule-group-subscriptions) for [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html) from one of Steven Black's [host blocklists](https://github.com/StevenBlack/hosts).

We assume the raw host file takes the following form:

```hosts
# Comment lines
127.0.0.1 normal.hosts

# Blacklist hosts start
0.0.0.0 bad.domain.com
0.0.0.0 another.domain.com

# More blacklist hosts
0.0.0.0 suspicious.org
```

All blacklist hosts have the IP address `0.0.0.0`. The script parses out the hostnames and adds them to a JSON template representing the Little Snitch rule group. This is written to stdout.

The template looks like this:

```json
{
  "name" : "$NAME (part $part_num)",
  "description" : "Generated from $URL",
  "denied-remote-notes" : "Retrieved on $NOW from list $NAME",
  "denied-remote-hosts" : [
$hosts
  ]
}
```

## Usage

`./snitcher.sh`

Outputs `$PREFIX-00.lsrules`, `$PREFIX-01.lsrules`, ... as rule files split into chunks of 200,000 entries, since this is a limit in Little Snitch.

## Environment variables

The following environment variables affect the behaviour of `snitcher`:

- `URL`: the source URL, which should produce what looks like a regular UNIX hosts file. Defaults to
  `https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts`.
- `NAME`: the name for this rule group, defaults to `Steven Black`.
- `PREFIX`: output file prefix, defaults to `unified`.

## Generating rules files for multiple lists

The website in the `docs/` directory is hosted on GitHub Pages at https://snitcher.dannorth.net. The rules files are hosted on a different server so they can be dynamically updated. The `update.sh` script rebuilds these files every week based on a cron job.

## Developing

Pull requests are welcomed! There is a pre-commit hook that ensures that the website in the `docs` folder is up-to-date if any of the files in the `website` folder are staged.

To enable this, set the githooks directory to `resources/githooks` like this:

```shell
git config --local core.hooksPath .githooks
```
