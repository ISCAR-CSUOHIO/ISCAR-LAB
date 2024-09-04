#SBATCH --job-name datagen
#SBATCH --account=PFS0238
#SBATCH -J ondemand/sys/myjobs/basic_sequential
#SBATCH --time=01:30:00
#SBATCH --nodes=2
#SBATCH --exclusive

# The following is an example of a single-processor sequential job that uses $TMPDIR as its working area.
# This batch script copies the script file and input file from the directory the
# qsub command was called from into $TMPDIR, runs the code in $TMPDIR,
# and copies the output file back to the original directory.
#   https://www.osc.edu/supercomputing/batch-processing-at-osc/job-scripts
#
# Move to the directory where the job was submitted
#
module load miniconda3
source ~/.bashrc
conda activate ECG
python ModelCreation.py 
