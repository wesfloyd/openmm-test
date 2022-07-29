# Openmm Test

## Background

[OpenMM](https://github.com/openmm/openmm) is a toolkit for molecular simulation. It can be used either as a stand-alone application for running simulations, or as a library you call from your own code. It provides a combination of extreme flexibility (through custom forces and integrators), openness, and high performance (especially on recent GPUs) that make it truly unique among simulation codes.

## Running the Demo
Example workload to validate [OpenMM](https://github.com/openmm/openmm) on [Bacalhau](bacalhau.org) via [workload onboarding](https://docs.bacalhau.org/getting-started/workload-onboarding)  


### To run on [Bacalhau](https://github.com/filecoin-project/bacalhau):
```bash
bacalhau docker run \
	-v bafybeig63whfqyuvwqqrp5456fl4anceju24ttyycexef3k5eurg5uvrq4:/project/input
	-o output:/project/output \
	wesfloyd/bacalwow-socat-test

bacalhau list

bacalhau describe [JOB_ID]

bacalhau get [JOB_ID]
```


### To test the docker image locally
```bash

#git clone https://github.com/wesfloyd/openmm-test.git

docker run \
	-v output:/project/output \
	-w /home/openmm-test
	wesfloyd/bacalwow-openmm-test-v2


```





### To create the Docker image from Dockerfile

docker build -t wesfloyd/bacalwow-openmm .

docker push wesfloyd/bacalwow-openmm


### To create the Docker Image from scratch

```bash

docker run --name bacalwow-openmm -it conda/miniconda3

conda install -y -c conda-forge openmm
#python -m openmm.testInstallation


#this section will be omitted from Dockerfile
mkdir /project /project/output/ /project/input
cd /project
apt-get update && apt-get -y upgrade
apt-get install -y wget sudo vim git
git clone https://github.com/wesfloyd/openmm-test.git
cp openmm-test/run_openmm_simulation.py  .
cp openmm-test/input/2dri-processed.pdb ./input
python run_openmm_simulation.py

exit
docker commit <CONTAINER_ID> wesfloyd/bacalwow-openmm-test
docker push wesfloyd/bacalwow-openmm-test

```

temp utilities
```
docker run -d -t -v output:/project/output \
	wesfloyd/bacalwow-openmm-test
docker exec -it NAME bash
docker build -t wesfloyd/bacalwow-openmm-test-v2 .
```



































### To create the Docker Image (old attempt)

```bash

docker run --name bacalwow-openmm-test -it ubuntu:kinetic

apt-get update && apt-get -y upgrade
apt-get install -y software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa
apt-get install -y \
    g++ wget sudo coreutils gnupg vim git python3.9 python-is-python3 python3-tqdm
mkdir /project /project/output/
# install Conda and OpenMM http://docs.openmm.org/latest/userguide/application/01_getting_started.html#installing-openmm 
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
echo 'export PATH="/root/miniconda/bin:$PATH"' >> /home/.bashrc
bash && conda install -y -c conda-forge openmm
python -m openmm.testInstallation

#clone the openmm test repo
git clone https://github.com/wesfloyd/openmm-test.git
cd openmm-test/


...

exit
docker commit <CONTAINER_ID> wesfloyd/bacalwow-openmm-test

```

temp utilities
```
docker run -d -t -v output:/project/output \
	wesfloyd/bacalwow-openmm-test
docker exec -it NAME bash
docker build -t wesfloyd/bacalwow-openmm-test-v2 .
```