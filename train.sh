#!/bin/bash -l
#SBATCH --job-name="NLP Homework"
#SBATCH --time=09:59:00
#SBATCH --partition=gpu 
#SBATCH --gres=gpu:tesla:1 
#SBATCH --output=/gpfs/space/home/amlk/HNLPHW/slurm_%x.%j.out # STDOUT
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=anton.malkovski@ut.ee

# Here you need to run train.py with python from the virtual environment where you have all the dependencies install
# You also have to pass the command line args (such as dataset name) to the script here, as well
# You may use whichever virtual environment manager you prefer (conda, venv, etc.)
source hpc_tutorial_pt
python train.py --model_name_or_path "distilbert-base-uncased" \ --dataset_name "conll2003" \ --label_column_name "ner_tags" \ --num_train_epochs 6 \ --output_dir "$HOME/NLPHW" \ --train_batch_size 64 \
--eval_batch_size 64 \ --return_entity_level_metrics