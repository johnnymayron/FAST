#!/bin/bash
test_suite_size=$1
test_case_size=$2
algorithm=$3

echo "========================================="
echo "Starting FAST prioritize"
echo "========================================="

if [ -z "$test_suite_size" ]; then
  test_suite_size="1000"
fi
if [ -z "$test_case_size" ]; then
  test_case_size="medium"
fi
if [ -z "$algorithm" ]; then
  algorithm="FAST-pw"
fi

timeout 30m python2 tools/generate-scalability-input.py $test_suite_size $test_case_size

timeout 30m py/scalability.py $test_suite_size $test_case_size $algorithm

echo "========================================="
echo "Execution finished"
echo "========================================="
#Print the result in the console
cat scalability/output/$algorithm-$test_suite_size.tsv
