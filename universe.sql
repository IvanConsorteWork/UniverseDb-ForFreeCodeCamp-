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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(60) NOT NULL,
    country character varying(30),
    born integer,
    died integer,
    notable_for text
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomers_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomers_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomers_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomers_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomers_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_types character varying(60),
    is_naked_eye_visible boolean,
    constellation character varying(60)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    numeral character varying(20),
    discovery_year integer,
    planet_id integer
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
    name character varying(60) NOT NULL,
    planet_types character varying(60),
    number_of_moons integer,
    distance_from_sun_in_km numeric,
    has_rings boolean,
    description text,
    star_id integer
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
    name character varying(60) NOT NULL,
    distance_from_earth_in_light_years numeric,
    is_naked_eye_visible boolean,
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
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomers_astronomer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Marc Aaronson', 'USA', 1927, 1983, 'Was one of the first astronomers to attempt to image dark matter using infrared imaging.');
INSERT INTO public.astronomer VALUES (2, 'Agrippa', 'Greece', 92, NULL, 'He observed the occultation of a part of the Pleiades by the southernmost part of the Moon');
INSERT INTO public.astronomer VALUES (3, 'Aryabhata', 'India', 476, 550, 'Insisted that the earth rotates about its axis daily,  and thatthe apparent movement of the stars is a relative motion caused by the rotation of the earth.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Irregular', true, 'Canis Major');
INSERT INTO public.galaxy VALUES (3, 'Virgo Stellar Stream', 'Spherical', false, 'Virgo');
INSERT INTO public.galaxy VALUES (4, 'Sagittarius Dwarf Elliptical Galaxy', 'Elliptical', false, 'Sagittarius');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Spherical', true, 'Dorado/Mensa');
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Spiral', true, 'Tucana/Hydrus');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'I (1)', NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'I (1)', 1877, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'II (2)', 1877, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'I (1)', 1610, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'II (2)', 1610, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'III (3)', 1610, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'IV (4)', 1610, 5);
INSERT INTO public.moon VALUES (8, 'Tethys', 'III (3)', 1684, 6);
INSERT INTO public.moon VALUES (9, 'Dione', 'IV (4)', 1684, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 'V (5)', 1672, 6);
INSERT INTO public.moon VALUES (11, 'Titan', 'VI (6)', 1655, 6);
INSERT INTO public.moon VALUES (12, 'Ariel', 'I (1)', 1851, 7);
INSERT INTO public.moon VALUES (14, 'Titania', 'III (3)', 1787, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 'V (5)', 1948, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'II (2)', 1851, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 'I (1)', 1846, 8);
INSERT INTO public.moon VALUES (17, 'Galatea', 'VI (6)', 1989, 8);
INSERT INTO public.moon VALUES (18, 'Proteus', 'VIII (8)', 1989, 8);
INSERT INTO public.moon VALUES (19, 'Charon', 'I (1)', 1978, 10);
INSERT INTO public.moon VALUES (20, 'Namaka', 'II (2)', 2005, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Major', 0, 57909175, false, 'One of the four terrestrial planets on the Solar System, is also the smallest. Is a rocky body, like Earth, and appears to have a solid sillicate crust and mantle overlying a solid, iron sulfide outer core layer, a deeper liquid core layer, and a solid inner core', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Major', 0, 108208930, false, 'Thesecond largest terrestrial object of the Solar System. The atmosphere of Venus consist mainly of carbon dioxide and, at the planet''s surface, is the densest and hottest of the atmospheres of the terrestrial planets. It is sometimes called Earth''s "sister" or "twin" planet as it is almost as large and has a similar composition', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Major', 1, 149597890, false, 'The third planet from the Sun and home to all known life. While large volumes of water can be found throughout the Solar System, only Earth sustains liquid surface water. Earth''s surface layer is formed of several slowly moving tectonic plates, which interact to produce mountain ranges, volcanoes and earthquakes.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Major', 2, 227936649, false, 'A terrestrial planet with a thin atmosphere and a crust primarily composed of elements similar to Earth''s crust, as well as a core made of iron and nickel. Mars has surface features such as impact craters, valleys, dunes and polar ice caps.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Major', 92, 778412010, true, 'The largest in the Solar System, is a gas giant with a mass more than two and half times that of all the other planets in the Solar System combined. Is primarily composed of hydrogen, followed by helium. The ongoing contraction of Jupiter''s interior generates more heat than the planet receives from the Sun.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Major', 83, 1426725400, true, 'It''s a gas giant with an average radius of about nine and half times that of Earth. Saturn''s interior is most likely composed of a rocky core surrounded by a deep layer of metallic hydrogen, an intermediate layer of liquid hydrogen and liquid helium, and finally, a gaseous outer layer. The planet''s most notable feature is its prominent ring system, which is composed mainly of ice particles, with a smaller amount of rocky debris and dust.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Major', 27, 2870972200, true, 'Similar in composition to Neptune, Uranus is a ice giant. Ice giants lack a well-defined solid surface. Uranus''s atmosphere is primarily composed by hydrogen and helium, but also contains more "ices" such as water, ammonia and methane, along with traces of other hydrocarbons. ', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Major', 14, 4498252900, true, 'Although Neptune is a ice giant, is denser and physically smaller than Uranus because its greater mass causes more gravitational compression on it''s atmosphere. Neptune is not visible to the unaided eye and is the only planet in the Solar System found by mathematical prediction rather than by empirical observation', 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 'Dwarf', 0, 413700000, false, 'Located in the asteroid belt between the orbits of Mars and Jupiter, Ceres''s small size means that even at its brightest, it is too dim to be seen by the naked eye, except under extremely dark skies. Its surfaces seem to be a mixture of water ice and hydrated minerals such as carbonates and clay.', 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Dwarf', 5, 5906380000, false, 'Is made primarily of ice and rock and is much smaller than the inner planets. Is located in the Kulpter belt, a ring of bodies beyond the orbit of Neptune.', 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf', 2, 6484000000, true, 'Located beyond Neptune''s orbits, its mass is about one-third of that of Pluto. Its elongated shape together with its rapid rotations, rings and high albedo (from a surface of crystalline water ice) are thought to be the consequences of a giant collision.', 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf', 1, 6850000000, false, 'The second largest of what are known as the classical population of Kuiper belt objects, its extremely low average temperature means its surface is covered with methane, ethane, and possibly nitrogen ices.', 1);
INSERT INTO public.planet VALUES (13, 'Eris', 'Dwarf', 1, 10210000000, false, 'The most massive and second largest known planet in the Solar System, is a trans-Neptunian object (TNO) in the scattered disck and has a high eccentricity orbit.', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.0000158, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.2465, false, 1);
INSERT INTO public.star VALUES (3, 'Barnard"s Star', 5.9629, false, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 8.7094, true, 1);
INSERT INTO public.star VALUES (5, 'Procyon', 11.402, true, 1);
INSERT INTO public.star VALUES (6, 'Tau Ceti', 11.9118, true, 1);


--
-- Name: astronomers_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomers_astronomer_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronomer astronomers_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomers_name_key UNIQUE (name);


--
-- Name: astronomer astronomers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomers_pkey PRIMARY KEY (astronomer_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: star pk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT pk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

