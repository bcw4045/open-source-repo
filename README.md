# open-source-repo

# getopt와 getopts

### 두 명령어의 장점
1. 기본 옵션 사용 가능

	``` command -a -b -c ```
	
2. 순서에 상관없음.

	``` command -b -c -a```
	
3. 옵션 인자를 가질 수 있음

	``` command -a "인자" ```
	
4. 옵션 인자를 붙여서 사용 가능

	``` command -a"인자"```
	
5. 옵션 구분자가 올 경우 구분자 다음의 값을 옵션으로 해석하지 않음.

	``` command -a -- bb```
	=> bb는 옵션으로 해석하지 않는다.

## getopt

쉘 스크립트에서 명령을 실행시킬 때 옵션을 사용할 수 있는데, 이러한 옵션은 직접 쉘 스크립트에서 처리해주어야 한다. 이때 옵션 해석 작업을 도와는 명령어이다. 옵션에 필요한 인수들을 파싱해주는 역할을 한다.



getopt는 /usr/bin/getopt에 위치한 외부 명령으로 기본적으로 short, long 옵션을 모두 지원한다. 옵션이 인수를 가질 경우 :문자를 사용하여 표시한다.


### getopt의 옵션

***

+ -o : short option

	-f, -a, -h와 같이 짧은 옵션들을 설정하고 싶을 때 사용

+ -l : long option

	--name, --long과 같이 긴 옵션들을 설정하고 싶을 때 사용


+ _short와 long옵션은 혼용해서 사용이 가능하다._


### getopt의 사용법

***

```getopt [option] "옵션으로 사용할 문자열" "옵션으로 사용되는 변수"```

### 예시

***

1. short 옵션을 사용한 getopt

	```getopt -o ab:c```

	-b는 옵션 인수를 갖게 된다.

2. long 옵션을 사용한 getopt


	```getopt -l name:,list:,hard```

	--name과 --list는 옵션 인수를 갖게 된다.


## getopts

getopt와 같이 옵션 처리를 편리하게 해주는 역할을 한다.

### 예시

***

#### 옵션 사용

```
#!/bin/bash

while getopts “abc” opt; do
	case $opt in
		a)
			echo “a 옵션 실행”
			;;
		b)
			echo “b 옵션 실행”
			;;
		c)
			echo “c 옵션 실행”
		\?)
			echo $@ is not balid option
			exit 0
			;;
	esac
done
```

**실행**

```./exam.sh –a```

```# -a 옵션 실행```

**에러 처리**

```./exam.sh –4```
```
./exam2.sh: illegal option -- 5
-5 is not balid option
```


























