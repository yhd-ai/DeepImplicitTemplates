#!/bin/bash
#SBATCH --job-name="smplsdf"
#SBATCH --nodes=1
#SBATCH --cpus-per-task=12
#SBATCH --constraint="GPU_GEN:AMPERE|GPU_GEN:TURING"
#SBATCH --gres=gpu:1,VRAM:32G
#SBATCH --mem=32G
#SBATCH --time=5-24:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user="k610215095@gmail.com"
#SBATCH --output=/storage/user/lhao/haodong/DeepImplicitTemplates/slurm-%j.out
#SBATCH --error=/storage/user/lhao/haodong/DeepImplicitTemplates/slurm-%j.error


srun 
python train_deep_implicit_templates.py -e examples/smplf --debug --batch_split 2  -d ./data -c latest
