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