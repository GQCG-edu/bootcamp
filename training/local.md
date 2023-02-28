
<p align="center">
<img src="../media/cloud.png" width="400">
</p>

# Enhanced collaboration with version control and Git

[Git](https://git-scm.com/downloads) is a state-of-the-art version control system and using Git with [Github](https://www.github.com) allows for efficient workflows. To see what Git is all about, check out the [Git lectures](https://swcarpentry.github.io/git-novice). 

> Assignment: Fork the `bootcamp` repo to your personal account on Github. After installing and configuring Git, pull your personal fork repo to your local machine. Commit a file `hello.md` with contents 'Hello, <G|QC|G>!' to the master branch of your fork.

# Getting in command with the VSCode editor

The [VSCode editor](https://code.visualstudio.com/) is a highly powerful and customizable cross-platform editor. After you have [gotten started](https://code.visualstudio.com/docs/getstarted/introvideos), take a look at the so-called `terminal`. This [terminal](https://swcarpentry.github.io/shell-novice) gives you more power to do more tasks more quickly with your computer. VSCode also has [builtin Git support](https://code.visualstudio.com/docs/introvideos/versioncontrol).

> Assignment: Open the local copy of your fork with VSCode. **Inside VSCode**, commit a new field `vscode.md` with contents 'Hello, VSCode!' to the master branch of your fork. Note that VSCode has a built-in Preview for markdown documents
> 
> <p align="center">
> <img src="../media/preview.png" width="200">
> </p>

# Installing software with Docker containers

[Docker](https://www.docker.com/) allows us to easily share software and development environments that contain everything you need to finish this bootcamp. After you have [installed Docker](https://www.docker.com/get-started), [play around with Docker](https://www.docker.com/play-with-docker). Note that Windows users **first** need to install the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install). At the time of writing this, Ubuntu 20.04.5 LTS is known to be more stable than the more recent version. A [specific Ubuntu distro can be specified within the wsl installation process](https://learn.microsoft.com/en-us/windows/wsl/basic-commands#install) or can afterwards be installed from the [Windows store](https://apps.microsoft.com/store/detail/ubuntu-20045-lts/9MTTCL66CPXJ?hl=en-us&gl=us). Windows users are also recommended to enable all listed distros under *Enable integration with additional distros* under Docker Settings -> Resources -> WSL Integration.

VSCode has [excellent support for Docker](https://code.visualstudio.com/docs/remote/containers-tutorial). Install the `Remote - Containers` extension in VSCode (Windows users should install the `Remote Development` extension pack, and revert the `Dev Containers` extension to `v0.266.1` in case of issues with the most recent version). [This tutorial](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) illustrates the process of cloning a repo. Clone the `bootcamp` repo locally and open the `project` folder in VSCode. You should get the option to open the folder in a custom Docker container.

<p align="center">
<img src="../media/vscode-container.png" width="350">
</p>

This will initiate a **one-time** download and can take some time depending on your internet connection. If you have configured VSCode correctly in the steps above, you can run iPython notebooks directly in VSCode. Check this by opening the [Restricted Hartree-Fock notebook](../project/rhf.ipynb) and running the code cells.

> Hint: Make sure you are using the kernel `/usr/local/miniconda3/bin/python`.
>
> <p align="center">
> <img src="../media/kernel.png" width="200">
> </p>

In a similar way, you can now typeset LaTeX documents locally. Open the `report` folder in VSCode and reopen the folder in the Devcontainer. You can typeset the `report.tex` file with Cmd/Ctrl+Shift+P > `LaTeX Workshop: Build LaTeX project`. You can open the resulting *.pdf in a separate tab (Cmd/Ctrl+Shift+P > `LaTeX Workshop: View LaTeX PDF file.`). Note that you can navigate your LaTeX code from inside your *.pdf by Ctrl/Cmd+clicking on a piece of text in the *.pdf.

# Collaborating Live: VSCode LiveShare

[Live Share](https://code.visualstudio.com/learn/collaboration/live-share) enables you to quickly collaborate with a friend, classmate, or professor on the same code without the need to sync code or to configure the same development tools, settings, or environment.

> Assignment: Start a Live Share sessions (Ctrl/Cmd+Shift+P > `Live Share: Start Collaboration Session (Share)`) and share that link with a collaborator. Make a document `hello-live-share.md` **on your local system** in which you **seperately** write your names.
