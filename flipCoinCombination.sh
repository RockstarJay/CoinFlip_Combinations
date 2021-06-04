#!/bin/bash
echo "Flip Coin Combination Problem"

read -p "How Many Times You Want to Flip The Coin: " n
declare -A flipResult

flipResult=( ['HHH']=0 ['HHT']=0 ['HTH']=0 ['HTT']=0 ['THH']=0 ['THT']=0 ['TTH']=0 ['TTT']=0 )
hhh=0
hht=1
hth=2
thh=3
htt=4
tht=5
tth=6
ttt=7

for(( i=1; i<=$n; i++ ))
do
	flipCoin=$((RANDOM%8))
	case $flipCoin in
	$hhh)
		flipResult['HHH']=$((${flipResult['HHH']}+1))
		;;
	$hht)
		flipResult['HHT']=$((${flipResult['HHT']}+1))
		;;
	$hth)
		flipResult['HTH']=$((${flipResult['HTH']}+1))
		;;
	$htt)
		flipResult['HTT']=$((${flipResult['HTT']}+1))
		;;
	$thh)
		flipResult['THH']=$((${flipResult['THH']}+1))
		;;
	$tht)
		flipResult['THT']=$((${flipResult['THT']}+1))
		;;
	$tth)
		flipResult['TTH']=$((${flipResult['TTH']}+1))
		;;
	*)
		flipResult['TTT']=$((${flipResult['TTT']}+1))
		;;
	esac
done

hhhWinPercentage=$(((${flipResult['HHH']}*100)/n))
hhtWinPercentage=$(((${flipResult['HHT']}*100)/n))
hthWinPercentage=$(((${flipResult['HTH']}*100)/n))
httWinPercentage=$(((${flipResult['HTT']}*100)/n))
thhWinPercentage=$(((${flipResult['THH']}*100)/n))
thtWinPercentage=$(((${flipResult['THT']}*100)/n))
tthWinPercentage=$(((${flipResult['TTH']}*100)/n))
tttWinPercentage=$((100-(hhhWinPercentage+hhTWinPercentage+hthWinPercentage+httWinPercentage+thhWinPercentage+thtWinPercentage+tthWinPercentage)))

headsPercentage=$((hhhWinPercentage+((hhtWinPercentage+hthWinPercentage+thhWinPercentage)*2/3)+((httWinPercentage+thtWinPercentage+tthWinPercentage)/3)))
tailsPercentage=$((100-$headsPercentage))

#echo "HHH=${flipResult['HHH']} HHT=${flipResult['HHT']} HTH=${flipResult['HTH']} HTT=${flipResult['HTT']} THH=${flipResult['THH']} THT=${flipResult['THT']} TTH=${flipResult['TTH']} TTT=${flipResult['TTT']}"

echo "Triplet Heads Percentage: $headsPercentage%"
echo "Triplet Tails Percentage: $tailsPercentage%"
