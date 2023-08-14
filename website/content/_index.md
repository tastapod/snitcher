---
title: "Little Snitch Rule Groups"
base: "https://rules.snitcher.dannorth.net/"
---
This is a list of [rule groups](https://help.obdev.at/littlesnitch/lsc-rule-group-subscriptions) of potentially suspicious hosts, which you can subscribe to from [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html) version 4.1 onwards.

These groups are generated from the raw host files on Steven Black's [unified hosts project](https://github.com/StevenBlack/hosts).

_Disclaimer: I make no claims or warranty for the veracity or accuracy of any of the source lists. In particular categorising something as "fake news" may be a matter of opinion. I just want to make them easier to consume from Little Snitch. I am not a lawyer. Use these at your own risk. You can always explicitly override false positives._

## The rule groups

Each list has been split into two rule groups because they [exceed the limit](/limits/) of a Little Snitch rule group.

This is a breaking change, because I didn't want people subscribing to just the first chunk of a block list and thinking they have the whole thing.

_This means you will have to resubscribe to all the rule groups for the list you want._

{{% rule-group-block "unified" "Unified (adware + malware)" %}}

{{% rule-group-block "fake-news" "Unified + fake news" %}}

{{% rule-group-block "gambling" "Unified + gambling" %}}

{{% rule-group-block "porn" "Unified + porn" %}}

{{% rule-group-block "social" "Unified + social media" %}}

{{% rule-group-block "everything" "Everything" %}}

The scripts for the rule group generator and the source for this website are at <https://github.com/tastapod/snitcher>.

_This site was built with [Hugo](https://gohugo.io/) and uses the [Ananke](https://themes.gohugo.io/themes/gohugo-theme-ananke/) theme._
