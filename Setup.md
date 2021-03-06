You have TWO options to run the Machine-Learning (ML) classifiers:

STAND-ALONE SCRIPTS:

If you can't/don't want to use the jupyter notebook, you can run the classifiers scripts directly in MATLAB. 
1) Make sure to download the whole folder called 'Classifiers' to preserve the structure of the scripts and functions. (You might have to download the whole repository to do so)
2) On your local computer terminal, go to the directory where you downloded the classifiers' folder and start MATLAB. 
3) Make sure to follow the steps provided in the file "Instructions_SA_Scripts" (to be added soon) for instructions on the Machine-Learning Procedures.     

JUPYTER NOTEBOOK:

The Jupyter Notebook requires the installation of a virtual environment adapted to MATLAB. 
The instructions to install this MATLAB kernel were made from this web page:
https://am111.readthedocs.io/en/latest/jmatlab_install.html 
Although, one of the commands contained a typo ( 'pip install matlab_kernal' ; it should be 'pip install matlab_kernel') so to ease the workflow of this tutorial and add additional information, I made a corrected copy of these instructions.   

1) Go to the following repository and follow the instructions described on this page: 
https://github.com/arsisabelle/AM111/blob/master/docs/jmatlab_install.ipynb

***Instructions to Open the Jupyter Notebooks of This Tutorial***

Make a clone (a copy, see info below) of the git hub repository https://github.com/brainhack-school2020/ArsIsabelle_BHS_Project on your local computer, so you can have your own copy of this notebook and the notebook [Matlab_HMM_Scripts_Notebook.ipynb](https://github.com/brainhack-school2020/ArsIsabelle_BHS_Project/Matlab_HMM_Scripts_Notebook.ipynb) on your local machine (aka your computer). This is useful because, once you [open these notebooks from your local computer](, you can take notes directly on the notebook (without disturbing the original document), run the commands, and save everything on your local machine.

#### Make a Copy of This Git Repository

To do so, first go to your terminal, and go to the directory where you 
would like to have this material cloned on your local machine with the cd command. 

Then with the git clone command and the https address of the repository, you will clone the material on your local machine: 

`cd your_directory/of_choice/`

`git clone https://github.com/brainhack-school2020/ArsIsabelle_BHS_Project.git`     

#### To Start the jupyter notebook of this repository: 

* Open your terminal (Press the keys 'cmd + space' or 'ctrl + space', write 'Terminal', press 'enter'
* Go to the directory: `cd path/to/local_directory_that_contains_notebooks`

_If this command does not work, make sure to enter the FULL path to your folder 'ArsIsabelle_BHS_Project' 
Or navigate manually to this directory with the `cd`command_.

* Confirm that you are in ArsIsabelle_BHS_Project: `pwd`

_The terminal should output a path finishing with ArsIsabelle_BHS_Project (e.g. Users/Isabelle/Desktop/ArsIsabelle_BHS_Project )

* Confirm that the Notebooks are in ArsIsabelle_BHS_Project: `ls`
_Your terminal should output the several files and folders, check for:_
    - __Tutorial_Introduction.ipynb__
    - __Matlab_HMM_Scripts_Notebook.ipynb__

* Start __this notebook__ with command: `jupyter notebook Tutorial_Introduction.ipynb`

_A web page with this jupyter notebook should open in your web browser_
![Tutorial Introduction](/images/Tutorial_Introduction.png)

* To quit the notebook, go to your terminal windowL
- Press the keys 'ctrl + c'
- Enter `y` when asked 'Shutdown this notebook server (y/[n])?'

* Start the __Machine-Learning Notebook__ with command: `jupyter notebook Matlab_HMM_Scripts_Notebook.ipynb`

![Machine-Learning Tutorial](/images/ML_Notebook.png)

Installation instructions are also provided in the readme.md (briefly) and in the [Tutorial_Introduction.ipynb](https://github.com/brainhack-school2020/ArsIsabelle_BHS_Project/blob/master/Tutorial_Introduction.ipynb) notebook (detailled).
