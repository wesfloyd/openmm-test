# openmm-test

Example workload to validate [OpenMM](https://github.com/openmm/openmm) on [Bacalhau](bacalhau.org) via [workload onboarding](https://docs.bacalhau.org/getting-started/workload-onboarding)  


To test locally:
1) Clone the repository
2) Invoke the docker container:
```
docker run \
	-v output:/project/output \
	wesfloyd/bacalwow-socat-test
```


To run on [Bacalhau](https://github.com/filecoin-project/bacalhau):
```
bacalhau docker run \
	-o output:/project/output \
	wesfloyd/bacalwow-socat-test

bacalhau list

bacalhau describe [JOB_ID]

bacalhau get [JOB_ID]
```
