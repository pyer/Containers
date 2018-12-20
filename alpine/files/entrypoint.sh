#!/bin/sh
for script in /etc/init.d/* ; do
  [ -r $script ] && /bin/ash $script
done

/bin/ash -l
