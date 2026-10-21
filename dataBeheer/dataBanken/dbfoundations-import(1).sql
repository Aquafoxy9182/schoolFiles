-- !!! OPGELET !!!
-- Als er reeds een database met de naam "dbfoundations" bestaat op je MySQL-server,
-- dan zal deze VERWIJDERD en OVERSCHREVEN worden.

DROP DATABASE IF EXISTS dbfoundations;

-- ***************************************************************
-- This script creates and populates all sample tables (and the one view)
-- of the DATABASE FOUNDATIONS Oracle Academy course.
-- This SQL-script is optimized for a MySQL Server.
-- For other SQL-flavours (Oracle, Microsoft SQL Server, PostgreSQL, ...)
-- this script will probably need some small changes.
-- ***************************************************************

CREATE DATABASE dbfoundations;
USE dbfoundations;

CREATE TABLE regions 
   ( region_id  DECIMAL NOT NULL,
     region_name  VARCHAR(25),
     CONSTRAINT  REG_ID_PK  PRIMARY KEY ( region_id )
   );
   
CREATE TABLE   countries 
   ( country_id  CHAR(2) NOT NULL,
     country_name  VARCHAR(40),
     region_id  DECIMAL,
     CONSTRAINT  COUNTRY_C_ID_PK  PRIMARY KEY ( country_id ) 
   );
ALTER TABLE   countries  ADD CONSTRAINT  COUNTR_REG_FK  FOREIGN KEY ( region_id ) REFERENCES   regions  ( region_id ) ;
   
CREATE TABLE   locations 
   ( location_id  DECIMAL(4,0),
     street_address  VARCHAR(40),
     postal_code  VARCHAR(12),
     city  VARCHAR(30) NOT NULL,
     state_province  VARCHAR(25),
     country_id  CHAR(2),
    CONSTRAINT  LOC_ID_PK  PRIMARY KEY ( location_id )
   );
ALTER TABLE   locations  ADD CONSTRAINT  LOC_C_ID_FK  FOREIGN KEY ( country_id ) REFERENCES   countries  ( country_id ) ;
CREATE INDEX   LOC_CITY_IX  ON   locations  ( city );
CREATE INDEX   LOC_COUNTRY_IX  ON   locations  ( country_id );
CREATE INDEX   LOC_STATE_PROVINCE_IX  ON   locations  ( state_province );

CREATE TABLE   departments 
   ( department_id  DECIMAL(4,0),
     department_name  VARCHAR(30) NOT NULL,
     manager_id  DECIMAL(6,0),
     location_id  DECIMAL(4,0),
     CONSTRAINT  DEPT_ID_PK  PRIMARY KEY ( department_id )
   );
ALTER TABLE   departments  ADD CONSTRAINT  DEPT_LOC_FK  FOREIGN KEY ( location_id ) REFERENCES   locations  ( location_id ) ;
CREATE INDEX   DEPT_LOCATION_IX  ON   departments  ( location_id );
    
CREATE TABLE   jobs 
   ( job_id  VARCHAR(10),
     job_title  VARCHAR(35) NOT NULL,
     min_salary  DECIMAL(6,0),
     max_salary  DECIMAL(6,0),
     CONSTRAINT  JOB_ID_PK  PRIMARY KEY ( job_id )
   );
    
CREATE TABLE   employees 
   ( employee_id  DECIMAL(6,0),
     first_name  VARCHAR(20),
     last_name  VARCHAR(25) NOT NULL,
     email  VARCHAR(25) NOT NULL,
     phone_number  VARCHAR(20),
     hire_date  DATE NOT NULL,
     job_id  VARCHAR(10) NOT NULL,
     salary  DECIMAL(8,2),
     commission_pct  DECIMAL(2,2),
     manager_id  DECIMAL(6,0),
     department_id  DECIMAL(4,0),
     bonus  VARCHAR(5),
     CONSTRAINT  EMP_SALARY_MIN  CHECK (salary > 0) ,
     CONSTRAINT  EMP_ID_PK  PRIMARY KEY ( employee_id ) ,
     CONSTRAINT  EMP_EMAIL_UK  UNIQUE ( email )
  );
