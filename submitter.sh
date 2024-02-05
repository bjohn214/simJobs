#!/bin/bash

for i in {0..9990..10}; do 
	condor_submit /work/bjohn214/simJobs/submits/sample"$i"/sample"$i".submit
	done
