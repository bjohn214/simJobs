#!/bin/bash

for i in {0..9990..10}; do
	submitDir=../submits/sample"$i"
	steerFile="$submitDir"/sim_steer_jet_"$i"_CONDOR.py
	runFile=../runScripts/run"$i".sh
	submitFile="$submitDir"/sample"$i".submit

	mkdir -p $submitDir
	cp sim_steer_jet_CONDOR_template.py $steerFile 
	cp runTemp.sh $runFile
	cp jobTemp.submit $submitFile		

	sed -i s/foo/"$i"/g $steerFile $runFile $submitFile
	
	mod=$(expr $i % 100)	
	if [ $mod -eq 0 ]; then 
		echo "creating files for sample $i"
	fi
	
	done
