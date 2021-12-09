#!/bin/bash
#SBATCH --job-name="1_2_3"
#SBATCH --output=/cluster/projects/nn9705k/evenmm/article/outfiles/out-noise100-1_2_3-%a.out
#SBATCH --mail-type=NONE
#SBATCH --mail-user=e.m.myklebust@medisin.uio.no
#SBATCH --time=24:00:00
#SBATCH --mem=3G # Do not set to limit because then it is too big
#SBATCH --account=nn9705k
#SBATCH --cpus-per-task=1      ### Number of threads per task (OMP threads)
#SBATCH --array=1-9
#SBATCH --ntasks=1

set -o errexit # Exit the script on any error
set -o nounset # Treat any unset variables as an error

WORKDIR=${SLURM_SUBMIT_DIR}
echo "The name of the job is: $SLURM_JOB_NAME"
echo "The job ID is $SLURM_JOB_ID"
echo "We are running from this directory: $SLURM_SUBMIT_DIR"
echo "We are running from this directory: $SLURM_SUBMIT_DIR"
echo "The job was run on these nodes: $SLURM_JOB_NODELIST"
echo "Number of nodes: $SLURM_JOB_NUM_NODES"
echo "We are using $SLURM_CPUS_ON_NODE cores"
echo "We are using $SLURM_CPUS_ON_NODE cores per node"
echo ""

module --quiet purge
module load --silent MATLAB/2020a
module list

matlab -batch "run_1_2_3_cluster($SLURM_ARRAY_TASK_ID)"

