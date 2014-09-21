{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red64\green95\blue139;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 The \'93run_analysis.R\'94 script in this repo will transform the Human Activity Recognition Using Smartphones Dataset downloaded from the following URL into a \'93tidy.txt\'94 file in your R working directory.\
\pard\pardeftab720\sl420
{\field{\*\fldinst{HYPERLINK "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"}}{\fldrslt 
\f1\fs28 \cf2 \cb3 \ul \ulc2 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip}}\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural
\cf0 \
To get the final output, you will need to unzip the above dataset and copy it to your R working directory. \
\
Below are the steps to describe how \'93run_analysis.R\'94 product the final result.\
\
\
## Step 1: exact column name of each feature\
## Step 2: get the activity label\
## Step 3: process test set\
\
Step 3.1: first get subject id from test data set\
Step 3.2: merge activity id with label to get descriptive activty\
Step 3.3: load test set measures\
Step 3.4: filter columns to only mean and std\
Step 3.5: final data set for test\
\
## Step 4: processing training set, which perform the same steps as Step 3 except it\'92s from different folder\
\
## Step 5: merge train and test sets together\
## Step 6: rename column name to make it more human-readable\
## Step 7: finally, export the final output to tidy.txt\
\
The run_analysis.R has the details about how each steps was performed. \
If you have questions, please feel free to reach out to me\
\
Roger Huang\
fayeyutaka@gmail.com\
\
\pard\pardeftab720\sl420

\f1\fs28 \cf2 \cb3 \ul \ulc2 \
\
}