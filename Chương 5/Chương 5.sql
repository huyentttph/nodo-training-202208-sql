--Chương 5. LỆNH TRUY VẤN DỮ LIỆU MỞ RỘNG
select * from dept
select * from emp
select * from salgrade
--1. Hiển thị toàn bộ tên nhân viên và tên phòng ban làm việc sắp xếp theo tên phòng ban.
select DISTINCT ename
from emp e , dept d
where e.deptno = d.deptno
--2. Hiển thị tên nhân viên, vị trí địa lý, tên phòng với điều kiện lương >1500. 
select DISTINCT e.ename, d.loc,d.dname
from emp e , dept d
where e.deptno = d.deptno
--3. Hiển thị tên nhân viên, nghề nghiệp, lương và mức lương
select DISTINCT e.ename,e.job,e.sal ,s.grade
from emp e , dept d, salgrade s
where e.deptno = d.deptno and (e.sal>=s.LOSAL  and e.sal<=HISAL)
--4. Hiển thị tên nhân viên, nghề nghiệp, lương và mức lương, với điều kiện mức lương=3.
select DISTINCT e.ename, e.job,e.sal,s.grade
from emp e, salgrade s
where e.sal>1401 and e.sal<2000  
--5. Hiển thị những nhân viên tại DALLAS
select DISTINCT e.ename, d.loc,e.sal
from emp e, dept d
where d.loc like 'DALLAS'
--6.Hiển thị tên nhân viên , nghề nghiệp, lương, mức lương, tên phòng làm việc trừ nhân
--viên có nghề là cleck và sắp xếp theo chiều giảm. 
select DISTINCT e.ename, e.job, e.sal,s.grade,d.dname
from emp e, dept d, salgrade s
where e.deptno = d.deptno  and (e.sal>=s.LOSAL  and e.sal<=HISAL)
--7. Hiển thị chi tiết về những nhân viên kiếm được 36000 $ 1 năm hoặc nghề là cleck.
--(gồm các trường tên, nghề, thu nhập, mã phòng, tên phòng, mức lương)
select DISTINCT e.ename,e.job,e.sal,e.deptno,d.dname,s.grade
from emp e, dept d,salgrade s
where e.sal*12 =36000 or e.job like 'CLERK' and (e.sal>=s.LOSAL  and e.sal<=HISAL)

--Ví dụ
Select job from emp where deptno = 10
Union 
Select job from emp where deptno = 30;
select *from emp
select ename, job
from emp
where job = (select job from emp where ename = 'BLAKE'); 

--8. Hiển thị những phòng không có nhân viên nào làm việc. 
SELECT DEPTNO, DNAME,LOC
FROM DEPT D
WHERE not exists (SELECT * FROM EMP E
WHERE D.DEPTNO = E.DEPTNO)

select d.deptno, d.dname, d.loc
from dept d 
where d.deptno not EXISTS (select deptno from emp)
--9. Hiển thị mã nhân viên, tên nhân viên, mã người quản lý, tên người quản lý
select e.ename as EMP_NAME, e.empno as EMP_EMP, e.mgr as EPM_mgr ,m.ename MGR_NAME
from emp e, emp m
where e.mgr = m.empno
--10. Như câu 9 hiển thị thêm thông tin về ông KING
select e.ename as EMP_NAME, e.sal as EMP_SAL ,m.ename MGR_NAME,m.sal MGR_SAL
from emp e, emp m
where e.mgr = m.empno

--11. Hiển thị nghề nghiệp được tuyển dụng vào năm 1981 và không được tuyển dụng vào năm 1994. 
select * from emp
select distinct job
from emp 
where job in(select job from emp where extract(year from hiredate ) =1981)
and job not in(select job from emp where extract(year from hiredate ) =19941)
--12. Tìm những nhân viên gia nhập công ty trước giám đốc của họ. 
select e.ename EMP_NAME
from emp e, emp m
where e.deptno = m.deptno and m.job like'PRESIDENT'
and  extract(year from e.hiredate)< extract(year from m.hiredate)
--13. Tìm tất cả các nhân viên, ngày gia nhập công ty, tên nhân viên, tên người giám đốc
--và ngày gia nhập công ty của người giám đốc ấy
select e.ename EML_NAME, e.hiredate EMP_DATE,m.ename MGR_NAME ,m.hiredate MGR_HIREDATE
from emp e,emp m
where e.deptno = m.deptno and m.job like'PRESIDENT'
--14. Tìm những nhân viên kiếm được lương cao nhất trong mỗi loại nghề nghiệp
select distinct m.job, max(m.sal), e.ename
from emp e, emp m
where e.job=m.job
group by m.job,e.ename
--15. Tìm mức lương cao nhất trong mỗi phòng ban, sắp xếp theo thứ tự phòng ban. 
select deptno,max(sal)
from emp
group by deptno
order by deptno asc
--16. Tìm nhân viên gia nhập vào phòng ban sớm nhất 
select distinct m.deptno, min(m.hiredate), e.ename
from emp e, emp m
where e.deptno=m.deptno
group by m.deptno,e.ename

--17. Hiển thị những nhân viên có mức lương lớn hơn lương TB của phòng ban mà họ làm việc. 
select distinct e.empno,e.ename, e.sal ,m.deptno
from emp e, emp m
where e.DEPTNO=m.DEPTNO 
group by m.deptno, e.empno,e.ename, e.sal 
having e.sal > avg(m.sal)

--18. Hiển thị tên nhân viên, mã nhân viên, mã giám đốc, tên giám đốc, phòng ban làm
--việc của giám đốc, mức lương của giám đốc.

select * from emp

select e.empno EMP_NUMBER, e.ename EMP_NAME, e.sal EMP_SAL, p.empno MGR_NUMBER,p.ename MGR_NAME ,s.grade MGR_GRADE
from emp e, emp p, salgrade s
where e.DEPTNO=p.DEPTNO and p.job like 'MANAGER'  and (p.sal>=s.LOSAL  and p.sal<=HISAL)