ALTER TABLE   employees  ADD CONSTRAINT  EMP_DEPT_FK  FOREIGN KEY ( department_id ) REFERENCES   departments  ( department_id ) ;
ALTER TABLE   employees  ADD CONSTRAINT  EMP_job_FK  FOREIGN KEY ( job_id ) REFERENCES   jobs  ( job_id ) ;
ALTER TABLE   employees  ADD CONSTRAINT  EMP_manager_FK  FOREIGN KEY ( manager_id ) REFERENCES   employees  ( employee_id ) ;
--  ALTER TABLE   DEPARTMENTS  ADD CONSTRAINT  DEPT_MGR_FK  FOREIGN KEY ( manager_id ) REFERENCES   EMPLOYEES  ( employee_id ) DISABLE; (= Oracle code)
--  In MySQL we can't DISABLE/ENABLE a foreign key.
--  So, we choose not to create this foreign key here,
--  but to create it later on.
CREATE INDEX   EMP_department_IX  ON   employees  ( department_id );
CREATE INDEX   EMP_job_IX  ON   employees  ( job_id );
CREATE INDEX   EMP_manager_IX  ON   employees  ( manager_id );
CREATE INDEX   EMP_NAME_IX  ON   employees  ( last_name ,  first_name );

CREATE TABLE   job_grades 
   ( grade_level  VARCHAR(3),
     lowest_sal  REAL,
     highest_sal  REAL
   );

CREATE TABLE   job_history 
   ( employee_id  DECIMAL(6,0) NOT NULL,
     start_date  DATE NOT NULL,
     end_date  DATE NOT NULL,
     job_id  VARCHAR(10) NOT NULL,
     department_id  DECIMAL(4,0),
     CONSTRAINT  JHIST_DATE_INTERVAL  CHECK (end_date > start_date) ,
     CONSTRAINT  JHIST_EMP_ID_ST_DATE_PK  PRIMARY KEY ( employee_id ,  start_date )
   );
ALTER TABLE   job_history  ADD CONSTRAINT  JHIST_DEPT_FK  FOREIGN KEY ( department_id ) REFERENCES   departments  ( department_id ) ;
-- In the original Oracle code, 
-- the folowing FK constraint is disabled as table contains historical data for employees that are not in the current employees table
-- ALTER TABLE   job_HISTORY  ADD CONSTRAINT  JHIST_EMP_FK  FOREIGN KEY ( employee_id ) REFERENCES   EMPLOYEES  ( employee_id ) DISABLE;
ALTER TABLE   job_history  ADD CONSTRAINT  JHIST_job_FK  FOREIGN KEY ( job_id ) REFERENCES   jobs  ( job_id ) ;
CREATE INDEX   JHIST_department_IX  ON   job_history  ( department_id );
CREATE INDEX   JHIST_EMPLOYEE_IX  ON   job_history  ( employee_id );
CREATE INDEX   JHIST_job_IX  ON   job_history  ( job_id );

-- populate regions table
INSERT INTO regions (region_id, region_name) Values(1,'Europe');
INSERT INTO regions (region_id, region_name) Values(2,'Americas');
INSERT INTO regions (region_id, region_name) Values(3,'Asia');
INSERT INTO regions (region_id, region_name) Values(4,'Middle East and Africa');

-- populate countries table
INSERT INTO countries (country_id, country_name, region_id) Values('CA','Canada',2);
INSERT INTO countries (country_id, country_name, region_id) Values('DE','Germany',1);
INSERT INTO countries (country_id, country_name, region_id) Values('UK','United Kingdom',1);
INSERT INTO countries (country_id, country_name, region_id) Values('US','United States of America',2);

-- populate locations table
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) Values(1800,'460 Bloor St. W.','ON M5S 1X8','Toronto','Ontario','CA');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) Values(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) Values(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) Values(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) Values(1700,'2004 Charade Rd','98199','Seattle','Washington','US');

-- populate departments table
INSERT INTO departments (department_id, department_name, manager_id, location_id) Values(10,'Administration',200,1700);
INSERT INTO departments (department_id, department_name, manager_id, location_id) Values(20,'Marketing',201,1800);
INSERT INTO departments (department_id, department_name, manager_id, location_id) Values(50,'Shipping',124,1500);
INSERT INTO departments (department_id, department_name, manager_id, location_id) Values(60,'IT',103,1400);
INSERT INTO departments (department_id, department_name, manager_id, location_id) Values(80,'Sales',149,2500);
INSERT INTO departments (department_id, department_name, manager_id, location_id) Values(90,'Executive',100,1700);
INSERT INTO departments (department_id, department_name, manager_id, location_id) Values(110,'Accounting',205,1700);
INSERT INTO departments (department_id, department_name, manager_id, location_id) Values(190,'Contracting',null,1700);

