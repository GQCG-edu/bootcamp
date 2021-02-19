## Frequently Encountered Problems (for Windows users)
**connecting notebooks to the HPC from windows (thanks to @MFatjano)**

    module swap cluster/'Your_Cluster'

    qsub -I -l nodes=1:ppn=3

    singularity shell $VSC_SCRATCH/containers/psi4_latest.sif

    jupyter notebook --ip=0.0.0.0 --no-browser --allow-root

    IN OTHER LOCAL TERMINAL
    ssh -L 8888:nodexxx.'cluster'.os:xxxx vscxxxxx@login.hpc.ugent.be

copy 3<sup>rd</sup> link to browser

**Cannot perform an interactive login from a non TTY device.**

use winpty before input command
