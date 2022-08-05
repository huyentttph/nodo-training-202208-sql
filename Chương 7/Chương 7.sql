--Chương 7. TABLE VÀ CÁC LỆNH SQL VỀ TABLE 
--1. Tạo bảng PROJECT với các column được chỉ ra dưới đây, PROJID là promary key, và
--P_END_DATE > P_START_DATE.
create table PROJECT_HUYEN
(
PROJID NUMBER(4) not null CONSTRAINT  PK_PROJECT_HUYEN PRIMARY KEY, 
P_DESC VARCHAR2(20),
P_END_DATE date ,
P_START_DATE date ,
BUDGET_AMOUNT NUMBER(7,2),
MAX_NO_STAFF NUMBER (2),
check (P_END_DATE > P_START_DATE)
);


--2. Tạo bảng ASSIGNMENTS với các column được chỉ ra dưới đây, đồng thời cột
--PROJID là foreign key tới bảng PROJECT, cột EMPNO là foreign key tới bảng EMP. 
create table ASSIGNMENTS_HUYEN
(
PROJID NUMBER(4) not null CONSTRAINT  FK_ASSIGNMENTS_HUYEN  REFERENCES SCOTT.PROJECT_HUYEN(PROJID) , 
EMPNO number (4 )not null,
A_START_DATE date ,
A_END_DATE date ,
BILL_RATE NUMBER(4,2),
ASSIGN_TYPE varchar2 (2)
);


--3. Thêm column COMMENTS kiểu LONG vào bảng PROJECTS. Thêm column HOURS kiểu
--NUMBER vào bảng ASSIGNMENTS. 
alter table PROJECT_HUYEN
add (
COMMENTS  Long
)

alter table ASSIGNMENTS_HUYEN
add (
HOURS  NUMBER 
)

--4. Sử dụng view USER_OBJECTS hiển thị tất cả các đối tượng user sở hữu.

DESCRIBE USER_OBJECT;
--5. Thêm ràng buộc duy nhất (UNIQUE) cho 2 column PROJECT_ID và EMPNO của bảngASSIGNMENTS.
alter table ASSIGNMENTS_HUYEN
MODIFY(
CONSTRAINT UNQ_ASSIGNMENTS_HUYEN UNIQUE(PROJID, EMPNO) 
)

--6. Xem các thông tin về các ràng buộc trong USER_CONSTRAINTS.

select * from USER_CONSTRAINTS

--7. Xem trong USER hiện tại có tất cả bao nhiêu bảng. 

 SELECT count(TABLE_NAME) COUNT_TABLE FROM DICTIONARY;