# Learning How to Run EEG-FFR Classifiers in MATLAB   
 
## Developped through the BrainHack School Montreal 2020

## Team Contributors 

-Project Developed and implemented by Isabelle Arseneau-Bruneau (McGill University)

-Original classifiers Scripts provided by Fernando Llanos, Ph.D. (University of Pittsburgh) 

-Dataset Provided by Emily B. J. Coffey, Ph.D. (Concordia University)

-Brainhack School Instructor: Pierre Bellec, Tristan Glatard, Yann Harel (BHS Montreal 2020)

## Summary 

I would like to use this project to classify Frequency Following Responses (FFRs) with Machine-Learning, notably with a Hidden MArkov Model. FFRs are auditory neural signals captured with EEG or MEG that provide a representation of how the brain encode complex sounds (e.g. speech or music). As I am novice with coding, I would like to implement my classifier (Hidden Markov Model (HMM) into a structure that would be beginner-friendly and that would provide more flexibility for future usage (e.g. with other classifiers such as Support Vector Machine (SVM), Cross-correlation (XCorr), LSTM, with other variables, and with different datasets). I would like to put together a set of resources for my futur self, my research assistant, and the collaborators on my doctoral thesis project ( who also have students to train on these ML procedures). Hence, I aim for a structure that would be optimaly adaptable for different datasets or variables. The data will be organized according to components of standards in project management (EEG-BIDS), the classifiers Notebook will be implemented in a virtual environement, and basic matlab vizualization tools will provide figures of the results. However, the latest steps remain a secondary goal as my skills (and the time allowed for this project) are limited. 

## Project definition 

Overall, my goal is to learn how to run a machine-learning classifier writen in MATLAB and to examine if it can predict a variable that is associated with the EEG-FFR signal (e.g. if the stimuli that generated the FFRs is a speech vs. piano sound, but it could be other variables cuch as if the participants are musicians vs. non-musicians, etc.). 

I hope to run and put together beginner-friendly procedures that would make ML classification writen in MATLAB more accessible. As the equipment and hardware used to record FFRs can influence the quality of the signal, the scripts could also track the number of trials required for a significant classification. It would be useful to adjust research designs and target more feasable research questions. In addition to keeping track of the number of FFR trials, the instruction of the scripts would ideally make it more flexible for datasets of different dimensions. 

## ASSIGNMENT WEEK 3

[Check the video description of my project on Youtube!](https://www.youtube.com/watch?v=6lX_-AgOXug) 

### Background

![The Frequency Following Response and Machine-Learning](https://www-nature-com.proxy3.library.mcgill.ca/articles/s41467-019-13003-w/figures/1)

Over the last decades, neuroimaging studies have provided cumulative evidence of the benefits of musical training, in particular how such training promotes neuroplasticity (Herholz et al. 2012). A clear benefit of musical training is manifested at the level of the frequency following response (FFR), an electrical potential sensitive to phase-locking captured by EEG that arises from subcortical and cortical sources (Coffey et al., 2016). The FFR is an extremely rapid (starting at 7 ms) reaction of the brain to an auditory stimulus. It is a neural representation of the periodicity of the entering auditory information and allow us to recognize speech or music sounds (Coffey et al., 20161; Kraus et al., 2010; 2014; 2017b; 2017c). With both cortical and subcortical contributors that modify its quality (Coffey, Herholz, Chepesiuk, Baillet, & Zatorre, 2016), the FFR represents an integrated response of the entire auditory system (Irvine et al., 2018).  

Interestingly, the FFR varies in individuals as a function of experience (enhanced in musicians, tonal language speakers, bilinguals [Coffey et al., 2016; Kraus & Chandrasekaran, 2010; Krizman, Marian, Shook, Skoe, & Kraus, 2012]) or pathologies (decreased in autism, dyslexia, traumatic brain injuries [Hornickel & Kraus, 2013;  Nina Kraus et al., 2016;, for extensive literature survey, see Kraus et al., 2017]. Several authors have thus proposed that it may serve as an auditory biomarker to target treatments and educational interventions (Kraus et al., 2015; Bidelman et al., 2017). Musicians are of particular interest because of correlations between the augmentation of their FFR quality and enhancements in their perception skills (Coffey et al., 2016; Kraus & Chandraserakan, 2010). The greater the musical training, the closer the neuronal representation approaches its corresponding auditory stimuli (Kraus et al., 2010b, 2015, 2017). The signal is transmitted faster, and becomes more precise and robust, which then benefits higher-order cognitive functions (Coffey et al., 2016; Kraus, Anderson, White-Schwoch, Fay, & Popper, 2017). This is a remarkable phenomenon, but how these enhancements are achieved remains unclear. 

A considerable challenge for the understanding of FFR enhancements mechanisms is the very small amplitude (measured in nanovolt) and the bad signal-to-noise ratio (SNR) of the neural signal. Hence, measuring FFRs typically requires several thousand exposures to the same auditory stimulus (which are then averaged). These recording difficulties considerably limits the research questions that can be expored with FFRs while they remain a key component of plasticity mechanisms associated with musical training. 

Combined with optimized equipment and hardware, machine-learning classifiers developed with speech-evoked neurophysiological responses have recently considerably reduced the number of trials necessary to obtain a usable FFR signal (Zilong Xie et al., 2019). The classification of FFR is starting to emmerge as an objective mean to assess auditory perception (Llanos et al., 2019; Losorelli et al., 2019 PREPRINT). Thus, my current BHS project aims to run classifiers on FFRs that were generated by 100 Hz speech and piano tones in musicians and non-musicians. I have to perform these procedures as part of my doctoral thesis project and with this course, I hope to implement them in a way that will facilitate collaborations and open science.  

### Tools 

Xie et al., 2019 describes procedures and toolboxes implemented in MATLAB. As our lab also uses this software to analyse EEG-FFR, I will develop my project in this language. 

Tools I will use : 
* A Bash Shell
* A Remote Server (ZatorreLabServer.mni.mcgill.ca)
* MATLAB
* The gpu MATLAB Toolboxe (and other toolboxes TBC)
* Visual Studio Code 
* Github
* HMM, SVM and XCorr models (originaly developped by Fernando Llanos)
* SLTM model TBC (originaly developped by Fernando Llanos)

* [Markdown](https://guides.github.com/features/mastering-markdown/), to structure my text as I am very novice with coding
* Hugo to submit a pull request to the [BrainHack School website](https://github.com/BrainhackMTL/school) to add the project description to the website. 

Additional Tools Depending on Time:
* Jupyter-MATLAB Notebook (and dependencies)
* Container (TBC)
* LORIS and EEG-BIDS (TBC)
  
### Data 

The dataset for this project was previously published by Emily Coffey and colleagues from the Zatorre Lab at McGill University (Coffey et al., 2017). It consists of a set of pre-processed EEG-FFR collected in 28 subjects (14 musicians and 14 non-musicians). Demographic and music experience information were also collected with the Montreal Music History Questionnaire (Coffey et al., 2011). The stimuli used were a speech |dah| and a piano tone stimuli, with both a duration of 100ms and a fondamental frequency of 100 Hz. For more details on this dataset, please see [Cortical Correlates of the Auditory Frequency-Following and Onset Responses: EEG and fMRI Evidence](https://www.jneurosci.org/content/37/4/830)

### Deliverables

At the end of this project, we will have:
 - The current markdown document, completed and revised.
 - Beginner-Friendly procedures to run a HMM, SVM and XCorr classifiers on FFR-EEG data
 - A section in the gallery of the BHS website about this project

## Results 
By the end of this project, I aim to be able to run classifiers on EEG-FFR and have a code structure that I will be able to reuse in the future. 

### Progress overview

After extensive research, I found and downloaded a pre-processed FFR dataset and classifiers scripts for an HMM, a SVM, a cross-correlation and a STLM classifiers for EEG-FFR. I obtained the author's permission, installed the gpu MATLAB Toolbox on my computer. I faced issues running the scripts locally on my computer and will need to run the classifiers on my Lab server. I am currently verifying the compatibility of jupyter notebooks with MATLAB. My next steps, are to run the classifiers, and if it works, to write detailled explanations for each steps in a parralel version of the scripts.   

### Tools I learned during this project

Hopefully the ones named above! (More details coming soon) 
 
### Results 

(More details coming soon) 

#### Deliverable 1: A Project Report 

Check out the evolution of this project and others on the [2020 BHS github organization](https://github.com/brainhack-school2020)

#### Deliverable 2: An Entry in the Project Gallery

This project will be incorporated in the project gallery of the BHS 2020 website at the beginning of June 2020. (More details coming soon)  

#### Deliverable 3: Instructions to run ML Classifiers on EEG-FFR in MATLAB
 
 To be made available soon. 
 
## Conclusion and acknowledgement

I would like to acknowledge the assistance of Pierre Bellec, Tristan Glatard, and Yann Harel as my Individual Instructors at the Brainhack School) and the contributions of my collaborators Fernando Llanos (for the classifiers original script), and Emily Coffey (for the dataset).
