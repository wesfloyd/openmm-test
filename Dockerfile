FROM conda/miniconda3

RUN conda install -y -c conda-forge openmm

WORKDIR /project

COPY ./run_openmm_simulation.py /project
COPY ./input/2dri-processed.pdb /project/input

CMD ["python","run_openmm_simulation.py"]