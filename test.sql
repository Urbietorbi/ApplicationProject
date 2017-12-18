--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    testname character varying(50) NOT NULL,
    score smallint,
    total smallint,
    q1 smallint,
    q2 smallint,
    q3 smallint,
    q4 smallint,
    q5 smallint,
    q6 smallint,
    q7 smallint,
    q8 smallint,
    q9 smallint,
    q10 smallint,
    q11 smallint,
    q12 smallint,
    q13 smallint,
    q14 smallint,
    q15 smallint,
    q16 smallint,
    q17 smallint,
    q18 smallint,
    q19 smallint,
    q20 smallint
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE id OWNER TO postgres;

--
-- Name: id; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE id OWNED BY users.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE questions (
    id smallint NOT NULL,
    testname character varying(30) NOT NULL,
    questionid character varying(5) NOT NULL,
    question character varying(200) NOT NULL,
    answer1 character varying(200) NOT NULL,
    answer2 character varying(200) DEFAULT NULL::character varying,
    answer3 character varying(200) DEFAULT NULL::character varying,
    answer4 character varying(200) DEFAULT NULL::character varying,
    answer5 character varying(200) DEFAULT NULL::character varying,
    answer6 character varying(200) DEFAULT NULL::character varying,
    answer7 character varying(200) DEFAULT NULL::character varying,
    answer8 character varying(200) DEFAULT NULL::character varying,
    answer9 character varying(200) DEFAULT NULL::character varying,
    answer10 character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE questions OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('id'::regclass);


--
-- Name: id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id', 234, true);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY questions (id, testname, questionid, question, answer1, answer2, answer3, answer4, answer5, answer6, answer7, answer8, answer9, answer10) FROM stdin;
1	Math	q1	What is the square root of 81?	9	18	90	No answers are correct	\N	\N	\N	\N	\N	\N
2	Math	q2	How many miliseconds per 7 seconds?	7000	700	4200	420	No answers are correct	\N	\N	\N	\N	\N
3	Logics	q1	What is the meaning of "==" operator?	Tests the equality	Asigns a value	There is no such operator	\N	\N	\N	\N	\N	\N	\N
4	Logics	q2	What is the result of: (12>15 ? Y:N)	N	Y	12<15	None correct	\N	\N	\N	\N	\N	\N
5	English	q1	Where does english language come from?	Great Britain	Ireland	USA	\N	\N	\N	\N	\N	\N	\N
6	Math	q3	What is the value of 11 squared?	121	111	122	211	\N	\N	\N	\N	\N	\N
7	Math	q4	What is the result of 12/5?	2.4	2.25	1.12	\N	\N	\N	\N	\N	\N	\N
8	Logics	q3	Are the "==" and "===" operators equal?	Yes	No	\N	\N	\N	\N	\N	\N	\N	\N
9	Logics	q4	(!(true)==(false))	True	False	!=	==	Incorrect statement	\N	\N	\N	\N	\N
10	Physics	q1	What is the most popular formulae?	E=mc**2	a**2 + b**2 = c**2	V = d / t	\N	\N	\N	\N	\N	\N	\N
11	Physics	q2	What is the speed of light?	All answers are correct	299 792.458 km/s	29 979 245 800 mm/s	299 792 458 m/s	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, username, testname, score, total, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20) FROM stdin;
208	Edgars	Logics	2	4	2	4	2	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
209	Edgars Urbans	Physics	2	2	2	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
210	Edgars Urbans	Logics	4	4	2	2	2	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
211	Edgars Urbans	English	1	1	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
212	Edgars Urbans	Math	4	4	2	2	2	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
213	Edgars Urbans	Math	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
214	Edgars Urbans	Math	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
215	Edgars Urbans	Math	1	4	5	3	5	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
216	Edgars Urbans	Math	\N	\N	5	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
217	Edgars Urbans	Math	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
218	Edgars Urbans	Math	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
219	Edgars Urbans	Math	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
220	Edgars Urbans	Math	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	Edgars Urbans	Math	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
222	Edgars Urbans	Math	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	Edgars Urbans	Logics	\N	\N	2	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
224	Edgars Urbans	Logics	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
225	Edgars Urbans	Logics	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
226	Edgars Urbans	Logics	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
227	Edgars Urbans	Math	\N	\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
228	Edgars Urbans	Physics	\N	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
229	Edgars Urbans	Physics	0	2	4	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
230	Edgars Urbans	Physics	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
231	Edgars Urbans	Physics	0	2	4	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
232	Edgars Urbans	Physics	1	2	3	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
233	Edgars Urbans	Math	\N	\N	2	6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
234	Edgars Urbans	Math	\N	\N	3	2	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
169			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: users; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM postgres;
GRANT SELECT,INSERT,UPDATE ON TABLE users TO postgres;


--
-- Name: questions; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE questions FROM PUBLIC;
REVOKE ALL ON TABLE questions FROM postgres;
GRANT SELECT ON TABLE questions TO postgres;


--
-- PostgreSQL database dump complete
--

