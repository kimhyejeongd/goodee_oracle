`select*from dba_users;
SELECT*FROM TAB;
-- 데이터 베이스 사용하기
-- 사용자 계정을 관리자계정에서 생성해줌
-- 관리자 계정을 접속해서 계정을 생성하는 명령어 사용
-- 계정생성 명령어:CREATE USER 사용자계정명 IDENTIFIED BY 비밀번호 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- 사용자계정명은 대소문자 구분이 없음 -> 대문자로 처리
-- 비밀번호는 대소문자 구분함 - 유의!

-- 사용자계정에 C##을 붙이지않게 하기 
-- SESSION에 대한 설정을 변경해줘야함
-- ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER MJ IDENTIFIED BY MJ DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

SELECT*FROM DBA_USERS;

-- 사용자계정을 생성한 후에는 적절한 권한을 부여해줘야한다.
-- 기본적으로 DB에 접속할 수 있는 권한, 할당되어있는 DB영역을 사용할 권한 부여
-- DB접속권한 : CONNECT(ROLE/명칭)
-- 사용할권한 : RESOURCE(ROLE/명칭)

-- 관리자 계정으로 권한을 부여하는 명령어 
-- GRANT 권한/ROLE이름 TO 사용자명
GRANT CONNECT TO MJ;
GRANT RESOURCE TO MJ;

GRANT CONNECT,RESOURCE TO MJ;

-- 사용자계정 생성하기
-- 계정명 BS 비밀번호 BS 접속, 생성권한부여
-- 생성된 BS계정으로 접속하기
CREATE USER BS IDENTIFIED BY BS DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
GRANT CONNECT,RESOURCE TO BS;

SELECT*FROM DBA_USERS;

-- BS계정으로 접속
-- 생성된 테이블 정보 확인해보기
SELECT * FROM TAB;
-- 각 테이블의 데이터 정보확인하기
-- EMPLOYEE : 사원에 대한 정보를 저장하는 테이블
SELECT*FROM EMPLOYEE;
-- 항목에 대한 정보확인하기
DESC EMPLOYEE; 
-- DEPRATMENT : 부서에 대한 정보를 저장하는 테이블
SELECT*FROM DEPARTMENT;
DESC DEPARTMENT;
-- JOB : 직책에 대한 정보를 저장하는 테이블
SELECT*FROM JOB;
DESC JOB;
-- LOCATIONAL : 부서지역에 대한 정보를 저장하는 테이블
SELECT*FROM LOCATION;
DESC LOCATION;
-- NATIONAL : 부서지역에 설정된 국가 정보를 저장하는 테이블
SELECT*FROM NATIONAL;
DESC NATIONAL;
-- SAL_GRADE : 급여등급에 대한 정보를 저장하는 테이블
SELECT*FROM SAL_GRADE;
DESC SAL_GRADE;

-- SELECT 활용하기
-- 기본문법
-- SELECT 컬럼명[,컬럼명,컬럼명,....]OR*
-- FROM 테이블명;

-- EMPLOYEE테이블에 있는 전체 COLUMN의 데이터 조회하기
SELECT*FROM EMPLOYEE;
-- EMPLOYEE테이블에 있는 이름, 주민번호, 이메일, 급여, 보너스 조회하기

SELECT EMP_NAME,EMP_NO,EMAIL.SALARY,BOUNUS
FROM EMPLOYEE;
SELECT EMP_ID FROM EMPLOYEE;

-- DEARTMENT 의 모든 컬럼데이터 출력하기
SELECT*FROM DEPARTMENT;

-- SELECT문의 컬럼작성부에는 산술연산을 작성하고 그 결과를 출력할 수 있다.

-- ,+,-,*,/
SELECT EMP_NAME,10+10
FROM EMPLOYEE;

-- 오라클이 제공하는 간단한 테스트용 테이블 : DUAL
SELECT 10+10,20*3,10/3
FROM DUAL;

-- 리터럴
-- 숫자 : 10 20, 실수 : 180.5 3.14 ,문자열 : '문자열', 날짜 : 'YY/MM/DD'

-- 산술연산은 리터럴과 컬럼을 같이 사용할 수 있다.
SELECT EMP_NAME,SALARY,SALARY+100
FROM EMPLOYEE;

-- 컬럼과 컬럼 산술연산하기
SELECT EMP_NAME, SALARY, SALARY+SALARY,SALARY+1000.15
FROM EMPLOYEE;

-- 사원의 이름, 급여, 보너스금액 출력하기
SELECT EMP_NAME, SALARY, NVL(BONUS,0),SALARY*NVL(BONUS,0)
FROM EMPLOYEE;

-- 문자열 리터럴 출력하기
SELECT '여러분 오라클 너무 쉽죠~'
FROM DUAL;
-- 문자열+문자열 -> 문자열 문자열 문자열 결합연산XXXX
-- ORACLE 에서 + 연산은 무조건 수치연산 !
SELECT '오호~'+'이것도 해보자'
FROM EMPLOYEE;
SELECT 100+'하이'
FORM DUAL;

-- 사원테이블에서 사원명, 부서코드, 월급, 연봉을 조회하기
-- 보너스가 없는 사원의 연봉도 잘 출력하게 해보자!
SELECT EMP_NAME,DEPT_CODE,SALARY,(SALARY+(SALARY*NVL(BONUS,0)))*12 AS TOTALSAL
FROM EMPLOYEE;

-- 컬럼명에 작성할 수 있는 것은 테이블에 존재하는 컬럼명이다
SELECT EMP_NAME
FROM EMPLOYEE;
-- DEPARTMETN에는 EMP_NAME이 없기 떄문에 조회 불가능하다

-- RESULTSEST으로 조회된 컬럼의 이름을 변경하기 -> 별칭
-- 컬럼명 AS 출력할명칭 또는 컬럼명 출력할명칭

SELECT EMP_NAME AS 이름,SALARY 월급
FROM EMPLOYEE;

-- 별칭에 띄어쓰기, 특수기호가 가능할까? XXX 띄어쓰기도 안됨 / 사용하려면 별칭을 ""묶어주면 가능하다.
SELECT SALARY AS "월^^급",EMP_NAME"ㅠ ㅠ"
FROM EMPLOYEE;

-- DISTINCT예약어 사용하기
-- 중복되는 ROW를 제외하고 출력해주는 기능
-- SELECT DISTINCT 컬럼명[,컬럼명] FROM 테이블명
-- DISTINCT는 컬럼작성부 맨앞에만 작성가능
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

--SELECT EMP_ID,DISTINCT DEPT_CODE
--FROM EMPLOYEE;

-- DISTINCT뒤에 컬럼을 여러개 작성하면 한개 그룹으로 묶고 일치여부를 확인한다.
SELECT DISTINCT DEPT_CODE,JOB_CODE
FROM EMPLOYEE;

-- 원하는 ROW만 조회하기
-- WHERE절을 이용한다. -> DB에서 사용하는 조건문
-- SELECT 컬럼명,...
-- FROM 테이블명
-- WHERE 조건식

-- 부서가 D5인 사원의 전체 데이터 조회하기
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- 월급이 300만원 이상인 사원의 이름, 이메일. 급여 조회하기
SELECT EMP_NAME,EMAIL,SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

-- 사원 중 직책이 J2가 아닌 사원 조회하기
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE!='J2';

-- 데이터를 비교할때는 대소문자를 구별함.
SELECT *
FROM EMPLOYEE
SHERE JOB_CODE='j2';
-- J2로 수정해야 함.

-- 날짜에 대한 대소비교하기
-- 문자열로 날짜패턴을 작성해서 비교를 함.
-- 00/01/01 이후 입사자 조회하기
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE>'00/01/01';

-- 조건이 여러개일 경우 논리연산자를 이용하자
-- AND / OR  를 사용할 수 있다.
-- 사원 중 부서가 D5이고 급여가 300만원 이상인 사원의 이름, 부서코드 ,급여를 조회하기
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY>=3000000;

-- 사원 중 직책이 J6이거나 J7인 사원의 이름, 이메일, 급여 직책코드를 조회하기
SELECT EMP_NAME, EMAIL,SALARY,JOB_CODE
FROM EMPLOYEE
WHERE JOB_CODE='J6' OR JOB_CODE='J7';

-- 특정범위에 있는 값을 조회하기
-- 사원중 급여를 200 만원 이상 300만원 이하 받는 사원 조회하기
-- 사원명, 급여, 보너스, 입사일
SELECT EMP_NAME,SALARY,BONUS,HIRE_DATE
FROM EMPLOYEE
WHERE SALARY>=2000000 AND SALARY<=3000000;

--사원중 입사일이 00년 01년 01일 부터 02년 12월 31일까지인 사원의 사원명, 급여, 부서코드, 입사일 조회하기
SELECT EMP_NAME,SALARY,DEPT_CODE,HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE>= '00/01/01' AND HIRE_DATE<='02/12/31';

-- 범위값을 조회할때 범위조회연산자를 이용해보자
-- BETWEEN AND
-- 컬럼명 BETWEEN 값(시작) AND 값2(끝)
SELECT EMP_NAME,SALARY,BONUS,HIRE_DATE
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 3000000;

SELECT EMP_NAME,SALARY,DEPT_CODE,HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '00/01/01' AND '02/12/31';

-- LIKE연산자 이용하기
-- 문자열에 대해 패턴으로 검색하는 연산자
-- 패턴을 표현하는 표현식이 있음
-- _: 아무문자가 1개를 나타내는 표현식
-- '_강' : 강으로 끝나는 두글자
-- '_유_호' : 네글자인데 두번째는 유 마지막은 호가 들어가는 글자
-- '___' : 세글자
-- % : 아무문자가 0개이상을 나타내는 표현식
-- '%강' : 강으로 끝나는 글자 다 (앞에 문자나 문자의 수 상관 없음) 강, 한강, 두만강, 호홓호호호호하하강  모두 가능함
--         하하하호호호오오오강강오 안됨 -> 강으로 안끝나서
-- '%명%' : 명이 있는 모든 글자

-- '_명%' : 명을 포함한 최소 두글자
--  컬럼명 LIKE '패턴'
-- 사원중 유씨성을 가진 사원의 이름, 급여, 부서코드 조회
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '유%';

-- 사원중 이메일에 yo가 포함된 사원 조회하기
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%yo%';
-- 사원중 이메일에 j가 포함되고 유씨성을 가진 사원 조회하기
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%j%' AND EMP_NAME LIKE '유%';

-- 사원중 유씨성이 아닌 사원들 조회하기
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '유%';

-- 이메일 주소에 _앞글자가3글자인 사원을 조회하기
-- 사원명, 이메일
SELECT EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___\_%' ESCAPE'\';
--이스케이프 문자열 처리하기  \처리

-- 문자열을 결합시켜주는 연산자
-- || : 문자열 결합연산자
SELECT '여러분 오늘'||'금요일이에요! 아이유'
FROM DUAL;
SELECT EMP_NAME||'님 급여'||SALARY||'보너스'||BONUS MSG
FROM EMPLOYEE;

-- NULL값 조회하기
-- NULL 아무의미 없는 값, 빈값을 표시할 때 사용할 수 있음
-- 연산불가능함.->산술 , 비교연산
-- NULL을 찾을 수 있는 연산자를 제공
-- IS  NULL/IS NOT NULL
-- 보너스를 받지않는 사원 조회하기
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

-- 보너스를 받는 사원 사원명, 급여, 보너스 조회하기
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- 부서가 지정되지 않은 사원 조회하기 사원명, 부서코드
SELECT EMP_NAME, NBL(DEPT_CODE '인턴')AS DEPTCODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

-- 다중값에 대한 동등비교 연산자
-- OR 연결되는 조건을 간단하게 처리할 수 있다.
-- IN / NOT IN
-- 컬럼명 IN/ NOT IN(값,값,값...);
-- 사원중 부서코드가 D5,D6,D8인 사원을 조회하기 이름,부서코드
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D8');

-- 나중에~~~ 서브쿼리문(다중행)과 동등비교할 때 사용
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IN(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='총무부' OR DEPT_TITLE LIKE'해외%');

-- 논리연산자 우선순위
-- 직책이 J7이거나 J2인 사원 중 월급이 280만원 이상인 사원 조회하기
-- 사원명, 직책코드, 급여
SELECT EMP_NAME,JOB_CODE,SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN('J7','J2') AND SALARY>=2800000;

-- 오라클에서 제공하는 함수에 대해 알아보자
-- 단일행 함수 : 테이블의 모든 행에 대한 결과를 반환하는 함수 
-- 자료형(문자,숫자,날짜)에 따라 제공하는 함수들이 있음, 선택함수(조건에 따라 내용을 출력)
-- 그룹 함수 : 테이블에(그룹별) 한개의 결과를 반환하는 함수 -> 데이터 내용을 집계할 때 사용
-- 합계,평균,최대,최소,갯수

-- 단일행 함수 활용하기
-- 사용위치
-- SELECT문의 컬럼위치
-- WHERE 절 조건으로 사용
-- INSERT,UDPDATE,DELETE사용이 가능

-- 문자열을 처리하는 함수

-- 문자열의 길이는 반환하는 함수 : LENGTH('문자열' 또는 컬럼명) -> 반환형 INT
SELECT LENGTH('오늘은 금요일')
FROM DUAL;

SELECT EMP_NAME,LENGTH(EMP_NAME) AS EMP_NAME_LENGTH
FROM EMPLOYEE;

-- 사원 중 이메일의 길이가 15글자 이상인 사원만 조회하기 이름, 이메일, 이메일길이
SELECT EMP_NAME,EMAIL,LENGTH(EMAIL) AS EMAIL_LENGTH
FROM EMPLOYEE
WHERE LENGTH(EMAIL)>= 15;                                                                                                 

-- 문자열의 바이트수를 출력해주는 함수 : LENTGHB('문자열'/컬럼명)
-- 한글 대한 BYTE수 한글자당 3BYTE*EXPRESS버전에서만
SELECT LENGTHB('ABCDE'),LENGTHB('아양오요')
FROM DUAL;

-- INSTR : JABA INDEXOF메소드와 동일한 기능
-- INSTR('문자열'/컬럼명, 찾을 문자[,시작위치, 찾을 횟수]
-- 오라클에서는 번호는 1부터 시작함
SELECT INSTR('GE아카데미','GD'),INSTR('GD아카데미','아'),INSTR('GD아카데미','BS')
FROM DUAL;

--사원의 이메일에 J위치 찾기
SELECT EMAAIL ,INSTR(EMAIL,'j')
fROM EMPLOYEE
WHERE INSTR(EMAIL,'j')!=0;

SELECT INSTR('GD 아카데미 GD게임즈 GD음악사 GD7DJ화이팅!'GD'),
        INSTR('GD 아카데미 GD게임즈 GD음악사 GDJ79 화이팅!'GD',3),
            INSTR('GD 아카데미 GD게임즈 GD음악사 GDJ79 화이팅!'GD',3,-10),
            INSTR('GD 아카데미 GD게임즈 GD음악사 GDJ79 화이팅!'GD',1,4)
            FROM DUAL;
            
--LPAD/RPAD : 문자열의 길이가 지정된 길이만큼 저장되지않을 경우 특정값으로 채우는 함수
-- LPAD/RPAD( 문자열/컬럼명,최대길이,채울문자) 
--여기서는 한글 한글자에 2바이트임
SELECT LPAD ('유병승',10,'*'),RPAD('유병승','10','#'),RPAD('유병승',6,'%')
FROM DUAL;

-- 이메일을 출력할때 16글자가 안되는 이메일은 나머지 자리를*로 표시하기
SELECT EMAIL,RPAD(EMAIL,16,'*')
FROM EMPLOYEE;

-- LTRIM / RTRIM : 공백, 지정문자를 제거해주는 함수
-- LTRIM / RTRIM(문자열/컬럼명/특정문자)
SELECT '          명준',LTRIM('          명준')
FROM DUAL;
--명준앞에 공백이 다 날아가서 출력됨

SELECT '2222222222동훈',LTRIM('2222222222동훈','2')
FROM DUAL;
-- 왼쪽 2가 다 지워지고 출력된다. 

-- TRIM : 양쪽에 있는 값을 제거하는 함수, 기본 : 공백, 설정하면 설정값을 제거(한개문자만 가능)
-- 옵션을 설정해서 왼쪽, 오른쪽 양쪽을 설정할 수 있음
-- TRIM(문자열/컬럼명)
-- TRIM(LEADING/TRAILING/BOTH 찾을 문자 FROM 문자열/컬럼)

SELECT '        금요일          ',TRIM('        금요일          '), --양옆 공백없는 값이 출력된다. 
        'VVVVVVVVVV태권VVVVVVVVVV',
        TRIM(LEADING 'V' FROM 'VVVVVVVVVV태권VVVVVVVVVV'),  -- 왼쪽 V 없이 출력된다.
        TRIM(TRAILING 'V' FROM 'VVVVVVVVVV태권VVVVVVVVVV'), -- 오른쪽 V 없이 출력된다
        TRIM(BOTH 'V' FROM 'VVVVVVVVVV태권VVVVVVVVVV') -- 양옆 V없이 출력된다.
FROM DUAL;

--12345684654325158금요일화이팅3574685435436835453
SELECT RTRIM(LTRIM('12345684654325158금요일화이팅3574685435436835453','1234567890'),'0123456789' AS OKAY) --오류
FROM DUAL;

--SUBSTR : 문자열을 잘라내는 기능 -> JAVA SUBSTRING 메소드와 동일
--SUBSTR : (문자열/컬럼명,시작인덱스[,길이])
SELECT SUBSTR('금요일은 너무너무 행복해 주말에 공부할 시간이 많잖아 우하하',6,8), --6번에서부터 8칸만 출력됨 너무너무 행복해 출력
       SUBSTR('금요일은 너무너무 행복해 주말에 공부할 시간이 많잖아 우하하',INSTR('금요일은 너무너무 행복해 주말에 공부할 시간이 많잖아 우하하','행'),3) --행복해 출력
FROM DUAL;

SELECT SUBSTR('금요일은 너무너무 행복해 주말에 공부할 시간이 많잖아 우하하',-3) -- 뒤에서부터 3개 만 출력됨 우하하 출력
FROM DUAL;

-- 사원의 이메일에서 아이디만 출력하기
SELECT EMAIL,SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1)
FROM EMPLOYEE;

-- 이메일의 아이디가 7글자이상인 사원을 조회하기
-- 사원명, 이메일 출력
SELECT EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE LENGTH(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1))>=7;

-- 사원 중 여사원만 출력하기
SELECT *
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1)='2';

-- UPPER/LOWER : 영문자를 대문자 소문자로 변경하는 기능
-- INITCAP : 띄어쓰기에 영문자 첫글자를 대문자로 변경해주는 기능
SELECT 'Welcome to oRACLE world',
        UPPER('Welcome to oRACLE world'),
        LOWER('Welcome to oRACLE world'),
        INITCAP('Welcome to oRACLE world') --단어 첫글자만 대문자로 바꿔서 출력됨
FROM DUAL; 

SELECT UPPER(EMAIL),LOWER(EMAIL)
FROM EMPLOYEE;

-- CONCAT : 문자열을 결합해주는 기능
-- ||연산자와 동일한 기능
SELECT '곧'||'점심' ,CONCAT('곧','점심') --곧점심
FROM DUAL;

-- REPLACE : 문자열을 변경해주는 함수
-- REPLACE(문자열/컬럼명,찾을문자,교체문자)
SELECT '코딩은 너무 어려워',REPLACE('코딩은 너무 어려워','어려워','쉬워') --코딩은 너무 어려워 / 코딩은 너무 쉬워 
FROM DUAL;
-- EMAIL 주소가 BS -> GD로 변경됨 GD로 변경해서 출력하기
-- 사원명, 이메일 부서코드
SELECT EMP_NAME,REPLACE(EMAIL,'BS','GD'),DEPT_CODE
FROM EMPLOYEE;

-- REVERSE 문자열을 거꾸로 만들어주는 기능
SELECT EMAIL,REVERSE(EMAIL),REVERSE(EMAIL),REVERSE(REVERSE('배고프다 밥줘'))
FROM EMPLOYEE;

-- 숫자처리함수
-- ABS : 절대값 부호없는값
SELECT ABS(10),ABS(-10) -- 둘다 10 출력됨
FROM DUAL;

-- MOD : 나머지를 계산하는 기능 JAVA%연산자와 동일
SELECT MOD(3,2) --1
FROM DUAL;

SELECT SALARY,MOD(SALARY,3)
FROM EMPLOYEE;

-- 소수점처리함수
-- ROUND : 소수점을 반올림하는 기능
-- ROUND(숫자/컬럼명[,자리수]) 컬럼명은 반드시 숫자여야함
SELECT 125.567,ROUND(125.567),--126
       ROUND(125.567,2) --125.57
FROM DUAL;

-- FLLOR : 소수점을 버림
SELECT 125.567,FLOOR(125.567) --125
FROM DUAL;

-- TRUNC : 소수점버림, 자리수를 지정할 수 있음
SELECT 125.567,TRUNC(125.567,2) --125.56
FROM DUAL;

-- CEIL : 소수점 무조건 올림
SELECT 125.567,CEIL(125.167) --126
FROM DUAL;

-- 오라클에서 랜덤숫자 출력하기
-- DBMS_RANDOM,VALUE()함수를 이용 
SELECT DBMS_RANDOM.VALUE(),FLOOR(DBMS_RANDOM.VALUE()*10), -- 0~1 실수가 랜덤으로 출력됨/정수로 랜덤값 출력
        FLOOR(DBMS_RANDOM.VALUE(1,11)) --1에서11까지의 랜덤값 출력됨
FROM DUAL;

-- 문자 랜덤으로 출력하기
-- DBMS_RANDOM.STRING()
SELECT DBMS_RANDOM.STRING('X',5), --5글자의 숫자와 영문자가 랜덤으로 출력됨
        DBMS_RANDOM.STRING('P',5), -- 5글자의 특수기호를 포함한 영문자와 숫자가 출력됨
        DBMS_RANDOM.STRING('U',5) -- 5글자의 대문자가 랜덤으로 출력됨
        DBMS_RANDOM.STRING('L',5) -- 5글자의 소문자가 랜덤으로 출력됨
FROM DUAL;

-- 날짜처리함수
-- 오라클에서 기본날짜 출력하는 방법
-- SYSDATE ->  시스템상의 현재 년, 월, 일을 출력할 때 -> JAVA javs.sql.Date 연결
-- SYSTIMESTAMP -> 오늘 년, 월, 일, 시, 분, 초 -> JAVA java.sql.Timestamp 연결

SELECT SYSDATE,SYSTIMESTAMP
FROM DUAL; 

-- 날짜값에 대한 산술연산처리
-- +,- 연산 -> 날짜의 일수가 증가, 차감
SELECT SYSDATE,SYSDATE+1,SYSDATE-1 -- 현재 날짜 / 현재 날짜에서 하루 증가 / 현재 날짜에서 하루 감소된 날짜 출력
FROM DUAL;

SELECT EMP_NAME,HIRE_DATE,HIRE_DATE+10
FROM EMPLOYEE;

-- NEXT_DAY : 매개변수로 전달받은 요일중 가장 가까운 날짜를 출력
SELECT NEXT_DAY(SYSDATE,'토') --그주의 가장 가까운 요일의 날짜를 출력 오늘 3.15 금이니까 2024.3.16이 출력됨
FROM DUAL;
-- 한글을 인식하는 이유 : LOCALE값을 가지고 국적에 맞는 언어를 사용하기 때문에
SELECT*FROM V$NLS_PARAMETERS; -- 오라클이 기본적으로 가지고있는 정보들에 언어가 KOREAN으로 설정되어있음
-- 만약 세팅 되어있는 값을 바꾸면 
ALTER SESSION SET NLS_LANGUAGE='AMERICAN'; -- 바꾸면 '토','토요일' 등의 언어 사용 불가능
ALTER SESSION SET NLS_LANGUAGE='KOREAN'; -- 다시 KOREA로 변경하기

-- LAST_DAY : 그 달의 마지막 날 출력
SELECT LAST_DAY(SYSDATE)  --24/03/31
FROM DUAL;

-- ADD_MONTH : 개월수를 더하는 기능
SELECT SYSDATE,ADD_MONTHS(SYSDATE,5)  --2024/08/15
FROM DUAL;

SELECT ADD_MONTHS(HIRE_DATE,5) -- 입사일에서 5달후의 데이터들출력
FROM EMPLOYEE;

-- MONTHS_BETWEEN : 두 날짜 사이의 개열수를 구해주는 함수
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE,'93/11/09')),FLOOR(MONTHS_BETWEEN(SYSDATE,'01/08/10'))  --03/11/09 부터 지금까지의 개월수 출력(소수점 제외)/ 01/08/10 부터 지금까지의 개월 수 출력 (소수점 제외)
FROM DUAL;

-- 사원들의 개월수를 조회하기
-- 사원명, 부서코드, 입사일, 입사개월
SELECT EMP_NAME,DEPT_CODE,HIRE_DATE,FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) AS 입사개월
FROM EMPLOYEE;

-- 오늘부로 명준님이 군대로 끌려갑니다. 군복무기간 1년 6개월이고 그랬을때 명준님의 전역날을 구하고 전역때까지 먹는 짬밥(하루에 3끼)의 수를 구하기.
SELECT ADD_MONTHS(SYSDATE,18) AS 명준님전역날 ,ADD_MONTHS(SYSDATE,18)-SYSDATE AS 복무일수,(ADD_MONTHS(SYSDATE,18)-SYSDATE)*3 AS 짬밥수
FROM DUAL;


-- EXTRACT : 날짜의 년,월,일을 따로 출력할 수 있는 기능
-- EXTRACT(YEAR/MONTH/DAY FROM 날짜)
-- 현재 날짜의 년 월 일 각 컬럼으로 출력하기
SELECT 
    EXTRACT(YEAR FROM SYSDATE)AS YEAR, --연도 출력
    EXTRACT(MONTH FROM SYSDATE)AS MONTH, -- 달 출력
    EXTRACT(DAY FROM SYSDATE)AS DAY --일 출력
FROM DUAL;

-- 사원 중 12월에 입사한 사원을 조회하기
-- 사원명, 입사일
SELECT EMP_NAME,HIRE_DATE
FROM EMPLOYEE
WHERE EXTRACT(MONTH FROM HIRE_DATE)=12; 

SELECT EMP_NAME,HIRE_DATE
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE)=2001; -- 2001년도에 입사한 사원의 이름과 입사일 출력

-- 형변환 함수 -> 오라클에는 자동형변환이 잘 작동함. 자동으로 한개의 타입에 맞춰서 연산을 해주는 기능을 갖추고 있음 하지만 필요에 따라 강제형변환을 할 때 사용하는 함수가 존재
-- 자료형
-- 문자 : CHAR, VARCHAR2, NVARCHAR2 -> 문자열을 저장
-- 숫자 : NUMBER -> 정수, 실수를 모두 저장 
-- 날짜 : DATE, TIMESTAMP
-- BLOB, CLOB, LONG

-- TO_CHAR : 숫자, 날짜값을 문자형으로 변환해주는 함수
-- 특정문자열 패턴에 맞춰서 변경해줌
-- 패턴을 표시하는 기호가 있음

-- 숫자 -> 문자로 변경 패턴
-- 0 : 변환값의 자리수가 지정한 자리수와 일치하지않을 때 값이 없는 자리에 0을 표시 
-- 9 : 변환대상값의 자리수가 지정한 자리수와 일치하지않을 때 값이 없는 자리를 생략
-- L : 화폐단위를 표시(*LOCALE을 기준으로 설정)

-- 정수, 문자열로 변환하기 
SELECT 1234567,TO_CHAR(1234567,'000,000,000'), --1234567/001,234,567
                TO_CHAR(1234567,'999,999,999'), --1,234,567
                TO_CHAR(1234567,'L999,999,999') --\1,234,567
FROM DUAL;
-- 소수점에 대한 처리
SELECT 180.5,TO_CHAR(180.5,'000,000,000'),TO_CHAR(180.5,'000,000,000'),
    TO_CHAR(180.5,'999,999.000') --000,000,181/000,000,181/180.500
FROM DUAL;

-- 날짜를 문자열로 변경하기
-- Y/R 년,M 월,D 일, H 시, MI 분 SS 초
SELECT SYSDATE,
    TO_CHAR(SYSDATE,'YYYY.MM.DD'), -- 2024.03.15
    TO_CHAR(SYSDATE,'YY.MM.DD'), -- 24.03.15
    TO_CHAR(SYSDATE,'YY"년"MM"월"DD"일"HH24"시"MI"분"SS"초"') -- 24년03월15일15시17분12초 
FROM DUAL;

-- 사원의 급여를 화폐단위로 표시하여 단위별로 ,로 구분하고 입사일을 -로 구분해서 년월일 출력하기
-- 사원명 , 급여, 입사일
SELECT EMP_NAME,TO_CHAR(SALARY,'L999,999,999'),TO_CHAR(HIRE_DATE,'YY-MM-DD')
FROM EMPLOYEE;

-- 숫자형으로 변경하기
-- 문자를 숫자로 변경할 수 있다.
-- 숫자형식의 문자열을 숫자로 변경해서 연산처리할 때 등 사용
SELECT 1000+1000, 1000+TO_NUMBER('1,000','999,999')-- 2000/2000
FROM DUAL;

-- 날짜 형변환하기 
-- 문자를 날짜로 변경
-- 숫자를 날짜로 변경
SELECT TO_DATE('240315','YYMMDD'),TO_DATE('24-03-15','YY-MM-DD'), --24/03/15
    TO_DATE(240213,'YYMMDD'),TO_DATE(TO_CHAR(000614,'000000'),'YYMMDD') -- > 614로 들어오기떄문에 길이가 부족하다고뜨기때문에 CHAR로 바꿔서 출력해야함
FROM DUAL;

-- NULL 처리 대체함수
-- NVL(컬럼명,대체값) : 컬럼값이 NULL일 경우 대체값으로 대체해서 출력
-- NVL2(컬럼명,NULL일아닐 때 출력할값,NULL일 때 출력할 값)
SELECT EMP_NAME,SALARY,BONUS,DEPT_CODE,
        NVL(BONUS,0),NVL2(BONUS,'있다','없다'),NVL2(DEPT_CODE,'정규직','인턴')
FROM EMPLOYEE;

-- 컬럼의 값에 따라 출력하는 내용을 변경하는 함수
-- 1.DECODE SWITCH같은 스타일
-- DECODE(컬럼명,'예상값','출력할 값','예상값2',출력값2,...)
-- 사원의 직책명 출력하기
SELECT*FROM EMPLOYEE;
SELECT*FROM JOB;
SELECT*EMP_NAME,
    DECODE(JOB_CODE,'J1','대표','J2','부사장','J3','부장','J4','차장','사원') AS JOB_NAME
FROM EMPLOYEE;

-- 사원의 이름, 급여, 부서코드, 성별(남,여) 출력하기
SELECT EMP_NAME,SALARY,DEPT_CODE,
 DECODE(SUBSTR(EMP_NO,8,1),'2','여','1','남','3','남','4','여')AS 성별
FROM EMPLOYEE;

-- 2.CASE IF~ELSE IF문같은 스타일
-- CASE
-- WHEN 조건
-- THEN 조건이 TRUE일때 출력 할 값
-- WHEN 조건
-- THEN 조건이 TRUE일때 출력 할 값
-- WHEN 조건
-- THEN 조건이 TRUE일때 출력 할 값
-- ELSE 기본출력값
-- END

SELECT EMP_NAME,JOB_CODE,
    CASE
        WHEN JOB_CODE='J1' THEN '대표'
        WHEN JOB_CODE='J2' THEN '부사장'
        WHEN JOB_CODE='J3' THEN '부장'
        ELSE '사원'
        END AS 직책
FROM EMPLOYEE;

-- 월급을 기준으로 고액, 중간, 그외를 나눠서 출력하기
-- 400만원 이상이면 고액, 400~300사이면 중간, 그외 ㅠㅠ을 출력하기
-- 이름 급여 결과
SELECT EMP_NAME, SALARY,
    CASE
        WHEN SALARY>=4000000 THEN '고액'
        WHEN SALARY>=3000000 THEN '중간'
        ELSE 'ㅠㅠ'
    END AS 월급기준레벨
FROM EMPLOYEE;

-- 사원테이블에서 현재나이를 구하기
-- 현재년도에서 출생년도를 차감
SELECT EXTRACT(YEAR FROM SYSDATE) -- 현재년도구하기
FROM DUAL;
SELECT EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR')) -- 출생년도 구하기/'YY'는 앞자리가 다 20으로 나옴, 'RR'을 사용해야 19로 출력됨
FROM EMPLOYEE;
SELECT EMP_NAME
        ,EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR')) AS 현재나이,
        EXTRACT(YEAR FROM SYSDATE)-(SUBSTR(EMP_NO,1,2)+(CASE
        WHEN SUBSTR(EMP_NO,8,1) IN('1','2')THEN  1900
        WHEN SUBSTR(EMP_NO,8,1) IN('3','4')THEN 2000
     END)) AS 나이
FROM EMPLOYEE;
 -- RR로 년도를 출력할때 
--현재년도       입력년도     계산년도
--00~49         00~49       현세기
--00~49         50~99       전세기
--50~99         00~49       다음세기
--50~99         50~99       현세기

UPDATE EMPLOYEE SET EMP_NO='320808-212341' WHERE EMP_ID='252';

insert into EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE, ENT_DATE,ENT_YN) 
values ('252','옛사람','320808-2123341','go_dm@kh.or.kr',null,'D2','J2','S5',4480000,null,null,to_date('94/01/20','RR/MM/DD'),null,'N');

ROLLBACK;

-- 그룹함수
-- 테이블의 데이터에 집계하는 함수들 -> 결과는 한개만 출력
-- 컬럼을 선택하는 것에 제한이 있음 
-- 합계, 평균, 갯수, 최대값, 최소값
-- SUM() : 테이블의 특정컬럼의 합계값을 출력해주는 함수
-- AVG() : 테이블의 특정컬럼의 평균값을 출력해주는 함수
-- COUNT() : 테이블의 ROW(데이터) 수를 출력해주는 함수
-- MAX() : 테이블의 특정컬럼의 최대값을 출력해주는 함수
-- MIN() : 테이블의 특정 컬럼의 최소값을 출력해주는 함수 

-- 사원의 급여 합계를 조회하기
-- 다른컬럼을 추가조회할 수 없다!
SELECT SUM(SALARY)
FROM EMPLOYEE;
-- WHERE 사용하면 FILTER된 ROW만 가지고 계산을 함
-- 부서가 D5인 사원의 급여 합계를 조회하기
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5'; -- 실행순서 : FROM -> WHERE -> SELECT65

-- 평균 구하기
SELECT AVG(SALARY)
FROM EMPLOYEE;
-- D5부서의 금여 평균조회하기
SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- SELECT문에서 그룹함수 두개 실행하기
SELECT SUM(SALARY),AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- NULL값 처리 -> 제외하고 계산됨 -> NVL로 NULL값 0으로 처리해줌(다른 값이 출력됨)
SELECT AVG(BONUS),AVG(NVL(BONUS,0))
FROM EMPLOYEE;

-- 테이블의 데이터수를 조회하기
-- COUNT(컬럼명/*)
-- 컬럼명 : 그 컬럼값이 NULL인 ROW는 제외하고 갯수를 출력
-- * : 모든컬럼값이 NULL이면 제외하고 출력* 컬럼에 한개라도 값이 있으면 갯수에 포함
-- 전체 사원수, 전체 부서수, 직책수 등 구할 수 있음
SELECT COUNT(*) AS 사원수 ,COUNT(DEPT_CODE) AS DEPT_CODECOUNT
FROM EMPLOYEE;
SELECT COUNT(*) AS 부서수
FROM DEPARTMENT;
-- 보너스를 받는 사원의 수 
SELECT COUNT(*) 
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;
SELECT COUNT(BONUS)
FROM EMPLOYEE;

-- 급여를 400만원 이상받는 사원의 수는 ? 
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SALARY>=4000000;
-- D6부서의 사원수를 조회하기
SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE='D6';
-- 부서가 D6,D7,D5인 사원들의 사원수, 급여합계, 급여 평균을 조회하세요
SELECT COUNT(*),SUM(SALARY),AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IN('D6','D5','D7');

-- 최대값, 최소값을 조회하기
-- 최대급여를 조회하기, 최소 급여를 조회하기등에 사용
SELECT MAX(SALARY),MIN(SALARY)
FROM EMPLOYEE;
-- D5 부서의 최고 급여액, 최소 급여액을 조회하기
SELECT MAX(SALARY),MIN(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- GROUP BY, HAVTIG 
-- GROUP BY 절 활용하기
-- ROW 를 특정컬럼을 기준으로 그룹으로 묶어주는 기능  -> 동일한 컬럼값을 한개 그룹으로 묶어줌
-- SELECT 컬렴명,컬럼명 ....
-- FROM 테이블명
-- [WHERE 조건식]
-- [GROUP BY 컬럼명[,컬럼명...]}
-- 부서별 급여합계 조회하기
SELECT DEPT_CODE,SUM(SALARY)
FROM EMPLOYEE -- 전체 사원에 대한 합계를 구한것
GROUP BY DEPT_CODE;
-- 직책별 평균 급여를 조회하기
SELECT JOB_CODE,AVG(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;
-- 부서별 평균급여, 합계 , 사원수 조회하기
SELECT NVL(DEPT_CODE,'인턴'),AVG(SALARY),SUM(SALARY),COUNT(*) 
FROM EMPLOYEE
--WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE;

-- GROUP BY절에 다수의 컬럼설정하기
SELECT JOB_CODE,DEPT_CODE,COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE,DEPT_CODE;
-- WHERE 절에 그룹함수를 사용할 수 없다.
-- 최대 급여를 받는 사원
SELECT *
FROM EMPLOYEE
-- WHERE SALARY=MAX(SALARY); --> WHERE에는 그룹함수 쓸 수 없음
-- 부서의 입원수가 3명 이상 부서
SELECT * 
FROM EMPLOYEE
WHERE COUNT(*)>=3; --> 그룹함수 X
--그룹함수를 조건으로 사용하려면 HAVING 절을 사용해야한다.
-- SSLELECT 컬럼명, 컬럼명
-- FROM  테이블명
-- [WHERE 조건식]
-- [GROUP BY 컬럼명]
-- [HAVIG 조건식]
-- 부서의 인원수가 3명이상인 부서조회하기
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(*) >=3;
-- 부서의 평균급여가 300만원 이상인 부서 조회하기
SELECT DEPT_CODE,AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000;
-- 직책별 인원수가 3명 이상인 직책 조회하기
SELECT JOB_CODE,COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING COUNT(*)>=3;
-- 매니저가 관리하는 사원이 2명 이상인 매지저 아이디 조회하기
SELECT MANAGER_ID,COUNT(MANAGER_ID)
FROM EMPLOYEE
GROUP BY MANAGER_ID
HAVING COUNT(MANAGER_ID)>=2;
-- 남자,여자의 급여 평균,인원수 조회하기
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여'),AVG(SALARY),COUNT(*)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1);

-- 1900년대 입사한 사원수, 2000년대 입사한 사원수 조회하기
-- 년도     인원수
-- 1900     8
-- 2000     15
SELECT 
        DECODE(SUBSTR(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),1,2),'19','1900년대','20','2000년대')
        AS 년도,COUNT(*) AS 사원수
FROM EMPLOYEE
GROUP BY SUBSTR(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),1,2);
-- 1900년도 2000년도
--    8       15
SELECT --  EXTRACT(YEAR FORM HIRE_DATE),
        COUNT(DECODE(SUBSTR(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),1,2),'19','1')) AS "1900년대",
        COUNT(DECODE(SUBSTR(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),1,2),'20','1')) AS "2000년대"
FROM EMPLOYEE;

-- ROLLUP과 CUBE활용하기--
-- GROUP BY에 작성한 기준컬럼이 한개일 경우 -> ROLLUP,CUBE차이 없음
-- 컬럼기준 그룹함수결과, 총 그룹함수의 결과를 출력

-- GROUP BY 작성한 기준컬럼이 두개일경우 
-- ROLLUP : 두개컬럼에 대한 그룹함수 결과, 첫번째 매개변수있는 컬럼의 그룹함수결과, 총 그룹함수의 결과 출력
-- CUBE : 두개 컬럼에 대한 그룹함수 결과, 첫번째 매개변수에 있는 컬럼의 그룹함수결과, 두번째 매개변수에 있는 컬럼의 그룹함수결과, 총 그룹함수의 결과출력

-- GROUP BY 절 이용해서 조회하기
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE;

SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL;

-- ROLLUP
-- 위의 두개를 안쓰고 한번에 처리가능하다
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE);

-- CUBE
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE);

-- 두개 컬럼을 기준으로 설정했을 때 ROLLUP
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE,JOB_CODE); 

-- 두개 컬럼을 기준으로 설정했을 때 CUBE -> 두개의 컬럼에 대한 집계결과를 출력
-- GROUP BY 없는 것
-- GROUP BY DEPT_CODE
-- GROUP BY JOB_CODE
-- GROUP BY DEPT_CODE,JOB_CODE
SELECT DEPT_CODE,JOB_CODE,COUNT(*),SUM(SALARY),AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE,JOB_CODE);

-- 데이터 정렬하기
-- 조회하는 데이터를 정렬해서 가져오기
-- 컬럼값을 기준으로 오름차순, 내림차순으로 정렬
-- ORDER BY 컬럼명 정렬방식[ASC(DEFAULT)/DESC][컬럼명 정렬방식...] //안적으면 DEFAULT값 (생략이 가능하다)

-- SELECT 컬럼명
-- FROM 테이블명
-- [WHERE]
-- [GROUPO BY]
-- [HAVING]
-- [ORDER BY]
-- 사원명을 기준으로 내림차순 정렬해서 조회하기
-- 사원명, 급여, 보너스, 부서코드
SELECT EMP_NAME,SALARY,BONUS,DEPT_CODE
FROM EMPLOYEE
ORDER BY EMP_NAME ASC;
-- 급여를 많은순으로 사원정보 조회하기
SELECT *
FROM EMPLOYEE
ORDER BY SALARY DESC;

-- ORDER BY 구문에 여러컬럼 지정하기
-- 기준컬럼값이 동등할 때 다음 기준으로 정렬을 함
SELECT EMP_NAME,DEPT_CODE,JOB_CODE,SALARY
FROM EMPLOYEE
ORDER BY DEPT_CODE,JOB_CODE,SALARY DESC;

-- 정렬시 NULL값처리
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
ORDER BY BONUS ASC; --NULL값을 하단에 배치
ORDER BY BONUS DESC; --NULL값을 상단에 배치
ORDER BY BONUS ASC NULLS LAST;-->NULL값 반대로 상단에 배치
ORDER BY BONUS DESC NULLS LAST;--> NULL값 반대로 하단에 배치

-- ORDER BY 절에는 컬럼명이 아닌 인덱스 번호를 사용할 수 있다.
SELECT*FROM EMPLOYEE
ORDER BY 2;
-- 가상컬럼을 생성했을 때 사용할 수 있다.
SELECT EMP_NAME,SALARY*12
FROM EMPLOYEE
ORDER BY 2 DESC;
-- ORDER BY 에서 컬럼별칭 사용 가능할까 ? -> 가능하다
SELECT EMP_NAME,SALARY*12 AS TOTAL_SAL
FROM EMPLOYEE
-- WHERE TOTAL_SAL>=1000000; --오류
ORDER BY TOTAL_SAL DESC;

--GROUPING

SELECT 
    CASE 
        WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=1 THEN'부서별 인원수'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=0 THEN'직책별 인원수'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=1 THEN'총 인원수'
        ELSE'직책부서별 인원수'
    END AS 구분,
    COUNT(*),DEPT_CODE,JOB_CODE
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE,JOB_CODE)
ORDER BY 1;

-- 집합 연산자 ----
-- 여러개의 SELECT문을 한개의 결과(RESULT SET)으로 출력해주는 연산자
-- 첫번째 SELECT문의 컬럼수와 이후 작성되는 SELECT문의 컬럼수가 같아야하고, 
-- 컬럼의 타입도 동일해야한다

-- UNION으로 연결하기
-- SELECT문
-- UNION
-- SELECT문
-- [UNION
-- SELECT문
-- ] 

SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION
SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

SELECT DEPT_CODE,JOB_CODE,AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE,JOB_CODE
UNION
SELECT DEPT_CODE,NULL,FLOOR(AVG(SALARY))
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE;
UNION
SELECT NULL,NULL,FLOOR(AVG(SALARY))
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL; --???

-- UNIONALL
-- 증복값도 출력
SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION ALL
SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

-- 부서코드, 부서명과 직책코드와 직책명을 다 조회하기 -- 테이블이 다르기때문에 연관관계가 없음
SELECT *FROM DEPARTMENT;
SELECT *FROM JOB;

SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT
UNION
SELECT JOB_CODE,JOB_NAME
FROM JOB;
--컬럼의 타입도 같아야한다.
DESC JOB; --> 타입 : 문자열
DESC DEPARTMENT; --> 타입 : 문자열
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT
UNION
SELECT JOB_CODE,JOB_NAME
FROM JOB;


-- INTERSECT
SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
INTERSECT
SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000; 

-- MINUS
SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
MINUS
SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000; 

SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
UNION
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT
UNION
SELECT JOB_CODE,JOB_NAME
FROM JOB
MINUS
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT
WHERE DEPT_ID IN('D5','D6','D7');
INTERSECT 
SELECT EMP_ID,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE'%유%';

-- JOIN 에 대해 알아보자-----
-- 두개 이상의 테이블을 특정컬럼을 기준으로 연결하는 기능
-- JOIN 두가지 종류
-- INNER JOIN : 기준컬럼값과 일치하는 값이 있는 ROW만 연결하는 JOIN문 * 없는 ROW 제외
-- OUTER JOIN : 기준 컬럼값과 일치하는 값이 없는 ROW도 가져오게 하는 JOIN문 * 전체 ROW를 가져올 테이블 설정/ 일치하는 값이 없는 ROW NULL값으로 연결

-- JOIN문 작성하기
-- 오라클 조인, ANSI조인이 있음
-- 오라클 조인 : SELECT 컬럼명, 컬럼명, ... FROM 테이블, 테이블 B WHERE 테이블,컬럼명=테이블B 컬럼명
-- ANSI : SELECT 컬럼명, 컬럼명 .... FROM 테이블 JOIN 테이블 B ON 테이블.컬럼명=테이블 B.컬럼명
-- *JOIN 기준의 컬럼은 유일한값을 가지고 있어야한다. -> PK설정된 컬럼값 이용

-- 사원정보, 사원의 부서정보 전체 출력하기
-- 오라클 조인으로 EMPLOYEE,DEPARTMENT 조인하기
SELECT*FROM EMPLOYEE,DEPARTMENT WHERE DEPT_CODE=DEPT_ID;
-- INNER조인
SELECT EMP_NAME,SALARY,DEPT_TITLE FROM EMPLOYEE,DEPARTMENT WHERE DEPT_CODE=DEPT_ID;
-- ANSI조인
-- INNER JOIN
SELECT *FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
SELECT EMP_NAME,SALARY,DEPT_TITLE,LOCATION_ID
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID; -- OUTER JOIN 은 JOIN앞에 LEFT를 써준다.

-- 사원에 대한 사원명, 이메일, 전화번호, 부서명을 조회하기
SELECT EMP_NAME,EMAIL,PHONE,DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE;

-- 사원 중 회계관리부에 근무하는 사원의 부서명, 사원명, 급여 보너스 조회하기
SELECT DEPT_TITLE, EMP_NAME,SALARY,BONUS
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_ID =DEPT_CODE
WHERE DEPT_TITLE='회계관리부';

-- 사원 중 대리 직책을 가지고 있는 사원의 직책명, 사원명, 급여, 보너스 조회하기
SELECT *FROM JOB;
SELECT *FROM EMPLOYEE;
-- 컬렴명이 동일하다면 앞에 테이블명. 을 찍어서 구분해야하거나 별칭을 부여하여 구분해야함
SELECT JOB_NAME, EMP_NAME,SALARY,BONUS
-- FROM EMPLOYEE JOIN JOB ON EMPLOYEE.JOB_CODE=JOB.JOB_CODE;
FROM EMPLOYEE E JOIN JOB J ON E.JOB_CODE=J.JOB_CODE;
-- SELECT에도 동일한 컬럼명일 때 사용해서 구분해줘야함
SELECT E.JOB_CODE,JOB_NAME,EMP_NAME,SALARY,BONUS
FROM EMPLOYEE E JOIN JOB J ON E.JOB_CODE=J.JOB_CODE;

-- USING : JOIN할 때 연결할 컬럼 명칭이 동일하면 USING 예약어를 사용할 수 있음
-- USING으로 묶었을 때 JOB_CODE는 하나만 출력됨
-- USING을 사용할 때 SELECT에는 식별자를 쓰지 못한다. ( 따로 부여할 필요 없음 ) 
SELECT**
FROM EMPLOYEE E JOIN JOB J USING(JOB_CODE);

-- ASIA 가 근무지역인 부서의 부서명 조회하기
SELECT *FROM LOCATION;
SELECT *FROM DEPARTMENT;
SELECT DEPT_TITLE
FROM DEPARTMENT JOIN LOCATION ON LOCATION_ID=LOCAL_CODE
WHERE LOCAL_NAME LIKE 'ASIA%';

-- JOIN문에서 GROUP BY 이용하기
-- 부서명별 사원수, 평균급여를 조회하기, 평균급여가 3000000이상
SELECT DEPT_TITLE,COUNT(*) AS EMP_COUNT,AVG(SALARY) AS AVG_SAL
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
GROUP BY DEPT_TITLE
HAVING AVG(SALARY)>=3000000
ORDER BY 3;

-- OUTER JOIN ----
-- JOIN 표현법
-- JOIN 테이블명 LEFT/LIGHT JOIN 테이블명 ON 조건
SELECT *
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID; --DEPT_CODE가 NULL인사람들은 빼고 나옴 얘네도 출력하고 싶을때 OUTER을 사용함
-- OUTER사용해서 다 넣어보기
-- LEFT
SELECT *
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID; -- TRUE가 나오는 애들은 ROW로 연결하고 연결이 안돼서 FALSE가 나오는 애들은 NULL로 출력
-- RIGHT
SELECT *
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID; 

-- > 참조되는 컬럼값이 필수일때는 INNER JOIN으로 데이터를 가져오고
-- 참조되는 컬럼값이 선택일 때는 OUTER JOIN으로 데이터를 가져온다. 

-- 사원이 없는 부서 조회하기
-- 부서명
SELECT DEPT_TITLE
FROM DEPARTMENT LEFT JOIN EMPLOYEE ON DEPT_CODE=DEPT_ID
WHERE DEPT_CODE IS NULL;

-- CROSS JOIN : 전체 ROW를 연결하는 JOIN 구문
SELECT *
FROM EMPLOYEE CROSS JOIN DEPARTMENT
ORDER BY 2;

SELECT *
FROM EMPLOYEE CROSS JOIN LOCATION;

-- SELF JOIN : 테이블 한개를 이용해서 JOIN을 하는 것
-- 자기 자신을 참조하는 컬럼이 있어야 한다. 
SELECT*FROM EMPLOYEE;--EMP_ID와 MANAGER_ID가 같음

-- 사원의 매니저 정보를 조회하기
-- 사원번호, 사원명, 매니저 사원 번호, 매니저 사원명
SELECT E.EMP_ID,E.EMP_NAME,E.MANAGER_ID,M.EMP_NAME
FROM EMPLOYEE E JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;

-- 비동등조인
SELECT*FROM SAL_GRADE;

SELECT EMP_ID,SAL_GRADE.SAL_LEVEL
FROM EMPLOYEE JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND MAX_SAL;

-- 다중 조인 : 두개 이상의 테이블을 조인함
-- 사원의 사원명, 부서명, 직책명, 급여, 보너스 조회하기
-- 표현법 FROM 테이블 JOIN 테이블 ON 조건 JOIN 테이블 ON 조건
SELECT EMP_NAME,DEPT_TITLE,JOB_NAME,SALARY,BONUS
FROM EMPLOYEE 
        LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
        JOIN JOB USING(JOB_CODE);
-- 사원명, 부서명,직책명, 지역명, 지역코드, 국가 코드를 조회하기
SELECT EMP_NAME,DEPT_TITLE,JOB_NAME,LOCAL_NAME,LOCAL_CODE,NATIONAL_CODE
FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
         JOIN JOB USING(JOB_CODE)
    LEFT JOIN LOCATION ON  LOCATION_ID=LOCAL_CODE
    LEFT JOIN NATIONAL USING(NATIONAL_CODE);
-- 문제풀이
-- 주민번호가 1970년대 생이면서 성별이 여자이고, 성이 전씨인 직원들의 사원명, 주민번호, 부서명, 직급명을 조회하시오.
SELECT*FROM TAB;
SELECT EMP_NAME,EMP_NO,DEPT_TITLE,JOB_NAME
FROM EMPLOYEE
        LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
             JOIN JOB USING(JOB_CODE)
WHERE SUBSTR(EMP_NO,1,1)=7 AND SUBSTR(EMP_NO,8,1)=2 AND EMP_NAME LIKE '전%';

-- 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.
SELECT EMP_ID,EMP_NAME,DEPT_CODE
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE EMP_NAME LIKE '%형%';

-- 해외영업부에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.
SELECT EMP_NAME,JOB_NAME,DEPT_CODE,DEPT_TITLE
FROM EMPLOYEE 
        JOIN JOB USING(JOB_CODE)
   LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE LIKE'해외%';
        
-- 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
SELECT EMP_NAME,BONUS,DEPT_TITLE,LOCAL_NAME
FROM EMPLOYEE 
    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    LEFT JOIN LOCATION ON LOCAL_CODE=LOCATION_ID
WHERE BONUS IS NOT NULL;

-- 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.
SELECT EMP_NAME,JOB_NAME,DEPT_TITLE,LOCAL_NAME
FROM EMPLOYEE
        JOIN JOB USING(JOB_CODE)
   LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
   LEFT JOIN LOCATION ON LOCAL_CODE=LOCATION_ID
WHERE DEPT_CODE='D2';

-- 급여등급테이블의 최대급여(MAX_SAL)보다 많이 받는(실수령액) - 보너스를 포함한 월급 직원들의 사원명, 직급명, 급여, 연봉을 조회하시오.
-- SALARY + SALARY * NVL(BONUS, 0)
-- (사원테이블과 급여등급테이블을 SAL_LEVEL컬럼기준으로 조인할 것) ?????????????????????
SELECT EMP_NAME,JOB_NAME,SALARY,(SALARY+(SALARY*NVL(BONUS,0)))*12 AS 연봉
FROM EMPLOYEE
         JOIN JOB USING(JOB_CODE) 
    LEFT JOIN SAL_GRADE USING(SAL_LEVEL)
WHERE MAX_SAL<SALARY+SALARY*NVL(BONUS,0);

-- 한국(KO)과 일본(JP)에 근무하는 직원들의 사원명, 부서명, 지역명, 국가명을 조회하시오.
SELECT EMP_NAME,DEPT_TITLE,LOCAL_NAME,NATIONAL_NAME
FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    LEFT JOIN LOCATION ON LOCAL_CODE=LOCATION_ID
    LEFT JOIN NATIONAL USING(NATIONAL_CODE)
WHERE NATIONAL_NAME IN('한국','일본');

-- 같은 부서에 근무하는 직원들의 사원명, 부서명, 동료이름을 조회하시오. (self join 사용) ????????????????
SELECT E.EMP_NAME,DEPT_TITLE,D.EMP_NAME
FROM EMPLOYEE E JOIN EMPLOYEE D ON E.DEPT_CODE=D.DEPT_CODE
        LEFT JOIN DEPARTMENT ON E.DEPT_CODE=DEPT_ID
WHERE E.EMP_NAME!=D.EMP_NAME
ORDER BY 1;

-- 보너스포인트가 없는 직원들 중에서 직급이 차장과 사원인 직원들의 사원명, 직급명, 급여를 조회하시오. 단, join과 IN 사용할 것
SELECT EMP_NAME,JOB_NAME,SALARY
FROM EMPLOYEE JOIN JOB USING(JOB_CODE)
WHERE BONUS IS NULL AND JOB_NAME IN('차장','과장');

-- 재직중인 직원과 퇴사한 직원의 수를 조회하시오.
SELECT COUNT(ENT_DATE) AS 재직중인직원, COUNT(*)- COUNT(ENT_DATE) AS 퇴사한직원
FROM EMPLOYEE;
-- 다르게 푸는 방법
SELECT DECODE(ENT_YN,'N','재직','퇴사') 재직여부,COUNT(*) 수
FROM EMPLOYEE
GROUP BY DECODE(ENT_YN,'N','재직','퇴사'); 

-- 서브쿼리에 대해 알아보자
-- SELECT문에 또다른 SELECT문을 작성하는 것
-- 주 SELECT 문 보조 SELECT 문
-- 서브쿼리문은 반드시 괄호로 묶어줘야하한다
-- 서브쿼리는 SELECT문의 컬럼위치, FROM 절,WHERE 절 에 사용이 가능
-- INSERT, UPDATE,CREATE문에도 사용

-- SELECT 컬럼명,(SELECT 컬럼명 FROM 테이블) : 스칼라서브쿼리, 단일행서브쿼리
-- FROM (SELECT 컬럼명.... FROM 테이블) : 다중행, 다중행다중열 서브쿼리
-- WHERE 컬럼명 비교연산(SELECT 컬럼명 FROM 테이블명) : 단일행, 다중행, 다중열 서브쿼리

-- 윤은해 사원과 동일한 급여를 받고 있는 사원 조회하기
SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='윤은해';
SELECT *
FROM EMPLOYEE
WHERE SALARY=(SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='윤은해');

-- D5부서의 평균급여보다 급여를 많이 받는 사원 조회하기
SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D5';
SELECT E.*,(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D5') AS AVG_SAL
FROM EMPLOYEE E
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D5');

-- 1. 단일행 서브쿼리
-- 서브쿼리의 결과 (RESULTSET)가 1개열 1개행인 경우

-- 전체사원의 평균급여보다 많은 급여를 받는 사원의 이름, 급여, 부서코드 조회하기
SELECT EMP_NAME,SALARY,DEPT_CODE
FROM EMPLOYEE E
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE);

--부서가 총무부인 사원을 조회하기
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE=(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='총무부');

--직책이 과장인 사원을 조회하기
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE=(SELECT JOB_CODE FROM JOB WHERE JOB_NAME='과장');

-- 다중행 서브쿼리
-- 서브쿼리의 결과가 1개컬럼 다수 행을 갖는 것
-- 직책이 과장, 부장인 사원 조회하기
SELECT JOB_CODE FROM JOB WHERE JOB_NAME IN('과장','부장'); -- 2개의 행이 나옴 (다중행)
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE IN(SELECT JOB_CODE FROM JOB WHERE JOB_NAME IN('과장','부장')); -- JOB_CODE가 1개이기때문에 () 와 비교할 수 없다-> IN을 사용
-- 다중행 서브쿼리 대소비교하기
-- ANY OR,ALL()AND 이용
-- ANY
-- 컬럼>(=)ANY() : 다중행 서브쿼리의 결과 중 하나라도 크면 참 -> 다중행 서브쿼리 결과 중 최소값보다 크면 참
-- 컬럼<(=)ANY() : 다중행 서브쿼리의 결과 중 하나라도 작은면 참 -> 다중행 서브쿼리 결과 중 최대값보다 작으면 참
-- D5,D6사원의 급여보다 많이 받는 사원 
SELECT *
FROM EMPLOYEE
WHERE SALARY> ANY(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));  -- > 180만원 이상 받는 사원들만 출력됨
            <                                                                  --> 최대값보다 작게 받는 값들이 출력됨
-- 컬럼>(=)ALL() : 다중행 서브쿼리의 결과 중 모든값보다 크면 참->다중행 서브쿼리 결과 중 최대값보다 크면 참
-- 컬럼<(=)ALL() : 다중행 서브쿼리의 결과 중 모든값보다 크면 참->다중행 서브쿼리 결과 중 최소값보다 크면 참

SELECT *
FROM EMPLOYEE
WHERE SALARY> ALL(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6')); -- 390만원 이상 받는 사원들이 출력됨
            <                                                                 -- 180만원 보다 적게 받는 사원들이 출력됨

-- 다중열 서브쿼리
-- 서브쿼리의 결과가 1개행, 다수 컬럼을 갖는 것
-- 퇴직한 여사원의 같은 부서, 같은 직급에 해당하는 사원 조회하기
SELECT DEPT_CODE,JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y';
SELECT DEPT_CODE,JOB_CODE,EMP_NAME
FROM EMPLOYEE
--WHERE DEPT_CODE=(SELECT DEPT_CODE FROM EMPLOYEE WHERE ENT_YN='Y')
 --       AND JOB_CODE=(SELECT JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y');
WHERE (DEPT_CODE,JOB_CODE)=(SELECT DEPT_CODE,JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y');

-- 기술지원부 이면서 급여가 200만원인 사원이 있음
-- 그 사원의 이름, 부서코드, 급여 출력하기(다중열 서브쿼리로 풀어보기)
SELECT DEPT_CODE,SALARY FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
WHERE SALARY=2000000 AND DEPT_TITLE='기술지원부';
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE,SALARY)
        =(SELECT DEPT_CODE,SALARY FROM EMPLOYEE WHERE DEPT_CODE=(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='기술지원부') 
        AND SALARY=2000000);

-- 다중열 다중행 서브쿼리
-- 서브쿼리의 결과가 다수행, 다수 컬럼을 갖는 것
SELECT*FROM EMPLOYEE;
-- FROM 절에 많이 사용함 -> INLINE VIEW 가상의 테이블을 만들어놓고 사용할 때를 말함
SELECT * 
FROM(SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID JOIN JOB USING(JOB_CODE)); 

-- 상관서브쿼리---
-- 서브쿼리의 SELECT문을 작성할 때 메인쿼리의 값을 가져와 사용하는 구문
-- 본인이 속한 부서의 사원수 출력, 본인이 속한 부서의 급여 평균보다 급여를 많이 받는 사원조회하기 --> 본인이라는 값이 바뀌면서 해당하는 값도 바뀌면서 출력/집계됨
-- 상품에 달려있는 댓글갯수, 게시글에 달려있는 첨부파일 갯수

-- 본인이 속한 부서의 사원수를 구하기
SELECT COUNT(*) FROM EMPLOYEE GROUP BY DEPT_CODE; --> 본인이 속한 부서의 사원 수가 아님 그냥 부서별로 사원수를 구한것

SELECT EMP_NAME,DEPT_CODE,(SELECT COUNT(*)FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS 사원수
FROM EMPLOYEE E;

-- 본인이 속한 부서의 사원수가 3명이상인 사원만 조회하기
SELECT *
FROM EMPLOYEE E
WHERE (SELECT COUNT(*)FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE)>=3;


-- 매니저인 사원을 조회하기
-- EXISTS예약어를 이용해서 ROW를 필터할 수 있음
-- 서브쿼리의 결과가 1개 이상이면 TRUE, 0개면 FALSE반환하는 연산
SELECT *
FROM EMPLOYEE E
WHERE EXISTS(SELECT 1 FROM EMPLOYEE WHERE MANAGER_ID=E.EMP_ID);

-- 최고급여를 받는 사원 조회하기
SELECT *
FROM EMPLOYEE E
WHERE NOT EXISTS(SELECT * FROM EMPLOYEE WHERE SALARY>E.SALARY);

-- 자신이 속한 직급의 평균급여보다 많은 급여를 받는 사원의 이름, 직책명, 급여 조회하기
SELECT EMP_NAME,SALARY,JOB_NAME 
FROM EMPLOYEE E JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
WHERE SALARY> (SELECT AVG(SALARY) FROM EMPLOYEE WHERE JOB_CODE=E.JOB_CODE);
-- FROM절에 서브쿼리 사용하기 -> 논리적인 가상테이블
-- INLINE VIEW : 1회용으로 사용하는 구문 -> 재사용 불가능
-- STORED VIEW : 저장해놓고 사용하는 구문 -> 재사용가능 -> VIEW 테이블

-- RESULTSET을 테이블처럼 이용할 수 있게 해주는 기능
SELECT *
 FROM (SELECT EMP_NAME, EMAIL, PHONE, SALARY*12 AS YEAR_SAL
                FROM EMPLOYEE);
                
-- 성별을 추가한 가상테이블 이용하기
SELECT E.*, DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여')
FROM EMPLOYEE E
WHERE SUBSTR(EMP_NO,8,1)=2;

SELECT *
FROM (
            SELECT E.*, DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여') AS GENDER
            FROM EMPLOYEE E)
WHERE GENDER='여';

-- 통계쿼리, 자주사용하는 JOIN, 집합연산결과, 가상컬럼이 추가된 SELECT문 

-- 연봉을 포함한 사원의 사원명, 부서명, 직책명, 자신이 속한 부서 평균급여(버림, 원화)
-- 평균급여가 300만원이상인 사원 구하기
SELECT V.*,EMP_NAME,TO_CHAR(DEPT_AVG,'L999,999,999') AS DEPT_AVG

FROM (
                SELECT EMP_NAME,NVL(DEPT_TITLE,'인턴') AS DEPT_TITLE, JOB_NAME, (SALARY+(SALARY*NVL(BONUS,0)))*12 AS YEAR_SAL,
                                (SELECT FLOOR(AVG(SALARY)) FROM EMPLOYEE WHERE E.DEPT_CODE=DEPT_CODE) AS DEPT_AVG
                FROM EMPLOYEE E LEFT JOIN DEPARTMENT D ON DEPT_CODE=DEPT_ID
                                JOIN JOB J ON E.JOB_CODE=J.JOB_CODE) V
                                
WHERE YEAR_SAL>=3000000;

SELECT * 
FROM (
    SELECT EMP_ID AS ID, EMP_NAME AS NAME
    FROM EMPLOYEE
    UNION
    SELECT DEPT_ID, DEPT_TITLE
    FROM DEPARTMENT
    UNION
    SELECT JOB_CODE, JOB_NAME
    FROM JOB
    )
WHERE ID LIKE '%2%' ;



SELECT A.*
 FROM (
        SELECT T.*,(SELECT AVG(SALARY) FROM EMPLOYEE WHERE JOB_CODE=T.JOB_CODE) AS AVG_JOB
        FROM (
            SELECT SALARY*12 AS YEAR_SAL, E.*,D.*, J.JOB_CODE AS JOB_JOB_CODE, J.JOB_NAME,
                (SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS AVG_DEPT
            FROM EMPLOYEE E JOIN DEPARTMENT D ON DEPT_CODE=DEPT_ID
                        JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
        ) T
 ) A;
 
 -- ROW를 TOP-N으로 조회하기
 -- 두가지 
 -- 오라클이 기본적으로 제공하는 ROWNUM이라는 가상컬럼을 이용하는 방법
 -- 오라클이 제공하는 WINDOW함수 RANK()를 이용하는 방법
 
 -- 급여를 적게받는 TOP-3 조회하기
 SELECT ROWNUM, EMP_NAME, SALARY
 FROM EMPLOYEE
 --WHERE ROWNUM <=3
 ORDER BY SALARY;
 
 SELECT ROWNUM, E.*
 FROM (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY) E
 WHERE ROWNUM <=3;
 
 -- 급여를 적게받는 5~10위 사원 사원명, 급여 조회하기
 -- ROWNUM을 이용해서 가져오기
 SELECT ROWNUM, A.* 
 FROM(
        SELECT ROWNUM AS RNUM,  E.*
        FROM (
            SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY
            ) E
        ) A
 WHERE A.ROWNUM BETWEEN 5 AND 10;
 
 SELECT ROWNUM AS RNUM, E.*
        FROM (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY) E
    WHERE ROWNUM BETWEEN 5 AND 10;
 
 
 SELECT ROWNUM, E.* FROM EMPLOYEE E
 WHERE ROWNUM<=3;
 
 DESC EMPLOYEE;

 -- 급여를 많이 받은 사원 3명 조회하기
 -- 사원명 부서명, 직책명, 급여
SELECT *
FROM (SELECT ROWNUM AS RNUM, E.* 
                FROM
                             (SELECT EMP_NAME,DEPT_TITLE,JOB_NAME, SALARY
                             FROM EMPLOYEE 
                                            LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
                                            JOIN JOB USING(JOB_CODE)
                             ORDER BY SALARY DESC)E
                )
-- WHERE RNUM BETWEEN 1 AND 3;
-- 급여를 많이 받는 10등 15등까지 조회하기
-- 사원명 부서명, 직책명, 급여
WHERE RNUM BETWEEN 10 AND 15;
 
 
 -- RANK() OVER(ORDER BY )  : 동일값이 나왔을때 번호를 생략 - 누락번호발생함
 -- DENSE_RANK() OVER(ORDER BY ) OVER : 동일값 나왔을때 번호를 생략하지않음 - 누락번호 없음
 -- 이용하기
 SELECT *
 FROM (
                 SELECT RANK() OVER(ORDER BY SALARY) AS "ORDER", 
                                    DENSE_RANK() OVER(ORDER BY SALARY) AS "ORDER2",
                                    E.*
                 FROM EMPLOYEE E
                 )
 WHERE "ORDER" BETWEEN 5 AND 10;
 
 -- 평균급여를 많이 받는 부서 3개출력하기
 -- 부서명, 평균급여
 SELECT *
 FROM (
     SELECT DEPT_TITLE, AVG(SALARY), RANK() OVER(ORDER BY AVG(SALARY) DESC) AS AVG_ORDER
     FROM EMPLOYEE 
                    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
     GROUP BY DEPT_TITLE
     )
 WHERE AVG_ORDER BETWEEN 1 AND 3;
 
 -- WITH구문 이용하기
 -- WITH 한개 SELECT문안에서 지정된 SELECT문을 재사용하기 위해 사용
 
WITH 
    TEST_WITH AS (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY  SALARY DESC),
    TEST_WITH2 AS (SELECT * FROM EMPLOYEE)
    
SELECT EMP_NAME,SALARY FROM TEST_WITH
UNION
SELECT EMAIL, BONUS
FROM TEST_WITH2;

SELECT * FROM TEST_WITH;

-- DDL에 대해 알아보자
-- 테이블을 생성하는 방법에 대해 알아보자
-- CREATE TABLE 을 이용해서 생성함.
-- 테이블은 데이터들을 저장하는 저장소
-- 테이블내 각컬럼에 데이터를 저장
-- 컬럼(각 저장소)는 TYPE이 있음
-- 오라클에서 제공하는 TYPE
-- 숫자 : NUMBER 정수, 실수
-- 문자 : CHAR, VARCHAR2, NVARCHAR2, LONG, CLOB
-- 날짜 : DATE, TIMESTAMP

-- 테이블 생성하는 방법
--CREATE TABLE 테이블명(
-- 컬럼명 TYPE() [제약조건] ,
-- 컬럼명 TYPE[()] [제약조건],......
--)


-- 문자열 타입 설정하기
-- CHAR : 고정크기 문자열 저장소
-- VARCHAR2 : 가변크기 문자열 저장소
-- NVARCHAR2 : 가변크기 확장적 문자열들을 저장

CREATE TABLE TBL_STR(
    A CHAR(6),
    B VARCHAR2(6),
    C NVARCHAR2(6)
);
SELECT * FROM TBL_STR;
INSERT INTO TBL_STR VALUES('ABC','ABC','ABC');
INSERT INTO TBL_STR VALUES('ABCDEFG','ABCDEF','ABCDEF');
INSERT INTO TBL_STR VALUES('가나','오나','자나');
INSERT INTO TBL_STR VALUES('가나다','오나다','자나다');
INSERT INTO TBL_STR VALUES('가나','오나','자나다라바마');

SELECT LENGTHB(A), LENGTHB(B), LENGTHB(C)
FROM TBL_STR;

-- 숫자형 자료형
-- NUMBER : 표현가능한 모든 숫자 저장함
-- NUMBER(PRECISION, SCALE) : 숫자저장에 제한설정
-- PRECISION : 저장가능한 숫자의 전체 자리수(1~38)
-- SCALE : 소수점 자리수설정(-84~127)

CREATE TABLE TBL_NUM(
    A NUMBER,
    B NUMBER(5),
    C NUMBER(5,1),
    D NUMBER(5,-2)
);
SELECT * FROM TBL_NUM;
INSERT INTO TBL_NUM VALUES(1234.567,1234.567,1234.567,1234.567);
INSERT INTO TBL_NUM VALUES(1234.123,1234.123,1234.123,1234.123);
INSERT INTO TBL_NUM VALUES(123400.12300,12340.123,1234.123,12340000.123);

-- 날짜형식
-- DATE : 년, 월, 일 저장하는 자료형
-- TIMESTAMP :  년, 월, 일 시, 분 초 저장하는 자료형
CREATE TABLE TBL_DATE(
    BIRTHDAY DATE,
    RENT_START TIMESTAMP
);

SELECT * FROM TBL_DATE;
INSERT INTO TBL_DATE VALUES(SYSDATE,SYSTIMESTAMP);
-- 날짜데이터
-- 1. 문자형태로 저장
INSERT INTO TBL_DATE VALUES('24/02/13','24/02/13 09:00');
-- 2. 형변환해서 저장하기 **
INSERT INTO TBL_DATE VALUES(TO_DATE('24/02/13','YY/MM/DD'),TO_TIMESTAMP('24/02/13 09:00','RR/MM/DD HH24:MI'));


-- 문자열저장시 데이터 크기가 엄청 크다면!!
-- VARCHAR2() -> 최대 4천바이트
-- LONG, CLOB
CREATE TABLE TBL_STR2(
    TESTSTR VARCHAR2(4000),
    TESTSTR2 CLOB
);

SELECT * FROM TBL_STR2;
DESC TBL_STR2;
INSERT INTO TBL_STR2 VALUES('1L3KJ12LJFKLEJ214K3JVDSLKJ214JDSKJ2
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ',
TO_CLOB('1L3KJ12LJFKLEJ214K3JVDSLKJ214JDSKJ2
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF')
||
TO_CLOB('DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJFㅁ니ㅏ얾ㄴ이ㅏ럼ㄴㅇ;ㅣ러ㅏㅁㄴ이ㅏ럼ㄴㅇ;ㅣㅓ람;댜ㅓㄻ;니럼ㅇㄴㄹ
ㅁ니ㅏ얾너아ㅜㄹ마ㅓ울마너ㅜㄹ;ㅁ뱓럼ㄷ룸ㄴ아ㅓㅜㄹ
ㅁㄴ어라ㅜㅁㄴ아ㅓㅣㅜㅗㅁㄴㅇ;랴ㅓㅗㅁㄴㄹㅇ
ㅁㄴ아ㅑㅓㅁ;ㅇ너람;ㅣㄴ어ㅏㅁ;ㅣ어람ㄴ
ㄻ;ㅣㄴ울;ㅁㄴ어ㅜ먼우라멍누
ㄷ랴ㅐㅓㅜㄹㄷ;ㅑㄻㄴ아ㅓㅜㄻ;ㄴ어
미;ㄴ욺니아ㅓㅣ만얼;ㅣ멍날;ㅣㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇㄹ;ㅓㅏㅁㅇㄴ;럼ㅇㄴ;ㅣ럼;ㅣㄴ어ㅏ;ㅐㅑㅓㅁ;ㅓ리누ㅏ마ㅓㅜㅍㅎㄹ;ㅓㅑㄺ쟈남어랟ㅈ라ㅓ주
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJFㅁ니ㅏ얾ㄴ이ㅏ럼ㄴㅇ;ㅣ러ㅏㅁㄴ이ㅏ럼ㄴㅇ;ㅣㅓ람;댜ㅓㄻ;니럼ㅇㄴㄹ
ㅁ니ㅏ얾너아ㅜㄹ마ㅓ울마너ㅜㄹ;ㅁ뱓럼ㄷ룸ㄴ아ㅓㅜㄹ
ㅁㄴ어라ㅜㅁㄴ아ㅓㅣㅜㅗㅁㄴㅇ;랴ㅓㅗㅁㄴㄹㅇ
ㅁㄴ아ㅑㅓㅁ;ㅇ너람;ㅣㄴ어ㅏㅁ;ㅣ어람ㄴ
ㄻ;ㅣㄴ울;ㅁㄴ어ㅜ먼우라멍누
ㄷ랴ㅐㅓㅜㄹㄷ;ㅑㄻㄴ아ㅓㅜㄻ;ㄴ어
미;ㄴ욺니아ㅓㅣ만얼;ㅣ멍날;ㅣㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇㄹ;ㅓㅏㅁㅇㄴ;럼ㅇㄴ;ㅣ럼;ㅣㄴ어ㅏ;ㅐㅑㅓㅁ;ㅓ리누ㅏ마ㅓㅜㅍㅎㄹ;ㅓㅑㄺ쟈남어랟ㅈ라ㅓ주
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJFㅁ니ㅏ얾ㄴ이ㅏ럼ㄴㅇ;ㅣ러ㅏㅁㄴ이ㅏ럼ㄴㅇ;ㅣㅓ람;댜ㅓㄻ;니럼ㅇㄴㄹ
ㅁ니ㅏ얾너아ㅜㄹ마ㅓ울마너ㅜㄹ;ㅁ뱓럼ㄷ룸ㄴ아ㅓㅜㄹ
ㅁㄴ어라ㅜㅁㄴ아ㅓㅣㅜㅗㅁㄴㅇ;랴ㅓㅗㅁㄴㄹㅇ
ㅁㄴ아ㅑㅓㅁ;ㅇ너람;ㅣㄴ어ㅏㅁ;ㅣ어람ㄴ
ㄻ;ㅣㄴ울;ㅁㄴ어ㅜ먼우라멍누
ㄷ랴ㅐㅓㅜㄹㄷ;ㅑㄻㄴ아ㅓㅜㄻ;ㄴ어
미;ㄴ욺니아ㅓㅣ만얼;ㅣ멍날;ㅣㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇㄹ;ㅓㅏㅁㅇㄴ;럼ㅇㄴ;ㅣ럼;ㅣㄴ어ㅏ;ㅐㅑㅓㅁ;ㅓ리누ㅏ마ㅓㅜㅍㅎㄹ;ㅓㅑㄺ쟈남어랟ㅈ라ㅓ주
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA')
||TO_CLOB(
'SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJFㅁ니ㅏ얾ㄴ이ㅏ럼ㄴㅇ;ㅣ러ㅏㅁㄴ이ㅏ럼ㄴㅇ;ㅣㅓ람;댜ㅓㄻ;니럼ㅇㄴㄹ
ㅁ니ㅏ얾너아ㅜㄹ마ㅓ울마너ㅜㄹ;ㅁ뱓럼ㄷ룸ㄴ아ㅓㅜㄹ
ㅁㄴ어라ㅜㅁㄴ아ㅓㅣㅜㅗㅁㄴㅇ;랴ㅓㅗㅁㄴㄹㅇ
ㅁㄴ아ㅑㅓㅁ;ㅇ너람;ㅣㄴ어ㅏㅁ;ㅣ어람ㄴ
ㄻ;ㅣㄴ울;ㅁㄴ어ㅜ먼우라멍누
ㄷ랴ㅐㅓㅜㄹㄷ;ㅑㄻㄴ아ㅓㅜㄻ;ㄴ어
미;ㄴ욺니아ㅓㅣ만얼;ㅣ멍날;ㅣㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇㄹ;ㅓㅏㅁㅇㄴ;럼ㅇㄴ;ㅣ럼;ㅣㄴ어ㅏ;ㅐㅑㅓㅁ;ㅓ리누ㅏ마ㅓㅜㅍㅎㄹ;ㅓㅑㄺ쟈남어랟ㅈ라ㅓ주
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJFㅁ니ㅏ얾ㄴ이ㅏ럼ㄴㅇ;ㅣ러ㅏㅁㄴ이ㅏ럼ㄴㅇ;ㅣㅓ람;댜ㅓㄻ;니럼ㅇㄴㄹ
ㅁ니ㅏ얾너아ㅜㄹ마ㅓ울마너ㅜㄹ;ㅁ뱓럼ㄷ룸ㄴ아ㅓㅜㄹ
ㅁㄴ어라ㅜㅁㄴ아ㅓㅣㅜㅗㅁㄴㅇ;랴ㅓㅗㅁㄴㄹㅇ
ㅁㄴ아ㅑㅓㅁ;ㅇ너람;ㅣㄴ어ㅏㅁ;ㅣ어람ㄴ
ㄻ;ㅣㄴ울;ㅁㄴ어ㅜ먼우라멍누
ㄷ랴ㅐㅓㅜㄹㄷ;ㅑㄻㄴ아ㅓㅜㄻ;ㄴ어
미;ㄴ욺니아ㅓㅣ만얼;ㅣ멍날;ㅣㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇㄹ;ㅓㅏㅁㅇㄴ;럼ㅇㄴ;ㅣ럼;ㅣㄴ어ㅏ;ㅐㅑㅓㅁ;ㅓ리누ㅏ마ㅓㅜㅍㅎㄹ;ㅓㅑㄺ쟈남어랟ㅈ라ㅓ주
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJFㅁ니ㅏ얾ㄴ이ㅏ럼ㄴㅇ;ㅣ러ㅏㅁㄴ이ㅏ럼ㄴㅇ;ㅣㅓ람;댜ㅓㄻ;니럼ㅇㄴㄹ
ㅁ니ㅏ얾너아ㅜㄹ마ㅓ울마너ㅜㄹ;ㅁ뱓럼ㄷ룸ㄴ아ㅓㅜㄹ
ㅁㄴ어라ㅜㅁㄴ아ㅓㅣㅜㅗㅁㄴㅇ;랴ㅓㅗㅁㄴㄹㅇ
ㅁㄴ아ㅑㅓㅁ;ㅇ너람;ㅣㄴ어ㅏㅁ;ㅣ어람ㄴ
ㄻ;ㅣㄴ울;ㅁㄴ어ㅜ먼우라멍누
ㄷ랴ㅐㅓㅜㄹㄷ;ㅑㄻㄴ아ㅓㅜㄻ;ㄴ어
')||TO_CLOB('
미;ㄴ욺니아ㅓㅣ만얼;ㅣ멍날;ㅣㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇㄹ;ㅓㅏㅁㅇㄴ;럼ㅇㄴ;ㅣ럼;ㅣㄴ어ㅏ;ㅐㅑㅓㅁ;ㅓ리누ㅏ마ㅓㅜㅍㅎㄹ;ㅓㅑㄺ쟈남어랟ㅈ라ㅓ주
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJFㅁ니ㅏ얾ㄴ이ㅏ럼ㄴㅇ;ㅣ러ㅏㅁㄴ이ㅏ럼ㄴㅇ;ㅣㅓ람;댜ㅓㄻ;니럼ㅇㄴㄹ

ㅁ니ㅏ얾너아ㅜㄹ마ㅓ울마너ㅜㄹ;ㅁ뱓럼ㄷ룸ㄴ아ㅓㅜㄹ
ㅁㄴ어라ㅜㅁㄴ아ㅓㅣㅜㅗㅁㄴㅇ;랴ㅓㅗㅁㄴㄹㅇ
ㅁㄴ아ㅑㅓㅁ;ㅇ너람;ㅣㄴ어ㅏㅁ;ㅣ어람ㄴ
ㄻ;ㅣㄴ울;ㅁㄴ어ㅜ먼우라멍누
ㄷ랴ㅐㅓㅜㄹㄷ;ㅑㄻㄴ아ㅓㅜㄻ;ㄴ어
미;ㄴ욺니아ㅓㅣ만얼;ㅣ멍날;ㅣㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇㄹ;ㅓㅏㅁㅇㄴ;럼ㅇㄴ;ㅣ럼;ㅣㄴ어ㅏ;ㅐㅑㅓㅁ;ㅓ리누ㅏ마ㅓㅜㅍㅎㄹ;ㅓㅑㄺ쟈남어랟ㅈ라ㅓ주
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJFㅁ니ㅏ얾ㄴ이ㅏ럼ㄴㅇ;ㅣ러ㅏㅁㄴ이ㅏ럼ㄴㅇ;ㅣㅓ람;댜ㅓㄻ;니럼ㅇㄴㄹ
ㅁ니ㅏ얾너아ㅜㄹ마ㅓ울마너ㅜㄹ;ㅁ뱓럼ㄷ룸ㄴ아ㅓㅜㄹ
ㅁㄴ어라ㅜㅁㄴ아ㅓㅣㅜㅗㅁㄴㅇ;랴ㅓㅗㅁㄴㄹㅇ
ㅁㄴ아ㅑㅓㅁ;ㅇ너람;ㅣㄴ어ㅏㅁ;ㅣ어람ㄴ
ㄻ;ㅣㄴ울;ㅁㄴ어ㅜ먼우라멍누
ㄷ랴ㅐㅓㅜㄹㄷ;ㅑㄻㄴ아ㅓㅜㄻ;ㄴ어
미;ㄴ욺니아ㅓㅣ만얼;ㅣ멍날;ㅣㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇㄹ;ㅓㅏㅁㅇㄴ;럼ㅇㄴ;ㅣ럼;ㅣㄴ어ㅏ;ㅐㅑㅓㅁ;ㅓ리누ㅏ마ㅓㅜㅍㅎㄹ;ㅓㅑㄺ쟈남어랟ㅈ라ㅓ주
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJFㅁ니ㅏ얾ㄴ이ㅏ럼ㄴㅇ;ㅣ러ㅏㅁㄴ이ㅏ럼ㄴㅇ;ㅣㅓ람;댜ㅓㄻ;니럼ㅇㄴㄹ
ㅁ니ㅏ얾너아ㅜㄹ마ㅓ울마너ㅜㄹ;ㅁ뱓럼ㄷ룸ㄴ아ㅓㅜㄹ
ㅁㄴ어라ㅜㅁㄴ아ㅓㅣㅜㅗㅁㄴㅇ;랴ㅓㅗㅁㄴㄹㅇ
ㅁㄴ아ㅑㅓㅁ;ㅇ너람;ㅣㄴ어ㅏㅁ;ㅣ어람ㄴ
ㄻ;ㅣㄴ울;ㅁㄴ어ㅜ먼우라멍누
ㄷ랴ㅐㅓㅜㄹㄷ;ㅑㄻㄴ아ㅓㅜㄻ;ㄴ어
미;ㄴ욺니아ㅓㅣ만얼;ㅣ멍날;ㅣㅏㅓㅁㄴㅇㄹ;ㅣㅏㅓㅁㄴㅇㄹ;ㅓㅏㅁㅇㄴ;럼ㅇㄴ;ㅣ럼;ㅣㄴ어ㅏ;ㅐㅑㅓㅁ;ㅓ리누ㅏ마ㅓㅜㅍㅎㄹ;ㅓㅑㄺ쟈남어랟ㅈ라ㅓ주'));

INSERT INTO TBL_STR2 VALUES('TEST','TEST');

SELECT * FROM TBL_STR2;


-- 테이블 생성시에 컬럼에 제약조건 설정하기
-- NOT NULL
-- UNIQUE
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK

-- 제약조건을 설정하는 방식
-- 컬럼레벨에서 설정 : 컬럼한개에 제약조건을 설정할때
-- 테이블레벨에서 설정 : 여러컬럼을 묶어서 제약조건을 설정할때 
--  CREATE TABLE 테이블명(
--    컬럼명 타입명 [제약조건] 컬럼레벨,
--      컬럼명 타입명 [제약조건],
--      [제약조건] 테이블레벨
--)

-- NOT NULL (C) : 설정된 컬럼에는 NULL값을 저장하지 않게 하는 제약조건 * 컬럼은 별다른 제약조건이 없으면 NULLABLE(DEFUALT)
-- 컬럼레벨에서만 설정이 가능함.!
CREATE TABLE MEMBER(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(50),
    MEMBER_PWD VARCHAR2(50),
    MEMBER_NAME VARCHAR2(20),
    MEMBER_AGE NUMBER
);
SELECT * FROM MEMBER;
INSERT INTO MEMBER VALUES(NULL,NULL,NULL,NULL,NULL);
-- NOTNULL제약조건 설정하기
CREATE TABLE NN_MEMBER(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(50) NOT NULL,
    MEMBER_PWD VARCHAR2(50) NOT NULL,
    MEMBER_NAME VARCHAR2(20),
    MEMBER_AGE NUMBER
--    NOT NULL(MEMBER_ID)
);
INSERT INTO NN_MEMBER VALUES(NULL, 'ADMIN',NULL,NULL,NULL);
INSERT INTO NN_MEMBER VALUES(NULL, 'ADMIN','1234',NULL,NULL);

-- UNIQUE (U) : 설정된 컬럼에 중복데이터를 저장할 수 없게 하는 기능
-- 컬럼레벨,  테이블레벨에서 설정
SELECT * FROM NN_MEMBER;
INSERT INTO NN_MEMBER VALUES(1,'ADMIN','0000','전승우',29);

CREATE TABLE UQ_MEMBER(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(50), --UNIQUE,
    MEMBER_PWD VARCHAR2(50) NOT NULL,
    MEMBER_NAME VARCHAR2(20),
    MEMBER_AGE NUMBER,
    --테이블레벨에서 제약조건설정
    UNIQUE(MEMBER_ID)
);
SELECT * FROM UQ_MEMBER;
INSERT INTO UQ_MEMBER VALUES(1,'GDJ79','7979','김명준',32);
INSERT INTO UQ_MEMBER VALUES(2,'GDJ79','8282','유병승',19);
INSERT INTO UQ_MEMBER VALUES(2,NULL,'8282','유병승',19);
INSERT INTO UQ_MEMBER VALUES(3,NULL,'7942','유승주',29);
DROP TABLE UQ_MEMBER;

-- 다수컬럼에 UNIQUE제약조건을 설정할 수 있다.
-- 테이블 레벨에서만 가능

CREATE TABLE UQ_MEMBER2(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(50),
    MEMBER_PWD VARCHAR2(50) NOT NULL,
    MEMBER_NAME VARCHAR2(20),
    MEMBER_AGE NUMBER,
    UNIQUE(MEMBER_ID,MEMBER_NAME)
); --  장바구니에 같은 상품을 다량의 수량으로 넣었을때 같은 상품이 계속 반복돼서 나오지 않음 SW가 화장지라는 상품을 장바구니에 넣음, 아이디 승우와 상품을 UNIQE로 묶어야함. 
SELECT *FROM UQ_MEMBER2;
INSERT INTO UQ_MEMBER2 VALUES(1,'GDJ79','7979','김명준',32);
INSERT INTO UQ_MEMBER2 VALUES(2,'GDJ79','8282','유병승',19);
INSERT INTO UQ_MEMBER2 VALUES(2,NULL,'8282','유병승',19);
INSERT INTO UQ_MEMBER2 VALUES(3,NULL,'7942','유승주',29);

-- PRIMARY KEY(P) : 설정된 컬럼에 중복, NULL 안됨
-- 일반적으로 모든 테이블에 한개 컬럼에 설정
-- 실제 사용하는 컬럼 / 사용하지않는 컬럼을 생성해서 설정
-- 컬럼레벨, 테이블레벨 모두 가능
CREATE TABLE PK_MEMBER(
    MEMBER_NO NUMBER PRIMARY KEY,
    MEMBER_ID VARCHAR2(50) UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(50) NOT NULL,
    MEMBER_NAME VARCHAR2(20),
    MEMBER_AGE NUMBER
    --첫번째 줄 없애고 PRIMARY KEY(MEMBER_NO)를 써줘도 됨, PRIMAR도 다중 묶어서 사용할 수 있음-> PRIMARY KEY(MEMBER_NO,MEMBER_ID)
); 
SELECT*FROM PK_MEMBER;
INSERT INTO PK_MEMBER VALUES(1,'ADMIN','1234','전승우',29);
INSERT INTO PK_MEMBER VALUES(2,'USER01','3333','최헌수',23);
DROP TABLE PK_MEMBER1;

-- FORENIN KEY(R) : 컬럼에 저장되는 데이터가 다른테이블에 있는 값만 저장하게 하는 것
-- 참조관계를 설정 -> 참조되는 테이블(부모) 참조하는 테이블(자식)
-- 참조되는 테이블에서 선택된 컬럼은 PK거나 UNIQUE제약조건이 설정이 되어있어야 한다. 
CREATE TABLE FK_BOARD--//////////////////////////////////////////////////////////////////
 CREATE TABLE FK_BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200) NOT NULL,
    BOARD_CONTENT VARCHAR2(2000),
    BOARD_WRITER VARCHAR2(20), --NOT NULL REFERENCES UQ_MEMBER(MEMBER_ID), --REFERENCES 테이블명(컬럼명),
    BOARD_DATE DATE,
    FOREIGN KEY(BOARD_WRITER) REFERENCES UQ_MEMBER(MEMBER_ID)
);

SELECT * FROM UQ_MEMBER;
INSERT INTO UQ_MEMBER VALUES(4,'ADMIN','1234','관리자',44);
INSERT INTO UQ_MEMBER VALUES(5,'USER01','1111','유저일',11);
INSERT INTO UQ_MEMBER VALUES(6,'BS','1111','유저일',11);

INSERT INTO FK_BOARD VALUES(1,'나는 오늘 db를 즐기고있다.',NULL,'GDJ79',SYSDATE);
INSERT INTO FK_BOARD VALUES(2,'참조관계에 NULL값은?.',NULL,NULL,SYSDATE);
INSERT INTO FK_BOARD VALUES(3,'참조관계에 NULL값은?.',NULL,'BS',SYSDATE);
SELECT * FROM FK_BOARD;
DROP TABLE FK_BOARD;


-- 댓글테이블 구성하기
-- 댓글번호, 내용, 작성자(FK), 작성일, 게시글번호(FK)
CREATE TABLE FK_BOARD_COMMENT(
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(1000) NOT NULL,
    COMMENT_WRITER VARCHAR2(20) REFERENCES UQ_MEMBER(MEMBER_ID),
    BOARD_NO NUMBER REFERENCES FK_BOARD(BOARD_NO),
    COMMENT_DATE DATE
);

INSERT INTO FK_BOARD_COMMENT VALUES(1, 'MJ 두끼 힘내요! 아랫배?','GDJ79',1,SYSDATE);
INSERT INTO FK_BOARD_COMMENT VALUES(2, '헌수 MJ 그만 눌러! 아랫배?','USER01',1,SYSDATE);
SELECT * FROM FK_BOARD_COMMENT;

SELECT *
FROM FK_BOARD 
            JOIN UQ_MEMBER ON BOARD_WRITER=MEMBER_ID
            LEFT JOIN FK_BOARD_COMMENT USING( BOARD_NO)
WHERE BOARD_NO=3;

-- FK제약조건이 설정된 부모테이블의 데이터는 함부로 삭제 할 수 없다.
DELETE FROM FK_BOARD WHERE BOARD_NO=1;

DROP TABLE FK_BOARD;

-- FK 설정시 삭제에 대한 옵션을 설정할 수 있음
-- ON DELETE SET NULL : 참조값이 삭제되면 NULL로 설정 *컬럼에 NOT NULL 제약조건을 설정하면 안됨!
-- ON DELETE CASCADE : 참조값이 삭제되면 너도 삭제돼!
DROP TABLE FK_BOARD_COMMENT;
CREATE TABLE FK_BOARD_COMMENT(
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(1000) NOT NULL,
    COMMENT_WRITER VARCHAR2(20) REFERENCES UQ_MEMBER(MEMBER_ID),
    --BOARD_NO NUMBER REFERENCES FK_BOARD(BOARD_NO) ON DELETE SET NULL,
    BOARD_NO NUMBER REFERENCES FK_BOARD(BOARD_NO) ON DELETE CASCADE,
    COMMENT_DATE DATE
);
SELECT * FROM FK_BOARD_COMMENT;
INSERT INTO FK_BOARD_COMMENT VALUES(1,'TEST','ADMIN',3,SYSDATE);

DELETE FROM FK_BOARD WHERE BOARD_NO=3;


-- CHECK DEFAULT COMMENT 제약조건조회 제약조건 이름 설정
-- CHECK(C) : 특정 조건에 맞는 값만 저장할 수 있게 해주는 것
-- 컬럼레벨에서 설정가능
CREATE TABLE PERSON(
NAME VARCAHR2(20),
AGE NUMBER CHECK(AGE>0),
GENDER VARCHAR(5) CHECK(GENDER IN('M','F'))
);
DROP TABLE PERSON;
SELECT *FROM PERSON;
INSERT INTO PERSON VALUES('유병승',19,'M');

CREATE TABLE TEST_BOARD(
TYPE VARCHAR2(10) CHECK(TYPE IN('자유','공용','비밀')) , --자유, 공용, 비밀
TITLE VARCHAR2(20)
)
-- 위 아니면 아래의 방식으로 만들어낼 수 있다. 
CREATE TABLE TEST_BOARD(
TYPE NUMBER REFERENCES BOARD_TYPE(TYPE_NO), -- 자유 , 공용, 비밀
TITLE VARCHAR2(20)
)
-- 위와 아래가 같음(조건이 더 수정 될 수도있으면 아래가 더 낫다)
CREATE TABLE BOARD_TYPE(
TYPE_NO NUMBER PRIMARY KEY,
TYPE_NAME VARCHAR2(10)
);

--DEFAULT 값 설정하기
CREATE TABLE DEFAULT_TEST(
TEST_NO NUMBER PRIMARY KEY,
TEST_DATE DATE DEFAULT SYSDATE NOT NULL,
TEST_DATA VARCHAR2(20) DEFAULT '기본값'
);

INSERT INTO DEFAULT_TEST VALUES(1,DEFAULT,DEFAULT);
INSERT INTO DEFAULT_TEST VALUES(2,TO_DATE('24/02/13','RR/MM/DD'),'개강일');
SELECT*FROM DEFAULT_TEST;
INSERT INTO DEFAULT_TEST VALUES(TEST_NO) VALUES(3); --컬럼을 지정해서 그 컬럼의 값만 설정해줄 수 있다. 


-- 제약조건을 설정할 때 제약 조건에 대한 이름 설정하기 : CONSTRAINT
CREATE TABLE MEMBER_TEST(
MEMBER_NO NUMBER CONSTRAINT MEMBER_NO_PK PRIMARY KEY,
MEMBER_ID VARCHAR(20) CONSTRAINT MEMBER_ID_UQ UNIQUE CONSTRAINT NN_MEMBER_ID NOT NULL,
MEMBER_AGE NUMBER CONSTRAINT CK_AGE CHECK(MEMBER_AGE>0),
BOARD_NO NUMBER,
CONSTRAINT FK_BOARD FOREIGN KEY(BOARD_NO) REFERENCES FK_BOARD(BOARD_NO)
);
INSERT INTO MEMBER_TEST VALUES(1,'ADMIN',10,2); -- 에러 메시지에서 이름이 나오기때문에 찾기 더 편함

-- 설정된 제약 조건 조회하기
-- 오라클에서 USER_CONSTRAINTS,USER_CONS_COLUMNS 테이블을 제공함
SELECT *
FROM USER_CONSTRAINTS; --컬럼 안나옴
-- 컬럼 확인하기(타입과 내용 안나옴)
SELECT *
FROM USER_CONS_COLUMNS;
-- > 합쳐서 사용(유일한 값을 갖는 CONSTRAINT_NAME)이 기준
SELECT UC.CONSTRAINT_NAME,UC.TABLE_NAME,CONSTRAINT_TYPE,COLUMN_NAME
FROM USER_CONSTRAINTS UC
 JOIN USER_CONS_COLUMNS UCC ON UC.CONSTRAINT_NAME=UCC.CONSTRAINT_NAME; 

-- 컬럼에 설명 작성하기
-- 다른 사람이 못알아보는 코드는 좋은 코드가 아님
COMMENT ON COLUMN MEMBER_TEST.MEMBER_NO IS'회원번호 PRIMARY KEY';
COMMENT ON COLUMN MEMBER_TEST.MEMBER_ID IS '회원아이디 8글자이상 영문';

SELECT*
FROM USER_COL_COMMENTS --오라클 제공 테이블
WHERE TABLE_NAME='MEMBER_TEST';

-- TABLE에 설명 작성하기
COMMENT ON TABLE MEMBER_TEST IS '제약조건 연습테이블';
-- 확인하기
SELECT*
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME='MEMBER_TEST';

-- 테이블 생성할 때 기존테이블의 내용을 복사해서 생성하기
-- 복사해서 생성한 테이블은 제약조건이 NOT NULL제약조건만 복사됨
-- ENPLOYEE 테이블 복사해서 테이블 생성하고 확인하기
CREATE TABLE COPY_EMP
AS SELECT *FROM EMPLOYEE;
SELECT*FROM COPY_EMP;

-- EMPLOYEE 에서 아이디, 이름, 연봉만 복사해서 테이블 생성하고 확인하기
CREATE TABLE COPY_EMP
AS SELECT  EMP_ID,EMP_NAME,SALARY*12 AS YEAR_SAL FROM EMPLOYEE;
SELECT*FROM COPY_EMP;

-- EMPLOYEE 테이블의 구조만 복사하기
CREATE TABLE COPY_EMP2
AS SELECT*FROM EMPLOYEE WHERE 1=2; --컬럼들만 복사해서 가져오게됨(NOT NULL제약조건만 복사됨)

--TEST_MEMBER 테이블
--MEMBER_CODE(NUMBER) - 기본키                  -- 회원전용코드 
--MEMBER_ID (varchar2(20) ) - 중복금지, NULL값 허용금지   -- 회원 아이디
--MEMBER_PWD (char(20)) - NULL 값 허용금지               -- 회원 비밀번호
--MEMBER_NAME(nchar(10)) - 기본값 '아무개'            -- 회원 이름
--MEMBER_ADDR (char(50)) - NULL값 허용금지               -- 회원 거주지
--GENDER (varchar2(5)) - '남' 혹은 '여'로만 입력 가능            -- 성별
--PHONE(varchar2(20)) - NULL 값 허용금지                -- 회원 연락처
--HEIGHT(NUMBER(5,2) - 130이상의 값만 입력가능           -- 회원키
--TYPE_NO NUMBER - BOARD_TYPE NO값을 참조 -- 보드타입참조
CREATE TABLE BOARD_TYPE(
    TYPE_NO NUMBER PRIMARY KEY,
    TYPE_NAME VARCHAR2(10)
);
CREATE TABLE TEST_MEMBER(
 MEMBER_CODE NUMBER PRIMARY KEY,
 MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL ,
 MEMBER_PWD CHAR(20) NOT NULL,
 MEMBER_NAME NCHAR(10) DEFAULT '아무개',
 MEMBER_ADDR CHAR(50) NOT NULL,
 GENDER VARCHAR(5) NOT NULL CHECK(GENDER IN('남','여')),
 PHONE VARCHAR(20) NOT NULL,
 HEIGHT NUMBER(5,2) CHECK(HEIGHT>=130),
 TYPE_NO NUMBER REFERENCES BOARD_TYPE(TYPE_NO)
 );
 
 COMMENT ON COLUMN TABLE_MEMNBER.MEMBER_CODE IS'회원전용코드';
  COMMENT ON COLUMN TABLE_MEMNBER.MEMBER_ID IS'회원아이디';
 COMMENT ON COLUMN TABLE_MEMNBER.MEMBER_PWD IS'회원비밀번호';
 COMMENT ON COLUMN TABLE_MEMNBER.MEMBER_ADDR IS'회원 거주지';
 COMMENT ON COLUMN TABLE_MEMNBER.GENDER IS'성별';
 COMMENT ON COLUMN TABLE_MEMNBER.PHONE IS'회원 연락처';
 COMMENT ON COLUMN TABLE_MEMNBER.HEIGHT IS'회원키';
 COMMENT ON COLUMN TABLE_MEMNBER.TYPE_TO_NUM IS'보드타입 참조';
 
 --------------------------DML
-- ROW(DATA)를 삽입, 수정, 삭제하는 명령어
-- INSERT : 테이블에 새로운 ROW를 추가하는 명령어
-- 표현법 
-- INSERT INTO 테이블명 [(컬럼명, 컬럼명 ...)] VALUES(값,값,값.....)
-- UPDATE : 테이블에 특정ROW의 컬럼값을 수정하는 명령어
-- 표현법
-- UPDATE 테이블명 SET 컬럼명=값[,컬럼명=값...][WHERE 조건문]
-- DELETE : 테이블에 특정ROW를 삭제하는 명령어
-- 표현법
-- DELETE FORM 테이블명[WHERE 조건식]

-- INSERT문 활용하기
-- 1. 전체컬럼에 값을 대입하기
-- INSERT INTO 테이블명 VALUES(값,...)-> VALUES값의 갯수는 테이블의 컬럼수와 같아야한다. 
-- 컬럼의 순서대로 매칭돼서 들어가서 순서를 맞춰서 INSERT해줘야함
 CREATE TABLE TEMP_DEPT
 AS SELECT*FROM DEPARTMENT WHERE 1=0;
 INSERT INTO TEMP_DEPT VALUES('D1','자바학부','L3'); 
 --> 값이 3개가 아니면 오류가 발생한다. 
 CREATE TABLE TEMP_EMP
 AS SELECT EMP_NAME,SALARY,HIRE_DATE FROM EMPLOYEE WHERE 1=0;
 SELECT*FROM TEMP_EMP;
 INSERT INTO TEMP_EMP VALUES('TEST','101원','1234'); --수치가 부적합니다 오류가 뜸
--> 타입에 맞게 INSERT해줘야함 아니면 오류가 발생한다. 
-- 2 .컬럼을 설정해서 값 대입하기
INSERT INTO TEMP_DEPT(DEPT_ID,LOCATION_ID) VALUES('D2','L2');
-- 지정안한 컬럼은 NULL로 들어가게된다. 
-- NOT NULL제약조건이 있는 컬럼은 무조건 선택해서 값을 넣어줘야함 이유 : NOT NULL제약 조건을 설정하지 않았을 때 나머지는 NULL로 들어가는데 제약조건이 NOT NULL인값에 NULL을 넣을 수 없기 때문에 오류 발생한다. (DEFAULT값이 있는 경우  NULL이 아닌DEFAULT값으로 대체되기 때문에 제외)

-- SELECT 문을 이용해서 INSERT하기
-- 다른테이블에 있는값을 복사해서 대입하기
CREATE TABLE INSERT_SUB
AS SELECT EMP_ID,EMP_NAME,DEPT_TITLE,HIRE_DATE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID WHERE 1=2;
    
SELECT*FROM INSERT_SUB;

INSERT INTO INSERT_SUB(
    SELECT EMP_ID,EMP_NAME,DEPT_TITLE,SALARY
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    WHERE SALARY>=3000000
);
-- 오류 발생 :  DATE가 필요하지만 NUMBER임 -> 데이터 타입을 맞춰줘야한다. 
 
 
 -- 컬럼을 선택해서
 INSERT INTO INSERT_SUB(EMP_ID,EMP_NAME)(
 SELECT EMP_ID,EMP_NAME FROM EMPLOYEE;
 
 -- INSERT ALL이용하기
 -- 한개의 SELECT문의 데이터를 다수 테이블 저장하는 명령어
 --표현법
 -- INTO 테이블명 VALUES(컬럼명, 컬럼명,.....)
 -- INTO 테이블명 VALUES(컬럼명, 컬럼명,.....)
 --SELECT 문
 CREATE TABLE EMP_HIRE_DATE
 AS SELECT EMP_ID,EMP_NAME,HIRE_DATE FROM EMPLOYEE WHERE 1=0;
CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID,EMP_NAME,MANAGER_ID FROM EMPLOYEE WHERE 1=0;

SELECT*FROM EMP_HIRE_DATE;
SLEECT*FROM EMP_MANAGER;
--각각의 데이터를 분활해서 저장한다. 
INSERT ALL 
    INTO EMP_HIRE_DATE VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
    INTO EMP_MANAGER VALUES(EMP_ID,EMP_NAME,MANAGER_ID)
SELECT EMP_ID,EMP_NAME,HIRE_DATE,MANAGER_ID FROM EMPLOYEE;

-- 조건에 따라 각 테이블에 저장하기 - WHEN을 사용해준다. 
-- 표현식
--INSERT ALL
 -- WHEN 조건식 THEN INTO 테이블명 VALUES(값, 값...)
 -- WHEN 조건식 THEN INTO 테이블명 VALUES(값, 값...)
 -- WHEN 조건식 THEN INTO 테이블명 VALUES(값, 값...)
 --SELECT문
-- 00년 이전 입사자,00년 이후 입사자를 분리저장하기
CREATE TABLE OLD_EMP
AS SELECT EMP_ID,EMP_NAME,HIRE_DATE FROM EMPLOYEE WHERE 1=0;
CREATE TABLE NEW_EMP
AS SELECT EMP_ID,EMP_NAME,HIRE_DATE FROM EMPLOYEE WHERE 1=0;

INSERT ALL
    WHEN HIRE_DATE<'00/01/01' THEN INTO OLD_EMP VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
    WHEN HIRE_DATE>='00/01/01' THEN INTO NEW_EMP VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
SELECT*FROM EMPLOYEE;
 -- 위 아래중 TRUE가 되는 값만 TRUE로 데이터가 삽입된다. 
SELECT * FROM OLD_EMP; --00/01/01 이전 입사한사람
SELECT * FROM NEW_EMP; --00/01/01 이후 입사한사람

-- UPDATE문 활용하기
-- 표현법
-- UPDATE 테이블명 SET 컬럼명= 값[,컬럼명=값][WHERE 조건식]
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID,EMP_NAME,DEPT_CODE,JOB_CODE,SALARY,BONUS
FROM EMPLOYEE;
SELECT* FROM EMP_SALARY;
-- 정형돈의 급여를 300만원으로 수정하기
UPDATE EMP_SALARY SET SALARY=3000000 WHERE EMP_NAME='전형돈';
ROLLBACK; -- 다시 돌아가기 -- 주의해야할 점 WHERE절 안쓰면 월급이 모두 300만원으로 바뀜
-- 다수의 컬럼값 수정하기
UPDATE EMP_SALARY SET SALARY=200,BONUS=0.5 WHERE EMP_NAME='전형돈'; -- 전형돈 월급200원, 보너스0.5로 업데이트 하기
-- 이전값을 가지고 컬럼값 수정하기
-- 전체 사원의 급여를 100원 증가
UPDATE EMP_SALARY SET SALARY=SALARY+100;
UPDATE EMP_SALARY SET DEPT_CODE='D'||SUBSTR(EMP_ID,3,1);

--문제 풀이
-- 유씨성을 가진 사원의 급여를 50만원 올리고 보너스는 0.4로 수정하기
UPDATE EMP_SALARY SET SALARY=SALARY+500000,BONUS=0.4 WHERE SUBSTR(EMP_NAME,1,1)='유';

-- UPDATE문 SELECT문 이용하기
-- 방명수의 급여,보너스를 심봉선과 동일하게 수정하기
-- 심봉선의 급여를 가져와서 저장을 시켜주면 됨!
UPDATE EMP_SALARY 
--    SET SALARY=(SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='심봉선'),
--        BONUS=(SELECT BONUS FROM EMPLOYEE WHERE EMP_NAME='심봉선') -- 이렇게 두줄 써도되지만 아래 구문처럼도 씀
      SET(SALARY,BONUS)=(SELECT SALARY,BONUS FROM EMPLOYEE EMP_NAME='심봉선'); 
WHERE EMP_NAME='방명수';

-- MERGE : 두 테이블의 데이터를 합치는 명령어
-- 기준테이블에 다른 테이블의 값을 저장 -> 동일값은 수정(UPDATE), 동일하지 않은 값은 추가(INSERT)
-- 표현법
-- MERGE INTO 기준테이블 USING 다른테이블 ON 조건
-- WHEN MATHCED/NOT MATHCED THEN 실행할 DML구문(UPDATE,INSERT)
CREATE TABLE EMP_M1
AS SELECT*FROM EMPLOYEE;
CREATE TABLE EMP_M2
AS SELECT*FROM EMPLOYEE WHERE JOB_CODE='J4';

INSERT INTO EMP_M2 VALUES(999,'전승우','961028-1234567','JEON@JOEN.COM','01012341234','D3','J4','S1',30,0.5,NULL,SYSDATE,DEFAULT,DEFAULT);
UPDATE EMP_M2 SET BONUS=0.3,SALARY=20 WHERE EMP_NAME!='전승우';
--일치할 때는 합치고 어떤걸로 바꿀지 결정해야함 -> UPDATE SET
MERGE INTO EMPI_M1 USING EMP_M2 ON(EMP_M1,EMP_ID=EMP_M2,EMP_ID)
WHEN MATCHED THEN
 UPDATE SET 
  EMP_M1.BONUS=EMP_M2.BONUS,
  EMP_M1.SALARY=EMP_M2.SALARY
WHEN NOT MATCHED THEN 
  INSERT VALUES(EMP_M2.EMP_ID,EMP_M2.EMP_NAME,EMP_M2.EMP_NO,EMP_M2.EMAIL,
                 EMP_M2.PHONE,EMP_M2.DEPT_CODE,EMP_M2.JOB_CODE,EMP_M2.SAL_LEVEL,EMP_M2.BONUS,
                EMP_M2.MANAGER_ID,EMP_M2_HIRE_DATE,EMP_M2.ENT_DATE,EMP_M2.ENT_YN);
                
--DELETE문 활용하기
-- ROW를 삭제하는 명령어
-- DELETE FROM 테이블명[WHERE 조건식]
DELETE FROM EMP_M1; --전체를 삭제하고 싶을 때 
ROLLBACK;
DELETE FROM EMP_M1 WHERE JOB_CODE='J4'; --> 조건에 따라 삭제할 때

-- TRUNCATE
-- 전체 ROW를 삭제할 때 사용한다. 
TRUNCATE TABLE EMP_M1; -- 삭제했습니다가아닌 잘렸습니다로 출력됨(DELETE보다 속도가 더 빠름)
-- ROLLBACK 안됨(완료라고 뜨긴뜨지만 실행되지 않는다)


-- ---------------------------------------DDL(ALTER,DROP)
-- ALTER
-- 오라클에 정의되어있는 OBJECT 를 수정할 때 사용하는 명령어이다. 
-- DROP
-- 오라클에 정의되어있는 OBJECT 를 삭제할 때 사용하는 명령어이다. 

-- 테이블에 설정한 내용을 수정, 석제하기
-- ALTER OBJECT 명 명령(ADD MODIFY...)
-- 테이블 생성
CREATE TABLE TBL_USERALTER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20)
);
-- 생성된 TBL_USERALTER테이블에 컬럼을 추가하기
-- ALTER TABLE 테이블명 ADD(컬럼명 타입 [제약조건])
-- 문제풀이
-- USER_NANE이라는 문자열 컬럼 추가하기
ALTER TABLE TBL_USERALTER ADD(USER_NAME VARCHAR2(20));
-- 제약조건과 같이 컬럼 추가하기
ALTER TABLE TBL_USERALTER ADD(GENDER VARCHAR(5) CHECK(GENDER IN('M','F')));
-- 컬럼추가시 주의사항 ! NOT NULLL제약조건을 설정할때
INSERT INTO TBL_USERALTER VALUES(1,'ADMIN','1234','관리자','F');
INSERT INTO TBL_USERALTER VALUES(2,'USER01','1111','유저일','M');
-- NOT NULL 제약조건을 설정할때는 일반적으로 DEFAULT 값을 설정한다. 
-- 두개의 데이터를 삽입한 상태에서 컬럼을 넣으면 원래 있던 데이터의 새로운 컬럼값에는 NULL을 넣기 때문에 NOT NULL제약조건을 설정할 때 주의해야한다.이메일은 무조건 받아야하는 값으로 NOT NULL컬럼으로 EMAIL을 생성한다면 원래의 컬럼데이터값에 NULL이 자동생성이 되기때문에 오류가나고 들어가지 않음
ALTER TABLE TBL_USERALTER ADD(EMAIL VARCHAR2(100) NOT NULL); -- 테이블은 필수 열을 추가하기 위해 (NOT NULL) 비어 있어야 합니다 오류 발생
-- 해결방법 : DEFAULT 값을 설정해줘야함 
ALTER TABLE TBL_USERALTER ADD(EMAIL VARCHAR2(100) DEFAULT '미설정' NOT NULL); -- 기본값을'미설정'으로 설정해줬기때문에 삽입이 가능하게됨

-- 컬럼 수정하기 -> 자료형, 길이
-- 표현법
-- ALTER TABLE 테이블명 MODIFY 컬럼명 자료형
-- TBL_USERALTER에 있는 데이터를 CHAR로 바꾸기
-- 주의할 점 : 컬럼안에 있는 데이터의 타입이 바꾸려는 타입으로 바꾸는것이 가능한지 주의해야함 -> 이름값을 NUMBER로 바꿀 수 없음
DESC TBL_USERALTER;
ALTER TABLE TBL_USERALTER MODIFY GENDER CHAR(5);
-- 길이 바꾸기
ALTER TABLE TBL_USERALTER MODIFY USER_NAME VARCHAR2(100);

----- DROP
-- 컬럼 삭제하기
-- ALTER TABLE 테이블명 DROP COLUMN 컬럼명; 
-- TBL_USERALTER 에 EMAIL컬럼, NAME컬럼 지우기
ALTER TABLE TBL_USERALTER DROP COLUMN EMAIL;
ALTER TABLE TBL_USERALTER DROP COLUMN USER_NAME;

-- 제약조건 추가하기
-- ADD CONSTRAINT 사용
-- 표현법
-- ALTER TABLE테이블명 ADD CONSTRAINT 제약조건명 제약조건(컬럼명) -> 테이블레벨에서 작성한 방식
-- TBL_USERALTER테이블의 USER_ID에 UNIQE,NOT NULL제약조건을 추가하기 -- NOT NULL제약조건을 추가할때는 추가가 아니라 수정!
ALTER TABLE TBL_USERALTER ADD CONSTRAINT UQ_USERID UNIQUE(USER_ID);
ALTER TABLE TBL_USERALTER ADD CONSTRAINT UQ_USERID NOT NULL(USER_ID);

-- 제약조건 수정하기
-- MODIFY 컬럼명 CONSTRAINT
-- 표현법
-- ALTER TABLE 테이블명 MODIFY 컬럼명 CONSTRAINT 제약조건명 제약조건;
ALTER TABLE TBL_USERALTER MODIFY USER_ID CONSTRAINT NN_USERID NOT NULL;
INSERT INTO TBL_USERALTER VALUES(4,NULL,'2222','F');

-- 제약조건 삭제하기
-- DROP CONSTRAINT
-- 표현법
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명;
-- TBL_USERALTER테이블의 USERID의 UNIQUE제약조건 삭제하기
ALTER TABLE TBL_USERALTER DROP CONSTRAINT UQ_USERID;

-- 컬럼명, 제약조건명, 테이블명, 변경하기
-- 컬럼명 변경
-- RENAME COLUMN 사용
-- 표현법
-- ALTER TABLE 테이블명 RENAME COLUMN 이전 컬럼명 TO 바꿀컬럼명;
-- TBL_USERALTER테이블의 USER_IDFMF USERID로 변경하기
ALTER TABLE TBL_USERALTER RENAME COLUMN USER_ID TO USERID;

-- 제약조건 변경
-- RENAME CONSTRAINT 사용
-- 표현법
-- ALTER TABLE 테이블명 RENAME CONSTRAINT 이전 제약조건명 TO 바꿀제약조건명;
ALTER TABLE EMPLOYEE RENAME CONSTRAINT SYS_C007307 TO NN_EMPID;

-- 테이블명 변경하기
-- 표현법
-- ALTER TABLE  이전테이블명 RENAME TO 새로운 테이블명
ALTER TABLE TBL_USERALTER RENAME TO USERALTER;

--DROP 테이블을 삭제
-- 표현법
-- DROP TABLE 테이블명
DROP TABLE USERALTER;
DROP TABLE FK_BOARD; --참조되는 키가 있기때문에 삭제 되지 않음(참조관계에서 부모테이블은 함부로 삭제할 수 없다
DROP TABLE FK_BOARD CASCADE CONSTRAINTS; --> 관계 다 끊어버리고 지워라

--DCL : DATA CONTROL LANGUAGE -> 사용자에 대한 권한설정 내용 --------------------------------------------------------
-- 사용자계정에 권한을 부여, 회수하는 명령어
-- GRANT : 권한이나 ROLE 부여하는 명령어
-- 표현법 
-- GRANT 권한명/ROLE명.권한명/ROLE명, 권한명 ON 테이블 사용자계정명
-- REVOKE : 부여된 권한/ ROLE을 회수하는 명령어
-- 표현법
-- REVOKE 권한명/ROLE형,권한명 ON 테이블명 FROM 사용자계정

-- 권한 : SELECT, INSERT, UPDATE, DELETE, CREATE VIEW....(권한을 주는 계정은 무조건 관리자 계정)
-- ROLE(역할) : 다수의 권한을 특정이름으로 묶어서 표현

-- 관리자계정은 어디든 다 접근할 수 있음
SELECT* FROM BS.EMPLOYEE; -- 앞에 BS.을 붙여서 조회해야함
SELECT* FROM MJ.TEST1;
INSERT INTO MJ.TEST1 VALUES('TEST',19);

--QWER/QWER : 계정생성
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER QWER IDENTIFIED BY QWER DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
SELECT* FROM DBA_USERS;
-- CONNECT, RESOURCE -> ROLE
SELECT*FROM DBA_SYS_PRIVS WHERE GRANTEE='RESOURSE';
SELECT*FROM DBA_SYS_PRIVS WHERE GRANTEE='CONNECT';

GRANT CONNECT,RESOURCE TO QWER; -- 처음 계정생성할때 해줘야한다. 

--QWER 접속
SELECT* FROM TAB;
SELECT* FROM BS.EMPLOYEE; -- 조회 안됨

--관리자계정
GRANT SELECT ON BS.EMPLOYEE TO QWER; 

-- QWER에게 관리자가 BS.EMPLOYEE의 권한을 부여함
SELECT* FROM BS.EMPLOYEE; --조회 OK
-- 만약 수정이나 추가 권한을 부여해야함
GRANT INSERT BS.EMPLOYEE TO QWER; --> 추가 입력 권한부여

-- 권한 회수(관리자 계정에서)
-- QWER에게 줬던 권한을 다시 회수함
REVOKE INSERT ON BS.EMPLOYEE FROM QWER;

-- ROLE 생성하기
CREATE ROLE MYROLE;
GRANT CREATE TABLE, CREATE VIEW TO MYROLE;
SELECT*FROM DBA_SYS_PRIVS WHERE GRANTEE='MYROLE'; --> MYROLE을 관리할 수 있는 권한을 줌

-- TCL트렌젝션을 제어하는 명령어
-- COMMIT,ROLLBACK
-- 트렌젝션 : 하나의 작업 단위-> 프로그램으로 봤을 때 한개의 서비스를 말함 DATA(ROW)를 수정하는 INSERT,UPDATE,DELETE세개를 묶어서 작업단위로 관리가 가능하다.
INSERT INTO BS.TEMP_DEPT VALUES('D9','TRAN','90');
DELETE FROM BS.TMEP_DEPT WHERE DEPT_ID='D1';
SELECT*FROM BS.TEMP_DEPT;
--> 이 세션에서는 보이지만 다른 세션에서는 보이지 않음
COMMIT; --> 다른 세션에서도 보임

















