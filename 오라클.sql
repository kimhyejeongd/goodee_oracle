select*from dba_users;
SELECT*FROM TAB;
-- ������ ���̽� ����ϱ�
-- ����� ������ �����ڰ������� ��������
-- ������ ������ �����ؼ� ������ �����ϴ� ��ɾ� ���
-- �������� ��ɾ�:CREATE USER ����ڰ����� IDENTIFIED BY ��й�ȣ DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

-- ����ڰ������� ��ҹ��� ������ ���� -> �빮�ڷ� ó��
-- ��й�ȣ�� ��ҹ��� ������ - ����!

-- ����ڰ����� C##�� �������ʰ� �ϱ� 
-- SESSION�� ���� ������ �����������
-- ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER MJ IDENTIFIED BY MJ DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

SELECT*FROM DBA_USERS;

-- ����ڰ����� ������ �Ŀ��� ������ ������ �ο�������Ѵ�.
-- �⺻������ DB�� ������ �� �ִ� ����, �Ҵ�Ǿ��ִ� DB������ ����� ���� �ο�
-- DB���ӱ��� : CONNECT(ROLE/��Ī)
-- ����ұ��� : RESOURCE(ROLE/��Ī)

-- ������ �������� ������ �ο��ϴ� ��ɾ� 
-- GRANT ����/ROLE�̸� TO ����ڸ�
GRANT CONNECT TO MJ;
GRANT RESOURCE TO MJ;

GRANT CONNECT,RESOURCE TO MJ;

-- ����ڰ��� �����ϱ�
-- ������ BS ��й�ȣ BS ����, �������Ѻο�
-- ������ BS�������� �����ϱ�
CREATE USER BS IDENTIFIED BY BS DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
GRANT CONNECT,RESOURCE TO BS;

SELECT*FROM DBA_USERS;

-- BS�������� ����
-- ������ ���̺� ���� Ȯ���غ���
SELECT * FROM TAB;
-- �� ���̺��� ������ ����Ȯ���ϱ�
-- EMPLOYEE : ����� ���� ������ �����ϴ� ���̺�
SELECT*FROM EMPLOYEE;
-- �׸� ���� ����Ȯ���ϱ�
DESC EMPLOYEE; 
-- DEPRATMENT : �μ��� ���� ������ �����ϴ� ���̺�
SELECT*FROM DEPARTMENT;
DESC DEPARTMENT;
-- JOB : ��å�� ���� ������ �����ϴ� ���̺�
SELECT*FROM JOB;
DESC JOB;
-- LOCATIONAL : �μ������� ���� ������ �����ϴ� ���̺�
SELECT*FROM LOCATION;
DESC LOCATION;
-- NATIONAL : �μ������� ������ ���� ������ �����ϴ� ���̺�
SELECT*FROM NATIONAL;
DESC NATIONAL;
-- SAL_GRADE : �޿���޿� ���� ������ �����ϴ� ���̺�
SELECT*FROM SAL_GRADE;
DESC SAL_GRADE;

-- SELECT Ȱ���ϱ�
-- �⺻����
-- SELECT �÷���[,�÷���,�÷���,....]OR*
-- FROM ���̺��;

-- EMPLOYEE���̺� �ִ� ��ü COLUMN�� ������ ��ȸ�ϱ�
SELECT*FROM EMPLOYEE;
-- EMPLOYEE���̺� �ִ� �̸�, �ֹι�ȣ, �̸���, �޿�, ���ʽ� ��ȸ�ϱ�

SELECT EMP_NAME,EMP_NO,EMAIL.SALARY,BOUNUS
FROM EMPLOYEE;
SELECT EMP_ID FROM EMPLOYEE;

-- DEARTMENT �� ��� �÷������� ����ϱ�
SELECT*FROM DEPARTMENT;

-- SELECT���� �÷��ۼ��ο��� ��������� �ۼ��ϰ� �� ����� ����� �� �ִ�.

-- ,+,-,*,/
SELECT EMP_NAME,10+10
FROM EMPLOYEE;

-- ����Ŭ�� �����ϴ� ������ �׽�Ʈ�� ���̺� : DUAL
SELECT 10+10,20*3,10/3
FROM DUAL;

-- ���ͷ�
-- ���� : 10 20, �Ǽ� : 180.5 3.14 ,���ڿ� : '���ڿ�', ��¥ : 'YY/MM/DD'

-- ��������� ���ͷ��� �÷��� ���� ����� �� �ִ�.
SELECT EMP_NAME,SALARY,SALARY+100
FROM EMPLOYEE;

-- �÷��� �÷� ��������ϱ�
SELECT EMP_NAME, SALARY, SALARY+SALARY,SALARY+1000.15
FROM EMPLOYEE;

-- ����� �̸�, �޿�, ���ʽ��ݾ� ����ϱ�
SELECT EMP_NAME, SALARY, NVL(BONUS,0),SALARY*NVL(BONUS,0)
FROM EMPLOYEE;

-- ���ڿ� ���ͷ� ����ϱ�
SELECT '������ ����Ŭ �ʹ� ����~'
FROM DUAL;
-- ���ڿ�+���ڿ� -> ���ڿ� ���ڿ� ���ڿ� ���տ���XXXX
-- ORACLE ���� + ������ ������ ��ġ���� !
SELECT '��ȣ~'+'�̰͵� �غ���'
FROM EMPLOYEE;
SELECT 100+'����'
FORM DUAL;

-- ������̺��� �����, �μ��ڵ�, ����, ������ ��ȸ�ϱ�
-- ���ʽ��� ���� ����� ������ �� ����ϰ� �غ���!
SELECT EMP_NAME,DEPT_CODE,SALARY,(SALARY+(SALARY*NVL(BONUS,0)))*12 AS TOTALSAL
FROM EMPLOYEE;

