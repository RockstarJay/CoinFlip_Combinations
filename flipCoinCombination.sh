#!/bin/bash
echo "Flip Coin Combination Problem"

read -p "How Many Times You Want to Flip The Coin: " n
declare -A flipResult
flipResult=( ['H']=0 ['T']=0 )
isHead=1
for(( i=1; i<=$n; i++ ))
do
	flipCoin=$((RANDOM%2))
	if [ $flipCoin -eq $isHead ]
	then
		flipResult['H']=$(("${flipResult['H']}"+1))
	else
		flipResult['T']=$(("${flipResult['T']}"+1))
	fi
done

headsPercentage=$(((${flipResult['H']}*100)/$n))
tailsPercentage=$((100-$headsPercentage))

#echo Heads=${flipResult['H']} Tails=${flipResult['T']}
echo Heads Percentage="$headsPercentage"% Tails Percentage="$tailsPercentage"%
