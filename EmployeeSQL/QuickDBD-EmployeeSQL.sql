﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/qYhnGc
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" VARCHAR(10)  NOT NULL ,
    "dept_name" VARCHAR(40)  NOT NULL 
)

GO

CREATE TABLE "titles" (
    "title_id" VARCHAR(10)  NOT NULL ,
    "title" VARCHAR(40)  NOT NULL 
)

GO

CREATE TABLE "employees" (
    "emp_no" INT  NOT NULL ,
    "emp_title_id" VARCHAR(10)  NOT NULL ,
    "birth_date" DATE  NOT NULL ,
    "first_name" VARCHAR(30)  NOT NULL ,
    "last_name" VARCHAR(30)  NOT NULL ,
    -- Check Constraint on column sex
    "sex" CHAR(1)  NOT NULL ,
    "hire_date" DATE  NOT NULL 
)

GO

CREATE TABLE "salaries" (
    "emp_no" INT  NOT NULL ,
    -- Check Constraint on column salary
    "salary" INT  NOT NULL 
)

GO

CREATE TABLE "dept_emp" (
    "emp_no" INT  NOT NULL ,
    "dept_no" VARCHAR(10)  NOT NULL ,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
    )
)

GO

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10)  NOT NULL ,
    "emp_no" INT  NOT NULL ,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
    )
)

GO

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id")
GO

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no")
GO

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no")
GO

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

