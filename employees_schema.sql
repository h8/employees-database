--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: employees; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA employees;


SET search_path = employees, pg_catalog;

--
-- Name: employee_gender; Type: TYPE; Schema: employees; Owner: -
--

CREATE TYPE employee_gender AS ENUM (
    'M',
    'F'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: department; Type: TABLE; Schema: employees; Owner: -
--

CREATE TABLE department (
    id character(4) NOT NULL,
    dept_name character varying(40) NOT NULL
);


--
-- Name: department_employee; Type: TABLE; Schema: employees; Owner: -
--

CREATE TABLE department_employee (
    employee_id bigint NOT NULL,
    department_id character(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


--
-- Name: department_manager; Type: TABLE; Schema: employees; Owner: -
--

CREATE TABLE department_manager (
    employee_id bigint NOT NULL,
    department_id character(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


--
-- Name: employee; Type: TABLE; Schema: employees; Owner: -
--

CREATE TABLE employee (
    id bigint NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(14) NOT NULL,
    last_name character varying(16) NOT NULL,
    gender employee_gender NOT NULL,
    hire_date date NOT NULL
);


--
-- Name: id_employee_seq; Type: SEQUENCE; Schema: employees; Owner: -
--

CREATE SEQUENCE id_employee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: id_employee_seq; Type: SEQUENCE OWNED BY; Schema: employees; Owner: -
--

ALTER SEQUENCE id_employee_seq OWNED BY employee.id;


--
-- Name: salary; Type: TABLE; Schema: employees; Owner: -
--

CREATE TABLE salary (
    employee_id bigint NOT NULL,
    amount bigint NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


--
-- Name: title; Type: TABLE; Schema: employees; Owner: -
--

CREATE TABLE title (
    employee_id bigint NOT NULL,
    title character varying(50) NOT NULL,
    from_date date NOT NULL,
    to_date date
);


--
-- Name: id; Type: DEFAULT; Schema: employees; Owner: -
--

ALTER TABLE ONLY employee ALTER COLUMN id SET DEFAULT nextval('id_employee_seq'::regclass);


--
-- Name: idx_16979_primary; Type: CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY department
    ADD CONSTRAINT idx_16979_primary PRIMARY KEY (id);


--
-- Name: idx_16982_primary; Type: CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY department_employee
    ADD CONSTRAINT idx_16982_primary PRIMARY KEY (employee_id, department_id);


--
-- Name: idx_16985_primary; Type: CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY department_manager
    ADD CONSTRAINT idx_16985_primary PRIMARY KEY (employee_id, department_id);


--
-- Name: idx_16988_primary; Type: CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT idx_16988_primary PRIMARY KEY (id);


--
-- Name: idx_16991_primary; Type: CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY salary
    ADD CONSTRAINT idx_16991_primary PRIMARY KEY (employee_id, from_date);


--
-- Name: idx_16994_primary; Type: CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY title
    ADD CONSTRAINT idx_16994_primary PRIMARY KEY (employee_id, title, from_date);


--
-- Name: idx_16979_dept_name; Type: INDEX; Schema: employees; Owner: -
--

CREATE UNIQUE INDEX idx_16979_dept_name ON department USING btree (dept_name);


--
-- Name: idx_16982_dept_no; Type: INDEX; Schema: employees; Owner: -
--

CREATE INDEX idx_16982_dept_no ON department_employee USING btree (department_id);


--
-- Name: idx_16985_dept_no; Type: INDEX; Schema: employees; Owner: -
--

CREATE INDEX idx_16985_dept_no ON department_manager USING btree (department_id);


--
-- Name: dept_emp_ibfk_1; Type: FK CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY department_employee
    ADD CONSTRAINT dept_emp_ibfk_1 FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: dept_emp_ibfk_2; Type: FK CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY department_employee
    ADD CONSTRAINT dept_emp_ibfk_2 FOREIGN KEY (department_id) REFERENCES department(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: dept_manager_ibfk_1; Type: FK CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY department_manager
    ADD CONSTRAINT dept_manager_ibfk_1 FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: dept_manager_ibfk_2; Type: FK CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY department_manager
    ADD CONSTRAINT dept_manager_ibfk_2 FOREIGN KEY (department_id) REFERENCES department(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: salaries_ibfk_1; Type: FK CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY salary
    ADD CONSTRAINT salaries_ibfk_1 FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: titles_ibfk_1; Type: FK CONSTRAINT; Schema: employees; Owner: -
--

ALTER TABLE ONLY title
    ADD CONSTRAINT titles_ibfk_1 FOREIGN KEY (employee_id) REFERENCES employee(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

