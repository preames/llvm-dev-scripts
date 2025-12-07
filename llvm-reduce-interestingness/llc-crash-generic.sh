#!/bin/bash
# Reduce a generic LLC codegen crash.  Expects the LL/BC file to contain
# target information.
# WARNING: Will reduce *any* llc crash which is often not what is intended.
# Using a specialized assert variant is likely better.

llc $@ && exit -1 || exit 0
