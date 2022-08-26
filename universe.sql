--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(5,2) NOT NULL,
    is_spherical boolean,
    has_life boolean,
    distance_in_ly integer,
    size_in_kly integer,
    discription text,
    constellation character varying(40)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_moon (
    galaxy_moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    moon_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age numeric(5,3),
    description text
);


ALTER TABLE public.galaxy_moon OWNER TO freecodecamp;

--
-- Name: galaxy_moon_galaxy_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_moon_galaxy_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_moon_galaxy_moon_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_moon_galaxy_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_moon_galaxy_moon_id_seq OWNED BY public.galaxy_moon.galaxy_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer,
    mass_kg integer,
    has_air boolean,
    has_water boolean,
    description text,
    distance_in_million numeric(5,3),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbital_speed numeric(5,2),
    no_of_satellite integer,
    diameter integer,
    is_spherical boolean,
    has_life boolean,
    composition text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_km integer NOT NULL,
    mass_kg integer,
    age_billions_year numeric(5,3),
    has_life boolean,
    is_sphere boolean,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_moon galaxy_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon ALTER COLUMN galaxy_moon_id SET DEFAULT nextval('public.galaxy_moon_galaxy_moon_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 0.00, false, false, 25500, 88, 'This is the galaxy containing Sun,and its solar system', 'Sagiittarius');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 0.00, false, false, 2450000, 152000, 'it is the closest big galaxy to Milky Way', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'NGC 4622', 0.00, false, false, 200000000, 0, 'also called Backward Galaxy', 'Centaurus');
INSERT INTO public.galaxy VALUES (4, 'NGC 4567 and NGC 4568', 0.00, false, false, 59400000, 0, 'Looks similar to Butterfly', 'Virgo');
INSERT INTO public.galaxy VALUES (5, 'Messier 64', 0.00, false, false, 17300000, 0, 'also called Evil eye Galaxy', 'Coma Berenices');
INSERT INTO public.galaxy VALUES (7, 'Cartwheel Galaxy', 0.00, false, false, 500000000, 144300, 'appreance is similar to that of a spoked cartwheel', 'Sculptor');
INSERT INTO public.galaxy VALUES (6, 'abcdefgh', 0.00, false, false, 59400000, 0, 'Appears similar in shape to a cigar', 'Ursa Major');


--
-- Data for Name: galaxy_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_moon VALUES (1, 'data', 1, 1, false, false, 54.450, 'no description');
INSERT INTO public.galaxy_moon VALUES (2, 'base', 2, 2, false, true, 4.450, 'not available description');
INSERT INTO public.galaxy_moon VALUES (3, 'database', 3, 3, true, false, 4.500, 'no descr');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'aaa', 3443, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'bbb', 443, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'cc', 443, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (5, 'c11c', 443, 454, true, false, 'dsajdjs', NULL, 2);
INSERT INTO public.moon VALUES (6, 'c131c', 443, 454, true, false, 'dsajdjs', NULL, 2);
INSERT INTO public.moon VALUES (7, '12131c', 443, 454, true, false, 'dsajdjs', NULL, 2);
INSERT INTO public.moon VALUES (8, 'zzzz', 32423, 454, false, true, 'no life here', 54.540, 3);
INSERT INTO public.moon VALUES (9, 'xxx', 3423, 54, false, true, ' life here', 54.400, 3);
INSERT INTO public.moon VALUES (11, 'x1xx', 13423, 154, false, true, ' life here', 54.400, 1);
INSERT INTO public.moon VALUES (12, 'x2xx', 32423, 524, false, true, ' life here', 25.400, 2);
INSERT INTO public.moon VALUES (13, 'x3xx', 33423, 354, false, true, ' life here', 34.340, 3);
INSERT INTO public.moon VALUES (14, 'xx4x', 42344, 4, false, true, ' here', 54.540, 3);
INSERT INTO public.moon VALUES (15, 'aaaa5', 3423, 154, true, false, 'all', 54.400, 5);
INSERT INTO public.moon VALUES (16, 'sss', 33, 24, false, true, 'good', 5.400, 5);
INSERT INTO public.moon VALUES (17, 'ddd', 423, 4, true, true, ' here', 34.300, 5);
INSERT INTO public.moon VALUES (18, 'eee', 44, 564, false, false, ' there', 54.540, 6);
INSERT INTO public.moon VALUES (19, 'hhhh', 423, 154, true, false, 'all', 54.400, 6);
INSERT INTO public.moon VALUES (20, 'hhsss', 33, 24, false, true, 'good', 5.400, 5);
INSERT INTO public.moon VALUES (21, 'ddghd', 423, 4, true, true, ' here', 34.300, 5);
INSERT INTO public.moon VALUES (22, 'ekjee', 44, 564, false, false, ' there', 54.540, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 29.78, 1, 12440, true, true, 'nitrogen oxygen', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 35.02, 0, 10102, true, false, 'nitrogen CO2', 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 47.36, 0, 4880, true, false, 'oxygen sodium magnesium', 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 13.07, 80, 140000, true, false, 'hyderogen helium methene', 1);
INSERT INTO public.planet VALUES (5, 'Pluto', 45.32, 4, 44435, false, false, 'something', 2);
INSERT INTO public.planet VALUES (6, 'Neptune', 34.30, 4, 46656, false, true, 'ectra', 4);
INSERT INTO public.planet VALUES (7, 'Plefduto', 45.32, 4, 44435, false, false, 'something', 6);
INSERT INTO public.planet VALUES (8, 'dfNeptune', 34.30, 4, 46656, false, true, 'ectra', 3);
INSERT INTO public.planet VALUES (9, 'Plefdo', 45.32, 4, 44435, false, false, 'something', 6);
INSERT INTO public.planet VALUES (10, 'dfNune', 34.30, 4, 46656, false, true, 'ectra', 6);
INSERT INTO public.planet VALUES (11, 'Pfdo', 45.32, 4, 44435, false, false, 'something', 6);
INSERT INTO public.planet VALUES (12, 'dfNe', 34.30, 4, 46656, false, true, 'ectra', 2);
INSERT INTO public.planet VALUES (13, 'Pfd12o', 45.32, 4, 44435, false, false, 'something', 3);
INSERT INTO public.planet VALUES (14, 'dfNe12', 34.30, 4, 46656, false, true, 'ectra', 2);
INSERT INTO public.planet VALUES (15, 'ipsum', 45.32, 4, 44435, false, false, 'something', 3);
INSERT INTO public.planet VALUES (16, 'same', 34.30, 4, 46656, false, true, 'ectra', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 695700, 2, 4.600, false, true, 'center of solar system', 1);
INSERT INTO public.star VALUES (2, 'Sun11', 5700, 15, 4.600, false, true, 'center  system', 2);
INSERT INTO public.star VALUES (3, 'RIgel', 55, 3, 4.600, false, true, 'lorem ipsum', 3);
INSERT INTO public.star VALUES (4, 'RIgel4', 44, 4, 20.700, true, true, 'lorem ipsum and all other', 4);
INSERT INTO public.star VALUES (5, 'Sirius', 44, 4, 20.700, true, true, 'lo all other', 5);
INSERT INTO public.star VALUES (6, 'Altair', 43, 3, 20.700, true, true, 'lo all other', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_moon_galaxy_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_moon_galaxy_moon_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy_moon galaxy_moon_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT galaxy_moon_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy_moon galaxy_moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT galaxy_moon_moon_id_key UNIQUE (moon_id);


--
-- Name: galaxy_moon galaxy_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT galaxy_moon_name_key UNIQUE (name);


--
-- Name: galaxy_moon galaxy_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT galaxy_moon_pkey PRIMARY KEY (galaxy_moon_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_moon galaxy_moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT galaxy_moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_moon galaxy_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_moon
    ADD CONSTRAINT galaxy_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

