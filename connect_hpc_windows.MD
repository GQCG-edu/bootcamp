# Connecting to HPC and opening a Jupyter notebook in a Singularity shell for Windows users

It is recommended that you first read the **[instructions for connecting to the infrastructure](http://hpcugent.github.io/vsc_user_docs/pdf/intro-HPC-windows-gent.pdf)** However, when you try to connect to the HPC via PuTTy or MobaXterm, you could encouter problems later on when you want to set up SSH tunnels for creating notebooks. That is why this document has been created to guide the Windows users. This means that chapter 2 and 3 of the **[instructions](http://hpcugent.github.io/vsc_user_docs/pdf/intro-HPC-windows-gent.pdf)** are covered here.

## Creating key pair and HPC account

First, let us make a public-private key pair. You can do this in a terminal on VS Code or in Windows Powershell.

<code>ssh-keygen -t rsa -b 4096</code>

When asked <code>Enter file in which to save the key:</code>, type in <code>/c/Users/your_username/.ssh/id_rsa</code>. Next, you can enter a passphrase. It is also possible to leave this empty.

When the key is generated, you should now apply for a **[VSC account](https://account.vscentrum.be/)**. After login via your UGent username and password, you will be asked to upload your public key file. This should be stored by default on <code>C:\Users\your_username\.ssh\id_rsa.pub</code>. It will take 15 minutes before your public key has been uploaded. You will also recieve an email with your VSC ID number after creating your account.

## Connecting to HPC

Now we can access the HPC via

<code>ssh vscxxxxx@login.hpc.ugent.be</code> 

With <code>xxxxx</code> being your VSC ID. If you get the following error message:

<code>Permission denied (publickey,gssapi-keyex,gssapi-with-mic)</code>

You can specify the location of your key file as followed:

<code>ssh -i C:\Users\your_username\.ssh\id_rsa.pub vscxxxxx@login.hpc.ugent.be</code>

You could also take a look at the next chapter **Using remote SSH in VS Code** for conencting to the HPC.

Then you take a look on how you can start an interactive session on the HPC (chapter 5 in the **[instructions](http://hpcugent.github.io/vsc_user_docs/pdf/intro-HPC-windows-gent.pdf)**)

## Using Remote SSH in VS Code

To connect to the HPC with only a few clicks and integrate visual file exploring via VS Code, you can install the **[Remote SSH extension](https://code.visualstudio.com/docs/remote/ssh)**. Select the Linux platform for this use case.

## Creating a Jupyter notebook within a Singularity shell on the HPC

On HPC systems, Singularity offers a more secure fork of Docker. So first we create the files wherin your containers will be saved. This is a **one-time** process.

<code> mkdir $VSC_SCRATCH/containers
mkdir $VSC_SCRATCH/containers/cache
mkdir $VSC_SCRATCH/containers/tmp

export SINGULARITY_CACHEDIR=$VSC_SCRATCH/containers/cache 
export SINGULARITY_TMPDIR=$VSC_SCRATCH/containers/tmp 
export SINGULARITY_PULLFOLDER=$VSC_SCRATCH/containers</code>

After configuring Singularity, you can pull and convert the Docker image in the scratch space.

<code>singularity pull docker://gqcg/psi4</code>

After converting the Docker image into a Singularity file you can shell into the resulting <code>*.sif</code> (on any cluster except **victini**). The default cluster is victini, so you will have to swap to another cluster and start an interactive session. To start one, you should take a look in chapter 5 in the **[instructions](http://hpcugent.github.io/vsc_user_docs/pdf/intro-HPC-windows-gent.pdf)**). There you can also look up the commands to check the states of each cluster. So for example, if we want to start an interactive session in **skitty**, you can use the following commands:

<code>module swap cluster/skitty
qsub -I -l nodes=1:ppn=3</code>

Then, we will move to the directory where we configured Singularity and start a shell.

<code>singularity shell $VSC_SCRATCH/containers/psi4_latest.sif</code>

Launch a Jupyter notebook in the Singularity container.

<code>jupyter notebook --ip=0.0.0.0 --no-browser --allow-root</code>

Then you will obtain three types of links with one of which looking like this.

<code>http://nodexxxx.skitty.os:8888/?token=a3bf3b8bbb14618586ff6716bfa8f51886ff14d0f5e2c458</code>

Start a **local** terminal and set up a SSH tunnel.

<code>ssh -L 8888:nodexxxx.skitty.os:8888 vscxxxxx@login.hpc.ugent.be</code>

Then, you can go back to the terminal with the Singulairy shell. Copy the third link in your web browser (don't directly follow it via VS Code) and then you should be able to create Jupyter notebooks!