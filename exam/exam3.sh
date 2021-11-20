
#!/bin/bash

while getopts “ab:c” opt; do
	case $opt in
		a)
			echo “a 옵션 실행”
			;;
		b)
			echo $OPTARG
			;;
		c)
			echo “c 옵션 실행”
			;;
		\?)
			echo $@ is not balid option
			exit 0
			;;
	esac
done

