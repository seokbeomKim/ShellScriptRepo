#!/bin/zsh
# authored by Sukbeom Kim (chaoxifer@gmail.com)

function check_backupFile {
    echo -n "Check file named 'wordlist-backup'    : "; 
    if [ -f "$PWD/wordlist-backup" ]; then
    	echo "OK";
	echo "make backupfile for current wordlist";
	cp $PWD/wordlist $PWD/wordlist-$(date +"%d%m%y%H%M");
    else
	echo "No";
	echo "ERROR: No wordlist backup file. Initializing...";
	cp $PWD/wordlist $PWD/wordlist-backup;
	cp $PWD/wordlist $PWD/wordlist-orig;
    fi
}

echo "Start test English words" ; 
echo "Check inputed options"
if [ -n $# ]; then
    case $@ in
	clear)
	    echo "Clear wordlist"
	    rm wordlist-??????????;
	    exit 0;
    esac
fi 
check_backupFile
while true;
do
    number=$(cat wordlist -n | tail -1 | sed -e 's/ //g'| sed -e 's/[a-z]//g');
    index=$number;
    echo $RANDOM >/dev/null;
    randnum=$(echo $RANDOM%$index | bc);

    if [ -z $index ]; then
	echo "End of Test.";
	exit 0;
    else
	echo -e "\e[00;33mNo.$index\e[00m";
	cat wordlist | sed -ne "$randnum"p;
	while true; 
	do
	    echo -en "\e[00;32m(y/n/c) : \e[00m"
	    read answer
	    case $answer in
		[cC]* )
		    sdcv $(cat wordlist | sed -n "$randnum"p)
		    continue
		    ;;
		[yY]* ) 
		    cat wordlist | sed -e "$randnum"d > temp
		    mv temp wordlist
		    break
		    ;;
		[nN]* )
		    sdcv $(cat wordlist | sed -n "$randnum"p)
		    break;;
		[qQ]* )
		    echo "Quit";
		    exit 0;
	    esac
	done
    fi
done
