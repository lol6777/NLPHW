#!/bin/bash -l
#SBATCH --job-name="NLP Homework"
#SBATCH --time=09:59:00
#SBATCH --partition=gpu 
#SBATCH --gres=gpu:tesla:1 
#SBATCH --output=/gpfs/space/home/amlk/NLPHW/slurm_%x.%j.out # STDOUT
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=anton.malkovski@ut.ee

# Here you need to run train.py with python from the virtual environment where you have all the dependencies install
# You also have to pass the command line args (such as dataset name) to the script here, as well
# You may use whichever virtual environment manager you prefer (conda, venv, etc.)
module load cuda/11.7.0 && module load cudnn/8.2.0.53-11.3
module load any/python/3.8.3-conda
conda activate hpc_tutorial_pt
#python train.py --model_name_or_path "distilbert-base-uncased" \ --dataset_name "conll2003" \ --label_column_name "ner_tags" \ --num_train_epochs 6 \ --output_dir "$HOME/NLPHW" \ --train_batch_size 64 \
#--eval_batch_size 64 \ --return_entity_level_metrics

$HOME/.conda/envs/hpc_tutorial_pt/bin/python $HOME/.conda/envs/hpc_tutorial_pt/HW3/NLPHW/train.py --model_name_or_path "bert-base-cased" \
            --dataset_name "conll2003" \
            --label_column_name "ner_tags" \
            --max_length 128 \
            --num_train_epochs 2 \
            --output_dir "$HOME/NLPHW3/" \
            --train_batch_size 64 \
            --eval_batch_size 64 \
            --return_entity_level_metrics