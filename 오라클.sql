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
WHERE EMP_NAME NOT LIKE'유%;
--