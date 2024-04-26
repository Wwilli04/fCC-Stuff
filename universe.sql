--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(40) NOT NULL,
    total_stars integer,
    fictional boolean,
    type character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: junk; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.junk (
    junk_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.junk OWNER TO freecodecamp;

--
-- Name: junk_junk_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.junk ALTER COLUMN junk_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.junk_junk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    has_humans boolean,
    has_robots boolean,
    fictional boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    has_humans boolean,
    has_robots boolean,
    description text,
    gravity_in_g numeric(3,1) NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    favorite_number integer,
    fictional boolean NOT NULL,
    color character varying(20),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 200000000, false, 'spiral');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 1000000000, false, 'barred spiral');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Hank''s Cluster', 17, true, 'spicy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Hank''s XL', 170, true, 'extra-spicy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Far, Far Away', 200000000, true, 'midichlorian');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Milky Way 2', 25, true, 'electric boogaloo');


--
-- Data for Name: junk; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.junk OVERRIDING SYSTEM VALUE VALUES (1, 3, 'Sputnik');
INSERT INTO public.junk OVERRIDING SYSTEM VALUE VALUES (2, 3, 'ISS');
INSERT INTO public.junk OVERRIDING SYSTEM VALUE VALUES (3, 3, 'Space Trash');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Luna', false, true, false, 3);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Deimos', false, false, false, 4);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Phobos', false, false, false, 4);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Ganymede', false, false, false, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Callisto', false, false, false, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Io', false, false, false, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Europa', false, false, false, 5);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Titan', false, true, false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Enceladus', false, false, false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Hyperion', false, false, false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Promethius', false, false, false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Pandora', false, false, false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Janus', false, false, false, 6);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Miranda', false, false, false, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Ariel', false, false, false, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Umbriel', false, false, false, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Titania', false, false, false, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Oberon', false, false, false, 7);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Despina', false, false, false, 8);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Valandus', false, true, true, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', false, false, 'small and hot', 0.4, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', false, false, 'hot and gassy', 0.9, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', false, true, 'the final frontier', 0.4, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', false, false, NULL, 2.5, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', false, false, 'the one with the big rings', 1.1, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Uranus', false, false, 'ha ha, very funny', 0.9, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Neptune', false, false, NULL, 1.1, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Pluto', false, false, 'arguably not a planet', 0.1, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', true, true, 'all my stuff is here', 1.0, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Qo''noS', true, true, 'the Klingon homeworld', 1.1, 3);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Vulcan', true, true, 'the Vulcan homeworld', 1.1, 6);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Romulus', true, true, 'the Romulan homeworld', 0.9, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Betelgeuse', NULL, false, 'Red', 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Sirius B', NULL, false, 'White', 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Alpha Centauri', 17, false, 'Yellow', 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sol', 42, false, 'Yellow', 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'QonoS', 10001, true, 'Green', 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'VulcanStar', 1, true, 'Orange', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: junk_junk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.junk_junk_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: junk junk_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junk
    ADD CONSTRAINT junk_name_key UNIQUE (name);


--
-- Name: junk junk_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junk
    ADD CONSTRAINT junk_pkey PRIMARY KEY (junk_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: junk junk_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.junk
    ADD CONSTRAINT junk_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

