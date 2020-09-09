<p align="center">
<img src="media/bootcamp.jpg" width="400">
</p>

# Boot Camp :school_satchel:

This boot camp entails the minimal set of computational skills that are required to survive in a computational chemistry group. The capstone project will allow you to showcase the skills you have learned. Bachelor students usually need around four weeks to pass this boot camp. We offer [support](../SUPPORT.md) if you encounter any difficulties that you cannot resolve on your own.

## Configuration

In order to start programming, you need to configure your system.

### 1. Install Xcode (Mac OS only)

[Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) is a package provided by Apple containing [compilers, libraries and additional tools](http://www.buthowdoitknow.com/) required to develop applications for macOS. This installation step may take a while. After installation, open the Xcode app, agree to the licensing terms and let the app run until you are greeted by a welcome screen.

### 2. Install the Command Line Tools (Mac OS only)

Open up the 'terminal.app' and run the following command:

```bash
    xcode-select --install
```

This will allow us to use the Xcode software package from the terminal command line.

### 3. Install Conda

The open-source Anaconda Distribution is the easiest way to perform Python/R data science and machine learning on Linux, Windows, and Mac OS X. [Download](https://www.anaconda.com/distribution/#download-section) and install the Python 3.x version.

### 4. Configure Conda

[Conda](https://docs.conda.io/en/latest/) uses [virtual environments](https://towardsdatascience.com/a-guide-to-conda-environments-bc6180fc533) to isolate dependencies and create reproducible software environments. We have created such an environment for this boot camp. You can install this environment by using the following command in the terminal.app:


```bash
    conda env create -f environment.yml --name gqcg
```

After you have created your environment, you need to activate it each time you want to use it

```bash
    conda activate gqcg
```

Now you have access to all software needed to finish the Boot Camp.

## Essential Skills

### The shell

Using a shell gives you more power to do more tasks more quickly with your computer. Go through the lectures about the [Shell](https://swcarpentry.github.io/shell-novice).

### Git

Git is a state-of-the-art version control system and using Git with [Github](https://www.github.com) allows for efficient workflows. To see what Git is all about, check out the [Git lectures](https://swcarpentry.github.io/git-novice). One of the workflows used at GQCG is the [Git flow](https://datasift.github.io/gitflow/IntroducingGitFlow.html).

### Scientific Python

[Python](https://www.grahamwheeler.com/posts/python-crash-course.html) is a great language for learning general programming concepts due to its easy-to-read syntax. You can run a local [Jupyter notebook](https://jupyter.org/) by starting your own Jupyter server from the terminal

```bash
    jupyter notebook
```
Read the [SciPy Lectures](http://www.scipy-lectures.org) to learn about numerical programming in Python. If needed, look at the courses offered on [DataCamp](https://www.datacamp.com) for interactive tutorials. You can get three months of free access if you get the [Github Education Pack](https://education.github.com/pack). Check out the free compute infrastructure offered by [Google Colab](https://colab.research.google.com/) and/or [Microsoft Azure](https://notebooks.azure.com). 

### LaTeX

LaTeX allows you to easily typeset documents that contain a lot of mathematics. After following the notes on [LaTeX](http://latex.ugent.be/cursus.php), we can collaborate realtime on [Overleaf](https://www.overleaf.com) or through commits to a Git repo. For the latter case, [Tectonic](https://tectonic-typesetting.github.io/en-US/) is installed in the gqcg virtual environment.

### Code editors

The current preferred general editor at GQCG is the [Visual Studio Code editor](https://code.visualstudio.com/). We also have experience with the [JetBrains IDEs](https://www.jetbrains.com/), [Vim](https://www.vim.org/), [Emacs](https://www.gnu.org/software/emacs/emacs.html), and (Apple's Xcode)[https://developer.apple.com/xcode/].

## Capstone project: basic quantum chemical programming

As a capstone project, you are encouraged to complete the three projects below in order and discuss your progress with current members of GQCG. They are based on Daniel Crawford's group's [Programming Projects](https://github.com/CrawfordGroup/ProgrammingProjects). In our capstone project, the focus is on using basic scientific _Python_, but if you are interested in basic scientific C, then Crawford's projects provide an excellent introduction.

1. [Molecular geometry](projects/molecular_geometry/README.md)
2. [Harmonic vibrational analysis](projects/harmonic_vibrational_analysis/README.md)
3. [Restricted Hartree-Fock](projects/restricted_hartree_fock/README.md)

## Handy packages

* GQCG members have access to additional external monitors when needed. [Spectacle](https://www.spectacleapp.com/) will allow you to easily manage windows with handy keybindings.
* Use [iTerm2](https://www.iterm2.com/) as an upgrade to the standard Mac terminal.
* The UGent offers 1TB of free cloud storage on [Microsoft OneDrive](https://helpdesk.ugent.be/office365/en/onedrivefb.php) and free Office 365 apps.
* Need more compute? Please contact @guacke to gain access to the [UGent High Performance Computing Infrastructure](https://www.ugent.be/hpc/en).
