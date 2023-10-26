<p align="center">
<img src="../media/hpc.png" width="400">
</p>

# Introduction

When finished, a quantum chemical calculation essentially consists of a long list of logical steps. This is exactly what a computer processor can do: it processes logical operations. The problem is that quantum chemical calculations need **lots** of logical operations before they are able to describe something accurately. 

The logical operations performed are called 'Floating Point Operations' and every computer system is capable of performing some amount of these operations a second ('Floating point Operations Per Second' or flops). An average laptop can reach around 20 GFlops. Although this may seem much, a **low** level quantum chemical calculation needs around 1440000 Giga floating operations (around one hour of compute time on the laptop). As we will run thousands of high-level calculations, we will need more GFlops if we are to obtain results in a limited amount of time.

Enter [Cloud computing](https://en.wikipedia.org/wiki/Cloud_computing), where you access larger computational resources over the internet. In this tutorial, we will largely focus on 'High Performance Computing' centra, as these are (currently) the most common cloud computing offerings you will encounter in academia.

# Connecting to an HPC

> In this tutorial, we will focus on gaining access to the [Flemish VSCentrum](https://www.vscentrum.be/). Please consult the documentation of the HPC associated with your own university to gain access to that HPC.

We recommend that you first browse through the [HPC documentation](https://www.ugent.be/hpc/en/support/documentation.htm), especially the section `Getting an HPC account`. In short:

1. Make a public-private key pair. You can do this in a terminal on VS Code or in Windows Powershell.
    ```bash
    ssh-keygen -t rsa -b 4096
    ```
2. When the key is generated, you can apply for a **[VSC account](https://account.vscentrum.be/)**. 
3. Now you can access the HPC via
    ```bash
    ssh vscxxxxx@login.hpc.ugent.be</code> 
    ```
    with `xxxxx` being your VSC ID. If you get the following error message
    ```
    Permission denied (publickey,gssapi-keyex,gssapi-with-mic)
    ```
    you have to explicitly specify the location of your key file, e.g.
    ```
    ssh -i C:\Users\your_username\.ssh\id_rsa.pub vscxxxxx@login.hpc.ugent.be
    ```

You connect to the `login nodes` of the HPC, which are **not** intended for **running** calculations, only **starting** them. Go through the sections `How to start background jobs?` and `How to start jobs with user interaction?` in the [HPC documentation](https://www.ugent.be/hpc/en/support/documentation.htm) to learn how to run such jobs.

The preferred way to connect to the HPC is with VS Code as you get **all** the editing capabilities included in VS Code on the HPC.  **Before** you connect to HPC using VS Code, construct an alias for the VS Code server, as this server will require more space than is available on `$HOME`
```bash
cd $HOME
ln -s $VSC_SCRATCH/.vscode-server .vscode-server
```
Then install the **[Remote SSH extension](https://code.visualstudio.com/docs/remote/ssh)** and browse through the documentation. Subsequently, connect to the HPC with VS Code.

# Using Git and Github with the HPC

To authenticate to Github, you should also make a public-private key pair on your HPC account and upload the **public key** to your Github account (via `Settings>SSH and GPG keys` on Github). For this, first generate a public-private key pair on a login node of the HPC:
```bash
ssh-keygen -t rsa -b 4096
```
Then upload the `id_rsa.pub` key to Github. After configuring your Git client on the HPC
```bash
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
```
you should be able to pull from your own repositories.

# Docker for HPC: Apptainer (prev. Singularity)

On HPC systems, Docker is not allowed (root access security risk) and we have to use Apptainer, previously known as Singularity. As a result, we have to give up some ease of use, but we do get a lot of compute instead. 

## First time configuration

> Note: You should follow the instructions below **only once** as then your HPC environment is configured for using Singularity.

Following the [HPC docs](https://docs.hpc.ugent.be/Linux/apptainer/). Submit an interactive session to the [debug cluster](https://docs.hpc.ugent.be/Linux/interactive_debug/), e.g.

```bash
module swap cluster/donphan
qsub -I -l nodes=1:ppn=6 -l mem=24GB
```

and build the SIF image

- for the bootcamp image:
```bash
APPTAINER_CACHEDIR=/tmp/ APPTAINER_TMPDIR=/tmp/ apptainer build --fakeroot /tmp/bootcamp.sif oras://ghcr.io/gqcg-edu/bootcamp/project-sif:master
```
- for the latest gqcp image:
```bash
APPTAINER_CACHEDIR=/tmp/ APPTAINER_TMPDIR=/tmp/ apptainer build --fakeroot /tmp/gqcp_latest.sif docker://gqcg/gqcp
```

Copy the resulting SIF to your `$VSC_SCRATCH` or `$VSC_SCRATCH_VO_USER` directories.

```bash
# if $VSC_SCRATCH/containers does not yet exist
mkdir $VSC_SCRATCH/containers
cp /tmp/bootcamp.sif $VSC_SCRATCH/containers
```
(and/or)
```bash
cp /tmp/gqcp_latest.sif $VSC_SCRATCH/containers
```
> Note: if your connection consistently times out before your apptainer build is completed, you can alternatively run the installation in as a job using `qsub build_image.sh`. For example, the `build_image.sh` file should look something like this:
```shell
#!/usr/bin/env bash
#PBS -l nodes=1:ppn=8
#PBS -l mem=32gb
#PBS -l walltime=°1:00:00
#PBS -N build_image
#PBS -o build_image.out
#PBS -e build_image.err
#PBS -m abe
#PBS -M your-email@example.com

# build
APPTAINER_CACHEDIR=/tmp/ APPTAINER_TMPDIR=/tmp/ apptainer build --fakeroot /tmp/gqcp_latest.sif docker://gqcg/gqcp

# move
cp /tmp/gqcp_latest.sif $VSC_SCRATCH/containers
```


## Using the Apptainer image

Inside VS Code, open a terminal and submit an interactive job
```bash
module swap cluster/skitty
qsub -I -l nodes=1:ppn=6
```
You can now shell into the image
```bash
apptainer shell $VSC_SCRATCH/containers/my_container.sif
```
Now you can simply use the command line as you would normally. For example,
- running a python file `my_py_file.py`
```
python my_py_file.py
```
- installing packages onto the image
```bash
pip install scipy --user
```
>Note: ensure you add the `--user` flag when trying to install packages with pip.
- Activating an interactive python session
```bash
python
# the python environment is now activated and you may run python code as you would normally
>>> import numpy as np
>>> print('Hello world!')
# exit the python environment with the exit() command
>>> exit()
```

Inside the interactive session, you can also run python scripts. Suppose we have a script named ``python_script123.py``, we run
```bash
apptainer run $APPTAINER_PULLFOLDER/bootcamp.sif python3 python_script123.py
```
IPython notebooks can also be run: for a notebook named ``my_ipython_notebook.ipynb``, we run
```bash
apptainer run $APPTAINER_PULLFOLDER/bootcamp.sif ipython -c "%run my_ipython_notebook.ipynb"
```
Make sure that any output (figures, tables, ...) in those notebooks is stored (as e.g. *.pdf or *.json) and not just rendered in the Jupyter client. In this way you can use the following workflow for development
1. Edit the Jupyter notebook in VS Code
2. Run the notebook with the above command
3. Go back to step 1.

Once you have developed your code and you want to use it in **production** (e.g. running a thousand calculations), you preferably
* convert your notebook to a python script
* make sure that you can pass relevant [command line arguments](https://docs.python.org/3/library/argparse.html) to that script
* use multi-job submission (see relevant section in [the HPC documentation](https://www.ugent.be/hpc/en/support/documentation.htm))
* combine the data from that multi-job submission in the subsequent analysis

# Frequently Encountered Problems

## Cannot perform an interactive login from a non TTY device.

Use `winpty` before input command.