-- populate jobs table
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('AD_PRES','President',20000,40000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('AD_VP','Administration Vice President',15000,30000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('SA_MAN','Sales Manager',10000,20000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('SA_REP','Sales Representative',6000,12000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('ST_MAN','Stock Manager',5500,8500);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('ST_CLERK','Stock Clerk',2000,5000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('IT_PROG','Programmer',4000,10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) Values('MK_REP','Marketing Representative',4000,9000);

-- populate employees table
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(100,'Steven','King','SKING','515.123.4567',STR_TO_DATE('1987-06-17','%Y-%m-%d'),'AD_PRES',24000,null,null,90);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(101,'Neena','Kochhar','NKOCHHAR','515.123.4568',STR_TO_DATE('1989-09-21','%Y-%m-%d'),'AD_VP',17000,null,100,90 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(102,'Lex','De Haan','LDEHAAN','515.123.4569',STR_TO_DATE('1993-01-13','%Y-%m-%d'),'AD_VP',17000,null,100,90 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(200,'Jennifer','Whalen','JWHALEN','515.123.4444',STR_TO_DATE('1987-09-17','%Y-%m-%d'),'AD_ASST',4400,null,101,10 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(205,'Shelley','Higgins','SHIGGINS','515.123.8080',STR_TO_DATE('1994-06-07','%Y-%m-%d'),'AC_MGR',12000,null,101,110 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(206,'William','Gietz','WGIETZ','515.123.8181',STR_TO_DATE('1994-06-07','%Y-%m-%d'),'AC_ACCOUNT',8300,null,205,110 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
VALUES(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',STR_TO_DATE('2000-01-29','%Y-%m-%d'),'SA_MAN',10500,.2,100,80, '1500' );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
VALUES(174,'Ellen','Abel','EABEL','011.44.1644.429267',STR_TO_DATE('1996-05-11','%Y-%m-%d'),'SA_REP',11000,.3,149,80,'1700' );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id, bonus)
VALUES(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',STR_TO_DATE('1998-03-24','%Y-%m-%d'),'SA_REP',8600,.2,149,80,'1250' );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(178,'Kimberely','Grant','KGRANT','011.44.1644.429263',STR_TO_DATE('1999-05-24','%Y-%m-%d'),'SA_REP',7000,.15,149,null );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(124,'Kevin','Mourgos','KMOURGOS','650.123.5234',STR_TO_DATE('1999-11-16','%Y-%m-%d'),'ST_MAN',5800,null,100,50);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(141,'Trenna','Rajs','TRAJS','650.121.8009',STR_TO_DATE('1995-10-17','%Y-%m-%d'),'ST_CLERK',3500,null,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(142,'Curtis','Davies','CDAVIES','650.121.2994',STR_TO_DATE('1997-01-29','%Y-%m-%d'),'ST_CLERK',3100,null,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(143,'Randall','Matos','RMATOS','650.121.2874',STR_TO_DATE('1998-03-15','%Y-%m-%d'),'ST_CLERK',2600,null,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(144,'Peter','Vargas','PVARGAS','650.121.2004',STR_TO_DATE('1998-07-09','%Y-%m-%d'),'ST_CLERK',2500,null,124,50 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(103,'Alexander','Hunold','AHUNOLD','590.423.4567',STR_TO_DATE('1990-01-03','%Y-%m-%d'),'IT_PROG',9000,null,102,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(104,'Bruce','Ernst','BERNST','590.423.4568',STR_TO_DATE('1991-05-21','%Y-%m-%d'),'IT_PROG',6000,null,103,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(107,'Diana','Lorentz','DLORENTZ','590.423.5567',STR_TO_DATE('1999-02-07','%Y-%m-%d'),'IT_PROG',4200,null,103,60 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(201,'Michael','Hartstein','MHARTSTE','515.123.5555',STR_TO_DATE('1996-02-17','%Y-%m-%d'),'MK_MAN',13000,null,100,20 );
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id)
VALUES(202,'Pat','Fay','PFAY','603.123.6666',STR_TO_DATE('1997-08-17','%Y-%m-%d'),'MK_REP',6000,null,201,20 );

-- populate job_history table
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(200,STR_TO_DATE('09-17-1987','%m-%d-%Y'),STR_TO_DATE('06-17-1993','%m-%d-%Y'),'AD_ASST',90 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(101,STR_TO_DATE('10-28-1993','%m-%d-%Y'),STR_TO_DATE('03-15-1997','%m-%d-%Y'),'AC_MGR',110 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(200,STR_TO_DATE('07-01-1994','%m-%d-%Y'),STR_TO_DATE('12-31-1998','%m-%d-%Y'),'AC_ACCOUNT',90 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(101,STR_TO_DATE('09-21-1989','%m-%d-%Y'),STR_TO_DATE('10-27-1993','%m-%d-%Y'),'AC_ACCOUNT',110 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(176,STR_TO_DATE('01-01-1999','%m-%d-%Y'),STR_TO_DATE('12-31-1999','%m-%d-%Y'),'SA_MAN',80 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(176,STR_TO_DATE('03-24-1998','%m-%d-%Y'),STR_TO_DATE('12-31-1998','%m-%d-%Y'),'SA_REP',80 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(122,STR_TO_DATE('01-01-1999','%m-%d-%Y'),STR_TO_DATE('12-31-1999','%m-%d-%Y'),'ST_CLERK',50 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(114,STR_TO_DATE('03-24-1998','%m-%d-%Y'),STR_TO_DATE('12-31-1999','%m-%d-%Y'),'ST_CLERK',50 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(102,STR_TO_DATE('01-13-1993','%m-%d-%Y'),STR_TO_DATE('07-24-1998','%m-%d-%Y'),'IT_PROG',60 );
INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES(201,STR_TO_DATE('02-17-1996','%m-%d-%Y'),STR_TO_DATE('12-19-1999','%m-%d-%Y'),'MK_REP',20 );

-- populate job_grades table
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal) VALUES('A',1000,2999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal) VALUES('B',3000,5999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal) VALUES('C',6000,9999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal) VALUES('D',10000,14999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal) VALUES('E',15000,24999);
INSERT INTO job_grades(grade_level,lowest_sal,highest_sal) VALUES('F',25000,40000);

--  ALTER TABLE DEPARTMENTS  ENABLE  CONSTRAINT  DEPT_MGR_FK ; (= Oracle code)
--  In MySQL we can't DISABLE/ENABLE a foreign key.
--  So, we have chosen not to create this foreign key after the CREATE TABLE, but we create it here.
ALTER TABLE   departments  ADD CONSTRAINT  DEPT_MGR_FK  FOREIGN KEY ( manager_id ) REFERENCES   employees  ( employee_id ) ;

CREATE OR REPLACE VIEW  emp_details_view  ( employee_id ,  job_id ,  manager_id ,  department_id ,  location_id ,  country_id ,  first_name ,  last_name ,  salary ,  commission_pct ,  department_name ,  job_title ,  city ,  state_province ,  country_name ,  region_name ) 
    AS SELECT
        e.employee_id, e.job_id, e.manager_id, e.department_id,
        d.location_id,
        l.country_id,
        e.first_name, e.last_name, e.salary, e.commission_pct,
        d.department_name,
        j.job_title,
        l.city, l.state_province,
        c.country_name,
        r.region_name
    FROM
        employees e,
        departments d,
        jobs j,
        locations l,
        countries c,
        regions r
    WHERE
        e.department_id = d.department_id
        AND d.location_id = l.location_id
        AND l.country_id = c.country_id
        AND c.region_id = r.region_id
        AND j.job_id = e.job_id
    ;
    
/* SEQUENCES ARE NOT SUPPORTED IN MYSQL; MYSQL USES THE AUTO_INCREMENT COLUMN ATTRIBUTE.

-- In the original Oracle version of this script, the three sequences below are created, but not used.

-- Create sequence for departments PK                
CREATE SEQUENCE  DEPARTMENTS_SEQ   
    MINVALUE 1 
    MAXVALUE 9990 
    INCREMENT BY 10 
    START WITH 280 
    NOCACHE  NOORDER  NOCYCLE;

-- Create sequence for employees PK    
CREATE SEQUENCE  EMPLOYEES_SEQ   
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 207 
    NOCACHE  NOORDER  NOCYCLE;

-- Create sequence for locations PK    
CREATE SEQUENCE  LOCATIONS_SEQ   
    MINVALUE 1 
    MAXVALUE 9900 
    INCREMENT BY 100 
    START WITH 3300 
    NOCACHE  NOORDER  NOCYCLE;
*/

-- ****************************************************************************

SET foreign_key_checks = 1;  -- enforce foreign key constraints
                             -- make sure it's enabled, in case it was ever disabled before
-- SET lower_case_table_names = 1;  -- this variable seems to be read-only

-- ****************************************************************************
