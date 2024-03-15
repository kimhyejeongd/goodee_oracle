select*from dba_users;
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