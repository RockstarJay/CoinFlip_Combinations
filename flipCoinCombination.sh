#!/bin/bash
echo "Flip Coin Combination Problem"

isHead=1
coinToss=$((RANDOM%2))
if [ $coinToss -eq $isHead ]
then
	echo "Head"
else
	echo "Tail"
fi
