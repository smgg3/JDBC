
//Create tables

SQL> create table dept(
  2    deptno     number(2,0),
  3    dname      varchar2(14),
  4    loc        varchar2(13),
  5    constraint pk_dept primary key (deptno)
  6  );
 SQL> create table emp(
  2    empno    number(4,0),
  3    ename    varchar2(10),
  4    job      varchar2(9),
  5    mgr      number(4,0),
  6    hiredate date,
  7    sal      number(7,2),
  8    comm     number(7,2),
  9    deptno   number(2,0),
 10    constraint pk_emp primary key (empno),
 11    constraint fk_deptno foreign key (deptno) references dept (deptno)
 12  );
 
 //insert values dept
 SQL> insert into DEPT (DEPTNO, DNAME, LOC)
  2  values(10, 'ACCOUNTING', 'NEW YORK');

  SQL> insert into dept
  2  values(20, 'RESEARCH', 'DALLAS');
  
  SQL> insert into dept
  2  values(30, 'SALES', 'CHICAGO')
  3  ;
  
  SQL> insert into dept
  2  values(40, 'OPERATIONS', 'BOSTON');
  
  //insert values into emp
  
  SQL> insert into emp
  2  values(
  3   7839, 'KING', 'PRESIDENT', null,
  4   to_date('17-11-1981','dd-mm-yyyy'),
  5   5000, null, 10
  6  );
  
  SQL> insert into emp
  2  values(
  3   7698, 'BLAKE', 'MANAGER', 7839,
  4   to_date('1-5-1981','dd-mm-yyyy'),
  5   2850, null, 30
  6  );
  
  SQL> insert into emp
  2  values(
  3   7782, 'CLARK', 'MANAGER', 7839,
  4   to_date('9-6-1981','dd-mm-yyyy'),
  5   2450, null, 10
  6  );
  
  SQL> insert into emp
  2  values(
  3   7566, 'JONES', 'MANAGER', 7839,
  4   to_date('2-4-1981','dd-mm-yyyy'),
  5   2975, null, 20
  6  );
  
  SQL> insert into emp
  2  values(
  3   7788, 'SCOTT', 'ANALYST', 7566,
  4   to_date('13-JUL-87','dd-mm-rr') - 85,
  5   3000, null, 20
  6  );
  
  SQL> insert into emp
  2  values(
  3   7902, 'FORD', 'ANALYST', 7566,
  4   to_date('3-12-1981','dd-mm-yyyy'),
  5   3000, null, 20
  6  );
  
  SQL> insert into emp
  2  values(
  3   7369, 'SMITH', 'CLERK', 7902,
  4   to_date('17-12-1980','dd-mm-yyyy'),
  5   800, null, 20
  6  );
  
  SQL> insert into emp
  2  values(
  3   7499, 'ALLEN', 'SALESMAN', 7698,
  4   to_date('20-2-1981','dd-mm-yyyy'),
  5   1600, 300, 30
  6  );
  
  SQL> insert into emp
  2  values(
  3   7521, 'WARD', 'SALESMAN', 7698,
  4   to_date('22-2-1981','dd-mm-yyyy'),
  5   1250, 500, 30
  6  );

  SQL> insert into emp
  2  values(
  3   7654, 'MARTIN', 'SALESMAN', 7698,
  4   to_date('28-9-1981','dd-mm-yyyy'),
  5   1250, 1400, 30
  6  );
  
  SQL> insert into emp
  2  values(
  3   7844, 'TURNER', 'SALESMAN', 7698,
  4   to_date('8-9-1981','dd-mm-yyyy'),
  5   1500, 0, 30
  6  );
  
  SQL> insert into emp
  2  values(
  3   7876, 'ADAMS', 'CLERK', 7788,
  4   to_date('13-JUL-87', 'dd-mm-rr') - 51,
  5   1100, null, 20
  6  );
  
  SQL> insert into emp
  2  values(
  3   7900, 'JAMES', 'CLERK', 7698,
  4   to_date('3-12-1981','dd-mm-yyyy'),
  5   950, null, 30
  6  );
  
  SQL> insert into emp
  2  values(
  3   7934, 'MILLER', 'CLERK', 7782,
  4   to_date('23-1-1982','dd-mm-yyyy'),
  5   1300, null, 10
  6  );
  
  SQL> select ename, dname, job, empno, hiredate, loc
  2  from emp, dept
  3  where emp.deptno = dept.deptno
  4  order by ename;
  
  ENAME      DNAME          JOB            EMPNO HIREDATE  LOC
---------- -------------- --------- ---------- --------- -------------
ADAMS      RESEARCH       CLERK           7876 23-MAY-87 DALLAS
ALLEN      SALES          SALESMAN        7499 20-FEB-81 CHICAGO
BLAKE      SALES          MANAGER         7698 01-MAY-81 CHICAGO
CLARK      ACCOUNTING     MANAGER         7782 09-JUN-81 NEW YORK
FORD       RESEARCH       ANALYST         7902 03-DEC-81 DALLAS
JAMES      SALES          CLERK           7900 03-DEC-81 CHICAGO
JONES      RESEARCH       MANAGER         7566 02-APR-81 DALLAS
KING       ACCOUNTING     PRESIDENT       7839 17-NOV-81 NEW YORK
MARTIN     SALES          SALESMAN        7654 28-SEP-81 CHICAGO
MILLER     ACCOUNTING     CLERK           7934 23-JAN-82 NEW YORK
SCOTT      RESEARCH       ANALYST         7788 19-APR-87 DALLAS

ENAME      DNAME          JOB            EMPNO HIREDATE  LOC
---------- -------------- --------- ---------- --------- -------------
SMITH      RESEARCH       CLERK           7369 17-DEC-80 DALLAS
TURNER     SALES          SALESMAN        7844 08-SEP-81 CHICAGO
WARD       SALES          SALESMAN        7521 22-FEB-81 CHICAGO

14 rows selected.

SQL> select dname, count(*) count_of_employees
  2  from dept, emp
  3  where dept.deptno = emp.deptno
  4  group by DNAME
  5  order by 2 desc;
  
  DNAME          COUNT_OF_EMPLOYEES
-------------- ------------------
SALES                           6
RESEARCH                        5
ACCOUNTING                      3