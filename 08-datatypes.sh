#!/bin/bash

NUM1=10
NUM2=20

SUM=$((NUM1+NUM2))

echo "sum is: $SUM"
#Array
MOVIE=("RANGAM" "PUSHPA" "KARHI")
echo "movie is: ${MOVIE[@]}"
echo "movie is: ${MOVIE[2]}"