-- �÷��� �ۼ��� �� �ִ� ���� ���̺� �����ϴ� �÷����̴�
SELECT EMP_NAME
FROM EMPLOYEE;
-- DEPARTMETN���� EMP_NAME�� ���� ������ ��ȸ �Ұ����ϴ�

-- RESULTSEST���� ��ȸ�� �÷��� �̸��� �����ϱ� -> ��Ī
-- �÷��� AS ����Ҹ�Ī �Ǵ� �÷��� ����Ҹ�Ī

SELECT EMP_NAME AS �̸�,SALARY ����
FROM EMPLOYEE;

-- ��Ī�� ����, Ư����ȣ�� �����ұ�? XXX ���⵵ �ȵ� / ����Ϸ��� ��Ī�� ""�����ָ� �����ϴ�.
SELECT SALARY AS "��^^��",EMP_NAME"�� ��"
FROM EMPLOYEE;

-- DISTINCT����� ����ϱ�
-- �ߺ��Ǵ� ROW�� �����ϰ� ������ִ� ���
-- SELECT DISTINCT �÷���[,�÷���] FROM ���̺��
-- DISTINCT�� �÷��ۼ��� �Ǿտ��� �ۼ�����
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

--SELECT EMP_ID,DISTINCT DEPT_CODE
--FROM EMPLOYEE;

-- DISTINCT�ڿ� �÷��� ������ �ۼ��ϸ� �Ѱ� �׷����� ���� ��ġ���θ� Ȯ���Ѵ�.
SELECT DISTINCT DEPT_CODE,JOB_CODE
FROM EMPLOYEE;

-- ���ϴ� ROW�� ��ȸ�ϱ�
-- WHERE���� �̿��Ѵ�. -> DB���� ����ϴ� ���ǹ�
-- SELECT �÷���,...
-- FROM ���̺��
-- WHERE ���ǽ�

-- �μ��� D5�� ����� ��ü ������ ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- ������ 300���� �̻��� ����� �̸�, �̸���. �޿� ��ȸ�ϱ�
SELECT EMP_NAME,EMAIL,SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

-- ��� �� ��å�� J2�� �ƴ� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE!='J2';

-- �����͸� ���Ҷ��� ��ҹ��ڸ� ������.
SELECT *
FROM EMPLOYEE
SHERE JOB_CODE='j2';
-- J2�� �����ؾ� ��.

-- ��¥�� ���� ��Һ��ϱ�
-- ���ڿ��� ��¥������ �ۼ��ؼ� �񱳸� ��.
-- 00/01/01 ���� �Ի��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE>'00/01/01';

-- ������ �������� ��� �������ڸ� �̿�����
-- AND / OR  �� ����� �� �ִ�.
-- ��� �� �μ��� D5�̰� �޿��� 300���� �̻��� ����� �̸�, �μ��ڵ� ,�޿��� ��ȸ�ϱ�
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY>=3000000;

-- ��� �� ��å�� J6�̰ų� J7�� ����� �̸�, �̸���, �޿� ��å�ڵ带 ��ȸ�ϱ�
SELECT EMP_NAME, EMAIL,SALARY,JOB_CODE
FROM EMPLOYEE
WHERE JOB_CODE='J6' OR JOB_CODE='J7';

-- Ư�������� �ִ� ���� ��ȸ�ϱ�
-- ����� �޿��� 200 ���� �̻� 300���� ���� �޴� ��� ��ȸ�ϱ�
-- �����, �޿�, ���ʽ�, �Ի���
SELECT EMP_NAME,SALARY,BONUS,HIRE_DATE
FROM EMPLOYEE
WHERE SALARY>=2000000 AND SALARY<=3000000;

--����� �Ի����� 00�� 01�� 01�� ���� 02�� 12�� 31�ϱ����� ����� �����, �޿�, �μ��ڵ�, �Ի��� ��ȸ�ϱ�
SELECT EMP_NAME,SALARY,DEPT_CODE,HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE>= '00/01/01' AND HIRE_DATE<='02/12/31';

-- �������� ��ȸ�Ҷ� ������ȸ�����ڸ� �̿��غ���
-- BETWEEN AND
-- �÷��� BETWEEN ��(����) AND ��2(��)
SELECT EMP_NAME,SALARY,BONUS,HIRE_DATE
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 3000000;

SELECT EMP_NAME,SALARY,DEPT_CODE,HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '00/01/01' AND '02/12/31';

-- LIKE������ �̿��ϱ�
-- ���ڿ��� ���� �������� �˻��ϴ� ������
-- ������ ǥ���ϴ� ǥ������ ����
-- _: �ƹ����ڰ� 1���� ��Ÿ���� ǥ����
-- '_��' : ������ ������ �α���
-- '_��_ȣ' : �ױ����ε� �ι�°�� �� �������� ȣ�� ���� ����
-- '___' : ������
-- % : �ƹ����ڰ� 0���̻��� ��Ÿ���� ǥ����
-- '%��' : ������ ������ ���� �� (�տ� ���ڳ� ������ �� ��� ����) ��, �Ѱ�, �θ���, ȣ�Pȣȣȣȣ���ϰ�  ��� ������
--         ������ȣȣȣ������������ �ȵ� -> ������ �ȳ�����
-- '%��%' : ���� �ִ� ��� ����

-- '_��%' : ���� ������ �ּ� �α���
--  �÷��� LIKE '����'
-- ����� �������� ���� ����� �̸�, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';

-- ����� �̸��Ͽ� yo�� ���Ե� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%yo%';
-- ����� �̸��Ͽ� j�� ���Եǰ� �������� ���� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%j%' AND EMP_NAME LIKE '��%';
-- ����� �������� �ƴ� ����� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE'��%;
--