#!/bin/bash

while getopts "abc" opt; do
	case $opt in
		a)
			echo "a 옵션 실행"
			;;
		b)
			echo "b 옵션 실행"
			;;
		c)
			echo "c 옵션 실행"
			;;
		\?)
			echo $@ is not balid option
			exit 0
			;;
	esac
done
