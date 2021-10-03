SELECT emp_no, first_name, last_name
FROM employees

SELECT title, from_date, to_date
FROM titles

--Joining employee and title tables
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
--INTO emptt_info
FROM employees as e
INNER JOIN titles as tt
ON e.emp_no = tt.emp_no;

--Joining employee and title tables with birthdates between 1952 and 1955
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
--INTO emptt_info
FROM employees as e
INNER JOIN titles as tt
ON e.emp_no = tt.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--Joining employee and title tables with birthdates between 1952 and 1955 in emp no order
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tt
ON e.emp_no = tt.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, to_date DESC;

--number of retiring employees by title
SELECT COUNT(rt.emp_no), rt.title
INTO retiring_titles
FROM retirement_titles as rt
GROUP BY rt.title
ORDER BY COUNT(rt.emp_no) DESC;

SELECT emp_no, first_name, last_name, birth_date
FROM employees

SELECT from_date, to_date
FROM dept_emp

SELECT title
FROM titles

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
tt.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as tt
ON e.emp_no = tt.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, to_date DESC;
