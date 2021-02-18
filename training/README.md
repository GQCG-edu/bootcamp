
# Training

In this training we will first focussing on acquiring high-level skills using freely available resources that run in your browser (Software as a Service). After you have obtained these skills, we will break free from the confines of this resources and transition to a much more powerful Platform as a Service. At the end of this training, you will be able to run scientific simulations on highly powerful supercomputers. If you would encounter technical problems, check the [Frequently_Encountered_problem.md](https://github.com/ruvdrsti/bootcamp/blob/contributions/Frequently_Encountered_Problems.md) file, maybe someone else had these problems before and wrote them down here.

## Software as a Service

<p align="center">
<img src="../media/local.png" width="350">
</p>

### Managing your progress and getting help with Github

GitHub is a code hosting platform for version control and collaboration. It lets you and others work together on projects from anywhere. Implement the [GitHub Hello World project](https://guides.github.com/activities/hello-world/). Learn how you can [contribute back by opening and closing issues](https://guides.github.com/features/issues/), how you can [socialize](https://guides.github.com/activities/socialize/) and how you can [write in GitHub markdown](https://guides.github.com/features/mastering-markdown/). 

> Assignment: study the `bootcamp` repository. Is there something you would like to improve? Open an issue and, if you are up for it, propose to resolve the issues by opening a PR and assigning one of the members of GQCG as a reviewer.

### Scientific communication with LaTeX with Overleaf

LaTeX allows you to easily typeset documents that contain a lot of mathematics. In order to use LaTeX, you first need to study the [structure and syntax of LaTeX documents](https://www.overleaf.com/learn/latex/Free_online_introduction_to_LaTeX_(part_1)). You can write and typeset LaTeX documents in your browser using [Overleaf](https://www.overleaf.com). 

> Assignment: open an issue in the `bootcamp` repo with a title `$username: LaTeX progress` (substitute your username in `$username`) in which you upload a *.pdf file that contains your name, the typeset [time-dependent Schrödinger equation](https://en.wikipedia.org/wiki/Schr%C3%B6dinger_equation#Time-dependent_equation) and [an image of Erwin Schrödinger](https://en.wikipedia.org/wiki/Schr%C3%B6dinger_equation#/media/File:Erwin_Schrodinger2.jpg). Mention a team member of GQCG, who will review and close the issue.

### Data Science with Python and Google Colab

Google Colab allows you to write and execute Python in your browser. The following [iPython notebook](https://colab.research.google.com/notebooks/intro.ipynb) will show you how this is done.

The best way to learn scientific Python is to look at the courses offered on [DataCamp](https://www.datacamp.com) for interactive tutorials. You can get three months of free access if you get the [Github Education Pack](https://education.github.com/pack). The [SciPy Lectures](http://www.scipy-lectures.org) provide an overview of what you will learn.

> Assignment: open an issue in the `bootcamp` repo with a title `$username: Python Colab progress` in which you upload a iPython notebook in which you:
> - try to diagonalize a random 40 by 40 matrix and a random symmetric 40 by 40 matrix. 
> - reproduce the following image:
> <p align="center">
> <img src="../media/python-colab.png" width="350">
> </p>
> Mention a team member of GQCG, who will review and close the issue.

## Platform as a Service

<p align="center">
<img src="../media/cloud.png" width="400">
</p>

### Getting in command with the VSCode editor

The [VSCode editor](https://code.visualstudio.com/) is a highly powerful and customizable cross-platform editor. After you have [gotten started](https://code.visualstudio.com/docs), take a look at the so-called `terminal`. This [terminal](https://swcarpentry.github.io/shell-novice) gives you more power to do more tasks more quickly with your computer. On Windows, you will need to point to the [Windows Subsystem for Linux](https://stackoverflow.com/questions/42606837/how-do-i-use-bash-on-windows-from-the-visual-studio-code-integrated-terminal) to follow these lessons.

> Assignment: using the terminal, look at the content of your directories. Create, copy and delete a file. Open an issue on GitHub and copy your commands in that issue. 
> Mention a team member of GQCG, who will review and close the issue.

### Enhanced collaboration with version control and Git

Git is a state-of-the-art version control system and using Git with [Github](https://www.github.com) allows for efficient workflows. To see what Git is all about, check out the [Git lectures](https://swcarpentry.github.io/git-novice). VSCode has [builtin Git support](https://code.visualstudio.com/docs/introvideos/versioncontrol).

> Assignment: Fork the `bootcamp` repo and pull your personal fork repo to your local machine. Add your name to the `WALL_OF_FAME` file in a draft PR to the the original `bootcamp` repo. Once you have finished the bootcamp, mark the PR as `ready for review` and assign a team member of GQCG, who will review and close the PR.

### Installing software with Docker containers

[Docker](https://www.docker.com/) allows us to easily share software and development environments that contain everything you need to finish this bootcamp. After you have [installed Docker](https://www.docker.com/get-started), [play around with Docker](https://www.docker.com/play-with-docker).

VSCode has [excellent support for Docker](https://code.visualstudio.com/docs/remote/containers-tutorial). After installing the `Remote - Containers` extension in VSCode,  open the folder containing the bootcamp in VSCode and save your workspace. Then, use the [command palette](https://code.visualstudio.com/docs/getstarted/userinterface#:~:text=The%20most%20important%20key%20combination,provides%20access%20to%20many%20commands.) to select `Remote-Containers: Open Workspace in Container`. After selecting the workspace, you can choose the option to start from the existing `Dockerfile`. The first time you open the workspace in a container, a Docker image has to be built which will take quite some time. You can check that all commands in the terminal are now routed through Docker. 

> Assignment: Open an issue in which you add a list of Conda packages installed in the Docker container (`conda list`) and the version of Python you are using (`python --version`). Assign a team member of GQCG, who will review and close the issue.

### Enhanced data science with Python and Jupyter notebooks

If you have configured VSCode correctly in the steps above, you can run iPython notebooks directly in VSCode. Check this by opening one of the notebooks in the `projects` folder in VSCode. After VSCode has installed all extensions in the Docker container, you should be able to run the iPython notebooks on your local machine.

> Assignment: Check that you can run [the first notebook of the projects folder](../projects/molecular-geometry/Project1_Molecular_geometry_analysis.ipynb). Note that you are now running this notebook on your local machine and that you have access to all the resources your machine has to offer.

### Enhanced scientific communication with LaTeX workshop

In a similar way, you can install the `LaTeX Workshop` extension (by James Yu) in the Docker container. Through the command palette, you can typeset *.tex documents (`LaTeX Workshop: Build LaTeX project`). You can open the resulting *.pdf in a separate tab (`LaTeX Workshop: View LaTeX PDF file.`).

> Assignment: Make sure you can typeset the [LaTeX test provided](latex/main.tex).

### Scaling up your research with remote development and the UGent HPC

The main reason why we are using Docker is that Docker can be run on any machine you like and will give exactly the same computational environment and results. As such, you could run your notebooks on the machines hosted by the [UGent HPC](https://www.ugent.be/hpc/en), which offer free access to e.g. machines with 32 cores and 177GB RAM memory. Please contact [@dariatols](https://github.com/GQCG-org/GQCG/blob/master/members/daria_tolstykh.md) if you interested in using those machines.
