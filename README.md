# Learning How to Run Matlab EEG-FFR Classifiers   
 
## Developped through the BrainHack School Montreal 2020

## Team Contributors 
-Project Developped and implemented by Isabelle Arseneau-Bruneau (McGill)

-Classifiers scripts provided by Fernando Llanos (University of Pittsburgh) 

-Dataset Provided by: Emily B. J. Coffey (Concordia University)

-Server to process data provided by: Zatorre Lab 

-Brainhack School Instructors Supervision: Yann Harel (BHS Montreal 2020)

## Summary 
I would like to use this project to classify Frequency Following Responses (FFRs) generated and vizualize the results. FFRs are auditory neural signals captured with EEG or MEG that provide a representation of how the brain encode complex sounds (e.g. speech or music). As I am novice with coding and several collaborators on my doctoral thesis project also have people to train on these ML procedures, I would like to implement a set of classifiers (Hidden Markov Model (HMM), Support Vector Machine (SVM), Cross-correlation (XCorr), LSTM) into a structure that would be beginner-friendly and that would provide more flexibility for future usage. Hence, this structure could be more easily adaptable for different datasets or variables. If time allow for it, the data will be organized according to standards in project management, I might implement the classifiers in a container, and use vizualization tools to provide figures of the results, but these steps would be secondary goals as my skills are limited. 

