--Chương 4. CÁC HÀM SQL
--1. Liệt kê tên nhân viên, mã phòng ban và lương nhân viên được tăng 15% (PCTSAL).
select DISTINCT deptno, ename,sal*0.15 as PCTSAL from emp
--2. Viết câu lệnh hiển thị như sau:
select concat(rpad(ename,7,'*') , lpad(job,9,'*')) as  Employee_and_job  from emp
--3. Viết câu lệnh hiển thị như sau:
select DISTINCT  ename || '  ' || '(' || INITCAP(job) || ')' from emp
--4. Viết câu lệnh hiển thị như sau:
select DISTINCT UPPER(ename) as Ename , deptno, initcap(job) as JOB from emp
--5. Tìm ngày thứ 6 đầu tiên cách 2 tháng so với ngày hiện tại hiển thị ngày dưới dạng 09
--February 1990. 
select  DISTINCT to_char(next_day( add_months(sysdate ,2) ,'FRIDAY')) as Frist_friday from emp
--6. Tìm thông tin về tên nhân viên, ngày gia nhập công ty của nhân viên phòng số 20,
--sao cho hiển thị như sau:
select DISTINCT ename, to_char(hiredate,'month-day-yyyy') as DATE_HIRED   from emp
--7. Hiển thị tên nhân viên, ngày gia nhập công ty, ngày xét nâng lương (sau ngày gia
--nhập công ty 1 năm), sắp xếp theo thứ tự ngày xét nâng lương.
select DISTINCT ename, hiredate, add_months(hiredate,12) as REVIEW
 from emp
 order by add_months(hiredate,12) asc
 --8. Hiển thị tên nhân viên và lương dưới dạng 
 select * from dept
select * from emp
select DISTINCT ename,
       case 
            when  sal > 1500 then  concat( sal,'')
            else 'BELOW 1500'
            end
        AS SALARY
from emp
--9. Cho biết thứ của ngày hiện tại 
select DISTINCT to_char(sysdate ,'DAY') as MY_Date from emp
--10. Đưa chuỗi dưới dạng nn/nn, kiểm tra nếu khúng khuôn dạng trả lời là YES, ngược lại
--là NO. Kiểm tra với các chuỗi 12/34, 01/1a, 99\88
--VALUE VALID? 

--11. Hiển thị tên nhân viên, ngày gia nhập công ty, ngày lĩnh lương sao cho ngày lĩnh
--lương phải vào thứ 6, nhân viên chỉ được nhận lương sau ít nhất 15 ngày làm việc tại
--công ty, sắp xếp theo thứ tự ngày gia nhập công ty
select DISTINCT ename,add_months(hiredate,12) as REVIEW,next_day(hiredate,'FRIDAY') as DATE_SAL
from emp
where extract( day from next_day(hiredate,'FRIDAY')) in (1,15)
order by add_months(hiredate,12) asc
--4.5.2. Hàm trên nhóm dữ liệu 
--1. Tìm lương thấp nhất, lớn nhất và lương trung bình của tất cả các nhân viên
select min(sal) as MIN_SAL , max(sal) as MAX_SAL, to_char(  avg(sal) ,'9,9999999')AVG_SAL
from emp 
--2. Tìm lương nhỏ nhất và lớn của mỗi loại nghề nghiệp
select min(sal)MIN_SAL_JOB
from emp
group by job
--3. Tìm xem có bao nhiêu giám đốc trong danh sách nhân viên. 
select count(empno)COUNT_PRESIDENT
from emp
where job like 'PRESIDENT'
--4. Tìm tất cả các phòng ban mà số nhân viên trong phòng >3
select deptno
from emp
group by deptno
having count(ename) >3

--5. Tìm ra mức lương nhỏ nhất của mỗi nhân viên làm việc cho một giám đốc nào đó
--sắp xếp theo thứ tự tăng dần của mức lương.
select min(sal) 
from emp
where job != 'PRESIDENT'
group by deptno 
having job 