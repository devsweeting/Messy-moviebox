--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying,
    actors character varying,
    checkedout boolean,
    genre character varying
);


ALTER TABLE public.movies OWNER TO "Guest";

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO "Guest";

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: patrons; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.patrons (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.patrons OWNER TO "Guest";

--
-- Name: patrons_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.patrons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patrons_id_seq OWNER TO "Guest";

--
-- Name: patrons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.patrons_id_seq OWNED BY public.patrons.id;


--
-- Name: rent; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.rent (
    id integer NOT NULL,
    movies_id integer,
    patron_id integer,
    date date
);


ALTER TABLE public.rent OWNER TO "Guest";

--
-- Name: rent_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.rent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rent_id_seq OWNER TO "Guest";

--
-- Name: rent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.rent_id_seq OWNED BY public.rent.id;


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: patrons id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.patrons ALTER COLUMN id SET DEFAULT nextval('public.patrons_id_seq'::regclass);


--
-- Name: rent id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.rent ALTER COLUMN id SET DEFAULT nextval('public.rent_id_seq'::regclass);


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.movies (id, title, actors, checkedout, genre) FROM stdin;
6	Snowpiercer	Chris Evans	f	action
3	The Grand Budapest Hotel	Jeff Goldblum	f	Comedy
7	Jurassic Park	Sam Neil	f	thriller
9	Intersteller	Anne Hathaway	f	Sci-fi
11	Train To Busan	Gong Yoo	f	Horror
12	The Polar Express	Tom Hanks	f	Family
13	Planes, Trains, And Automobiles	Steve Martin	f	Comedy
4	The Commuter	Devin	f	Drama
\.


--
-- Data for Name: patrons; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.patrons (id, name) FROM stdin;
\.


--
-- Data for Name: rent; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.rent (id, movies_id, patron_id, date) FROM stdin;
\.


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.movies_id_seq', 13, true);


--
-- Name: patrons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.patrons_id_seq', 1, false);


--
-- Name: rent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.rent_id_seq', 1, false);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: patrons patrons_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.patrons
    ADD CONSTRAINT patrons_pkey PRIMARY KEY (id);


--
-- Name: rent rent_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.rent
    ADD CONSTRAINT rent_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

