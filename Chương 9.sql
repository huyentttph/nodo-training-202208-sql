--Chương 9. SEQUENCE VÀ INDEX
--1. Tạo Index trên cột PROJID cho bảng ASSIGNMENT. 
CREATE INDEX index_PROJID_SSIGNMENTS_HUYEN
ON ASSIGNMENTS_HUYEN ( PROJID );
--2. Hiển thị danh sách của nhân viên thuộc sự quản lý của người có tên là 1 biến được
--nhập từ bàn phím
--EMPNO ENAME JOB MGR HIREDATE SAL COMM DEPTNO
--7698 BLAKE MANAGER 7839 01-05-1981 2850 30
--7654 MARTIN SALESMAN 7698 28-09-1981 1250 1400 30
--7499 ALLEN SALESMAN 7698 20-02-1981 1600 300 30
--7844 TURNER SALESMAN 7698 08-09-1981 1500 0 30
--7900 JAMES CLERK 7698 03-12-1981 950 30
--7521 WARD SALESMAN 7698 22-02-1981 1250 500 30
select e.ename EMP_NAME, e.empno EMP_EMPNO,e.job EMP_JOB,m.ename MGR_NAME,
from emp e, emp m 
where  e.mgr = m.empno and m.ename = &Condition 


