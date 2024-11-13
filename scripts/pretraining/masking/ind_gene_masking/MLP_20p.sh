#!/bin/bash

#SBATCH -J hvg_ae_ssl_20p
#SBATCH -p gpu_p
#SBATCH --qos gpu
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=6
#SBATCH -t 2-00:00:00
#SBATCH --mem=90GB
#SBATCH --nice=10000

echo "Current directory: $(pwd)"
echo "SSL_PROJECT_HOME: $SSL_PROJECT_HOME"
echo "Target directory: $MASKING_DIR"

if [ -n "$1" ]; then
    source "$1"
else
    source "$HOME/.bashrc"
fi

export PYTHONPATH=$PYTHONPATH:$SSL_PROJECT_HOME

cd $SSL_PROJECT_HOME/self_supervision/trainer/masking
echo "Current directory: $(pwd)"

python -u train.py --mask_rate 0.2 --model 'MLP' --dropout 0.1 --weight_decay 0.01 --lr 0.001 --decoder True --hvg True