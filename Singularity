Bootstrap: docker
From: ubuntu:20.04
Stage: build

%environment
    export DEBIAN_FRONTEND=noninteractive
    export PATH="/usr/local/miniconda3/bin:${PATH}"

%post
    export DEBIAN_FRONTEND=noninteractive
    apt-get update 
    apt-get install -y wget pandoc texlive-full biber latexmk make git procps locales curl openssh-client
    apt-get clean 
    apt-get autoremove -y

    wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.8.2-Linux-x86_64.sh 
    bash Miniconda3-py37_4.8.2-Linux-x86_64.sh -p /usr/local/miniconda3 -b
    rm -f Miniconda3-py37_4.8.2-Linux-x86_64.sh

    export PATH="/usr/local/miniconda3/bin:${PATH}"

    conda --version

    conda install -c conda-forge numpy scipy matplotlib ipython jupyter pandas sympy nose h5py scikit-learn sympy
    conda install -c psi4 psi4

    NOW=`date`
    echo "export NOW=\"${NOW}\"" >> $SINGULARITY_ENVIRONMENT
