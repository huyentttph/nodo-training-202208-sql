--Chương 2. LỆNH TRUY VẤN CƠ BẢN
--Cau 1. Chọn toàn bộ thông tin trong bảng SALGRADE
SELECT * FROM SALGRADE
--Câu 2: Chọn toàn bộ thông tin trong bảng EMP
SELECT * FROM EMP
--Câu 3:3. Hiển thị mọi loại nghề nghiệp
SELECT DISTINCT  JOB FROM EMP
--4. Hiển thị tên nhân viên và thu nhập trong một năm (REMUNERATION)
SELECT DISTINCT  ENAME, SAL*12 as REMUNERATION FROM EMP
--5. Hiển thị theo nội dung dưới đây 
SELECT DISTINCT   ENAME || ' HAS HELP THE POSITION OF ' || JOB 
||' IN DEPT ' || DEPTNO || ' SINCE ' || to_char( HIREDATE, 'dd-MM-yyyy') FROM EMP
--6. Hiển thị cấu trúc bảng emp
DESC EMP 
--Cách 2 
DESCRIBE EMP
--7. Thay đổi nhãn và định dạng hiển thị của cột sal và hiredate trong bảng emp;
ALTER TABLE EMP
RENAME COLUMN SALARY to SAL
ALTER TABLE EMP
RENAME COLUMN  HIREDATE1 TO HIREDATE
--
SELECT DISTINCT  to_char(SAL, '9,999$') as Luong ,to_char(HIREDATE , 'dd/MM/yyyy') as Ngay FROM EMP


