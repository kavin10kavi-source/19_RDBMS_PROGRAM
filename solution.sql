CREATE DATABASE CollegeDB;
USE CollegeDB;

SET SERVEROUTPUT ON;

CREATE TABLE Student (
    StudentID NUMBER PRIMARY KEY,
    StudentName VARCHAR2(50),
    DepartmentID NUMBER
);

INSERT INTO Student VALUES (101, 'Kavi', 10);
INSERT INTO Student VALUES (102, 'Arun', 10);
INSERT INTO Student VALUES (103, 'Priya', 20);
INSERT INTO Student VALUES (104, 'Ravi', 20);
INSERT INTO Student VALUES (105, 'Anu', 30);

COMMIT;

DECLARE
    CURSOR student_cursor IS
        SELECT StudentID, StudentName, DepartmentID
        FROM Student;

    v_student_id     Student.StudentID%TYPE;
    v_student_name   Student.StudentName%TYPE;
    v_department_id  Student.DepartmentID%TYPE;

BEGIN
    OPEN student_cursor;

    LOOP
        FETCH student_cursor
        INTO v_student_id, v_student_name, v_department_id;

        EXIT WHEN student_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Student ID: ' || v_student_id ||
            ' | Student Name: ' || v_student_name ||
            ' | Department ID: ' || v_department_id
        );
    END LOOP;

    CLOSE student_cursor;
END;
/
