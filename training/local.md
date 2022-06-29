
<p align="center">
<img src="../media/cloud.png" width="400">
</p>

# Enhanced collaboration with version control and Git

[Git](https://git-scm.com/downloads) is a state-of-the-art version control system and using Git with [Github](https://www.github.com) allows for efficient workflows. To see what Git is all about, check out the [Git lectures](https://swcarpentry.github.io/git-novice). 

> Assignment: Fork the `bootcamp` repo and pull your personal fork repo to your local machine. Commit a file `hello.md` with contents 'Hello, <G|QC|G>!' to the master branch of your fork.

# Getting in command with the VSCode editor

The [VSCode editor](https://code.visualstudio.com/) is a highly powerful and customizable cross-platform editor. After you have [gotten started](https://code.visualstudio.com/docs), take a look at the so-called `terminal`. This [terminal](https://swcarpentry.github.io/shell-novice) gives you more power to do more tasks more quickly with your computer. VSCode also has [builtin Git support](https://code.visualstudio.com/docs/introvideos/versioncontrol).

> Assignment: Open the local copy of your fork with VSCode. **Inside VSCode**, commit a new field `vscode.md` with contents 'Hello, VSCode!' to the master branch of your fork.

# Installing software with Docker containers

[Docker](https://www.docker.com/) allows us to easily share software and development environments that contain everything you need to finish this bootcamp. After you have [installed Docker](https://www.docker.com/get-started), [play around with Docker](https://www.docker.com/play-with-docker). Note that Windows users first need to install the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install).

VSCode has [excellent support for Docker](https://code.visualstudio.com/docs/remote/containers-tutorial). After installing the `Remote - Containers` extension in VSCode, open the folder containing your local copy of the bootcamp repo in VSCode. You should get the option to open the folder in a custom Docker container.

<p align="center">
<img src="../media/vscode-container.png" width="350">
</p>

This will initiate a **one-time** download (approximately 5GB) and can take some time depending on your internet connection. After your Docker container has booted, you can check that all commands in the terminal are now routed through Docker. 

> Assignment: Open an issue in which you add a list of Conda packages installed in the Docker container (`conda list`) and the version of Python you are using (`python --version`). Assign a team member of GQCG, who will review and close the issue.

# Enhanced data science with Python and Jupyter notebooks

If you have configured VSCode correctly in the steps above, you can run iPython notebooks directly in VSCode. Check this by opening one of the notebooks in the `projects` folder in VSCode. After VSCode has installed all extensions in the Docker container, you should be able to run the iPython notebooks on your local machine.

> Assignment: Check that you can run [the first notebook of the projects folder](../projects/molecular-geometry/Project1_Molecular_geometry_analysis.ipynb). Note that you are now running this notebook on your local machine and that you have access to all the resources your machine has to offer.

# Enhanced scientific communication with LaTeX workshop

In a similar way, you can install the `LaTeX Workshop` extension (by James Yu) in the Docker container. Through the command palette, you can typeset *.tex documents (`LaTeX Workshop: Build LaTeX project`). You can open the resulting *.pdf in a separate tab (`LaTeX Workshop: View LaTeX PDF file.`).

> Assignment: Make sure you can typeset the [LaTeX test provided](latex/main.tex).

# Capstone project: Hello <G|QC|G>!

Create a repo called `hello-gqcg` in your personal organisation and commit
* the above iPython notebook
* the above figure stored as pdf
* the LaTeX source for a document that contains that figure
* the typeset pdf document

> Congratulations! You are now able to collaborate with other Github users, generate computational results and report on those results.