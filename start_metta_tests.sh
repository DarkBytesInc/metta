#!/bin/bash
#
# Kick off the attack simulations
#

if [ "$(uname -s)" == "Darwin" ]; then
  for x in $(find MITRE -iname '*.yml'); do
    python run_simulation_yaml.py -f "$x"
  done
elif [ "$(uname -s)" == "Linux" ]; then
  for x in $(find MITRE -iname '*.yml' | grep -v osx); do
    python run_simulation_yaml.py -f "$x"
  done
fi

exit 0
