#!/bin/bash
echo "Flip Coin Combination Problem"

read -p "How Many Times You Want to Flip The Coin: " n
declare -A flipResult
flipResult=( ['HH']=0 ['HT']=0 ['TH']=0 ['TT']=0 )
hh=0
ht=1
th=2
tt=3
for (( i=1; i<=$n; i++ ))
do
	flipCoin=$((RANDOM%4))
	case $flipCoin in
	$hh)
		flipResult['HH']=$((${flipResult['HH']}+1))
		;;
	$ht)
		flipResult['HT']=$((${flipResult['HT']}+1))
		;;
	$th)
		flipResult['TH']=$((${flipResult['TH']}+1))
		;;
	*)
		flipResult['TT']=$((${flipResult['TT']}+1))
		;;
	esac
done

hhWinPercentage=$(((${flipResult['HH']}*100)/n))
htWinPercentage=$(((${flipResult['HT']}*100)/n))
thWinPercentage=$(((${flipResult['TH']}*100)/n))
ttWinPercentage=$((100-(hhWinPercentage+htWinPercentage+thWinPercentage)))

headsPercentage=$(($hhWinPercentage+($thWinPercentage+$htWinPercentage)/2))
tailsPercentage=$((100-$headsPercentage))

#echo HH=${flipResult['HH']} HT=${flipResult['HT']} TH=${flipResult['TH']} TT=${flipResult['TT']}
echo "Doublet Heads Percentage=$headsPercentage%"
echo "Doublet Tails Percentage=$((100-$headsPercentage))%"
