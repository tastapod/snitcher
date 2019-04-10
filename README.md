# Snitcher

Generate a [rule group](https://help.obdev.at/littlesnitch/lsc-rule-group-subscriptions) for [Little
Snitch](https://www.obdev.at/products/littlesnitch/index.html) from one of Steven Black's [host
blocklists](https://github.com/StevenBlack/hosts).

We assume the raw host file takes the following form:

```
# Comment lines
127.0.0.1 normal.hosts

# Blacklist hosts start
0.0.0.0 bad.domain.com
0.0.0.0 another.domain.com

# More blacklist hosts
0.0.0.0 suspicious.org
```

All blacklist hosts have the IP address `0.0.0.0`. The script parses out the hostnames and adds them
to a JSON template representing the Little Snitch rule group. This is written to stdout.

The template looks like this:

```json
{
  "description" : "Generated from $URL",
  "name" : "$NAME",
  "denied-remote-hosts" : [
$HOSTS
  ]
}
```

## Usage

`./snitcher.sh`

## Environment variables

The following environment variables affect the behaviour of `snitcher`:

- `URL`: the source URL, which should produce what looks like a regular UNIX hosts file. Defaults to
  `https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts`.
- `NAME`: the name for this rule group. Defaults to `Steven Black`.

## Generating multiple rules files

The website in the `docs/` directory is hosted on GitHub at https://snitcher.dannorth.net.
The rules files are hosted on a different server so they can be dynamically updated.
The `update.sh` script rebuilds these files every day based on a cron job.
