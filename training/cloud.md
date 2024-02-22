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

# Docker for HPC: Singularity

On HPC systems, Docker is not allowed (root access security risk) and we have to use Singularity. As a result, we have to give up some ease of use, but we do get a lot of compute instead. 

## First time configuration

> Note: You should follow the instructions below **only once** as then your HPC environment is configured for using Singularity.

To store the Singularity containers, we first create the relevant directories
```bash
mkdir $VSC_SCRATCH/containers
mkdir $VSC_SCRATCH/containers/cache
mkdir $VSC_SCRATCH/containers/tmp
```
and point the Singularity installation to those directories by adding the following lines to our `.bashrc`
```bash
export SINGULARITY_CACHEDIR=$VSC_SCRATCH/containers/cache 
export SINGULARITY_TMPDIR=$VSC_SCRATCH/containers/tmp 
export SINGULARITY_PULLFOLDER=$VSC_SCRATCH/containers
```
After configuring Singularity, you can pull (and automatically convert) the bootcamp Singularity image 
```bash
singularity pull oras://ghcr.io/gqcg-edu/bootcamp/project-sif:master
```

## Using the Singularity image

Inside VS Code, open a terminal and submit an interactive job
```bash
module swap cluster/skitty
qsub -I -l nodes=1:ppn=6
```
Inside the interactive session, you can now run python scripts as follows. Suppose we have a script named ``python_script123.py``, we run
```bash
singularity run $SINGULARITY_PULLFOLDER/project-sif_master.sif python3 python_script123.py
```
IPython notebooks can also be run: for a notebook named ``my_ipython_notebook.ipynb``, we run
```bash
singularity run $SINGULARITY_PULLFOLDER/project-sif_master.sif ipython -c "%run my_ipython_notebook.ipynb"
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
