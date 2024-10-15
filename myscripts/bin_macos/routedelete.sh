#!/usr/bin/env bash
#
for i in {0..3}; do
    route delete -inet6 default -ifscope utun${i}
    route delete -inet6 ff00::/8 -ifscope utun${i}
    route delete -inet6 ff01::%utun${i}/32 -ifscope utun${i}
    route delete -inet6 ff02::%utun${i}/32 -ifscope utun${i}
done

for i in $(netstat -rn | grep utun | grep fe80 | awk '{print $1}'); do
    route delete -inet6 "${i}"
done
