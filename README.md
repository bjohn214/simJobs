this is a rather hackey way of submitting jobs to condor. it has worked for me after much fiddling, which means the actual submittion part probably won't work for anyone else, but feel free to poke around and improve. 

List of Files and what the do: 

in generateJobs/:
	You'll need to update the absolute path used in passing files to condor. Mine was /work/bjohn214/simJobs/generateJobs if you want to grep it. Set to generate 10k events, can be changed easily. 

	jobTemp.submit: Template for condor input info. 
	runTemp.sh: The commands condor actually runs.
	sim_steer_jet_CONDOR_template.py: The steering file the ddsim will use. There are likely many breakable things in there. One of which being the path to my madgraph sample
	simfoo.log: Log file for ddsim to output into.
	steer_gen.sh: Running this generates all the submit and run scripts in their respective folders. takes a hot minute.

inputFiles/: 
5TeV_pythia8_events.hepmc: gen level sample with 10k events
MuColl_10TeV_v0A: MuCol Geometry .xml files I've been using. Should be able to switch these with any others you've been using. 

To actually submit to condor you can just run submit.sh. And if this messes up and you're left with with a bunch of broken files you can just just remover.sh. This removes any files left in outputs/ submits/ and runScripts/

What I've Done: 

In the main geometry file inputFiles/MuColl_10teV_v0A/MuColl_10teV_v0A.xml in line 162 I added:

	<limitset name="nozzle_limits">
            <limit name="track_length_max" particles="*" value="0.1" unit="mm" />
        </limitset>
and in the the nozzle .xml file I added: limits="nozzle_limits" in each detector entry: e.g. <detector name="NozzleW_right" type="DD4hep_PolyconeSupport" vis="NozzleWVis" region="NozzleRegion"> on line 17 became  <detector name="NozzleW_right" type="DD4hep_PolyconeSupport" vis="NozzleWVis" region="NozzleRegion" limits="nozzle_limits"> 


-ben Feb. 4 2024

