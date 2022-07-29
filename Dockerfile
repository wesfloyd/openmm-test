FROM wesfloyd/bacalwow-openmm-test

WORKDIR /home/openmm-test

CMD ["/root/miniconda/bin/python","/home/openmm-test/run_openmm_simulation.py"]




FROM ...

RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y --no-install-recommends \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /project

COPY ./run_openmm_simulation.py /project
COPY ./2dri-processed.pdb /project


RUN pip3 install -r requirements.txt

CMD ["python","main.py"]