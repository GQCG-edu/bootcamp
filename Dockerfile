FROM ubuntu:22.04

# non interactive frontend for locales
ARG DEBIAN_FRONTEND=noninteractive

# installing texlive and utils
RUN apt-get update \
    && apt-get install -y --no-install-recommends wget pandoc texlive-full biber latexmk make git procps locales curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get autoremove -y

# generating locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8 LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# installing cpanm & missing latexindent dependencies
RUN curl -L http://cpanmin.us | perl - --self-upgrade && \
    cpanm Log::Dispatch::File YAML::Tiny File::HomeDir

ENV PATH="/usr/local/miniconda3/bin:${PATH}"
ARG PATH="/usr/local/miniconda3/bin:${PATH}"
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-py37_4.8.2-Linux-x86_64.sh \
    && bash Miniconda3-py37_4.8.2-Linux-x86_64.sh -p /usr/local/miniconda3 -b \
    && rm -f Miniconda3-py37_4.8.2-Linux-x86_64.sh
RUN conda --version

RUN conda install -c conda-forge numpy scipy matplotlib ipython jupyter pandas sympy nose h5py scikit-learn sympy
RUN conda install -c psi4 psi4

ENTRYPOINT bash
