
--Chương 3. TRUY VẤN DỮ LIỆU CÓ ĐIỀU KIỆN
--1. Chọn nhân viên trong bảng EMP có mức lương từ 1000 đến 2000 (chọn các trường
--ENAME, DEPTNO, SAL). 
select ename,DEPTNO ,SAL from emp
where sal BETWEEN 1000 AND 2000
--2. Hiển thị mã phòng ban, tên phòng ban, sắp xếp theo thứ tự tên phòng ban
select DISTINCT  DEPTNO, ENAME from emp
order by ENAME ASC
--3. Hiển thị danh sách những nhân viên làm tại phòng 10 và 20 theo thứ tự A,B,C 
select ename from emp
where deptno = 10  or deptno =20
order by ename  asc
--4. Hiển thị tên và nghề nghiệp những nhân viên làm nghề thư ký (cleck) tại phòng 20
select ename,job from emp
where deptno =20 and job like 'CLERK'
--5. Hiển thị tất cả những nhân viên mà tên có các ký tự TH và LL
select ename from emp
where ename like '%TH%' or ename like '%LL%'
--6. Hiển thị tên nhân viên, nghề nghiệp, lương của những nhân viên có giám đốc quản seleclý.
select  DISTINCT ename, job,sal from emp
where job != 'PRESIDENT'
--7. Hiển thị tên nhân viên, mã phòng ban, ngày gia nhập công ty sao cho gia nhập công ty trong năm 1983. 
select ename, empno, hiredate from emp
where extract(year from hiredate) =1983
--8. Hiển thị tên nhân viên, lương một năm (ANUAL_SAL ), thưởng sao cho lương lớn
--hơn thưởng và nghề nghiệp là SALEMAN, sắp theo thứ tự lương giảm dần và tên tăng dần. 
SELECT  ENAME, SAL*12 as ANUAL_SAL,COMM FROM EMP
where job like 'SALESMAN' and sal>comm
order by sal desc, ename asc
