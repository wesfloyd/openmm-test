FROM wesfloyd/bacalwow-openmm-test

WORKDIR /home/openmm-test

CMD ["/root/miniconda/bin/python","/home/openmm-test/run_openmm_simulation.py"]