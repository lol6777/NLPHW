#!/bin/bash -l
#SBATCH --job-name="NLP Homework"
#SBATCH --time = 11:00:00 
#SBATCH --partition = gpu 
#SBATCH --gres= gpu:tesla:1 
#SBATCH --output=/gpfs/space/home/amlk/HPC_practice/slurm_%x.%j.out # STDOUT

# Here you need to run train.py with python from the virtual environment where you have all the dependencies install
# You also have to pass the command line args (such as dataset name) to the script here, as well
# You may use whichever virtual environment manager you prefer (conda, venv, etc.)
source hpc_tutorial_pt
python train.py --dataset_name conll2003