#!/bin/bash
echo "Flip Coin Combination Problem"

function singlet () {
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

sheadPercentage=$(((${flipResult['H']}*100)/n))
stailPercentage=$((100-$sheadPercentage))
}

function doublet() {
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

dheadPercentage=$(($hhWinPercentage+($thWinPercentage+$htWinPercentage)/2))
dtailPercentage=$((100-$dheadPercentage))
}

function triplet() {
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

theadPercentage=$((hhhWinPercentage+((hhtWinPercentage+hthWinPercentage+thhWinPercentage)*2/3)+((httWinPercentage+thtWinPercentage+tthWinPercentage)/3)))
ttailPercentage=$((100-$theadPercentage))
}

read -p "How Many Times You Want to Flip The Coin: " n
singlet
doublet
triplet
echo ""
if [ $sheadPercentage -ge $dheadPercentage ] && [ $sheadPercentage -ge $theadPercentage ]
then
	if [ $sheadPercentage -gt $dheadPercentage ] && [ $sheadPercentage -gt $theadPercentage ]
	then
		echo "Winner is Singlet Heads With Percentage: $sheadPercentage%"
	elif [ $sheadPercentage -eq $dheadPercentage ] && [ $sheadPercentage -gt $theadPercentage ]
	then
		echo "Tie Between Singlet and Doublet Heads With Percentage: $sheadPercentage%"
	elif [ $sheadPercentage -gt $dheadPercentage ] && [ $sheadPercentage -eq $theadPercentage ]
	then
		echo "Tie Between Singlet and Triplet Heads With Percentage: $sheadPercentage%"
	else
		echo "Tie Between Singlet, Doublet, Triplet Head With Percentage: $sheadPercentage%"
	fi

elif [ $dheadPercentage -ge $sheadPercentage ] && [ $dheadPercentage -ge $theadPercentage ]
then
	if [ $dheadPercentage -gt $sheadPercentage ] && [ $dheadPercentage -gt $theadPercentage ]
	then
		echo "Winner is Doublet Head With Percentage: $dheadPercentage%"
	elif [ $dheadPercentage -eq $sheadPercentage ] && [ $dheadPercentage -gt $theadPercentage ]
	then
		echo "Tie Between Singlet and Doublet Head With Percentage: $dheadPercentage%"
	elif [ $dheadPercentage -gt $sheadPercentage ] && [ $dheadPercentage -eq $theadPercentage ]
	then
		echo "Tie Between Doublet and Triplet Head With Percentage: $dheadPercentage%"
	fi

else
	if [ $theadPercentage -gt $sheadPercentage ] && [ $theadPercentage -gt $dheadPercentage ]
	then
		echo "Winner is Triplet Head With Percentage: $dheadPercentage%"
	elif [ $theadPercentage -eq $sheadPercentage ] && [ $theadPercentage -gt $dheadPercentage ]
	then
		echo "Tie Between Triplet and Singlet Head Percentage: $dheadPercentage%"
	elif [ $theadPercentage -gt $sheadPercentage ] && [ $theadPercentage -eq $dheadPercentage ]
	then
		echo "Tie Between Triplet and Doublet Head With Percentage: $dheadPercentage%"
	fi
fi

if [ $stailPercentage -ge $dtailPercentage ] && [ $stailPercentage -ge $ttailPercentage ]
then
	if [ $stailPercentage -gt $dtailPercentage ] && [ $stailPercentage -gt $ttailPercentage ]
	then
		echo "Winner is Singlet Tail Percentage: $stailPercentage%"
	elif [ $stailPercentage -eq $dtailPercentage ] && [ $stailPercentage -gt $ttailPercentage ]
	then
		echo "Tie Between Singlet and Doublet Tail With Percentage: $stailPercentage%"
	elif [ $stailPercentage -gt $dtailPercentage ] && [ $stailPercentage -eq $ttailPercentage ]
	then
		echo "Tie Between Singlet and Triplet Tail With Percentage: $stailPercentage%"
	else
		echo "Tie Between Singlet, Doublet, Triplet Tail With Percentage: $stailPercentage%"
	fi

elif [ $dtailPercentage -ge $stailPercentage ] && [ $dtailPercentage -ge $ttailPercentage ]
then
	if [ $dtailPercentage -gt $stailPercentage ] && [ $dtailPercentage -gt $ttailPercentage ]
	then
		echo "Winner is Doublet Tail With Percentage: $dtailPercentage%"
	elif [ $dtailPercentage -eq $stailPercentage ] && [ $dtailPercentage -gt $ttailPercentage ]
	then
		echo "Tie Between Singlet and Doublet Tail With Percentage: $dtailPercentage%"
	elif [ $dtailPercentage -gt $stailPercentage ] && [ $dtailPercentage -eq $ttailPercentage ]
	then
		echo "Tie Between Doublet and Triplet With Percentage: $dtailPercentage%"
	fi

else
	if [ $ttailPercentage -gt $stailPercentage ] && [ $ttailPercentage -gt $dtailPercentage ]
	then
		echo "Winner is Triplet Tail With Percentage: $dtailPercentage%"
	elif [ $ttailPercentage -eq $stailPercentage ] && [ $ttailPercentage -gt $dtailPercentage ]
	then
		echo "Tie between Triplet and Singlet Tail With Percentage: $dtailPercentage%"
	elif [ $ttailPercentage -gt $stailPercentage ] && [ $ttailPercentage -eq $dtailPercentage ]
	then
		echo "Tie between Triplet and Doublet Tail With Percentage: $dtailPercentage%"
	fi
fi
