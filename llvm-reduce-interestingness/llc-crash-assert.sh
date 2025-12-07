#!/bin/bash
# Reduce a generic LLC assertion failure crash.  Expects the LL/BC file to
# contain target information.
# WARNING: While less fragile then the generic llc crash reducer, you may
# want to specialize this for the specific assertion file:line combination.

llc $@ 2> crash.log && exit -1
(fgrep  "Assertion" crash.log | fgrep "failed") && exit 0
exit -1
