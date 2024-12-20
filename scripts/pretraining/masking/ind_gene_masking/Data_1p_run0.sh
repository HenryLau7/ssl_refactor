#!/bin/bash

#SBATCH -J Pretrain_Data_1p_run0
#SBATCH -p gpu_p
#SBATCH --qos gpu_normal
#SBATCH --gres=gpu:1
#SBATCH -t 2-00:00:00
#SBATCH --mem=150GB
#SBATCH --nice=10000


if [ -n "$1" ]; then
    source "$1"
else
    source "$HOME/.bashrc"
fi

# export PYTHONPATH=$PYTHONPATH:$SSL_PROJECT_HOME
export PYTHONPATH=$PYTHONPATH:/home/aiscuser/ssl_refactor
# cd $SSL_PROJECT_HOME/self_supervision/trainer/masking
cd /home/aiscuser/ssl_refactor/self_supervision/trainer/masking

python -u train.py --mask_rate 0.5 --model 'MLP' --dropout 0.1 --weight_decay 0.01 --lr 0.001 --decoder --version 'data_1p_run0' --data_perc 1