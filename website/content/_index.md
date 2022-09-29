---
title: "Little Snitch Rule Groups"
---

This is a list of [rule groups](https://help.obdev.at/littlesnitch/lsc-rule-group-subscriptions) of blacklisted hosts you can subscribe to from [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html) version 4.1 onwards.

These groups are generated from the raw host files on Steven Black's [unified hosts project](https://github.com/StevenBlack/hosts).

_Disclaimer: I make no claims or warranty for the veracity or accuracy of any of the source lists. In particular categorising something as "fake news" may be a matter of opinion. I just want to make them easier to consume from Little Snitch. I am not a lawyer. Use these at your own risk. You can always explicitly override false positives._

## The rule groups

- Unified (adware + malware) [subscribe][subscribe-unified], [rule group file][download-unified]
- Unified + fake news [subscribe][subscribe-unified-fakenews], [rule group file][download-unified-fakenews]
- Unified + gambling [subscribe][subscribe-unified-gambling], [rule group file][download-unified-gambling]
- Unified + porn [subscribe][subscribe-unified-porn], [rule group file][download-unified-porn]
- Everything [subscribe][subscribe-everything], [rule group file][download-everything]

The scripts for the rule group generator and the source for this website are at https://github.com/tastapod/snitcher.

The site was built using [Hugo](https://gohugo.io/) and uses the [vanilla-bootstrap](https://themes.gohugo.io/vanilla-bootstrap-hugo-theme/) theme.

&copy; 2019-2022 [Daniel Terhorst-North](https://github.com/tastapod/), [all rights reserved](https://raw.githubusercontent.com/tastapod/snitcher/master/LICENSE)

[subscribe-unified]: x-littlesnitch:subscribe-rules?url=https%3A%2F%2Frules%2Esnitcher%2Edannorth%2Enet%2Funified%2Elsrules
[download-unified]: https://rules.snitcher.dannorth.net/unified.lsrules

[subscribe-unified-fakenews]: x-littlesnitch:subscribe-rules?url=https%3A%2F%2Frules%2Esnitcher%2Edannorth%2Enet%2Ffakenews%2Elsrules
[download-unified-fakenews]: https://rules.snitcher.dannorth.net/fakenews.lsrules

[subscribe-unified-gambling]: x-littlesnitch:subscribe-rules?url=https%3A%2F%2Frules%2Esnitcher%2Edannorth%2Enet%2Fgambling%2Elsrules
[download-unified-gambling]: https://rules.snitcher.dannorth.net/gambling.lsrules

[subscribe-unified-porn]: x-littlesnitch:subscribe-rules?url=https%3A%2F%2Frules%2Esnitcher%2Edannorth%2Enet%2Fporn%2Elsrules
[download-unified-porn]: https://rules.snitcher.dannorth.net/porn.lsrules

[subscribe-everything]: x-littlesnitch:subscribe-rules?url=https%3A%2F%2Frules%2Esnitcher%2Edannorth%2Enet%2Feverything%2Elsrules
[download-everything]: https://rules.snitcher.dannorth.net/everything.lsrules
