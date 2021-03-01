## Frequently Encountered Problems (for Windows users)
### Connecting notebooks to the HPC from Windows (thanks to @MFatjano).
For a more detailed description view **[connect_hpc_windows.MD](https://github.com/ruvdrsti/bootcamp/edit/contributions/connect_hpc_windows.MD)**
```
module swap cluster/${CHOOSE_CLUSTER}

qsub -I -l nodes=1:ppn=3

singularity shell $VSC_SCRATCH/containers/psi4_latest.sif

jupyter notebook --ip=0.0.0.0 --no-browser --allow-root
```
IN OTHER LOCAL TERMINAL
```
ssh -L 8888:nodexxx.'cluster'.os:xxxx vscxxxxx@login.hpc.ugent.be
```
Copy the third link to your browser.

### Cannot perform an interactive login from a non TTY device.
Use `winpty before input command.
