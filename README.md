# getting-and-cleaning-data-peer-assignment
Peer Graded Assignment Project
How To

To repeat the work done in this project:

Download source data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Unzip to your working directory
Execute the script run_analysis.R from that directory.
Steps Performed

The bulk of the steps done by the script involve loading the data provided from the source, and tidying this into a single data frame containing just the original data cells of interest, in the desired format. Only the final major step computes a new result from the tidied data, writing out subject ids, activites, and mean of all measures of interest.

Tidy Part 1

Get feature names and subset to only those features of mean or std measures

Tidy Part 2

Get the train and test feature sets and subset only the desired features

Tidy Part 3

Combine the two datasets into 1

Tidy Part 4

Attach column names to features

Tidy Part 5

Read and combine the train and test activity codes

Tidy Part 6

Get activity labels and attach to activity codes

Tidy Part 7

Get and combine the train and test subject ids

Tidy Part 8

Combine and name subjects and activity names

Tidy Part 9

Combine with measures of interest for finished desired data frame

Compute New Result

From the set produced for analysis, compute and report means of all measures, grouped by subject_id and by activity.
