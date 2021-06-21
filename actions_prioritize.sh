#!/bin/bash
subject=$1
entity=$2
algorithm=$3
repetitions=$4

echo "========================================="
echo "Starting FAST prioritize"
echo "========================================="
if [ -z "$subject" ]; then
  subject="flex_v3"
fi
if [ -z "$entity" ]; then
  entity="bbox"
fi
if [ -z "$algorithm" ]; then
  algorithm="FAST-pw"
fi
if [ -z "$repetitions" ]; then
  repetitions="10"
fi
timeout 60m python2 py/prioritize.py $subject $entity $algorithm $repetitions

echo "========================================="
echo "Execution finished"
echo "========================================="
#Print the result in the console
cat output/$subject/$algorithm-$entity.tsv
