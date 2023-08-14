---
title: "Limits"
---
Little Snitch has a limit of 200,000 entries per rule group. When I wrote Snitcher in 2019, the Steven Black lists had around 50k entries, so 200k seemed like plenty of overhead.

But then this happened:

{{< figure
    src="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts_file_size_history.png"
    link="https://github.com/StevenBlack/hosts/#unified-hosts-file-with-base-extensions"
    alt="Hosts file size history graph from 2018"
>}}

Hopefully this is linear rather than exponential growth! The jags in the graph look like someone changing the criteria for different categories, so that chunks of hosts are suddenly included or excluded.

Since Little Snitch has no concept of subscribing to a group-of-groups, I decided to split the lists at the 200,000 limit, which should keep us going for a while.

_This means you will have to resubscribe to all the rule groups for the list you want._

Apologies that this broke your rule group subscription, but I figured I would rather make a breaking change so that you can see what has happened, than leave you subscribed to just the first 200k entries of a list while the list itself continues to grow.
