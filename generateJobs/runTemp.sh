#!/usr/bin/bash 
echo "Sourcing"
source /opt/ilcsoft/muonc/init_ilcsoft.sh

echo "Running simulation"
ddsim --steeringFile sim_steer_jet_foo_CONDOR.py &> simfoo.log 

