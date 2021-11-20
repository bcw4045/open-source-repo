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



+ -o : short option

	-f, -a, -h와 같이 짧은 옵션들을 설정하고 싶을 때 사용

+ -l : long option

	--name, --long과 같이 긴 옵션들을 설정하고 싶을 때 사용


+ _short와 long옵션은 혼용해서 사용이 가능하다._


### getopt의 사용법



```
getopt [option] "옵션으로 사용할 문자열" "옵션으로 사용되는 변수"
```

### 예시



1. short 옵션을 사용한 getopt

	```getopt -o ab:c```

	-b는 옵션 인수를 갖게 된다.

2. long 옵션을 사용한 getopt


	```getopt -l name:,list:,hard```

	--name과 --list는 옵션 인수를 갖게 된다.


## getopts

getopt와 같이 옵션 처리를 편리하게 해주는 역할을 한다.

### 예시



**옵션 사용**

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
			;;
		\?)
			echo $@ is not balid option
			exit 0
			;;
	esac
done
```

**실행**

```
./exam.sh –a
```

```
# -a 옵션 실행
```

**에러 처리**

```
./exam.sh –4
```
```
./exam2.sh: illegal option -- 5
-5 is not balid option
```


**인자 사용**

인자를 사용하려는 옵션에 콜론(:)을 붙여서 사용하며, 인자는 $OPTARG로 들어간다.

인자 사용 시 두 가지 방법이 있음.

+ verbose mode

	option:
	
	인자가 필요한 옵션일 경우 콜론을 붙여서 사용함.
	
+ silent mode

	:option:
	
	양쪽에 콜론을 붙일 경우 더욱 세밀한 에러 메시지 출력이 가능함.
	

```
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
```

```
./exam.sh –b “hello”
```

```
# hello
```

```
./exam.sh –a
```
```
# -a 옵션 실행`
```


# sed와 awk 명령어

## sed 명령어

필터링과 텍스트를 변환하는 스트림 편집기로 명령행에서 파일을 인자로 받아 명령어를 통해 작업한 후 결과를 화면으로 확인할 수 있는 명령어이다. 원본 파일에 변화없이 명령어를 통해 변환, 필터링 된 결과를 화면을 통해 볼 수 있다.

**옵션**

+ -e
	sed를 사용하였을 때 출력되는 값을 보여준다. 기본값으로 설정되어 있으며 다중 명령어를 쓸 때는 반드시 사용해야 한다.
+ -n
	특정 값이 들어간 줄만 출력해주는 기능, pattern buffer의 내용을 자동적으로 출력하지 않음.
+ -f
	스크립트를 파일로부터 읽어들이며 명령어를 지정하는 명령어

**주요 명령어**

1. 삭제

	[범위]/d : 지정 범위 삭제

```
sed '4d' file # 4번 줄을 삭제한다.
```

2. 출력

	[범위]/p : 지정 범위 출력
	
```
sed -n '3.7p' file  # 3과 7이 포함된 라인만 출력
```

3. 입력
	
	a : 현재 행에 하나 이상의 새로운 행 추가
	
```
sed 'a\\hello world' file # 파일의 모든 행에 hello world라는 행을 추가
```

4. 치환

	s/문자1/문자2/ : 문자 1을 문자 2로 바꿔서 출력

```
sed 's/test/world/g' file # file전체에서 test라는 단어를 world로 치환
```

5. 기타

	g : 모든 라인에 적용

	q : 명령어 종료 


## awk 명령어

자료 처리 및 리포트 생성에 사용하는 프로그래밍 언어

파일로부터 레코드를 선택하고, 선택된 레코드에 포함된 값을 조작하거나 데이터화하는 것을 목적으로 하는 프로그램

**awk 명령으로 할 수 있는 일**

+ 텍스트 파일의 전체 내용 출력
+ 파일의 특정 필드만 출력
+ 특정 필드에 문자열을 추가해서 출력
+ 패턴이 포함된 레코드 출력
+ 특정 필드에 연산 수행 결과 출력
+ 필드 값 비교에 따라 레코드 출력


**명령어 기본 형식**

```
awk [option] [awk program] [arg]
```























	
	
	
