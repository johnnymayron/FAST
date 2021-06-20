#!/bin/bash
#This scripts will run behave and split it's results in two files:
#  behave_details.txt will store the tests results with details
#  behave_summary.txt will store the summary of the tests and sent to discord

subject=$1
entity=$2
algorithm=$3
repetitions=$4

echo "========================================="
echo "Starting FAST prioritize"
echo "========================================="


#Run behave in a sub command
timeout 60m python2 py/prioritize.py $subject $entity $algorithm $repetitions

echo "========================================="
echo "Execution finished"
echo "========================================="
#Print the result in the console
cat /output/$subject/$algorithm-$entity.tsv