[Check our project on the Brainhack School Webpage](https://fakefornowbutinprogress.org)

## Project definition 

Overall, my goal is to learn how to run a machine-learning classifier writen in MATLAB and to examine if it can differentiate known components associated with the EEG-FFR signal (e.g. if the participants are musicians vs. non-musicians, if the stimuli that generated the FFRs are speech vs. piano sounds, etc.). 

The equipment and hardware used to collect FFRs influence the quality of the signal, and thus, the number of trials required for correct identification of known characteristics of the data. Thus, it can also be useful for developping research designs to keep track of the number of FFR trials required by each classifier to yield significant results. If time allow for it, I would like to use vizualization tools to provide figures of the results of this classification exercise. If this doesn't require to much adaptation, I will organize the data according to standards in project management (LORIS, EEG-BIDS).

*This will be replaced by a link to our my project on the BHS website*
[![](https://img.shields.io/badge/Visit-our%20project%20page-ff69b4)](https://school.brainhackmtl.org/project/template)

### Background

I invite you to watch the short description of my project on youtube [at timing 1:14:24](https://www.youtube.com/watch?v=MwyUUV6Vfdk&t=5198s) 

![The Frequency Following Response and Machine-Learning](https://www-nature-com.proxy3.library.mcgill.ca/articles/s41467-019-13003-w/figures/1)

Over the last decades, neuroimaging studies have provided cumulative evidence of the benefits of musical training, in particular how such training promotes neuroplasticity (Herholz et al. 2012). A clear benefit of musical training is manifested at the level of the frequency following response (FFR), an electrical potential sensitive to phase-locking captured by EEG that arises from subcortical and cortical sources (Coffey et al., 2016). They constitute a first and extremely rapid (starting at 7 ms) reaction of the brain to an auditory stimulus. FFRs are neural representations of the periodicity of entering auditory information (such as speech or music) [Kraus et al., 2017]. To decode auditory input, brainstem nuclei send information about sound features to the cortex. These features are used to build up more abstract representations, and allow us to recognize speech or musical sounds (Coffey et al., 20161; Kraus et al., 2010; 2014; 2017b; 2017c). 

With both cortical and subcortical contributors that modify its quality (Coffey, Herholz, Chepesiuk, Baillet, & Zatorre, 2016), the FFR constitutes an integrated response of the entire auditory system (Irvine et al., 2018). Further, the FFR is strongly associated with higher-level cognitive functions (Kraus, Anderson, White-Schwoch, Fay, & Popper, 2017); its quality affects learning and it has served as predictor of complex functions such as reading (Hornickel & Kraus, 2013). Even more significant, the FFR varies in individuals as a function of experience (enhanced in musicians, tonal language speakers, bilinguals [Coffey et al., 2016; Kraus & Chandrasekaran, 2010; Krizman, Marian, Shook, Skoe, & Kraus, 2012]) or pathologies (decreased in autism, dyslexia, traumatic brain injuries [Hornickel & Kraus, 2013;  Nina Kraus et al., 2016;, for extensive literature survey, see Kraus et al., 2017]. Several authors have thus proposed that it may serve as an auditory biomarker to target treatments and educational interventions (Kraus et al., 2015; Bidelman et al., 2017). Musicians are of particular interest because of correlations between the augmentation of their FFR quality and enhancements in their perception skills (Coffey et al., 2016; Kraus & Chandraserakan, 2010). The greater the musical training, the closer the neuronal representation approaches its corresponding auditory stimuli (Kraus et al., 2010b, 2015, 2017). The signal is transmitted faster, and becomes more precise and robust, which then benefits higher-order cognitive functions (Coffey et al., 2016; Kraus, Anderson, White-Schwoch, Fay, & Popper, 2017). This is a remarkable phenomenon, but how these enhancements are achieved remains unclear. 

A

### Tools 

The "project template" project will rely on the following technologies: 
 * [Markdown](https://guides.github.com/features/mastering-markdown/), to structure the text.
 * The [Hugo website framework](https://gohugo.io) which is used by the BHS website. This makes it possible to easily add the markdown project description to the website. 
 * Adding the project to the website relies on github, through pull requests. 

### Data 

Ultimately, the project template will be used by all BHS participants. Data on the different projects will be aggregareted on the [following page](https://school.brainhackmtl.org/project). This will serve as an additional example gallery in the years to come for future brainhack school students. Many reports from [BHS 2019](https://github.com/mtl-brainhack-school-2019) already used this template. 

### Deliverables

At the end of this project, we will have:
 - The current markdown document, completed and revised.
 - A gallery of the student projects at Brainhack 2020.
 - Instructions on the website about how to submit a pull request to the [BrainHack School website](https://github.com/BrainhackMTL/school) in order to add the project description to the website. 

## Results 

### Progress overview

The project was swiftly initiated by P Bellec, based on the existing template created in 2019 by Tristan Glatard and improved by different students. It was really not that hard. Community feedback is expected to lead to rapid further improvements of this first version. 

### Tools I learned during this project

 * **Meta-project** P Bellec learned how to do a meta project for the first time, which is developping a framework while using it at the same time. It felt really weird, but somehow quite fun as well. 
 * **Github workflow-** The successful use of this template approach will demonstrate that it is possible to incorporate dozens of students presentation on a website collaboratively over a few weeks. 
 * **Project content** Through the project reports generated using the template, it is possible to learn about what exactly the brainhack school students are working on. 
 
### Results 

#### Deliverable 1: report template

You are currently reading the report template! I will let you judge whether it is useful or not. If you think there is something that could be improved, please do not hesitate to open an issue [here](https://github.com/brainhack-school2020/project_template/issues) and let us know. 

#### Deliverable 2: project gallery

There is not yet a project gallery, as BHS 2020 is the first edition that will incorporate it on the website. You can still check out the [2019 BHS github organization](https://github.com/mtl-brainhack-school-2019)

##### ECG pupilometry pipeline by Marce Kauffmann 

The repository of this project can be found [here](https://github.com/mtl-brainhack-school-2019/ecg_pupillometry_pipeline_kaufmann). The objective was to create a processing pipeline for ECG and pupillometry data. The motivation behind this task is that Marcel's lab (MIST Lab @ Polytechnique Montreal) was conducting a Human-Robot-Interaction user study. The repo features:
 * a [video introduction](http://www.youtube.com/watch/8ZVCNeX42_A) to the project.
 * a presentation [made in a jupyter notebook](https://github.com/mtl-brainhack-school-2019/ecg_pupillometry_pipeline_kaufmann/blob/master/BrainHackPresentation.ipynb) on the results of the project.
 * Notebooks for all analyses.
 * Detailed requirements files, making it easy for others to replicate the environment of the notebook.
 * An overview of the results in the markdown document.
 
##### Other projects
Here are other good examples of repositories:
- [Learning to manipulate biosignals with python](https://github.com/mtl-brainhack-school-2019/franclespinas-biosignals) by François Lespinasse
- [Run multivariate anaylysis to relate behavioral and electropyhysiological data](https://github.com/mtl-brainhack-school-2019/PLS_PV_Behaviour) by Mike
- [PET pipeline automation and structural MRI exploration](https://github.com/mtl-brainhack-school-2019/rwickens-sMRI-PET) by Rebekah Wickens
- [Working with PSG [EEG] data from Parkinson's patients](https://github.com/mtl-brainhack-school-2019/Soraya-sleep-data-in-PD-patients) by Cryomatrix
- [Exploring Brain Functional Activation in Adolescents Who Attempted Suicide](https://github.com/mtl-brainhack-school-2019/Anthony-Gifuni-repo) by Anthony Gifuni

#### Deliverable 3: Instructions 
 
 To be made available soon. 
 
 
## Conclusion and acknowledgement

The BHS team hope you will find this template helpful in documenting your project. Developping this template was a group effort, and benefitted from the feedback and ideas of all BHS students over the years.
