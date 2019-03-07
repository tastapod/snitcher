# Snitcher

Generate a [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html) [rule
group](https://help.obdev.at/littlesnitch/lsc-rule-group-subscriptions) from one of Steven Black's
[host blocklists](https://github.com/StevenBlack/hosts).

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

## Usage

`./snitcher.sh`

## Environment variables

The following environment variables affect the behaviour of `snitcher`:

- `URL`: the source URL, which should produce what looks like a regular UNIX hosts file. Defaults to
  `https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts`.
- `NAME`: the name for this rule group. Defaults to `Steven Black`.
