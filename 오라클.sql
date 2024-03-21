`select*from dba_users;
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
WHERE EMP_NAME NOT LIKE '��%';

-- �̸��� �ּҿ� _�ձ��ڰ�3������ ����� ��ȸ�ϱ�
-- �����, �̸���
SELECT EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___\_%' ESCAPE'\';
--�̽������� ���ڿ� ó���ϱ�  \ó��

-- ���ڿ��� ���ս����ִ� ������
-- || : ���ڿ� ���տ�����
SELECT '������ ����'||'�ݿ����̿���! ������'
FROM DUAL;
SELECT EMP_NAME||'�� �޿�'||SALARY||'���ʽ�'||BONUS MSG
FROM EMPLOYEE;

-- NULL�� ��ȸ�ϱ�
-- NULL �ƹ��ǹ� ���� ��, ���� ǥ���� �� ����� �� ����
-- ����Ұ�����.->��� , �񱳿���
-- NULL�� ã�� �� �ִ� �����ڸ� ����
-- IS  NULL/IS NOT NULL
-- ���ʽ��� �����ʴ� ��� ��ȸ�ϱ�
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

-- ���ʽ��� �޴� ��� �����, �޿�, ���ʽ� ��ȸ�ϱ�
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;

-- �μ��� �������� ���� ��� ��ȸ�ϱ� �����, �μ��ڵ�
SELECT EMP_NAME, NBL(DEPT_CODE '����')AS DEPTCODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL;

-- ���߰��� ���� ����� ������
-- OR ����Ǵ� ������ �����ϰ� ó���� �� �ִ�.
-- IN / NOT IN
-- �÷��� IN/ NOT IN(��,��,��...);
-- ����� �μ��ڵ尡 D5,D6,D8�� ����� ��ȸ�ϱ� �̸�,�μ��ڵ�
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D8');

-- ���߿�~~~ ����������(������)�� ������� �� ���
SELECT EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IN(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='�ѹ���' OR DEPT_TITLE LIKE'�ؿ�%');

-- �������� �켱����
-- ��å�� J7�̰ų� J2�� ��� �� ������ 280���� �̻��� ��� ��ȸ�ϱ�
-- �����, ��å�ڵ�, �޿�
SELECT EMP_NAME,JOB_CODE,SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN('J7','J2') AND SALARY>=2800000;

-- ����Ŭ���� �����ϴ� �Լ��� ���� �˾ƺ���
-- ������ �Լ� : ���̺��� ��� �࿡ ���� ����� ��ȯ�ϴ� �Լ� 
-- �ڷ���(����,����,��¥)�� ���� �����ϴ� �Լ����� ����, �����Լ�(���ǿ� ���� ������ ���)
-- �׷� �Լ� : ���̺�(�׷캰) �Ѱ��� ����� ��ȯ�ϴ� �Լ� -> ������ ������ ������ �� ���
-- �հ�,���,�ִ�,�ּ�,����

-- ������ �Լ� Ȱ���ϱ�
-- �����ġ
-- SELECT���� �÷���ġ
-- WHERE �� �������� ���
-- INSERT,UDPDATE,DELETE����� ����

-- ���ڿ��� ó���ϴ� �Լ�

-- ���ڿ��� ���̴� ��ȯ�ϴ� �Լ� : LENGTH('���ڿ�' �Ǵ� �÷���) -> ��ȯ�� INT
SELECT LENGTH('������ �ݿ���')
FROM DUAL;

SELECT EMP_NAME,LENGTH(EMP_NAME) AS EMP_NAME_LENGTH
FROM EMPLOYEE;

-- ��� �� �̸����� ���̰� 15���� �̻��� ����� ��ȸ�ϱ� �̸�, �̸���, �̸��ϱ���
SELECT EMP_NAME,EMAIL,LENGTH(EMAIL) AS EMAIL_LENGTH
FROM EMPLOYEE
WHERE LENGTH(EMAIL)>= 15;                                                                                                 

-- ���ڿ��� ����Ʈ���� ������ִ� �Լ� : LENTGHB('���ڿ�'/�÷���)
-- �ѱ� ���� BYTE�� �ѱ��ڴ� 3BYTE*EXPRESS����������
SELECT LENGTHB('ABCDE'),LENGTHB('�ƾ����')
FROM DUAL;

-- INSTR : JABA INDEXOF�޼ҵ�� ������ ���
-- INSTR('���ڿ�'/�÷���, ã�� ����[,������ġ, ã�� Ƚ��]
-- ����Ŭ������ ��ȣ�� 1���� ������
SELECT INSTR('GE��ī����','GD'),INSTR('GD��ī����','��'),INSTR('GD��ī����','BS')
FROM DUAL;

--����� �̸��Ͽ� J��ġ ã��
SELECT EMAAIL ,INSTR(EMAIL,'j')
fROM EMPLOYEE
WHERE INSTR(EMAIL,'j')!=0;

SELECT INSTR('GD ��ī���� GD������ GD���ǻ� GD7DJȭ����!'GD'),
        INSTR('GD ��ī���� GD������ GD���ǻ� GDJ79 ȭ����!'GD',3),
            INSTR('GD ��ī���� GD������ GD���ǻ� GDJ79 ȭ����!'GD',3,-10),
            INSTR('GD ��ī���� GD������ GD���ǻ� GDJ79 ȭ����!'GD',1,4)
            FROM DUAL;
            
--LPAD/RPAD : ���ڿ��� ���̰� ������ ���̸�ŭ ����������� ��� Ư�������� ä��� �Լ�
-- LPAD/RPAD( ���ڿ�/�÷���,�ִ����,ä�﹮��) 
--���⼭�� �ѱ� �ѱ��ڿ� 2����Ʈ��
SELECT LPAD ('������',10,'*'),RPAD('������','10','#'),RPAD('������',6,'%')
FROM DUAL;

-- �̸����� ����Ҷ� 16���ڰ� �ȵǴ� �̸����� ������ �ڸ���*�� ǥ���ϱ�
SELECT EMAIL,RPAD(EMAIL,16,'*')
FROM EMPLOYEE;

-- LTRIM / RTRIM : ����, �������ڸ� �������ִ� �Լ�
-- LTRIM / RTRIM(���ڿ�/�÷���/Ư������)
SELECT '          ����',LTRIM('          ����')
FROM DUAL;
--���ؾտ� ������ �� ���ư��� ��µ�

SELECT '2222222222����',LTRIM('2222222222����','2')
FROM DUAL;
-- ���� 2�� �� �������� ��µȴ�. 

-- TRIM : ���ʿ� �ִ� ���� �����ϴ� �Լ�, �⺻ : ����, �����ϸ� �������� ����(�Ѱ����ڸ� ����)
-- �ɼ��� �����ؼ� ����, ������ ������ ������ �� ����
-- TRIM(���ڿ�/�÷���)
-- TRIM(LEADING/TRAILING/BOTH ã�� ���� FROM ���ڿ�/�÷�)

SELECT '        �ݿ���          ',TRIM('        �ݿ���          '), --�翷 ������� ���� ��µȴ�. 
        'VVVVVVVVVV�±�VVVVVVVVVV',
        TRIM(LEADING 'V' FROM 'VVVVVVVVVV�±�VVVVVVVVVV'),  -- ���� V ���� ��µȴ�.
        TRIM(TRAILING 'V' FROM 'VVVVVVVVVV�±�VVVVVVVVVV'), -- ������ V ���� ��µȴ�
        TRIM(BOTH 'V' FROM 'VVVVVVVVVV�±�VVVVVVVVVV') -- �翷 V���� ��µȴ�.
FROM DUAL;

--12345684654325158�ݿ���ȭ����3574685435436835453
SELECT RTRIM(LTRIM('12345684654325158�ݿ���ȭ����3574685435436835453','1234567890'),'0123456789' AS OKAY) --����
FROM DUAL;

--SUBSTR : ���ڿ��� �߶󳻴� ��� -> JAVA SUBSTRING �޼ҵ�� ����
--SUBSTR : (���ڿ�/�÷���,�����ε���[,����])
SELECT SUBSTR('�ݿ����� �ʹ��ʹ� �ູ�� �ָ��� ������ �ð��� ���ݾ� ������',6,8), --6���������� 8ĭ�� ��µ� �ʹ��ʹ� �ູ�� ���
       SUBSTR('�ݿ����� �ʹ��ʹ� �ູ�� �ָ��� ������ �ð��� ���ݾ� ������',INSTR('�ݿ����� �ʹ��ʹ� �ູ�� �ָ��� ������ �ð��� ���ݾ� ������','��'),3) --�ູ�� ���
FROM DUAL;

SELECT SUBSTR('�ݿ����� �ʹ��ʹ� �ູ�� �ָ��� ������ �ð��� ���ݾ� ������',-3) -- �ڿ������� 3�� �� ��µ� ������ ���
FROM DUAL;

-- ����� �̸��Ͽ��� ���̵� ����ϱ�
SELECT EMAIL,SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1)
FROM EMPLOYEE;

-- �̸����� ���̵� 7�����̻��� ����� ��ȸ�ϱ�
-- �����, �̸��� ���
SELECT EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE LENGTH(SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1))>=7;

-- ��� �� ������� ����ϱ�
SELECT *
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1)='2';

-- UPPER/LOWER : �����ڸ� �빮�� �ҹ��ڷ� �����ϴ� ���
-- INITCAP : ���⿡ ������ ù���ڸ� �빮�ڷ� �������ִ� ���
SELECT 'Welcome to oRACLE world',
        UPPER('Welcome to oRACLE world'),
        LOWER('Welcome to oRACLE world'),
        INITCAP('Welcome to oRACLE world') --�ܾ� ù���ڸ� �빮�ڷ� �ٲ㼭 ��µ�
FROM DUAL; 

SELECT UPPER(EMAIL),LOWER(EMAIL)
FROM EMPLOYEE;

-- CONCAT : ���ڿ��� �������ִ� ���
-- ||�����ڿ� ������ ���
SELECT '��'||'����' ,CONCAT('��','����') --������
FROM DUAL;

-- REPLACE : ���ڿ��� �������ִ� �Լ�
-- REPLACE(���ڿ�/�÷���,ã������,��ü����)
SELECT '�ڵ��� �ʹ� �����',REPLACE('�ڵ��� �ʹ� �����','�����','����') --�ڵ��� �ʹ� ����� / �ڵ��� �ʹ� ���� 
FROM DUAL;
-- EMAIL �ּҰ� BS -> GD�� ����� GD�� �����ؼ� ����ϱ�
-- �����, �̸��� �μ��ڵ�
SELECT EMP_NAME,REPLACE(EMAIL,'BS','GD'),DEPT_CODE
FROM EMPLOYEE;

-- REVERSE ���ڿ��� �Ųٷ� ������ִ� ���
SELECT EMAIL,REVERSE(EMAIL),REVERSE(EMAIL),REVERSE(REVERSE('������� ����'))
FROM EMPLOYEE;

-- ����ó���Լ�
-- ABS : ���밪 ��ȣ���°�
SELECT ABS(10),ABS(-10) -- �Ѵ� 10 ��µ�
FROM DUAL;

-- MOD : �������� ����ϴ� ��� JAVA%�����ڿ� ����
SELECT MOD(3,2) --1
FROM DUAL;

SELECT SALARY,MOD(SALARY,3)
FROM EMPLOYEE;

-- �Ҽ���ó���Լ�
-- ROUND : �Ҽ����� �ݿø��ϴ� ���
-- ROUND(����/�÷���[,�ڸ���]) �÷����� �ݵ�� ���ڿ�����
SELECT 125.567,ROUND(125.567),--126
       ROUND(125.567,2) --125.57
FROM DUAL;

-- FLLOR : �Ҽ����� ����
SELECT 125.567,FLOOR(125.567) --125
FROM DUAL;

-- TRUNC : �Ҽ�������, �ڸ����� ������ �� ����
SELECT 125.567,TRUNC(125.567,2) --125.56
FROM DUAL;

-- CEIL : �Ҽ��� ������ �ø�
SELECT 125.567,CEIL(125.167) --126
FROM DUAL;

-- ����Ŭ���� �������� ����ϱ�
-- DBMS_RANDOM,VALUE()�Լ��� �̿� 
SELECT DBMS_RANDOM.VALUE(),FLOOR(DBMS_RANDOM.VALUE()*10), -- 0~1 �Ǽ��� �������� ��µ�/������ ������ ���
        FLOOR(DBMS_RANDOM.VALUE(1,11)) --1����11������ ������ ��µ�
FROM DUAL;

-- ���� �������� ����ϱ�
-- DBMS_RANDOM.STRING()
SELECT DBMS_RANDOM.STRING('X',5), --5������ ���ڿ� �����ڰ� �������� ��µ�
        DBMS_RANDOM.STRING('P',5), -- 5������ Ư����ȣ�� ������ �����ڿ� ���ڰ� ��µ�
        DBMS_RANDOM.STRING('U',5) -- 5������ �빮�ڰ� �������� ��µ�
        DBMS_RANDOM.STRING('L',5) -- 5������ �ҹ��ڰ� �������� ��µ�
FROM DUAL;

-- ��¥ó���Լ�
-- ����Ŭ���� �⺻��¥ ����ϴ� ���
-- SYSDATE ->  �ý��ۻ��� ���� ��, ��, ���� ����� �� -> JAVA javs.sql.Date ����
-- SYSTIMESTAMP -> ���� ��, ��, ��, ��, ��, �� -> JAVA java.sql.Timestamp ����

SELECT SYSDATE,SYSTIMESTAMP
FROM DUAL; 

-- ��¥���� ���� �������ó��
-- +,- ���� -> ��¥�� �ϼ��� ����, ����
SELECT SYSDATE,SYSDATE+1,SYSDATE-1 -- ���� ��¥ / ���� ��¥���� �Ϸ� ���� / ���� ��¥���� �Ϸ� ���ҵ� ��¥ ���
FROM DUAL;

SELECT EMP_NAME,HIRE_DATE,HIRE_DATE+10
FROM EMPLOYEE;

-- NEXT_DAY : �Ű������� ���޹��� ������ ���� ����� ��¥�� ���
SELECT NEXT_DAY(SYSDATE,'��') --������ ���� ����� ������ ��¥�� ��� ���� 3.15 ���̴ϱ� 2024.3.16�� ��µ�
FROM DUAL;
-- �ѱ��� �ν��ϴ� ���� : LOCALE���� ������ ������ �´� �� ����ϱ� ������
SELECT*FROM V$NLS_PARAMETERS; -- ����Ŭ�� �⺻������ �������ִ� �����鿡 �� KOREAN���� �����Ǿ�����
-- ���� ���� �Ǿ��ִ� ���� �ٲٸ� 
ALTER SESSION SET NLS_LANGUAGE='AMERICAN'; -- �ٲٸ� '��','�����' ���� ��� ��� �Ұ���
ALTER SESSION SET NLS_LANGUAGE='KOREAN'; -- �ٽ� KOREA�� �����ϱ�

-- LAST_DAY : �� ���� ������ �� ���
SELECT LAST_DAY(SYSDATE)  --24/03/31
FROM DUAL;

-- ADD_MONTH : �������� ���ϴ� ���
SELECT SYSDATE,ADD_MONTHS(SYSDATE,5)  --2024/08/15
FROM DUAL;

SELECT ADD_MONTHS(HIRE_DATE,5) -- �Ի��Ͽ��� 5������ �����͵����
FROM EMPLOYEE;

-- MONTHS_BETWEEN : �� ��¥ ������ �������� �����ִ� �Լ�
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE,'93/11/09')),FLOOR(MONTHS_BETWEEN(SYSDATE,'01/08/10'))  --03/11/09 ���� ���ݱ����� ������ ���(�Ҽ��� ����)/ 01/08/10 ���� ���ݱ����� ���� �� ��� (�Ҽ��� ����)
FROM DUAL;

-- ������� �������� ��ȸ�ϱ�
-- �����, �μ��ڵ�, �Ի���, �Ի簳��
SELECT EMP_NAME,DEPT_CODE,HIRE_DATE,FLOOR(MONTHS_BETWEEN(SYSDATE,HIRE_DATE)) AS �Ի簳��
FROM EMPLOYEE;

-- ���úη� ���ش��� ����� �������ϴ�. �������Ⱓ 1�� 6�����̰� �׷����� ���ش��� �������� ���ϰ� ���������� �Դ� «��(�Ϸ翡 3��)�� ���� ���ϱ�.
SELECT ADD_MONTHS(SYSDATE,18) AS ���ش������� ,ADD_MONTHS(SYSDATE,18)-SYSDATE AS �����ϼ�,(ADD_MONTHS(SYSDATE,18)-SYSDATE)*3 AS «���
FROM DUAL;


-- EXTRACT : ��¥�� ��,��,���� ���� ����� �� �ִ� ���
-- EXTRACT(YEAR/MONTH/DAY FROM ��¥)
-- ���� ��¥�� �� �� �� �� �÷����� ����ϱ�
SELECT 
    EXTRACT(YEAR FROM SYSDATE)AS YEAR, --���� ���
    EXTRACT(MONTH FROM SYSDATE)AS MONTH, -- �� ���
    EXTRACT(DAY FROM SYSDATE)AS DAY --�� ���
FROM DUAL;

-- ��� �� 12���� �Ի��� ����� ��ȸ�ϱ�
-- �����, �Ի���
SELECT EMP_NAME,HIRE_DATE
FROM EMPLOYEE
WHERE EXTRACT(MONTH FROM HIRE_DATE)=12; 

SELECT EMP_NAME,HIRE_DATE
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE)=2001; -- 2001�⵵�� �Ի��� ����� �̸��� �Ի��� ���

-- ����ȯ �Լ� -> ����Ŭ���� �ڵ�����ȯ�� �� �۵���. �ڵ����� �Ѱ��� Ÿ�Կ� ���缭 ������ ���ִ� ����� ���߰� ���� ������ �ʿ信 ���� ��������ȯ�� �� �� ����ϴ� �Լ��� ����
-- �ڷ���
-- ���� : CHAR, VARCHAR2, NVARCHAR2 -> ���ڿ��� ����
-- ���� : NUMBER -> ����, �Ǽ��� ��� ���� 
-- ��¥ : DATE, TIMESTAMP
-- BLOB, CLOB, LONG

-- TO_CHAR : ����, ��¥���� ���������� ��ȯ���ִ� �Լ�
-- Ư�����ڿ� ���Ͽ� ���缭 ��������
-- ������ ǥ���ϴ� ��ȣ�� ����

-- ���� -> ���ڷ� ���� ����
-- 0 : ��ȯ���� �ڸ����� ������ �ڸ����� ��ġ�������� �� ���� ���� �ڸ��� 0�� ǥ�� 
-- 9 : ��ȯ����� �ڸ����� ������ �ڸ����� ��ġ�������� �� ���� ���� �ڸ��� ����
-- L : ȭ������� ǥ��(*LOCALE�� �������� ����)

-- ����, ���ڿ��� ��ȯ�ϱ� 
SELECT 1234567,TO_CHAR(1234567,'000,000,000'), --1234567/001,234,567
                TO_CHAR(1234567,'999,999,999'), --1,234,567
                TO_CHAR(1234567,'L999,999,999') --\1,234,567
FROM DUAL;
-- �Ҽ����� ���� ó��
SELECT 180.5,TO_CHAR(180.5,'000,000,000'),TO_CHAR(180.5,'000,000,000'),
    TO_CHAR(180.5,'999,999.000') --000,000,181/000,000,181/180.500
FROM DUAL;

-- ��¥�� ���ڿ��� �����ϱ�
-- Y/R ��,M ��,D ��, H ��, MI �� SS ��
SELECT SYSDATE,
    TO_CHAR(SYSDATE,'YYYY.MM.DD'), -- 2024.03.15
    TO_CHAR(SYSDATE,'YY.MM.DD'), -- 24.03.15
    TO_CHAR(SYSDATE,'YY"��"MM"��"DD"��"HH24"��"MI"��"SS"��"') -- 24��03��15��15��17��12�� 
FROM DUAL;

-- ����� �޿��� ȭ������� ǥ���Ͽ� �������� ,�� �����ϰ� �Ի����� -�� �����ؼ� ����� ����ϱ�
-- ����� , �޿�, �Ի���
SELECT EMP_NAME,TO_CHAR(SALARY,'L999,999,999'),TO_CHAR(HIRE_DATE,'YY-MM-DD')
FROM EMPLOYEE;

-- ���������� �����ϱ�
-- ���ڸ� ���ڷ� ������ �� �ִ�.
-- ���������� ���ڿ��� ���ڷ� �����ؼ� ����ó���� �� �� ���
SELECT 1000+1000, 1000+TO_NUMBER('1,000','999,999')-- 2000/2000
FROM DUAL;

-- ��¥ ����ȯ�ϱ� 
-- ���ڸ� ��¥�� ����
-- ���ڸ� ��¥�� ����
SELECT TO_DATE('240315','YYMMDD'),TO_DATE('24-03-15','YY-MM-DD'), --24/03/15
    TO_DATE(240213,'YYMMDD'),TO_DATE(TO_CHAR(000614,'000000'),'YYMMDD') -- > 614�� �����⋚���� ���̰� �����ϴٰ�߱⶧���� CHAR�� �ٲ㼭 ����ؾ���
FROM DUAL;

-- NULL ó�� ��ü�Լ�
-- NVL(�÷���,��ü��) : �÷����� NULL�� ��� ��ü������ ��ü�ؼ� ���
-- NVL2(�÷���,NULL�Ͼƴ� �� ����Ұ�,NULL�� �� ����� ��)
SELECT EMP_NAME,SALARY,BONUS,DEPT_CODE,
        NVL(BONUS,0),NVL2(BONUS,'�ִ�','����'),NVL2(DEPT_CODE,'������','����')
FROM EMPLOYEE;

-- �÷��� ���� ���� ����ϴ� ������ �����ϴ� �Լ�
-- 1.DECODE SWITCH���� ��Ÿ��
-- DECODE(�÷���,'����','����� ��','����2',��°�2,...)
-- ����� ��å�� ����ϱ�
SELECT*FROM EMPLOYEE;
SELECT*FROM JOB;
SELECT*EMP_NAME,
    DECODE(JOB_CODE,'J1','��ǥ','J2','�λ���','J3','����','J4','����','���') AS JOB_NAME
FROM EMPLOYEE;

-- ����� �̸�, �޿�, �μ��ڵ�, ����(��,��) ����ϱ�
SELECT EMP_NAME,SALARY,DEPT_CODE,
 DECODE(SUBSTR(EMP_NO,8,1),'2','��','1','��','3','��','4','��')AS ����
FROM EMPLOYEE;

-- 2.CASE IF~ELSE IF������ ��Ÿ��
-- CASE
-- WHEN ����
-- THEN ������ TRUE�϶� ��� �� ��
-- WHEN ����
-- THEN ������ TRUE�϶� ��� �� ��
-- WHEN ����
-- THEN ������ TRUE�϶� ��� �� ��
-- ELSE �⺻��°�
-- END

SELECT EMP_NAME,JOB_CODE,
    CASE
        WHEN JOB_CODE='J1' THEN '��ǥ'
        WHEN JOB_CODE='J2' THEN '�λ���'
        WHEN JOB_CODE='J3' THEN '����'
        ELSE '���'
        END AS ��å
FROM EMPLOYEE;

-- ������ �������� ���, �߰�, �׿ܸ� ������ ����ϱ�
-- 400���� �̻��̸� ���, 400~300���̸� �߰�, �׿� �Ф��� ����ϱ�
-- �̸� �޿� ���
SELECT EMP_NAME, SALARY,
    CASE
        WHEN SALARY>=4000000 THEN '���'
        WHEN SALARY>=3000000 THEN '�߰�'
        ELSE '�Ф�'
    END AS ���ޱ��ط���
FROM EMPLOYEE;

-- ������̺��� ���糪�̸� ���ϱ�
-- ����⵵���� ����⵵�� ����
SELECT EXTRACT(YEAR FROM SYSDATE) -- ����⵵���ϱ�
FROM DUAL;
SELECT EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR')) -- ����⵵ ���ϱ�/'YY'�� ���ڸ��� �� 20���� ����, 'RR'�� ����ؾ� 19�� ��µ�
FROM EMPLOYEE;
SELECT EMP_NAME
        ,EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2),'RR')) AS ���糪��,
        EXTRACT(YEAR FROM SYSDATE)-(SUBSTR(EMP_NO,1,2)+(CASE
        WHEN SUBSTR(EMP_NO,8,1) IN('1','2')THEN  1900
        WHEN SUBSTR(EMP_NO,8,1) IN('3','4')THEN 2000
     END)) AS ����
FROM EMPLOYEE;
 -- RR�� �⵵�� ����Ҷ� 
--����⵵       �Է³⵵     ���⵵
--00~49         00~49       ������
--00~49         50~99       ������
--50~99         00~49       ��������
--50~99         50~99       ������

UPDATE EMPLOYEE SET EMP_NO='320808-212341' WHERE EMP_ID='252';

insert into EMPLOYEE (EMP_ID,EMP_NAME,EMP_NO,EMAIL,PHONE,DEPT_CODE,JOB_CODE,SAL_LEVEL,SALARY,BONUS,MANAGER_ID,HIRE_DATE, ENT_DATE,ENT_YN) 
values ('252','�����','320808-2123341','go_dm@kh.or.kr',null,'D2','J2','S5',4480000,null,null,to_date('94/01/20','RR/MM/DD'),null,'N');

ROLLBACK;

-- �׷��Լ�
-- ���̺��� �����Ϳ� �����ϴ� �Լ��� -> ����� �Ѱ��� ���
-- �÷��� �����ϴ� �Ϳ� ������ ���� 
-- �հ�, ���, ����, �ִ밪, �ּҰ�
-- SUM() : ���̺��� Ư���÷��� �հ谪�� ������ִ� �Լ�
-- AVG() : ���̺��� Ư���÷��� ��հ��� ������ִ� �Լ�
-- COUNT() : ���̺��� ROW(������) ���� ������ִ� �Լ�
-- MAX() : ���̺��� Ư���÷��� �ִ밪�� ������ִ� �Լ�
-- MIN() : ���̺��� Ư�� �÷��� �ּҰ��� ������ִ� �Լ� 

-- ����� �޿� �հ踦 ��ȸ�ϱ�
-- �ٸ��÷��� �߰���ȸ�� �� ����!
SELECT SUM(SALARY)
FROM EMPLOYEE;
-- WHERE ����ϸ� FILTER�� ROW�� ������ ����� ��
-- �μ��� D5�� ����� �޿� �հ踦 ��ȸ�ϱ�
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5'; -- ������� : FROM -> WHERE -> SELECT65

-- ��� ���ϱ�
SELECT AVG(SALARY)
FROM EMPLOYEE;
-- D5�μ��� �ݿ� �����ȸ�ϱ�
SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- SELECT������ �׷��Լ� �ΰ� �����ϱ�
SELECT SUM(SALARY),AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- NULL�� ó�� -> �����ϰ� ���� -> NVL�� NULL�� 0���� ó������(�ٸ� ���� ��µ�)
SELECT AVG(BONUS),AVG(NVL(BONUS,0))
FROM EMPLOYEE;

-- ���̺��� �����ͼ��� ��ȸ�ϱ�
-- COUNT(�÷���/*)
-- �÷��� : �� �÷����� NULL�� ROW�� �����ϰ� ������ ���
-- * : ����÷����� NULL�̸� �����ϰ� ���* �÷��� �Ѱ��� ���� ������ ������ ����
-- ��ü �����, ��ü �μ���, ��å�� �� ���� �� ����
SELECT COUNT(*) AS ����� ,COUNT(DEPT_CODE) AS DEPT_CODECOUNT
FROM EMPLOYEE;
SELECT COUNT(*) AS �μ���
FROM DEPARTMENT;
-- ���ʽ��� �޴� ����� �� 
SELECT COUNT(*) 
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;
SELECT COUNT(BONUS)
FROM EMPLOYEE;

-- �޿��� 400���� �̻�޴� ����� ���� ? 
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SALARY>=4000000;
-- D6�μ��� ������� ��ȸ�ϱ�
SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE='D6';
-- �μ��� D6,D7,D5�� ������� �����, �޿��հ�, �޿� ����� ��ȸ�ϼ���
SELECT COUNT(*),SUM(SALARY),AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IN('D6','D5','D7');

-- �ִ밪, �ּҰ��� ��ȸ�ϱ�
-- �ִ�޿��� ��ȸ�ϱ�, �ּ� �޿��� ��ȸ�ϱ� ���
SELECT MAX(SALARY),MIN(SALARY)
FROM EMPLOYEE;
-- D5 �μ��� �ְ� �޿���, �ּ� �޿����� ��ȸ�ϱ�
SELECT MAX(SALARY),MIN(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE='D5';

-- GROUP BY, HAVTIG 
-- GROUP BY �� Ȱ���ϱ�
-- ROW �� Ư���÷��� �������� �׷����� �����ִ� ���  -> ������ �÷����� �Ѱ� �׷����� ������
-- SELECT �÷Ÿ�,�÷��� ....
-- FROM ���̺��
-- [WHERE ���ǽ�]
-- [GROUP BY �÷���[,�÷���...]}
-- �μ��� �޿��հ� ��ȸ�ϱ�
SELECT DEPT_CODE,SUM(SALARY)
FROM EMPLOYEE -- ��ü ����� ���� �հ踦 ���Ѱ�
GROUP BY DEPT_CODE;
-- ��å�� ��� �޿��� ��ȸ�ϱ�
SELECT JOB_CODE,AVG(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;
-- �μ��� ��ձ޿�, �հ� , ����� ��ȸ�ϱ�
SELECT NVL(DEPT_CODE,'����'),AVG(SALARY),SUM(SALARY),COUNT(*) 
FROM EMPLOYEE
--WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE;

-- GROUP BY���� �ټ��� �÷������ϱ�
SELECT JOB_CODE,DEPT_CODE,COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE,DEPT_CODE;
-- WHERE ���� �׷��Լ��� ����� �� ����.
-- �ִ� �޿��� �޴� ���
SELECT *
FROM EMPLOYEE
-- WHERE SALARY=MAX(SALARY); --> WHERE���� �׷��Լ� �� �� ����
-- �μ��� �Կ����� 3�� �̻� �μ�
SELECT * 
FROM EMPLOYEE
WHERE COUNT(*)>=3; --> �׷��Լ� X
--�׷��Լ��� �������� ����Ϸ��� HAVING ���� ����ؾ��Ѵ�.
-- SSLELECT �÷���, �÷���
-- FROM  ���̺��
-- [WHERE ���ǽ�]
-- [GROUP BY �÷���]
-- [HAVIG ���ǽ�]
-- �μ��� �ο����� 3���̻��� �μ���ȸ�ϱ�
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(*) >=3;
-- �μ��� ��ձ޿��� 300���� �̻��� �μ� ��ȸ�ϱ�
SELECT DEPT_CODE,AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY)>=3000000;
-- ��å�� �ο����� 3�� �̻��� ��å ��ȸ�ϱ�
SELECT JOB_CODE,COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING COUNT(*)>=3;
-- �Ŵ����� �����ϴ� ����� 2�� �̻��� ������ ���̵� ��ȸ�ϱ�
SELECT MANAGER_ID,COUNT(MANAGER_ID)
FROM EMPLOYEE
GROUP BY MANAGER_ID
HAVING COUNT(MANAGER_ID)>=2;
-- ����,������ �޿� ���,�ο��� ��ȸ�ϱ�
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��'),AVG(SALARY),COUNT(*)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1);

-- 1900��� �Ի��� �����, 2000��� �Ի��� ����� ��ȸ�ϱ�
-- �⵵     �ο���
-- 1900     8
-- 2000     15
SELECT 
        DECODE(SUBSTR(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),1,2),'19','1900���','20','2000���')
        AS �⵵,COUNT(*) AS �����
FROM EMPLOYEE
GROUP BY SUBSTR(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),1,2);
-- 1900�⵵ 2000�⵵
--    8       15
SELECT --  EXTRACT(YEAR FORM HIRE_DATE),
        COUNT(DECODE(SUBSTR(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),1,2),'19','1')) AS "1900���",
        COUNT(DECODE(SUBSTR(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),1,2),'20','1')) AS "2000���"
FROM EMPLOYEE;

-- ROLLUP�� CUBEȰ���ϱ�--
-- GROUP BY�� �ۼ��� �����÷��� �Ѱ��� ��� -> ROLLUP,CUBE���� ����
-- �÷����� �׷��Լ����, �� �׷��Լ��� ����� ���

-- GROUP BY �ۼ��� �����÷��� �ΰ��ϰ�� 
-- ROLLUP : �ΰ��÷��� ���� �׷��Լ� ���, ù��° �Ű������ִ� �÷��� �׷��Լ����, �� �׷��Լ��� ��� ���
-- CUBE : �ΰ� �÷��� ���� �׷��Լ� ���, ù��° �Ű������� �ִ� �÷��� �׷��Լ����, �ι�° �Ű������� �ִ� �÷��� �׷��Լ����, �� �׷��Լ��� ������

-- GROUP BY �� �̿��ؼ� ��ȸ�ϱ�
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY DEPT_CODE;

SELECT COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL;

-- ROLLUP
-- ���� �ΰ��� �Ⱦ��� �ѹ��� ó�������ϴ�
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE);

-- CUBE
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE);

-- �ΰ� �÷��� �������� �������� �� ROLLUP
SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY ROLLUP(DEPT_CODE,JOB_CODE); 

-- �ΰ� �÷��� �������� �������� �� CUBE -> �ΰ��� �÷��� ���� �������� ���
-- GROUP BY ���� ��
-- GROUP BY DEPT_CODE
-- GROUP BY JOB_CODE
-- GROUP BY DEPT_CODE,JOB_CODE
SELECT DEPT_CODE,JOB_CODE,COUNT(*),SUM(SALARY),AVG(SALARY)
FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL
GROUP BY CUBE(DEPT_CODE,JOB_CODE);

-- ������ �����ϱ�
-- ��ȸ�ϴ� �����͸� �����ؼ� ��������
-- �÷����� �������� ��������, ������������ ����
-- ORDER BY �÷��� ���Ĺ��[ASC(DEFAULT)/DESC][�÷��� ���Ĺ��...] //�������� DEFAULT�� (������ �����ϴ�)

-- SELECT �÷���
-- FROM ���̺��
-- [WHERE]
-- [GROUPO BY]
-- [HAVING]
-- [ORDER BY]
-- ������� �������� �������� �����ؼ� ��ȸ�ϱ�
-- �����, �޿�, ���ʽ�, �μ��ڵ�
SELECT EMP_NAME,SALARY,BONUS,DEPT_CODE
FROM EMPLOYEE
ORDER BY EMP_NAME ASC;
-- �޿��� ���������� ������� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
ORDER BY SALARY DESC;

-- ORDER BY ������ �����÷� �����ϱ�
-- �����÷����� ������ �� ���� �������� ������ ��
SELECT EMP_NAME,DEPT_CODE,JOB_CODE,SALARY
FROM EMPLOYEE
ORDER BY DEPT_CODE,JOB_CODE,SALARY DESC;

-- ���Ľ� NULL��ó��
SELECT EMP_NAME,BONUS
FROM EMPLOYEE
ORDER BY BONUS ASC; --NULL���� �ϴܿ� ��ġ
ORDER BY BONUS DESC; --NULL���� ��ܿ� ��ġ
ORDER BY BONUS ASC NULLS LAST;-->NULL�� �ݴ�� ��ܿ� ��ġ
ORDER BY BONUS DESC NULLS LAST;--> NULL�� �ݴ�� �ϴܿ� ��ġ

-- ORDER BY ������ �÷����� �ƴ� �ε��� ��ȣ�� ����� �� �ִ�.
SELECT*FROM EMPLOYEE
ORDER BY 2;
-- �����÷��� �������� �� ����� �� �ִ�.
SELECT EMP_NAME,SALARY*12
FROM EMPLOYEE
ORDER BY 2 DESC;
-- ORDER BY ���� �÷���Ī ��� �����ұ� ? -> �����ϴ�
SELECT EMP_NAME,SALARY*12 AS TOTAL_SAL
FROM EMPLOYEE
-- WHERE TOTAL_SAL>=1000000; --����
ORDER BY TOTAL_SAL DESC;

--GROUPING

SELECT 
    CASE 
        WHEN GROUPING(DEPT_CODE)=0 AND GROUPING(JOB_CODE)=1 THEN'�μ��� �ο���'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=0 THEN'��å�� �ο���'
        WHEN GROUPING(DEPT_CODE)=1 AND GROUPING(JOB_CODE)=1 THEN'�� �ο���'
        ELSE'��å�μ��� �ο���'
    END AS ����,
    COUNT(*),DEPT_CODE,JOB_CODE
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE,JOB_CODE)
ORDER BY 1;

-- ���� ������ ----
-- �������� SELECT���� �Ѱ��� ���(RESULT SET)���� ������ִ� ������
-- ù��° SELECT���� �÷����� ���� �ۼ��Ǵ� SELECT���� �÷����� ���ƾ��ϰ�, 
-- �÷��� Ÿ�Ե� �����ؾ��Ѵ�

-- UNION���� �����ϱ�
-- SELECT��
-- UNION
-- SELECT��
-- [UNION
-- SELECT��
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
-- �������� ���
SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5'
UNION ALL
SELECT EMP_ID,EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE SALARY>=3000000;

-- �μ��ڵ�, �μ���� ��å�ڵ�� ��å���� �� ��ȸ�ϱ� -- ���̺��� �ٸ��⶧���� �������谡 ����
SELECT *FROM DEPARTMENT;
SELECT *FROM JOB;

SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT
UNION
SELECT JOB_CODE,JOB_NAME
FROM JOB;
--�÷��� Ÿ�Ե� ���ƾ��Ѵ�.
DESC JOB; --> Ÿ�� : ���ڿ�
DESC DEPARTMENT; --> Ÿ�� : ���ڿ�
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
WHERE EMP_NAME LIKE'%��%';

-- JOIN �� ���� �˾ƺ���-----
-- �ΰ� �̻��� ���̺��� Ư���÷��� �������� �����ϴ� ���
-- JOIN �ΰ��� ����
-- INNER JOIN : �����÷����� ��ġ�ϴ� ���� �ִ� ROW�� �����ϴ� JOIN�� * ���� ROW ����
-- OUTER JOIN : ���� �÷����� ��ġ�ϴ� ���� ���� ROW�� �������� �ϴ� JOIN�� * ��ü ROW�� ������ ���̺� ����/ ��ġ�ϴ� ���� ���� ROW NULL������ ����

-- JOIN�� �ۼ��ϱ�
-- ����Ŭ ����, ANSI������ ����
-- ����Ŭ ���� : SELECT �÷���, �÷���, ... FROM ���̺�, ���̺� B WHERE ���̺�,�÷���=���̺�B �÷���
-- ANSI : SELECT �÷���, �÷��� .... FROM ���̺� JOIN ���̺� B ON ���̺�.�÷���=���̺� B.�÷���
-- *JOIN ������ �÷��� �����Ѱ��� ������ �־���Ѵ�. -> PK������ �÷��� �̿�

-- �������, ����� �μ����� ��ü ����ϱ�
-- ����Ŭ �������� EMPLOYEE,DEPARTMENT �����ϱ�
SELECT*FROM EMPLOYEE,DEPARTMENT WHERE DEPT_CODE=DEPT_ID;
-- INNER����
SELECT EMP_NAME,SALARY,DEPT_TITLE FROM EMPLOYEE,DEPARTMENT WHERE DEPT_CODE=DEPT_ID;
-- ANSI����
-- INNER JOIN
SELECT *FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID;
SELECT EMP_NAME,SALARY,DEPT_TITLE,LOCATION_ID
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID; -- OUTER JOIN �� JOIN�տ� LEFT�� ���ش�.

-- ����� ���� �����, �̸���, ��ȭ��ȣ, �μ����� ��ȸ�ϱ�
SELECT EMP_NAME,EMAIL,PHONE,DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_ID=DEPT_CODE;

-- ��� �� ȸ������ο� �ٹ��ϴ� ����� �μ���, �����, �޿� ���ʽ� ��ȸ�ϱ�
SELECT DEPT_TITLE, EMP_NAME,SALARY,BONUS
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_ID =DEPT_CODE
WHERE DEPT_TITLE='ȸ�������';

-- ��� �� �븮 ��å�� ������ �ִ� ����� ��å��, �����, �޿�, ���ʽ� ��ȸ�ϱ�
SELECT *FROM JOB;
SELECT *FROM EMPLOYEE;
-- �÷Ÿ��� �����ϴٸ� �տ� ���̺��. �� �� �����ؾ��ϰų� ��Ī�� �ο��Ͽ� �����ؾ���
SELECT JOB_NAME, EMP_NAME,SALARY,BONUS
-- FROM EMPLOYEE JOIN JOB ON EMPLOYEE.JOB_CODE=JOB.JOB_CODE;
FROM EMPLOYEE E JOIN JOB J ON E.JOB_CODE=J.JOB_CODE;
-- SELECT���� ������ �÷����� �� ����ؼ� �����������
SELECT E.JOB_CODE,JOB_NAME,EMP_NAME,SALARY,BONUS
FROM EMPLOYEE E JOIN JOB J ON E.JOB_CODE=J.JOB_CODE;

-- USING : JOIN�� �� ������ �÷� ��Ī�� �����ϸ� USING ���� ����� �� ����
-- USING���� ������ �� JOB_CODE�� �ϳ��� ��µ�
-- USING�� ����� �� SELECT���� �ĺ��ڸ� ���� ���Ѵ�. ( ���� �ο��� �ʿ� ���� ) 
SELECT**
FROM EMPLOYEE E JOIN JOB J USING(JOB_CODE);

-- ASIA �� �ٹ������� �μ��� �μ��� ��ȸ�ϱ�
SELECT *FROM LOCATION;
SELECT *FROM DEPARTMENT;
SELECT DEPT_TITLE
FROM DEPARTMENT JOIN LOCATION ON LOCATION_ID=LOCAL_CODE
WHERE LOCAL_NAME LIKE 'ASIA%';

-- JOIN������ GROUP BY �̿��ϱ�
-- �μ��� �����, ��ձ޿��� ��ȸ�ϱ�, ��ձ޿��� 3000000�̻�
SELECT DEPT_TITLE,COUNT(*) AS EMP_COUNT,AVG(SALARY) AS AVG_SAL
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
GROUP BY DEPT_TITLE
HAVING AVG(SALARY)>=3000000
ORDER BY 3;

-- OUTER JOIN ----
-- JOIN ǥ����
-- JOIN ���̺�� LEFT/LIGHT JOIN ���̺�� ON ����
SELECT *
FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID; --DEPT_CODE�� NULL�λ������ ���� ���� ��׵� ����ϰ� ������ OUTER�� �����
-- OUTER����ؼ� �� �־��
-- LEFT
SELECT *
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID; -- TRUE�� ������ �ֵ��� ROW�� �����ϰ� ������ �ȵż� FALSE�� ������ �ֵ��� NULL�� ���
-- RIGHT
SELECT *
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID; 

-- > �����Ǵ� �÷����� �ʼ��϶��� INNER JOIN���� �����͸� ��������
-- �����Ǵ� �÷����� ������ ���� OUTER JOIN���� �����͸� �����´�. 

-- ����� ���� �μ� ��ȸ�ϱ�
-- �μ���
SELECT DEPT_TITLE
FROM DEPARTMENT LEFT JOIN EMPLOYEE ON DEPT_CODE=DEPT_ID
WHERE DEPT_CODE IS NULL;

-- CROSS JOIN : ��ü ROW�� �����ϴ� JOIN ����
SELECT *
FROM EMPLOYEE CROSS JOIN DEPARTMENT
ORDER BY 2;

SELECT *
FROM EMPLOYEE CROSS JOIN LOCATION;

-- SELF JOIN : ���̺� �Ѱ��� �̿��ؼ� JOIN�� �ϴ� ��
-- �ڱ� �ڽ��� �����ϴ� �÷��� �־�� �Ѵ�. 
SELECT*FROM EMPLOYEE;--EMP_ID�� MANAGER_ID�� ����

-- ����� �Ŵ��� ������ ��ȸ�ϱ�
-- �����ȣ, �����, �Ŵ��� ��� ��ȣ, �Ŵ��� �����
SELECT E.EMP_ID,E.EMP_NAME,E.MANAGER_ID,M.EMP_NAME
FROM EMPLOYEE E JOIN EMPLOYEE M ON E.MANAGER_ID=M.EMP_ID;

-- �񵿵�����
SELECT*FROM SAL_GRADE;

SELECT EMP_ID,SAL_GRADE.SAL_LEVEL
FROM EMPLOYEE JOIN SAL_GRADE ON SALARY BETWEEN MIN_SAL AND MAX_SAL;

-- ���� ���� : �ΰ� �̻��� ���̺��� ������
-- ����� �����, �μ���, ��å��, �޿�, ���ʽ� ��ȸ�ϱ�
-- ǥ���� FROM ���̺� JOIN ���̺� ON ���� JOIN ���̺� ON ����
SELECT EMP_NAME,DEPT_TITLE,JOB_NAME,SALARY,BONUS
FROM EMPLOYEE 
        LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
        JOIN JOB USING(JOB_CODE);
-- �����, �μ���,��å��, ������, �����ڵ�, ���� �ڵ带 ��ȸ�ϱ�
SELECT EMP_NAME,DEPT_TITLE,JOB_NAME,LOCAL_NAME,LOCAL_CODE,NATIONAL_CODE
FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
         JOIN JOB USING(JOB_CODE)
    LEFT JOIN LOCATION ON  LOCATION_ID=LOCAL_CODE
    LEFT JOIN NATIONAL USING(NATIONAL_CODE);
-- ����Ǯ��
-- �ֹι�ȣ�� 1970��� ���̸鼭 ������ �����̰�, ���� ������ �������� �����, �ֹι�ȣ, �μ���, ���޸��� ��ȸ�Ͻÿ�.
SELECT*FROM TAB;
SELECT EMP_NAME,EMP_NO,DEPT_TITLE,JOB_NAME
FROM EMPLOYEE
        LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
             JOIN JOB USING(JOB_CODE)
WHERE SUBSTR(EMP_NO,1,1)=7 AND SUBSTR(EMP_NO,8,1)=2 AND EMP_NAME LIKE '��%';

-- �̸��� '��'�ڰ� ���� �������� ���, �����, �μ����� ��ȸ�Ͻÿ�.
SELECT EMP_ID,EMP_NAME,DEPT_CODE
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE EMP_NAME LIKE '%��%';

-- �ؿܿ����ο� �ٹ��ϴ� �����, ���޸�, �μ��ڵ�, �μ����� ��ȸ�Ͻÿ�.
SELECT EMP_NAME,JOB_NAME,DEPT_CODE,DEPT_TITLE
FROM EMPLOYEE 
        JOIN JOB USING(JOB_CODE)
   LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
WHERE DEPT_TITLE LIKE'�ؿ�%';
        
-- ���ʽ�����Ʈ�� �޴� �������� �����, ���ʽ�����Ʈ, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
SELECT EMP_NAME,BONUS,DEPT_TITLE,LOCAL_NAME
FROM EMPLOYEE 
    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    LEFT JOIN LOCATION ON LOCAL_CODE=LOCATION_ID
WHERE BONUS IS NOT NULL;

-- �μ��ڵ尡 D2�� �������� �����, ���޸�, �μ���, �ٹ��������� ��ȸ�Ͻÿ�.
SELECT EMP_NAME,JOB_NAME,DEPT_TITLE,LOCAL_NAME
FROM EMPLOYEE
        JOIN JOB USING(JOB_CODE)
   LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
   LEFT JOIN LOCATION ON LOCAL_CODE=LOCATION_ID
WHERE DEPT_CODE='D2';

-- �޿�������̺��� �ִ�޿�(MAX_SAL)���� ���� �޴�(�Ǽ��ɾ�) - ���ʽ��� ������ ���� �������� �����, ���޸�, �޿�, ������ ��ȸ�Ͻÿ�.
-- SALARY + SALARY * NVL(BONUS, 0)
-- (������̺�� �޿�������̺��� SAL_LEVEL�÷��������� ������ ��) ?????????????????????
SELECT EMP_NAME,JOB_NAME,SALARY,(SALARY+(SALARY*NVL(BONUS,0)))*12 AS ����
FROM EMPLOYEE
         JOIN JOB USING(JOB_CODE) 
    LEFT JOIN SAL_GRADE USING(SAL_LEVEL)
WHERE MAX_SAL<SALARY+SALARY*NVL(BONUS,0);

-- �ѱ�(KO)�� �Ϻ�(JP)�� �ٹ��ϴ� �������� �����, �μ���, ������, �������� ��ȸ�Ͻÿ�.
SELECT EMP_NAME,DEPT_TITLE,LOCAL_NAME,NATIONAL_NAME
FROM EMPLOYEE
    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    LEFT JOIN LOCATION ON LOCAL_CODE=LOCATION_ID
    LEFT JOIN NATIONAL USING(NATIONAL_CODE)
WHERE NATIONAL_NAME IN('�ѱ�','�Ϻ�');

-- ���� �μ��� �ٹ��ϴ� �������� �����, �μ���, �����̸��� ��ȸ�Ͻÿ�. (self join ���) ????????????????
SELECT E.EMP_NAME,DEPT_TITLE,D.EMP_NAME
FROM EMPLOYEE E JOIN EMPLOYEE D ON E.DEPT_CODE=D.DEPT_CODE
        LEFT JOIN DEPARTMENT ON E.DEPT_CODE=DEPT_ID
WHERE E.EMP_NAME!=D.EMP_NAME
ORDER BY 1;

-- ���ʽ�����Ʈ�� ���� ������ �߿��� ������ ����� ����� �������� �����, ���޸�, �޿��� ��ȸ�Ͻÿ�. ��, join�� IN ����� ��
SELECT EMP_NAME,JOB_NAME,SALARY
FROM EMPLOYEE JOIN JOB USING(JOB_CODE)
WHERE BONUS IS NULL AND JOB_NAME IN('����','����');

-- �������� ������ ����� ������ ���� ��ȸ�Ͻÿ�.
SELECT COUNT(ENT_DATE) AS ������������, COUNT(*)- COUNT(ENT_DATE) AS ���������
FROM EMPLOYEE;
-- �ٸ��� Ǫ�� ���
SELECT DECODE(ENT_YN,'N','����','���') ��������,COUNT(*) ��
FROM EMPLOYEE
GROUP BY DECODE(ENT_YN,'N','����','���'); 

-- ���������� ���� �˾ƺ���
-- SELECT���� �Ǵٸ� SELECT���� �ۼ��ϴ� ��
-- �� SELECT �� ���� SELECT ��
-- ������������ �ݵ�� ��ȣ�� ����������Ѵ�
-- ���������� SELECT���� �÷���ġ, FROM ��,WHERE �� �� ����� ����
-- INSERT, UPDATE,CREATE������ ���

-- SELECT �÷���,(SELECT �÷��� FROM ���̺�) : ��Į�󼭺�����, �����༭������
-- FROM (SELECT �÷���.... FROM ���̺�) : ������, ��������߿� ��������
-- WHERE �÷��� �񱳿���(SELECT �÷��� FROM ���̺��) : ������, ������, ���߿� ��������

-- ������ ����� ������ �޿��� �ް� �ִ� ��� ��ȸ�ϱ�
SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='������';
SELECT *
FROM EMPLOYEE
WHERE SALARY=(SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='������');

-- D5�μ��� ��ձ޿����� �޿��� ���� �޴� ��� ��ȸ�ϱ�
SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D5';
SELECT E.*,(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D5') AS AVG_SAL
FROM EMPLOYEE E
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE WHERE DEPT_CODE='D5');

-- 1. ������ ��������
-- ���������� ��� (RESULTSET)�� 1���� 1������ ���

-- ��ü����� ��ձ޿����� ���� �޿��� �޴� ����� �̸�, �޿�, �μ��ڵ� ��ȸ�ϱ�
SELECT EMP_NAME,SALARY,DEPT_CODE
FROM EMPLOYEE E
WHERE SALARY>=(SELECT AVG(SALARY) FROM EMPLOYEE);

--�μ��� �ѹ����� ����� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE=(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='�ѹ���');

--��å�� ������ ����� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE=(SELECT JOB_CODE FROM JOB WHERE JOB_NAME='����');

-- ������ ��������
-- ���������� ����� 1���÷� �ټ� ���� ���� ��
-- ��å�� ����, ������ ��� ��ȸ�ϱ�
SELECT JOB_CODE FROM JOB WHERE JOB_NAME IN('����','����'); -- 2���� ���� ���� (������)
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE IN(SELECT JOB_CODE FROM JOB WHERE JOB_NAME IN('����','����')); -- JOB_CODE�� 1���̱⶧���� () �� ���� �� ����-> IN�� ���
-- ������ �������� ��Һ��ϱ�
-- ANY OR,ALL()AND �̿�
-- ANY
-- �÷�>(=)ANY() : ������ ���������� ��� �� �ϳ��� ũ�� �� -> ������ �������� ��� �� �ּҰ����� ũ�� ��
-- �÷�<(=)ANY() : ������ ���������� ��� �� �ϳ��� ������ �� -> ������ �������� ��� �� �ִ밪���� ������ ��
-- D5,D6����� �޿����� ���� �޴� ��� 
SELECT *
FROM EMPLOYEE
WHERE SALARY> ANY(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6'));  -- > 180���� �̻� �޴� ����鸸 ��µ�
            <                                                                  --> �ִ밪���� �۰� �޴� ������ ��µ�
-- �÷�>(=)ALL() : ������ ���������� ��� �� ��簪���� ũ�� ��->������ �������� ��� �� �ִ밪���� ũ�� ��
-- �÷�<(=)ALL() : ������ ���������� ��� �� ��簪���� ũ�� ��->������ �������� ��� �� �ּҰ����� ũ�� ��

SELECT *
FROM EMPLOYEE
WHERE SALARY> ALL(SELECT SALARY FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D6')); -- 390���� �̻� �޴� ������� ��µ�
            <                                                                 -- 180���� ���� ���� �޴� ������� ��µ�

-- ���߿� ��������
-- ���������� ����� 1����, �ټ� �÷��� ���� ��
-- ������ ������� ���� �μ�, ���� ���޿� �ش��ϴ� ��� ��ȸ�ϱ�
SELECT DEPT_CODE,JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y';
SELECT DEPT_CODE,JOB_CODE,EMP_NAME
FROM EMPLOYEE
--WHERE DEPT_CODE=(SELECT DEPT_CODE FROM EMPLOYEE WHERE ENT_YN='Y')
 --       AND JOB_CODE=(SELECT JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y');
WHERE (DEPT_CODE,JOB_CODE)=(SELECT DEPT_CODE,JOB_CODE FROM EMPLOYEE WHERE ENT_YN='Y');

-- ��������� �̸鼭 �޿��� 200������ ����� ����
-- �� ����� �̸�, �μ��ڵ�, �޿� ����ϱ�(���߿� ���������� Ǯ���)
SELECT DEPT_CODE,SALARY FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID 
WHERE SALARY=2000000 AND DEPT_TITLE='���������';
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE,SALARY)
        =(SELECT DEPT_CODE,SALARY FROM EMPLOYEE WHERE DEPT_CODE=(SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE='���������') 
        AND SALARY=2000000);

-- ���߿� ������ ��������
-- ���������� ����� �ټ���, �ټ� �÷��� ���� ��
SELECT*FROM EMPLOYEE;
-- FROM ���� ���� ����� -> INLINE VIEW ������ ���̺��� �������� ����� ���� ����
SELECT * 
FROM(SELECT * FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID JOIN JOB USING(JOB_CODE)); 

-- �����������---
-- ���������� SELECT���� �ۼ��� �� ���������� ���� ������ ����ϴ� ����
-- ������ ���� �μ��� ����� ���, ������ ���� �μ��� �޿� ��պ��� �޿��� ���� �޴� �����ȸ�ϱ� --> �����̶�� ���� �ٲ�鼭 �ش��ϴ� ���� �ٲ�鼭 ���/�����
-- ��ǰ�� �޷��ִ� ��۰���, �Խñۿ� �޷��ִ� ÷������ ����

-- ������ ���� �μ��� ������� ���ϱ�
SELECT COUNT(*) FROM EMPLOYEE GROUP BY DEPT_CODE; --> ������ ���� �μ��� ��� ���� �ƴ� �׳� �μ����� ������� ���Ѱ�

SELECT EMP_NAME,DEPT_CODE,(SELECT COUNT(*)FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE) AS �����
FROM EMPLOYEE E;

-- ������ ���� �μ��� ������� 3���̻��� ����� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE E
WHERE (SELECT COUNT(*)FROM EMPLOYEE WHERE DEPT_CODE=E.DEPT_CODE)>=3;


-- �Ŵ����� ����� ��ȸ�ϱ�
-- EXISTS���� �̿��ؼ� ROW�� ������ �� ����
-- ���������� ����� 1�� �̻��̸� TRUE, 0���� FALSE��ȯ�ϴ� ����
SELECT *
FROM EMPLOYEE E
WHERE EXISTS(SELECT 1 FROM EMPLOYEE WHERE MANAGER_ID=E.EMP_ID);

-- �ְ�޿��� �޴� ��� ��ȸ�ϱ�
SELECT *
FROM EMPLOYEE E
WHERE NOT EXISTS(SELECT * FROM EMPLOYEE WHERE SALARY>E.SALARY);

-- �ڽ��� ���� ������ ��ձ޿����� ���� �޿��� �޴� ����� �̸�, ��å��, �޿� ��ȸ�ϱ�
SELECT EMP_NAME,SALARY,JOB_NAME 
FROM EMPLOYEE E JOIN JOB J ON E.JOB_CODE=J.JOB_CODE
WHERE SALARY> (SELECT AVG(SALARY) FROM EMPLOYEE WHERE JOB_CODE=E.JOB_CODE);
-- FROM���� �������� ����ϱ� -> ������ �������̺�
-- INLINE VIEW : 1ȸ������ ����ϴ� ���� -> ���� �Ұ���
-- STORED VIEW : �����س��� ����ϴ� ���� -> ���밡�� -> VIEW ���̺�

-- RESULTSET�� ���̺�ó�� �̿��� �� �ְ� ���ִ� ���
SELECT *
 FROM (SELECT EMP_NAME, EMAIL, PHONE, SALARY*12 AS YEAR_SAL
                FROM EMPLOYEE);
                
-- ������ �߰��� �������̺� �̿��ϱ�
SELECT E.*, DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��')
FROM EMPLOYEE E
WHERE SUBSTR(EMP_NO,8,1)=2;

SELECT *
FROM (
            SELECT E.*, DECODE(SUBSTR(EMP_NO,8,1),'1','��','2','��') AS GENDER
            FROM EMPLOYEE E)
WHERE GENDER='��';

-- �������, ���ֻ���ϴ� JOIN, ���տ�����, �����÷��� �߰��� SELECT�� 

-- ������ ������ ����� �����, �μ���, ��å��, �ڽ��� ���� �μ� ��ձ޿�(����, ��ȭ)
-- ��ձ޿��� 300�����̻��� ��� ���ϱ�
SELECT V.*,EMP_NAME,TO_CHAR(DEPT_AVG,'L999,999,999') AS DEPT_AVG

FROM (
                SELECT EMP_NAME,NVL(DEPT_TITLE,'����') AS DEPT_TITLE, JOB_NAME, (SALARY+(SALARY*NVL(BONUS,0)))*12 AS YEAR_SAL,
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
 
 -- ROW�� TOP-N���� ��ȸ�ϱ�
 -- �ΰ��� 
 -- ����Ŭ�� �⺻������ �����ϴ� ROWNUM�̶�� �����÷��� �̿��ϴ� ���
 -- ����Ŭ�� �����ϴ� WINDOW�Լ� RANK()�� �̿��ϴ� ���
 
 -- �޿��� ���Թ޴� TOP-3 ��ȸ�ϱ�
 SELECT ROWNUM, EMP_NAME, SALARY
 FROM EMPLOYEE
 --WHERE ROWNUM <=3
 ORDER BY SALARY;
 
 SELECT ROWNUM, E.*
 FROM (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY) E
 WHERE ROWNUM <=3;
 
 -- �޿��� ���Թ޴� 5~10�� ��� �����, �޿� ��ȸ�ϱ�
 -- ROWNUM�� �̿��ؼ� ��������
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

 -- �޿��� ���� ���� ��� 3�� ��ȸ�ϱ�
 -- ����� �μ���, ��å��, �޿�
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
-- �޿��� ���� �޴� 10�� 15����� ��ȸ�ϱ�
-- ����� �μ���, ��å��, �޿�
WHERE RNUM BETWEEN 10 AND 15;
 
 
 -- RANK() OVER(ORDER BY )  : ���ϰ��� �������� ��ȣ�� ���� - ������ȣ�߻���
 -- DENSE_RANK() OVER(ORDER BY ) OVER : ���ϰ� �������� ��ȣ�� ������������ - ������ȣ ����
 -- �̿��ϱ�
 SELECT *
 FROM (
                 SELECT RANK() OVER(ORDER BY SALARY) AS "ORDER", 
                                    DENSE_RANK() OVER(ORDER BY SALARY) AS "ORDER2",
                                    E.*
                 FROM EMPLOYEE E
                 )
 WHERE "ORDER" BETWEEN 5 AND 10;
 
 -- ��ձ޿��� ���� �޴� �μ� 3������ϱ�
 -- �μ���, ��ձ޿�
 SELECT *
 FROM (
     SELECT DEPT_TITLE, AVG(SALARY), RANK() OVER(ORDER BY AVG(SALARY) DESC) AS AVG_ORDER
     FROM EMPLOYEE 
                    LEFT JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
     GROUP BY DEPT_TITLE
     )
 WHERE AVG_ORDER BETWEEN 1 AND 3;
 
 -- WITH���� �̿��ϱ�
 -- WITH �Ѱ� SELECT���ȿ��� ������ SELECT���� �����ϱ� ���� ���
 
WITH 
    TEST_WITH AS (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY  SALARY DESC),
    TEST_WITH2 AS (SELECT * FROM EMPLOYEE)
    
SELECT EMP_NAME,SALARY FROM TEST_WITH
UNION
SELECT EMAIL, BONUS
FROM TEST_WITH2;

SELECT * FROM TEST_WITH;

-- DDL�� ���� �˾ƺ���
-- ���̺��� �����ϴ� ����� ���� �˾ƺ���
-- CREATE TABLE �� �̿��ؼ� ������.
-- ���̺��� �����͵��� �����ϴ� �����
-- ���̺� ���÷��� �����͸� ����
-- �÷�(�� �����)�� TYPE�� ����
-- ����Ŭ���� �����ϴ� TYPE
-- ���� : NUMBER ����, �Ǽ�
-- ���� : CHAR, VARCHAR2, NVARCHAR2, LONG, CLOB
-- ��¥ : DATE, TIMESTAMP

-- ���̺� �����ϴ� ���
--CREATE TABLE ���̺��(
-- �÷��� TYPE() [��������] ,
-- �÷��� TYPE[()] [��������],......
--)


-- ���ڿ� Ÿ�� �����ϱ�
-- CHAR : ����ũ�� ���ڿ� �����
-- VARCHAR2 : ����ũ�� ���ڿ� �����
-- NVARCHAR2 : ����ũ�� Ȯ���� ���ڿ����� ����

CREATE TABLE TBL_STR(
    A CHAR(6),
    B VARCHAR2(6),
    C NVARCHAR2(6)
);
SELECT * FROM TBL_STR;
INSERT INTO TBL_STR VALUES('ABC','ABC','ABC');
INSERT INTO TBL_STR VALUES('ABCDEFG','ABCDEF','ABCDEF');
INSERT INTO TBL_STR VALUES('����','����','�ڳ�');
INSERT INTO TBL_STR VALUES('������','������','�ڳ���');
INSERT INTO TBL_STR VALUES('����','����','�ڳ��ٶ�ٸ�');

SELECT LENGTHB(A), LENGTHB(B), LENGTHB(C)
FROM TBL_STR;

-- ������ �ڷ���
-- NUMBER : ǥ�������� ��� ���� ������
-- NUMBER(PRECISION, SCALE) : �������忡 ���Ѽ���
-- PRECISION : ���尡���� ������ ��ü �ڸ���(1~38)
-- SCALE : �Ҽ��� �ڸ�������(-84~127)

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

-- ��¥����
-- DATE : ��, ��, �� �����ϴ� �ڷ���
-- TIMESTAMP :  ��, ��, �� ��, �� �� �����ϴ� �ڷ���
CREATE TABLE TBL_DATE(
    BIRTHDAY DATE,
    RENT_START TIMESTAMP
);

SELECT * FROM TBL_DATE;
INSERT INTO TBL_DATE VALUES(SYSDATE,SYSTIMESTAMP);
-- ��¥������
-- 1. �������·� ����
INSERT INTO TBL_DATE VALUES('24/02/13','24/02/13 09:00');
-- 2. ����ȯ�ؼ� �����ϱ� **
INSERT INTO TBL_DATE VALUES(TO_DATE('24/02/13','YY/MM/DD'),TO_TIMESTAMP('24/02/13 09:00','RR/MM/DD HH24:MI'));


-- ���ڿ������ ������ ũ�Ⱑ ��û ũ�ٸ�!!
-- VARCHAR2() -> �ִ� 4õ����Ʈ
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
TO_CLOB('DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJF���Ϥ������̤�������;�ӷ��������̤�������;�Ӥö�;���ä�;�Ϸ�������
���Ϥ����ʾƤ̤����ÿ︶�ʤ̤�;���t�����뤤�Ƥä̤�
�������̤����ƤäӤ̤Ǥ�����;���äǤ�������
�����Ƥ��ä�;���ʶ�;�Ӥ����;�Ӿ����
��;�Ӥ���;������̸տ��۴�
�������ä̤���;�������Ƥä̤�;����
��;����ϾƤäӸ���;�Ӹ۳�;�Ӥ��ä�������;�Ӥ��ä�������;�ä�������;������;�ӷ�;�Ӥ��;�����ä�;�ø��������ä̤�����;�ä����𳲾�A�������
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJF���Ϥ������̤�������;�ӷ��������̤�������;�Ӥö�;���ä�;�Ϸ�������
���Ϥ����ʾƤ̤����ÿ︶�ʤ̤�;���t�����뤤�Ƥä̤�
�������̤����ƤäӤ̤Ǥ�����;���äǤ�������
�����Ƥ��ä�;���ʶ�;�Ӥ����;�Ӿ����
��;�Ӥ���;������̸տ��۴�
�������ä̤���;�������Ƥä̤�;����
��;����ϾƤäӸ���;�Ӹ۳�;�Ӥ��ä�������;�Ӥ��ä�������;�ä�������;������;�ӷ�;�Ӥ��;�����ä�;�ø��������ä̤�����;�ä����𳲾�A�������
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJF���Ϥ������̤�������;�ӷ��������̤�������;�Ӥö�;���ä�;�Ϸ�������
���Ϥ����ʾƤ̤����ÿ︶�ʤ̤�;���t�����뤤�Ƥä̤�
�������̤����ƤäӤ̤Ǥ�����;���äǤ�������
�����Ƥ��ä�;���ʶ�;�Ӥ����;�Ӿ����
��;�Ӥ���;������̸տ��۴�
�������ä̤���;�������Ƥä̤�;����
��;����ϾƤäӸ���;�Ӹ۳�;�Ӥ��ä�������;�Ӥ��ä�������;�ä�������;������;�ӷ�;�Ӥ��;�����ä�;�ø��������ä̤�����;�ä����𳲾�A�������
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA')
||TO_CLOB(
'SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJF���Ϥ������̤�������;�ӷ��������̤�������;�Ӥö�;���ä�;�Ϸ�������
���Ϥ����ʾƤ̤����ÿ︶�ʤ̤�;���t�����뤤�Ƥä̤�
�������̤����ƤäӤ̤Ǥ�����;���äǤ�������
�����Ƥ��ä�;���ʶ�;�Ӥ����;�Ӿ����
��;�Ӥ���;������̸տ��۴�
�������ä̤���;�������Ƥä̤�;����
��;����ϾƤäӸ���;�Ӹ۳�;�Ӥ��ä�������;�Ӥ��ä�������;�ä�������;������;�ӷ�;�Ӥ��;�����ä�;�ø��������ä̤�����;�ä����𳲾�A�������
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJF���Ϥ������̤�������;�ӷ��������̤�������;�Ӥö�;���ä�;�Ϸ�������
���Ϥ����ʾƤ̤����ÿ︶�ʤ̤�;���t�����뤤�Ƥä̤�
�������̤����ƤäӤ̤Ǥ�����;���äǤ�������
�����Ƥ��ä�;���ʶ�;�Ӥ����;�Ӿ����
��;�Ӥ���;������̸տ��۴�
�������ä̤���;�������Ƥä̤�;����
��;����ϾƤäӸ���;�Ӹ۳�;�Ӥ��ä�������;�Ӥ��ä�������;�ä�������;������;�ӷ�;�Ӥ��;�����ä�;�ø��������ä̤�����;�ä����𳲾�A�������
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJF���Ϥ������̤�������;�ӷ��������̤�������;�Ӥö�;���ä�;�Ϸ�������
���Ϥ����ʾƤ̤����ÿ︶�ʤ̤�;���t�����뤤�Ƥä̤�
�������̤����ƤäӤ̤Ǥ�����;���äǤ�������
�����Ƥ��ä�;���ʶ�;�Ӥ����;�Ӿ����
��;�Ӥ���;������̸տ��۴�
�������ä̤���;�������Ƥä̤�;����
')||TO_CLOB('
��;����ϾƤäӸ���;�Ӹ۳�;�Ӥ��ä�������;�Ӥ��ä�������;�ä�������;������;�ӷ�;�Ӥ��;�����ä�;�ø��������ä̤�����;�ä����𳲾�A�������
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJF���Ϥ������̤�������;�ӷ��������̤�������;�Ӥö�;���ä�;�Ϸ�������

���Ϥ����ʾƤ̤����ÿ︶�ʤ̤�;���t�����뤤�Ƥä̤�
�������̤����ƤäӤ̤Ǥ�����;���äǤ�������
�����Ƥ��ä�;���ʶ�;�Ӥ����;�Ӿ����
��;�Ӥ���;������̸տ��۴�
�������ä̤���;�������Ƥä̤�;����
��;����ϾƤäӸ���;�Ӹ۳�;�Ӥ��ä�������;�Ӥ��ä�������;�ä�������;������;�ӷ�;�Ӥ��;�����ä�;�ø��������ä̤�����;�ä����𳲾�A�������
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJF���Ϥ������̤�������;�ӷ��������̤�������;�Ӥö�;���ä�;�Ϸ�������
���Ϥ����ʾƤ̤����ÿ︶�ʤ̤�;���t�����뤤�Ƥä̤�
�������̤����ƤäӤ̤Ǥ�����;���äǤ�������
�����Ƥ��ä�;���ʶ�;�Ӥ����;�Ӿ����
��;�Ӥ���;������̸տ��۴�
�������ä̤���;�������Ƥä̤�;����
��;����ϾƤäӸ���;�Ӹ۳�;�Ӥ��ä�������;�Ӥ��ä�������;�ä�������;������;�ӷ�;�Ӥ��;�����ä�;�ø��������ä̤�����;�ä����𳲾�A�������
1OI43JGDFEN4O2;IJKNDS;2JIKJNASDFJ12IJEJKSDFASKDJFN12IE12KJ3KJLSDNFHASDKJW;IRJAWELFKJASDFKJ
ASDKJHKASJDHFKSAJDH13LK1SADKFJ123LKJSDVFAKLJWQRELKJDSAFLKJQWELKJVADSLKJASDKFJADSLASDJKFASDJKHFASDASL
ASLKDJFALSDKJFLASDKJFA
SDFLKJASDFLKJASDLFKJASLDKJALSKDJLAKSJDFLKASJDFLKJASDFASDFJKHASDF
;LKJASDFKLJKDJFASKLDJFA;SJ;ASLDJFKASDFASDFASDFASKJFASDFLKJASDFLKJASDFLKJASDF;LJAKSDF;LKJASDFLKJASDF;LJKASDFLKASFLKJ
ASDKJHFASKJDHFALKSDJFL;KDAJFLK;JASDF;LKJASDF;A;LFLJKFAL;DJSFKASDJFL;ADJSFL;KJSAF
A;LSDJKAS;DLJKASL;DJFASD;LJFKASD;LJFASD;FLJASD;FLJKS;LAS;LFASD;LFJA;DSLJKASLDKJAS;LDJK;ALSDJKF;ALDSJKASDJF
DSKALJFDL;KJAS;DLJFSA;DJFA;SDJFA;SLDFKALSDJFLKASJDF;ASDJF���Ϥ������̤�������;�ӷ��������̤�������;�Ӥö�;���ä�;�Ϸ�������
���Ϥ����ʾƤ̤����ÿ︶�ʤ̤�;���t�����뤤�Ƥä̤�
�������̤����ƤäӤ̤Ǥ�����;���äǤ�������
�����Ƥ��ä�;���ʶ�;�Ӥ����;�Ӿ����
��;�Ӥ���;������̸տ��۴�
�������ä̤���;�������Ƥä̤�;����
��;����ϾƤäӸ���;�Ӹ۳�;�Ӥ��ä�������;�Ӥ��ä�������;�ä�������;������;�ӷ�;�Ӥ��;�����ä�;�ø��������ä̤�����;�ä����𳲾�A�������'));

INSERT INTO TBL_STR2 VALUES('TEST','TEST');

SELECT * FROM TBL_STR2;


-- ���̺� �����ÿ� �÷��� �������� �����ϱ�
-- NOT NULL
-- UNIQUE
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK

-- ���������� �����ϴ� ���
-- �÷��������� ���� : �÷��Ѱ��� ���������� �����Ҷ�
-- ���̺������� ���� : �����÷��� ��� ���������� �����Ҷ� 
--  CREATE TABLE ���̺��(
--    �÷��� Ÿ�Ը� [��������] �÷�����,
--      �÷��� Ÿ�Ը� [��������],
--      [��������] ���̺���
--)

-- NOT NULL (C) : ������ �÷����� NULL���� �������� �ʰ� �ϴ� �������� * �÷��� ���ٸ� ���������� ������ NULLABLE(DEFUALT)
-- �÷����������� ������ ������.!
CREATE TABLE MEMBER(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(50),
    MEMBER_PWD VARCHAR2(50),
    MEMBER_NAME VARCHAR2(20),
    MEMBER_AGE NUMBER
);
SELECT * FROM MEMBER;
INSERT INTO MEMBER VALUES(NULL,NULL,NULL,NULL,NULL);
-- NOTNULL�������� �����ϱ�
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

-- UNIQUE (U) : ������ �÷��� �ߺ������͸� ������ �� ���� �ϴ� ���
-- �÷�����,  ���̺������� ����
SELECT * FROM NN_MEMBER;
INSERT INTO NN_MEMBER VALUES(1,'ADMIN','0000','���¿�',29);

CREATE TABLE UQ_MEMBER(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(50), --UNIQUE,
    MEMBER_PWD VARCHAR2(50) NOT NULL,
    MEMBER_NAME VARCHAR2(20),
    MEMBER_AGE NUMBER,
    --���̺������� �������Ǽ���
    UNIQUE(MEMBER_ID)
);
SELECT * FROM UQ_MEMBER;
INSERT INTO UQ_MEMBER VALUES(1,'GDJ79','7979','�����',32);
INSERT INTO UQ_MEMBER VALUES(2,'GDJ79','8282','������',19);
INSERT INTO UQ_MEMBER VALUES(2,NULL,'8282','������',19);
INSERT INTO UQ_MEMBER VALUES(3,NULL,'7942','������',29);
DROP TABLE UQ_MEMBER;

-- �ټ��÷��� UNIQUE���������� ������ �� �ִ�.
-- ���̺� ���������� ����

CREATE TABLE UQ_MEMBER2(
    MEMBER_NO NUMBER,
    MEMBER_ID VARCHAR2(50),
    MEMBER_PWD VARCHAR2(50) NOT NULL,
    MEMBER_NAME VARCHAR2(20),
    MEMBER_AGE NUMBER,
    UNIQUE(MEMBER_ID,MEMBER_NAME)
); --  ��ٱ��Ͽ� ���� ��ǰ�� �ٷ��� �������� �־����� ���� ��ǰ�� ��� �ݺ��ż� ������ ���� SW�� ȭ������� ��ǰ�� ��ٱ��Ͽ� ����, ���̵� �¿�� ��ǰ�� UNIQE�� �������. 
SELECT *FROM UQ_MEMBER2;
INSERT INTO UQ_MEMBER2 VALUES(1,'GDJ79','7979','�����',32);
INSERT INTO UQ_MEMBER2 VALUES(2,'GDJ79','8282','������',19);
INSERT INTO UQ_MEMBER2 VALUES(2,NULL,'8282','������',19);
INSERT INTO UQ_MEMBER2 VALUES(3,NULL,'7942','������',29);

-- PRIMARY KEY(P) : ������ �÷��� �ߺ�, NULL �ȵ�
-- �Ϲ������� ��� ���̺� �Ѱ� �÷��� ����
-- ���� ����ϴ� �÷� / ��������ʴ� �÷��� �����ؼ� ����
-- �÷�����, ���̺��� ��� ����
CREATE TABLE PK_MEMBER(
    MEMBER_NO NUMBER PRIMARY KEY,
    MEMBER_ID VARCHAR2(50) UNIQUE NOT NULL,
    MEMBER_PWD VARCHAR2(50) NOT NULL,
    MEMBER_NAME VARCHAR2(20),
    MEMBER_AGE NUMBER
    --ù��° �� ���ְ� PRIMARY KEY(MEMBER_NO)�� ���൵ ��, PRIMAR�� ���� ��� ����� �� ����-> PRIMARY KEY(MEMBER_NO,MEMBER_ID)
); 
SELECT*FROM PK_MEMBER;
INSERT INTO PK_MEMBER VALUES(1,'ADMIN','1234','���¿�',29);
INSERT INTO PK_MEMBER VALUES(2,'USER01','3333','�����',23);
DROP TABLE PK_MEMBER1;

-- FORENIN KEY(R) : �÷��� ����Ǵ� �����Ͱ� �ٸ����̺� �ִ� ���� �����ϰ� �ϴ� ��
-- �������踦 ���� -> �����Ǵ� ���̺�(�θ�) �����ϴ� ���̺�(�ڽ�)
-- �����Ǵ� ���̺��� ���õ� �÷��� PK�ų� UNIQUE���������� ������ �Ǿ��־�� �Ѵ�. 
CREATE TABLE FK_BOARD--//////////////////////////////////////////////////////////////////
 CREATE TABLE FK_BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(200) NOT NULL,
    BOARD_CONTENT VARCHAR2(2000),
    BOARD_WRITER VARCHAR2(20), --NOT NULL REFERENCES UQ_MEMBER(MEMBER_ID), --REFERENCES ���̺��(�÷���),
    BOARD_DATE DATE,
    FOREIGN KEY(BOARD_WRITER) REFERENCES UQ_MEMBER(MEMBER_ID)
);

SELECT * FROM UQ_MEMBER;
INSERT INTO UQ_MEMBER VALUES(4,'ADMIN','1234','������',44);
INSERT INTO UQ_MEMBER VALUES(5,'USER01','1111','������',11);
INSERT INTO UQ_MEMBER VALUES(6,'BS','1111','������',11);

INSERT INTO FK_BOARD VALUES(1,'���� ���� db�� �����ִ�.',NULL,'GDJ79',SYSDATE);
INSERT INTO FK_BOARD VALUES(2,'�������迡 NULL����?.',NULL,NULL,SYSDATE);
INSERT INTO FK_BOARD VALUES(3,'�������迡 NULL����?.',NULL,'BS',SYSDATE);
SELECT * FROM FK_BOARD;
DROP TABLE FK_BOARD;


-- ������̺� �����ϱ�
-- ��۹�ȣ, ����, �ۼ���(FK), �ۼ���, �Խñ۹�ȣ(FK)
CREATE TABLE FK_BOARD_COMMENT(
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_CONTENT VARCHAR2(1000) NOT NULL,
    COMMENT_WRITER VARCHAR2(20) REFERENCES UQ_MEMBER(MEMBER_ID),
    BOARD_NO NUMBER REFERENCES FK_BOARD(BOARD_NO),
    COMMENT_DATE DATE
);

INSERT INTO FK_BOARD_COMMENT VALUES(1, 'MJ �γ� ������! �Ʒ���?','GDJ79',1,SYSDATE);
INSERT INTO FK_BOARD_COMMENT VALUES(2, '��� MJ �׸� ����! �Ʒ���?','USER01',1,SYSDATE);
SELECT * FROM FK_BOARD_COMMENT;

SELECT *
FROM FK_BOARD 
            JOIN UQ_MEMBER ON BOARD_WRITER=MEMBER_ID
            LEFT JOIN FK_BOARD_COMMENT USING( BOARD_NO)
WHERE BOARD_NO=3;

-- FK���������� ������ �θ����̺��� �����ʹ� �Ժη� ���� �� �� ����.
DELETE FROM FK_BOARD WHERE BOARD_NO=1;

DROP TABLE FK_BOARD;

-- FK ������ ������ ���� �ɼ��� ������ �� ����
-- ON DELETE SET NULL : �������� �����Ǹ� NULL�� ���� *�÷��� NOT NULL ���������� �����ϸ� �ȵ�!
-- ON DELETE CASCADE : �������� �����Ǹ� �ʵ� ������!
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


-- CHECK DEFAULT COMMENT ����������ȸ �������� �̸� ����
-- CHECK(C) : Ư�� ���ǿ� �´� ���� ������ �� �ְ� ���ִ� ��
-- �÷��������� ��������
CREATE TABLE PERSON(
NAME VARCAHR2(20),
AGE NUMBER CHECK(AGE>0),
GENDER VARCHAR(5) CHECK(GENDER IN('M','F'))
);
DROP TABLE PERSON;
SELECT *FROM PERSON;
INSERT INTO PERSON VALUES('������',19,'M');

CREATE TABLE TEST_BOARD(
TYPE VARCHAR2(10) CHECK(TYPE IN('����','����','���')) , --����, ����, ���
TITLE VARCHAR2(20)
)
-- �� �ƴϸ� �Ʒ��� ������� ���� �� �ִ�. 
CREATE TABLE TEST_BOARD(
TYPE NUMBER REFERENCES BOARD_TYPE(TYPE_NO), -- ���� , ����, ���
TITLE VARCHAR2(20)
)
-- ���� �Ʒ��� ����(������ �� ���� �� ���������� �Ʒ��� �� ����)
CREATE TABLE BOARD_TYPE(
TYPE_NO NUMBER PRIMARY KEY,
TYPE_NAME VARCHAR2(10)
);

--DEFAULT �� �����ϱ�
CREATE TABLE DEFAULT_TEST(
TEST_NO NUMBER PRIMARY KEY,
TEST_DATE DATE DEFAULT SYSDATE NOT NULL,
TEST_DATA VARCHAR2(20) DEFAULT '�⺻��'
);

INSERT INTO DEFAULT_TEST VALUES(1,DEFAULT,DEFAULT);
INSERT INTO DEFAULT_TEST VALUES(2,TO_DATE('24/02/13','RR/MM/DD'),'������');
SELECT*FROM DEFAULT_TEST;
INSERT INTO DEFAULT_TEST VALUES(TEST_NO) VALUES(3); --�÷��� �����ؼ� �� �÷��� ���� �������� �� �ִ�. 


-- ���������� ������ �� ���� ���ǿ� ���� �̸� �����ϱ� : CONSTRAINT
CREATE TABLE MEMBER_TEST(
MEMBER_NO NUMBER CONSTRAINT MEMBER_NO_PK PRIMARY KEY,
MEMBER_ID VARCHAR(20) CONSTRAINT MEMBER_ID_UQ UNIQUE CONSTRAINT NN_MEMBER_ID NOT NULL,
MEMBER_AGE NUMBER CONSTRAINT CK_AGE CHECK(MEMBER_AGE>0),
BOARD_NO NUMBER,
CONSTRAINT FK_BOARD FOREIGN KEY(BOARD_NO) REFERENCES FK_BOARD(BOARD_NO)
);
INSERT INTO MEMBER_TEST VALUES(1,'ADMIN',10,2); -- ���� �޽������� �̸��� �����⶧���� ã�� �� ����

-- ������ ���� ���� ��ȸ�ϱ�
-- ����Ŭ���� USER_CONSTRAINTS,USER_CONS_COLUMNS ���̺��� ������
SELECT *
FROM USER_CONSTRAINTS; --�÷� �ȳ���
-- �÷� Ȯ���ϱ�(Ÿ�԰� ���� �ȳ���)
SELECT *
FROM USER_CONS_COLUMNS;
-- > ���ļ� ���(������ ���� ���� CONSTRAINT_NAME)�� ����
SELECT UC.CONSTRAINT_NAME,UC.TABLE_NAME,CONSTRAINT_TYPE,COLUMN_NAME
FROM USER_CONSTRAINTS UC
 JOIN USER_CONS_COLUMNS UCC ON UC.CONSTRAINT_NAME=UCC.CONSTRAINT_NAME; 

-- �÷��� ���� �ۼ��ϱ�
-- �ٸ� ����� ���˾ƺ��� �ڵ�� ���� �ڵ尡 �ƴ�
COMMENT ON COLUMN MEMBER_TEST.MEMBER_NO IS'ȸ����ȣ PRIMARY KEY';
COMMENT ON COLUMN MEMBER_TEST.MEMBER_ID IS 'ȸ�����̵� 8�����̻� ����';

SELECT*
FROM USER_COL_COMMENTS --����Ŭ ���� ���̺�
WHERE TABLE_NAME='MEMBER_TEST';

-- TABLE�� ���� �ۼ��ϱ�
COMMENT ON TABLE MEMBER_TEST IS '�������� �������̺�';
-- Ȯ���ϱ�
SELECT*
FROM USER_TAB_COMMENTS
WHERE TABLE_NAME='MEMBER_TEST';

-- ���̺� ������ �� �������̺��� ������ �����ؼ� �����ϱ�
-- �����ؼ� ������ ���̺��� ���������� NOT NULL�������Ǹ� �����
-- ENPLOYEE ���̺� �����ؼ� ���̺� �����ϰ� Ȯ���ϱ�
CREATE TABLE COPY_EMP
AS SELECT *FROM EMPLOYEE;
SELECT*FROM COPY_EMP;

-- EMPLOYEE ���� ���̵�, �̸�, ������ �����ؼ� ���̺� �����ϰ� Ȯ���ϱ�
CREATE TABLE COPY_EMP
AS SELECT  EMP_ID,EMP_NAME,SALARY*12 AS YEAR_SAL FROM EMPLOYEE;
SELECT*FROM COPY_EMP;

-- EMPLOYEE ���̺��� ������ �����ϱ�
CREATE TABLE COPY_EMP2
AS SELECT*FROM EMPLOYEE WHERE 1=2; --�÷��鸸 �����ؼ� �������Ե�(NOT NULL�������Ǹ� �����)

--TEST_MEMBER ���̺�
--MEMBER_CODE(NUMBER) - �⺻Ű                  -- ȸ�������ڵ� 
--MEMBER_ID (varchar2(20) ) - �ߺ�����, NULL�� ������   -- ȸ�� ���̵�
--MEMBER_PWD (char(20)) - NULL �� ������               -- ȸ�� ��й�ȣ
--MEMBER_NAME(nchar(10)) - �⺻�� '�ƹ���'            -- ȸ�� �̸�
--MEMBER_ADDR (char(50)) - NULL�� ������               -- ȸ�� ������
--GENDER (varchar2(5)) - '��' Ȥ�� '��'�θ� �Է� ����            -- ����
--PHONE(varchar2(20)) - NULL �� ������                -- ȸ�� ����ó
--HEIGHT(NUMBER(5,2) - 130�̻��� ���� �Է°���           -- ȸ��Ű
--TYPE_NO NUMBER - BOARD_TYPE NO���� ���� -- ����Ÿ������
CREATE TABLE BOARD_TYPE(
    TYPE_NO NUMBER PRIMARY KEY,
    TYPE_NAME VARCHAR2(10)
);
CREATE TABLE TEST_MEMBER(
 MEMBER_CODE NUMBER PRIMARY KEY,
 MEMBER_ID VARCHAR2(20) UNIQUE NOT NULL ,
 MEMBER_PWD CHAR(20) NOT NULL,
 MEMBER_NAME NCHAR(10) DEFAULT '�ƹ���',
 MEMBER_ADDR CHAR(50) NOT NULL,
 GENDER VARCHAR(5) NOT NULL CHECK(GENDER IN('��','��')),
 PHONE VARCHAR(20) NOT NULL,
 HEIGHT NUMBER(5,2) CHECK(HEIGHT>=130),
 TYPE_NO NUMBER REFERENCES BOARD_TYPE(TYPE_NO)
 );
 
 COMMENT ON COLUMN TABLE_MEMNBER.MEMBER_CODE IS'ȸ�������ڵ�';
  COMMENT ON COLUMN TABLE_MEMNBER.MEMBER_ID IS'ȸ�����̵�';
 COMMENT ON COLUMN TABLE_MEMNBER.MEMBER_PWD IS'ȸ����й�ȣ';
 COMMENT ON COLUMN TABLE_MEMNBER.MEMBER_ADDR IS'ȸ�� ������';
 COMMENT ON COLUMN TABLE_MEMNBER.GENDER IS'����';
 COMMENT ON COLUMN TABLE_MEMNBER.PHONE IS'ȸ�� ����ó';
 COMMENT ON COLUMN TABLE_MEMNBER.HEIGHT IS'ȸ��Ű';
 COMMENT ON COLUMN TABLE_MEMNBER.TYPE_TO_NUM IS'����Ÿ�� ����';
 
 --------------------------DML
-- ROW(DATA)�� ����, ����, �����ϴ� ��ɾ�
-- INSERT : ���̺� ���ο� ROW�� �߰��ϴ� ��ɾ�
-- ǥ���� 
-- INSERT INTO ���̺�� [(�÷���, �÷��� ...)] VALUES(��,��,��.....)
-- UPDATE : ���̺� Ư��ROW�� �÷����� �����ϴ� ��ɾ�
-- ǥ����
-- UPDATE ���̺�� SET �÷���=��[,�÷���=��...][WHERE ���ǹ�]
-- DELETE : ���̺� Ư��ROW�� �����ϴ� ��ɾ�
-- ǥ����
-- DELETE FORM ���̺��[WHERE ���ǽ�]

-- INSERT�� Ȱ���ϱ�
-- 1. ��ü�÷��� ���� �����ϱ�
-- INSERT INTO ���̺�� VALUES(��,...)-> VALUES���� ������ ���̺��� �÷����� ���ƾ��Ѵ�. 
-- �÷��� ������� ��Ī�ż� ���� ������ ���缭 INSERT�������
 CREATE TABLE TEMP_DEPT
 AS SELECT*FROM DEPARTMENT WHERE 1=0;
 INSERT INTO TEMP_DEPT VALUES('D1','�ڹ��к�','L3'); 
 --> ���� 3���� �ƴϸ� ������ �߻��Ѵ�. 
 CREATE TABLE TEMP_EMP
 AS SELECT EMP_NAME,SALARY,HIRE_DATE FROM EMPLOYEE WHERE 1=0;
 SELECT*FROM TEMP_EMP;
 INSERT INTO TEMP_EMP VALUES('TEST','101��','1234'); --��ġ�� �����մϴ� ������ ��
--> Ÿ�Կ� �°� INSERT������� �ƴϸ� ������ �߻��Ѵ�. 
-- 2 .�÷��� �����ؼ� �� �����ϱ�
INSERT INTO TEMP_DEPT(DEPT_ID,LOCATION_ID) VALUES('D2','L2');
-- �������� �÷��� NULL�� ���Եȴ�. 
-- NOT NULL���������� �ִ� �÷��� ������ �����ؼ� ���� �־������ ���� : NOT NULL���� ������ �������� �ʾ��� �� �������� NULL�� ���µ� ���������� NOT NULL�ΰ��� NULL�� ���� �� ���� ������ ���� �߻��Ѵ�. (DEFAULT���� �ִ� ���  NULL�� �ƴ�DEFAULT������ ��ü�Ǳ� ������ ����)

-- SELECT ���� �̿��ؼ� INSERT�ϱ�
-- �ٸ����̺� �ִ°��� �����ؼ� �����ϱ�
CREATE TABLE INSERT_SUB
AS SELECT EMP_ID,EMP_NAME,DEPT_TITLE,HIRE_DATE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID WHERE 1=2;
    
SELECT*FROM INSERT_SUB;

INSERT INTO INSERT_SUB(
    SELECT EMP_ID,EMP_NAME,DEPT_TITLE,SALARY
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE=DEPT_ID
    WHERE SALARY>=3000000
);
-- ���� �߻� :  DATE�� �ʿ������� NUMBER�� -> ������ Ÿ���� ��������Ѵ�. 
 
 
 -- �÷��� �����ؼ�
 INSERT INTO INSERT_SUB(EMP_ID,EMP_NAME)(
 SELECT EMP_ID,EMP_NAME FROM EMPLOYEE;
 
 -- INSERT ALL�̿��ϱ�
 -- �Ѱ��� SELECT���� �����͸� �ټ� ���̺� �����ϴ� ��ɾ�
 --ǥ����
 -- INTO ���̺�� VALUES(�÷���, �÷���,.....)
 -- INTO ���̺�� VALUES(�÷���, �÷���,.....)
 --SELECT ��
 CREATE TABLE EMP_HIRE_DATE
 AS SELECT EMP_ID,EMP_NAME,HIRE_DATE FROM EMPLOYEE WHERE 1=0;
CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID,EMP_NAME,MANAGER_ID FROM EMPLOYEE WHERE 1=0;

SELECT*FROM EMP_HIRE_DATE;
SLEECT*FROM EMP_MANAGER;
--������ �����͸� ��Ȱ�ؼ� �����Ѵ�. 
INSERT ALL 
    INTO EMP_HIRE_DATE VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
    INTO EMP_MANAGER VALUES(EMP_ID,EMP_NAME,MANAGER_ID)
SELECT EMP_ID,EMP_NAME,HIRE_DATE,MANAGER_ID FROM EMPLOYEE;

-- ���ǿ� ���� �� ���̺� �����ϱ� - WHEN�� ������ش�. 
-- ǥ����
--INSERT ALL
 -- WHEN ���ǽ� THEN INTO ���̺�� VALUES(��, ��...)
 -- WHEN ���ǽ� THEN INTO ���̺�� VALUES(��, ��...)
 -- WHEN ���ǽ� THEN INTO ���̺�� VALUES(��, ��...)
 --SELECT��
-- 00�� ���� �Ի���,00�� ���� �Ի��ڸ� �и������ϱ�
CREATE TABLE OLD_EMP
AS SELECT EMP_ID,EMP_NAME,HIRE_DATE FROM EMPLOYEE WHERE 1=0;
CREATE TABLE NEW_EMP
AS SELECT EMP_ID,EMP_NAME,HIRE_DATE FROM EMPLOYEE WHERE 1=0;

INSERT ALL
    WHEN HIRE_DATE<'00/01/01' THEN INTO OLD_EMP VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
    WHEN HIRE_DATE>='00/01/01' THEN INTO NEW_EMP VALUES(EMP_ID,EMP_NAME,HIRE_DATE)
SELECT*FROM EMPLOYEE;
 -- �� �Ʒ��� TRUE�� �Ǵ� ���� TRUE�� �����Ͱ� ���Եȴ�. 
SELECT * FROM OLD_EMP; --00/01/01 ���� �Ի��ѻ��
SELECT * FROM NEW_EMP; --00/01/01 ���� �Ի��ѻ��

-- UPDATE�� Ȱ���ϱ�
-- ǥ����
-- UPDATE ���̺�� SET �÷���= ��[,�÷���=��][WHERE ���ǽ�]
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID,EMP_NAME,DEPT_CODE,JOB_CODE,SALARY,BONUS
FROM EMPLOYEE;
SELECT* FROM EMP_SALARY;
-- �������� �޿��� 300�������� �����ϱ�
UPDATE EMP_SALARY SET SALARY=3000000 WHERE EMP_NAME='������';
ROLLBACK; -- �ٽ� ���ư��� -- �����ؾ��� �� WHERE�� �Ⱦ��� ������ ��� 300�������� �ٲ�
-- �ټ��� �÷��� �����ϱ�
UPDATE EMP_SALARY SET SALARY=200,BONUS=0.5 WHERE EMP_NAME='������'; -- ������ ����200��, ���ʽ�0.5�� ������Ʈ �ϱ�
-- �������� ������ �÷��� �����ϱ�
-- ��ü ����� �޿��� 100�� ����
UPDATE EMP_SALARY SET SALARY=SALARY+100;
UPDATE EMP_SALARY SET DEPT_CODE='D'||SUBSTR(EMP_ID,3,1);

--���� Ǯ��
-- �������� ���� ����� �޿��� 50���� �ø��� ���ʽ��� 0.4�� �����ϱ�
UPDATE EMP_SALARY SET SALARY=SALARY+500000,BONUS=0.4 WHERE SUBSTR(EMP_NAME,1,1)='��';

-- UPDATE�� SELECT�� �̿��ϱ�
-- ������ �޿�,���ʽ��� �ɺ����� �����ϰ� �����ϱ�
-- �ɺ����� �޿��� �����ͼ� ������ �����ָ� ��!
UPDATE EMP_SALARY 
--    SET SALARY=(SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='�ɺ���'),
--        BONUS=(SELECT BONUS FROM EMPLOYEE WHERE EMP_NAME='�ɺ���') -- �̷��� ���� �ᵵ������ �Ʒ� ����ó���� ��
      SET(SALARY,BONUS)=(SELECT SALARY,BONUS FROM EMPLOYEE EMP_NAME='�ɺ���'); 
WHERE EMP_NAME='����';

-- MERGE : �� ���̺��� �����͸� ��ġ�� ��ɾ�
-- �������̺� �ٸ� ���̺��� ���� ���� -> ���ϰ��� ����(UPDATE), �������� ���� ���� �߰�(INSERT)
-- ǥ����
-- MERGE INTO �������̺� USING �ٸ����̺� ON ����
-- WHEN MATHCED/NOT MATHCED THEN ������ DML����(UPDATE,INSERT)
CREATE TABLE EMP_M1
AS SELECT*FROM EMPLOYEE;
CREATE TABLE EMP_M2
AS SELECT*FROM EMPLOYEE WHERE JOB_CODE='J4';

INSERT INTO EMP_M2 VALUES(999,'���¿�','961028-1234567','JEON@JOEN.COM','01012341234','D3','J4','S1',30,0.5,NULL,SYSDATE,DEFAULT,DEFAULT);
UPDATE EMP_M2 SET BONUS=0.3,SALARY=20 WHERE EMP_NAME!='���¿�';
--��ġ�� ���� ��ġ�� ��ɷ� �ٲ��� �����ؾ��� -> UPDATE SET
MERGE INTO EMPI_M1 USING EMP_M2 ON(EMP_M1,EMP_ID=EMP_M2,EMP_ID)
WHEN MATCHED THEN
 UPDATE SET 
  EMP_M1.BONUS=EMP_M2.BONUS,
  EMP_M1.SALARY=EMP_M2.SALARY
WHEN NOT MATCHED THEN 
  INSERT VALUES(EMP_M2.EMP_ID,EMP_M2.EMP_NAME,EMP_M2.EMP_NO,EMP_M2.EMAIL,
                 EMP_M2.PHONE,EMP_M2.DEPT_CODE,EMP_M2.JOB_CODE,EMP_M2.SAL_LEVEL,EMP_M2.BONUS,
                EMP_M2.MANAGER_ID,EMP_M2_HIRE_DATE,EMP_M2.ENT_DATE,EMP_M2.ENT_YN);
                
--DELETE�� Ȱ���ϱ�
-- ROW�� �����ϴ� ��ɾ�
-- DELETE FROM ���̺��[WHERE ���ǽ�]
DELETE FROM EMP_M1; --��ü�� �����ϰ� ���� �� 
ROLLBACK;
DELETE FROM EMP_M1 WHERE JOB_CODE='J4'; --> ���ǿ� ���� ������ ��

-- TRUNCATE
-- ��ü ROW�� ������ �� ����Ѵ�. 
TRUNCATE TABLE EMP_M1; -- �����߽��ϴٰ��ƴ� �߷Ƚ��ϴٷ� ��µ�(DELETE���� �ӵ��� �� ����)
-- ROLLBACK �ȵ�(�Ϸ��� �߱������ ������� �ʴ´�)


-- ---------------------------------------DDL(ALTER,DROP)
-- ALTER
-- ����Ŭ�� ���ǵǾ��ִ� OBJECT �� ������ �� ����ϴ� ��ɾ��̴�. 
-- DROP
-- ����Ŭ�� ���ǵǾ��ִ� OBJECT �� ������ �� ����ϴ� ��ɾ��̴�. 

-- ���̺� ������ ������ ����, �����ϱ�
-- ALTER OBJECT �� ���(ADD MODIFY...)
-- ���̺� ����
CREATE TABLE TBL_USERALTER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20),
    USER_PWD VARCHAR2(20)
);
-- ������ TBL_USERALTER���̺� �÷��� �߰��ϱ�
-- ALTER TABLE ���̺�� ADD(�÷��� Ÿ�� [��������])
-- ����Ǯ��
-- USER_NANE�̶�� ���ڿ� �÷� �߰��ϱ�
ALTER TABLE TBL_USERALTER ADD(USER_NAME VARCHAR2(20));
-- �������ǰ� ���� �÷� �߰��ϱ�
ALTER TABLE TBL_USERALTER ADD(GENDER VARCHAR(5) CHECK(GENDER IN('M','F')));
-- �÷��߰��� ���ǻ��� ! NOT NULLL���������� �����Ҷ�
INSERT INTO TBL_USERALTER VALUES(1,'ADMIN','1234','������','F');
INSERT INTO TBL_USERALTER VALUES(2,'USER01','1111','������','M');
-- NOT NULL ���������� �����Ҷ��� �Ϲ������� DEFAULT ���� �����Ѵ�. 
-- �ΰ��� �����͸� ������ ���¿��� �÷��� ������ ���� �ִ� �������� ���ο� �÷������� NULL�� �ֱ� ������ NOT NULL���������� ������ �� �����ؾ��Ѵ�.�̸����� ������ �޾ƾ��ϴ� ������ NOT NULL�÷����� EMAIL�� �����Ѵٸ� ������ �÷������Ͱ��� NULL�� �ڵ������� �Ǳ⶧���� ���������� ���� ����
ALTER TABLE TBL_USERALTER ADD(EMAIL VARCHAR2(100) NOT NULL); -- ���̺��� �ʼ� ���� �߰��ϱ� ���� (NOT NULL) ��� �־�� �մϴ� ���� �߻�
-- �ذ��� : DEFAULT ���� ����������� 
ALTER TABLE TBL_USERALTER ADD(EMAIL VARCHAR2(100) DEFAULT '�̼���' NOT NULL); -- �⺻����'�̼���'���� ��������⶧���� ������ �����ϰԵ�

-- �÷� �����ϱ� -> �ڷ���, ����
-- ǥ����
-- ALTER TABLE ���̺�� MODIFY �÷��� �ڷ���
-- TBL_USERALTER�� �ִ� �����͸� CHAR�� �ٲٱ�
-- ������ �� : �÷��ȿ� �ִ� �������� Ÿ���� �ٲٷ��� Ÿ������ �ٲٴ°��� �������� �����ؾ��� -> �̸����� NUMBER�� �ٲ� �� ����
DESC TBL_USERALTER;
ALTER TABLE TBL_USERALTER MODIFY GENDER CHAR(5);
-- ���� �ٲٱ�
ALTER TABLE TBL_USERALTER MODIFY USER_NAME VARCHAR2(100);

----- DROP
-- �÷� �����ϱ�
-- ALTER TABLE ���̺�� DROP COLUMN �÷���; 
-- TBL_USERALTER �� EMAIL�÷�, NAME�÷� �����
ALTER TABLE TBL_USERALTER DROP COLUMN EMAIL;
ALTER TABLE TBL_USERALTER DROP COLUMN USER_NAME;

-- �������� �߰��ϱ�
-- ADD CONSTRAINT ���
-- ǥ����
-- ALTER TABLE���̺�� ADD CONSTRAINT �������Ǹ� ��������(�÷���) -> ���̺������� �ۼ��� ���
-- TBL_USERALTER���̺��� USER_ID�� UNIQE,NOT NULL���������� �߰��ϱ� -- NOT NULL���������� �߰��Ҷ��� �߰��� �ƴ϶� ����!
ALTER TABLE TBL_USERALTER ADD CONSTRAINT UQ_USERID UNIQUE(USER_ID);
ALTER TABLE TBL_USERALTER ADD CONSTRAINT UQ_USERID NOT NULL(USER_ID);

-- �������� �����ϱ�
-- MODIFY �÷��� CONSTRAINT
-- ǥ����
-- ALTER TABLE ���̺�� MODIFY �÷��� CONSTRAINT �������Ǹ� ��������;
ALTER TABLE TBL_USERALTER MODIFY USER_ID CONSTRAINT NN_USERID NOT NULL;
INSERT INTO TBL_USERALTER VALUES(4,NULL,'2222','F');

-- �������� �����ϱ�
-- DROP CONSTRAINT
-- ǥ����
-- ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�;
-- TBL_USERALTER���̺��� USERID�� UNIQUE�������� �����ϱ�
ALTER TABLE TBL_USERALTER DROP CONSTRAINT UQ_USERID;

-- �÷���, �������Ǹ�, ���̺��, �����ϱ�
-- �÷��� ����
-- RENAME COLUMN ���
-- ǥ����
-- ALTER TABLE ���̺�� RENAME COLUMN ���� �÷��� TO �ٲ��÷���;
-- TBL_USERALTER���̺��� USER_IDFMF USERID�� �����ϱ�
ALTER TABLE TBL_USERALTER RENAME COLUMN USER_ID TO USERID;

-- �������� ����
-- RENAME CONSTRAINT ���
-- ǥ����
-- ALTER TABLE ���̺�� RENAME CONSTRAINT ���� �������Ǹ� TO �ٲ��������Ǹ�;
ALTER TABLE EMPLOYEE RENAME CONSTRAINT SYS_C007307 TO NN_EMPID;

-- ���̺�� �����ϱ�
-- ǥ����
-- ALTER TABLE  �������̺�� RENAME TO ���ο� ���̺��
ALTER TABLE TBL_USERALTER RENAME TO USERALTER;

--DROP ���̺��� ����
-- ǥ����
-- DROP TABLE ���̺��
DROP TABLE USERALTER;
DROP TABLE FK_BOARD; --�����Ǵ� Ű�� �ֱ⶧���� ���� ���� ����(�������迡�� �θ����̺��� �Ժη� ������ �� ����
DROP TABLE FK_BOARD CASCADE CONSTRAINTS; --> ���� �� ��������� ������

--DCL : DATA CONTROL LANGUAGE -> ����ڿ� ���� ���Ѽ��� ���� --------------------------------------------------------
-- ����ڰ����� ������ �ο�, ȸ���ϴ� ��ɾ�
-- GRANT : �����̳� ROLE �ο��ϴ� ��ɾ�
-- ǥ���� 
-- GRANT ���Ѹ�/ROLE��.���Ѹ�/ROLE��, ���Ѹ� ON ���̺� ����ڰ�����
-- REVOKE : �ο��� ����/ ROLE�� ȸ���ϴ� ��ɾ�
-- ǥ����
-- REVOKE ���Ѹ�/ROLE��,���Ѹ� ON ���̺�� FROM ����ڰ���

-- ���� : SELECT, INSERT, UPDATE, DELETE, CREATE VIEW....(������ �ִ� ������ ������ ������ ����)
-- ROLE(����) : �ټ��� ������ Ư���̸����� ��� ǥ��

-- �����ڰ����� ���� �� ������ �� ����
SELECT* FROM BS.EMPLOYEE; -- �տ� BS.�� �ٿ��� ��ȸ�ؾ���
SELECT* FROM MJ.TEST1;
INSERT INTO MJ.TEST1 VALUES('TEST',19);

--QWER/QWER : ��������
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER QWER IDENTIFIED BY QWER DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
SELECT* FROM DBA_USERS;
-- CONNECT, RESOURCE -> ROLE
SELECT*FROM DBA_SYS_PRIVS WHERE GRANTEE='RESOURSE';
SELECT*FROM DBA_SYS_PRIVS WHERE GRANTEE='CONNECT';

GRANT CONNECT,RESOURCE TO QWER; -- ó�� ���������Ҷ� ������Ѵ�. 

--QWER ����
SELECT* FROM TAB;
SELECT* FROM BS.EMPLOYEE; -- ��ȸ �ȵ�

--�����ڰ���
GRANT SELECT ON BS.EMPLOYEE TO QWER; 

-- QWER���� �����ڰ� BS.EMPLOYEE�� ������ �ο���
SELECT* FROM BS.EMPLOYEE; --��ȸ OK
-- ���� �����̳� �߰� ������ �ο��ؾ���
GRANT INSERT BS.EMPLOYEE TO QWER; --> �߰� �Է� ���Ѻο�

-- ���� ȸ��(������ ��������)
-- QWER���� ��� ������ �ٽ� ȸ����
REVOKE INSERT ON BS.EMPLOYEE FROM QWER;

-- ROLE �����ϱ�
CREATE ROLE MYROLE;
GRANT CREATE TABLE, CREATE VIEW TO MYROLE;
SELECT*FROM DBA_SYS_PRIVS WHERE GRANTEE='MYROLE'; --> MYROLE�� ������ �� �ִ� ������ ��

-- TCLƮ�������� �����ϴ� ��ɾ�
-- COMMIT,ROLLBACK
-- Ʈ������ : �ϳ��� �۾� ����-> ���α׷����� ���� �� �Ѱ��� ���񽺸� ���� DATA(ROW)�� �����ϴ� INSERT,UPDATE,DELETE������ ��� �۾������� ������ �����ϴ�.
INSERT INTO BS.TEMP_DEPT VALUES('D9','TRAN','90');
DELETE FROM BS.TMEP_DEPT WHERE DEPT_ID='D1';
SELECT*FROM BS.TEMP_DEPT;
--> �� ���ǿ����� �������� �ٸ� ���ǿ����� ������ ����
COMMIT; --> �ٸ� ���ǿ����� ����

















