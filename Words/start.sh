#!/bin/zsh
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

echo "Start test English words";
check_backupFile
while true;
do
    number=$(cat wordlist -n | tail -1 | sed -e 's/ //g'| sed -e 's/[a-z]//g');
    index=$number;
    echo $RANDOM >/dev/null;
    randnum=$(echo $RANDOM%$index | bc);

    if [ -z $index ]; then
	echo "End of Test.";
    else
	echo "No.$index";
	cat wordlist | sed -n "$randnum"p;
	read answer
	case $answer in
	    [yY]* ) 
		cat wordlist | sed -e "$randnum"d > wordlist
		;;
	    [nN]* )
		sdcv $(cat wordlist | sed -n "$randnum"p)
		;;
	    [qQ]* )
		echo "Quit";
		exit 0;
	esac
    fi
done
