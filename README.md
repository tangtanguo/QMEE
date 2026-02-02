# QMEE Assignment 4 (2 February 2026)
There is no R Markdown file for this assignment. Instead, there is a PDF file named 
"QMEE_Assignment4_StatisticalAnalyses_TangTang.pdf". The working directory is the main
repo directory (QMEE). In this assignment, I examine a paper looking at mom and pup bat vocalizations,
critique the way an author writes about their results and provide suggestions 
on how to make the results more clear and concise for the readers.


# QMEE Assignment 3 (23 January 2026)
The R Markdown file for Assignment 3 is named "QMEE_Assignment3_DataVisualizations_TangTang.rmd".
The working directory is the main repo directory (QMEE). In this script, I make
3 different visualizations and explain my reasoning for making these graphs. 


# QMEE Assignment 2 (19 Jan 2026)
The two scripts for Assignment 2 are named "QMEE_Assignment2_ExaminingMyData_TangTang.rmd" 
and "QMEE_Assignment2_ReadingRDSFile_TangTang.R"
I've also attached my dataset as a separate CSV file named 
"Mom-PupInteractions_MasterDatasheet_16Jan2026.csv". 
The relative path is "../QMEE/QMEE_Assignment2_ExaminingMyData_TangTang.rmd".
The working directory is the main repo directory (QMEE). 
I've also attached an AI citation pdf since I used an LLM to help with my code
for this assignment. 


# 1. QMEE_Assignment2_ExaminingMyData_TangTang.rmd
This script breaks down different ways I examined my dataset. I created questions
to help me organize my code to catch any errors or anomalies. Specifically, I
wanted to check if there are any input errors by the raters (users) such as 
incorrect spellings and inter-rater errors per observation. I also wanted to 
make sure all videos that were meant to be scored were accounted for. Additionally,
I looked for mistakes in behaviours scored outside of the trial time for each video,
and removed them accordingly. 

# 2. QMEE_Assignment2_ReadingRDSFile_TangTang.R
After examining my data and cleaning it, I calculated ICC scores for all the 
behaviours across two raters, to see how similar their scores were.


# Investigations
One way I'd like to investigate this data is comparing behaviours across PND in
separate conditions (single vs double). 
Then, I'd also like to compare between conditions and examine how parental care
changes when mom is dealing with one pup vs both her pups.
Similarly, I'd like to see if there is sibling competition by examining how pup
behaviour changes in the absence and presence of their sibling (single vs double
condition)


# Extra Context
For this class, I will use behavioural data I collected looking at parental care
and sibling interaction behaviours between bat moms and their pups across six 
developmental time points. I had two conditions: single-pup or double-pup 
conditions, where mom was either interacting with one of her pups
(single-pup condition) or both of her pups (double-pup conditions). I will use 
this data to address the following biological questions:


RESEARCH QUESTIONS:

1) Do parental care behaviours (i.e. guidance, duration of attachment, 
attachment latency) change over pup development? 
      Prediction: Moms will invest less in parental care over time, therefore 
      they will guide pups less, nurse pups for shorter durations, and be delay
      teat attachment as pups age.  
      
2) Do parental care behaviours change across conditions over pup development?
      Predictions: Sibling competition will occur in the presence of siblings,
      and mom may show preference for one pup over the other.Therefore, moms 
      will invest less time into each pup individually by guiding each pup less, 
      nursing each pup for shorter durations, and taking longer to attach pups 
      when interacting with two pups instead of one. 
      
      
  
      
