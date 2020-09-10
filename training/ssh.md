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