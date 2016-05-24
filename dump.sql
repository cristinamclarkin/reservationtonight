--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: cristinaclarkin
--

CREATE TABLE categories (
    category_id integer NOT NULL,
    category_name character varying(40)
);


ALTER TABLE categories OWNER TO cristinaclarkin;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: cristinaclarkin
--

CREATE SEQUENCE categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_category_id_seq OWNER TO cristinaclarkin;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristinaclarkin
--

ALTER SEQUENCE categories_category_id_seq OWNED BY categories.category_id;


--
-- Name: reservations; Type: TABLE; Schema: public; Owner: cristinaclarkin
--

CREATE TABLE reservations (
    reservation_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    user_id integer,
    "timestamp" timestamp without time zone NOT NULL,
    party_size integer NOT NULL,
    reservation_status character varying(10) NOT NULL
);


ALTER TABLE reservations OWNER TO cristinaclarkin;

--
-- Name: reservations_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: cristinaclarkin
--

CREATE SEQUENCE reservations_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reservations_reservation_id_seq OWNER TO cristinaclarkin;

--
-- Name: reservations_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristinaclarkin
--

ALTER SEQUENCE reservations_reservation_id_seq OWNED BY reservations.reservation_id;


--
-- Name: restaurant_categories; Type: TABLE; Schema: public; Owner: cristinaclarkin
--

CREATE TABLE restaurant_categories (
    restaurantcategory_id integer NOT NULL,
    category_id integer NOT NULL,
    restaurant_id integer NOT NULL
);


ALTER TABLE restaurant_categories OWNER TO cristinaclarkin;

--
-- Name: restaurant_categories_restaurantcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: cristinaclarkin
--

CREATE SEQUENCE restaurant_categories_restaurantcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE restaurant_categories_restaurantcategory_id_seq OWNER TO cristinaclarkin;

--
-- Name: restaurant_categories_restaurantcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristinaclarkin
--

ALTER SEQUENCE restaurant_categories_restaurantcategory_id_seq OWNED BY restaurant_categories.restaurantcategory_id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: cristinaclarkin
--

CREATE TABLE restaurants (
    restaurant_id integer NOT NULL,
    yelp_id character varying(50),
    restaurant_name character varying(50),
    address_line_1 character varying(30),
    address_line_2 character varying(30),
    city character varying(30),
    zipcode character varying(5),
    telephone character varying(15),
    latitude double precision,
    longitude double precision,
    yelp_url character varying(200)
);


ALTER TABLE restaurants OWNER TO cristinaclarkin;

--
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: cristinaclarkin
--

CREATE SEQUENCE restaurants_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE restaurants_restaurant_id_seq OWNER TO cristinaclarkin;

--
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristinaclarkin
--

ALTER SEQUENCE restaurants_restaurant_id_seq OWNED BY restaurants.restaurant_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: cristinaclarkin
--

CREATE TABLE users (
    user_id integer NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(15) NOT NULL,
    user_telephone character varying(100)
);


ALTER TABLE users OWNER TO cristinaclarkin;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cristinaclarkin
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO cristinaclarkin;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cristinaclarkin
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY categories ALTER COLUMN category_id SET DEFAULT nextval('categories_category_id_seq'::regclass);


--
-- Name: reservation_id; Type: DEFAULT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY reservations ALTER COLUMN reservation_id SET DEFAULT nextval('reservations_reservation_id_seq'::regclass);


--
-- Name: restaurantcategory_id; Type: DEFAULT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY restaurant_categories ALTER COLUMN restaurantcategory_id SET DEFAULT nextval('restaurant_categories_restaurantcategory_id_seq'::regclass);


--
-- Name: restaurant_id; Type: DEFAULT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY restaurants ALTER COLUMN restaurant_id SET DEFAULT nextval('restaurants_restaurant_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: cristinaclarkin
--

COPY categories (category_id, category_name) FROM stdin;
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristinaclarkin
--

SELECT pg_catalog.setval('categories_category_id_seq', 1, false);


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: cristinaclarkin
--

COPY reservations (reservation_id, restaurant_id, user_id, "timestamp", party_size, reservation_status) FROM stdin;
\.


--
-- Name: reservations_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristinaclarkin
--

SELECT pg_catalog.setval('reservations_reservation_id_seq', 1, false);


--
-- Data for Name: restaurant_categories; Type: TABLE DATA; Schema: public; Owner: cristinaclarkin
--

COPY restaurant_categories (restaurantcategory_id, category_id, restaurant_id) FROM stdin;
\.


--
-- Name: restaurant_categories_restaurantcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristinaclarkin
--

SELECT pg_catalog.setval('restaurant_categories_restaurantcategory_id_seq', 1, false);


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: cristinaclarkin
--

COPY restaurants (restaurant_id, yelp_id, restaurant_name, address_line_1, address_line_2, city, zipcode, telephone, latitude, longitude, yelp_url) FROM stdin;
1	\N	Chapeau!	126 Clement St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/chapeau-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
2	\N	L'ardoise Bistro	151 Noe St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/l-ardoise-bistro-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
3	\N	Bouche	603 Bush St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/bouche-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
4	\N	La Folie	2316 Polk St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-folie-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
5	\N	Chez Maman	1401 18th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/chez-maman-san-francisco-9?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
6	\N	Le P'tit Laurent	699 Chenery St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/le-ptit-laurent-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
7	\N	Mathilde French Bistro	315 5th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/mathilde-french-bistro-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
8	\N	Bistro Central Parc	560 Central Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/bistro-central-parc-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
9	\N	Amélie	1754 Polk St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/am%C3%A9lie-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
10	\N	Chez Maman West	401 Gough St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/chez-maman-west-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
11	\N	Gamine	2223 Union St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/gamine-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
12	\N	Cafe Claude	7 Claude Ln	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/cafe-claude-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
13	\N	Monsieur Benjamin	451 Gough St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/monsieur-benjamin-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
14	\N	Zazie	941 Cole St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/zazie-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
15	\N	Jardinière	300 Grove St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/jardini%C3%A8re-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
16	\N	Sous Beurre Kitchen	2704 24th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/sous-beurre-kitchen-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
17	\N	Fringale	570 4th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/fringale-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
18	\N	Cocotte	1521 Hyde St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/cocotte-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
19	\N	Butler & The Chef Bistro	155A S Park St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/butler-and-the-chef-bistro-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
20	\N	Cafe du Soleil	345 3rd St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/cafe-du-soleil-san-francisco-4?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
21	\N	El Farolito	2779 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-farolito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
22	\N	El Farolito	2779 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-farolito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
23	\N	Tropisueño	75 Yerba Buena Ln	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/tropisue%C3%B1o-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
24	\N	The Italian Homemade Company	1919 Union St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-italian-homemade-company-san-francisco-6?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
25	\N	Sotto Mare	552 Green St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/sotto-mare-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
26	\N	San Tung	1031 Irving St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/san-tung-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
27	\N	Kung Food	1615 McAllister St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/kung-food-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
28	\N	El Farolito	2779 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-farolito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
29	\N	Tropisueño	75 Yerba Buena Ln	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/tropisue%C3%B1o-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
30	\N	El Farolito	2779 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-farolito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
31	\N	Tropisueño	75 Yerba Buena Ln	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/tropisue%C3%B1o-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
32	\N	El Farolito	2779 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-farolito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
33	\N	Tropisueño	75 Yerba Buena Ln	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/tropisue%C3%B1o-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
34	\N	The Italian Homemade Company	1919 Union St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-italian-homemade-company-san-francisco-6?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
35	\N	Sotto Mare	552 Green St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/sotto-mare-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
36	\N	San Tung	1031 Irving St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/san-tung-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
37	\N	Kung Food	1615 McAllister St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/kung-food-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
38	\N	El Farolito	2779 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-farolito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
39	\N	Tropisueño	75 Yerba Buena Ln	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/tropisue%C3%B1o-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
40	\N	Don Pisto's	510 Union St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/don-pistos-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
41	\N	Garaje	475 3rd St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/garaje-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
42	\N	Taqueria Guadalajara	4798 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/taqueria-guadalajara-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
43	\N	The Little Chihuahua	292 Divisadero St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-little-chihuahua-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
44	\N	Taqueria Castillo Mason	10 Mason St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/taqueria-castillo-mason-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
45	\N	Papito Potrero Hill	317 Connecticut St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/papito-potrero-hill-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
46	\N	El Castillito	136 Church St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-castillito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
47	\N	Papito Hayes	425 Hayes St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/papito-hayes-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
48	\N	La Palma Mexicatessen	2884 24th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-palma-mexicatessen-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
49	\N	Nopalito	1224 9th Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/nopalito-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
50	\N	Street Taco	1607 Haight St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/street-taco-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
51	\N	Cholita Linda	103 Montgomery St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/cholita-linda-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
52	\N	Azucar Lounge	299 9th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/azucar-lounge-san-francisco-4?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
53	\N	Padrecito	901 Cole St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/padrecito-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
54	\N	The New Spot	632 20th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-new-spot-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
55	\N	La Corneta Taqueria	2834 Diamond St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-corneta-taqueria-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
56	\N	Colibri Mexican Bistro	438 Geary St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/colibri-mexican-bistro-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
57	\N	Taqueria Cancún	2288 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/taqueria-canc%C3%BAn-san-francisco-5?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
58	\N	The Italian Homemade Company	1919 Union St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-italian-homemade-company-san-francisco-6?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
59	\N	Sotto Mare	552 Green St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/sotto-mare-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
60	\N	The Italian Homemade Company	716 Columbus Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-italian-homemade-company-san-francisco-4?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
61	\N	Fino Ristorante & Bar	624 Post St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/fino-ristorante-and-bar-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
62	\N	Bella Trattoria	3854 Geary Blvd	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/bella-trattoria-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
63	\N	Barbacco	220 California St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/barbacco-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
64	\N	Beretta	1199 Valencia St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/beretta-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
65	\N	Trattoria da Vittorio	150 W Portal Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/trattoria-da-vittorio-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
66	\N	Zero Zero	826 Folsom St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/zero-zero-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
67	\N	La Briciola	489 3rd St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-briciola-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
68	\N	La Traviata	2854 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-traviata-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
69	\N	Lupa Trattoria	4109 24th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/lupa-trattoria-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
70	\N	E' Tutto Qua	270 Columbus Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/e-tutto-qua-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
71	\N	La Ciccia	291 30th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-ciccia-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
72	\N	Trattoria Contadina	1800 Mason St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/trattoria-contadina-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
73	\N	Uva Enoteca	568 Haight St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/uva-enoteca-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
74	\N	Delarosa	2175 Chestnut St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/delarosa-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
75	\N	Fiorella	2339 Clement St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/fiorella-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
76	\N	Marcella's Lasagneria	1099 Tennessee St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/marcellas-lasagneria-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
77	\N	Mescolanza	3750 Geary Blvd	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/mescolanza-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
78	\N	San Tung	1031 Irving St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/san-tung-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
79	\N	Kung Food	1615 McAllister St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/kung-food-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
80	\N	El Farolito	2779 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-farolito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
81	\N	El Farolito	2779 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-farolito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
82	\N	Tropisueño	75 Yerba Buena Ln	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/tropisue%C3%B1o-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
83	\N	Don Pisto's	510 Union St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/don-pistos-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
84	\N	Garaje	475 3rd St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/garaje-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
85	\N	Taqueria Guadalajara	4798 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/taqueria-guadalajara-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
86	\N	The Little Chihuahua	292 Divisadero St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-little-chihuahua-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
87	\N	Taqueria Castillo Mason	10 Mason St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/taqueria-castillo-mason-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
88	\N	Papito Potrero Hill	317 Connecticut St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/papito-potrero-hill-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
89	\N	El Castillito	136 Church St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/el-castillito-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
90	\N	Papito Hayes	425 Hayes St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/papito-hayes-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
91	\N	La Palma Mexicatessen	2884 24th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-palma-mexicatessen-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
92	\N	Nopalito	1224 9th Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/nopalito-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
93	\N	Street Taco	1607 Haight St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/street-taco-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
94	\N	Cholita Linda	103 Montgomery St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/cholita-linda-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
95	\N	Azucar Lounge	299 9th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/azucar-lounge-san-francisco-4?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
96	\N	Padrecito	901 Cole St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/padrecito-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
97	\N	The New Spot	632 20th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-new-spot-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
98	\N	La Corneta Taqueria	2834 Diamond St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-corneta-taqueria-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
99	\N	Colibri Mexican Bistro	438 Geary St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/colibri-mexican-bistro-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
100	\N	Taqueria Cancún	2288 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/taqueria-canc%C3%BAn-san-francisco-5?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
101	\N	The Italian Homemade Company	1919 Union St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-italian-homemade-company-san-francisco-6?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
102	\N	Sotto Mare	552 Green St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/sotto-mare-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
103	\N	The Italian Homemade Company	716 Columbus Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-italian-homemade-company-san-francisco-4?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
104	\N	Fino Ristorante & Bar	624 Post St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/fino-ristorante-and-bar-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
105	\N	Bella Trattoria	3854 Geary Blvd	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/bella-trattoria-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
106	\N	Barbacco	220 California St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/barbacco-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
107	\N	Beretta	1199 Valencia St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/beretta-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
108	\N	Trattoria da Vittorio	150 W Portal Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/trattoria-da-vittorio-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
109	\N	Zero Zero	826 Folsom St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/zero-zero-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
110	\N	La Briciola	489 3rd St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-briciola-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
111	\N	La Traviata	2854 Mission St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-traviata-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
112	\N	Lupa Trattoria	4109 24th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/lupa-trattoria-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
113	\N	E' Tutto Qua	270 Columbus Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/e-tutto-qua-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
114	\N	La Ciccia	291 30th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-ciccia-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
115	\N	Trattoria Contadina	1800 Mason St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/trattoria-contadina-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
116	\N	Uva Enoteca	568 Haight St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/uva-enoteca-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
117	\N	Delarosa	2175 Chestnut St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/delarosa-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
118	\N	Fiorella	2339 Clement St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/fiorella-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
119	\N	Marcella's Lasagneria	1099 Tennessee St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/marcellas-lasagneria-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
120	\N	Mescolanza	3750 Geary Blvd	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/mescolanza-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
121	\N	San Tung	1031 Irving St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/san-tung-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
122	\N	Kung Food	1615 McAllister St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/kung-food-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
123	\N	The Chairman	670 Larkin St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/the-chairman-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
124	\N	SO	1010 Bryant St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/so-san-francisco-4?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
125	\N	Hunan Home's Restaurant	622 Jackson St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/hunan-homes-restaurant-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
126	\N	Sam Wo Restaurant	713 Clay St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/sam-wo-restaurant-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
127	\N	Wonderland Restaurant	500 Haight St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/wonderland-restaurant-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
128	\N	Heung Yuen Restaurant	3279 22nd St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/heung-yuen-restaurant-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
129	\N	Makli Restaurant	290 Sanchez St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/makli-restaurant-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
130	\N	Henry's Hunan Restaurant	1398 Grant Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/henrys-hunan-restaurant-san-francisco-7?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
131	\N	Wok Shop Cafe	1307 Sutter St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/wok-shop-cafe-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
132	\N	Hakkasan	1 Kearny St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/hakkasan-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
133	\N	Hai Ky Mi Gia	707 Ellis St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/hai-ky-mi-gia-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
134	\N	Chang's Kitchen	1030 Irving St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/changs-kitchen-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
135	\N	Kim Thanh Restaurant	607 Geary St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/kim-thanh-restaurant-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
136	\N	Yan's Kitchen	57 Columbus Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/yans-kitchen-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
137	\N	Yamo	3406 18th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/yamo-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
138	\N	Sun Kwong Restaurant	1400 Jackson St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/sun-kwong-restaurant-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
139	\N	Delicious Dim Sum	752 Jackson St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/delicious-dim-sum-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
140	\N	Win Garden	2794 Diamond St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/win-garden-san-francisco-3?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
141	\N	Chapeau!	126 Clement St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/chapeau-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
142	\N	L'ardoise Bistro	151 Noe St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/l-ardoise-bistro-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
143	\N	Bouche	603 Bush St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/bouche-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
144	\N	La Folie	2316 Polk St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/la-folie-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
145	\N	Chez Maman	1401 18th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/chez-maman-san-francisco-9?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
146	\N	Le P'tit Laurent	699 Chenery St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/le-ptit-laurent-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
147	\N	Mathilde French Bistro	315 5th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/mathilde-french-bistro-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
148	\N	Bistro Central Parc	560 Central Ave	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/bistro-central-parc-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
149	\N	Amélie	1754 Polk St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/am%C3%A9lie-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
150	\N	Chez Maman West	401 Gough St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/chez-maman-west-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
151	\N	Gamine	2223 Union St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/gamine-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
152	\N	Cafe Claude	7 Claude Ln	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/cafe-claude-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
153	\N	Monsieur Benjamin	451 Gough St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/monsieur-benjamin-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
154	\N	Zazie	941 Cole St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/zazie-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
155	\N	Jardinière	300 Grove St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/jardini%C3%A8re-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
156	\N	Sous Beurre Kitchen	2704 24th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/sous-beurre-kitchen-san-francisco-2?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
157	\N	Fringale	570 4th St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/fringale-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
158	\N	Cocotte	1521 Hyde St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/cocotte-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
159	\N	Butler & The Chef Bistro	155A S Park St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/butler-and-the-chef-bistro-san-francisco?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
160	\N	Cafe du Soleil	345 3rd St	\N	\N	\N	\N	\N	\N	http://www.yelp.com/biz/cafe-du-soleil-san-francisco-4?utm_campaign=yelp_api&utm_medium=api_v2_search&utm_source=5nN2-8AC_6lK5w_gKYT5Gw
\.


--
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristinaclarkin
--

SELECT pg_catalog.setval('restaurants_restaurant_id_seq', 160, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cristinaclarkin
--

COPY users (user_id, email, password, user_telephone) FROM stdin;
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cristinaclarkin
--

SELECT pg_catalog.setval('users_user_id_seq', 1, false);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (reservation_id);


--
-- Name: restaurant_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY restaurant_categories
    ADD CONSTRAINT restaurant_categories_pkey PRIMARY KEY (restaurantcategory_id);


--
-- Name: restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (restaurant_id);


--
-- Name: restaurants_yelp_id_key; Type: CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY restaurants
    ADD CONSTRAINT restaurants_yelp_id_key UNIQUE (yelp_id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: reservations_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservations_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id);


--
-- Name: reservations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY reservations
    ADD CONSTRAINT reservations_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: restaurant_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY restaurant_categories
    ADD CONSTRAINT restaurant_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(category_id);


--
-- Name: restaurant_categories_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cristinaclarkin
--

ALTER TABLE ONLY restaurant_categories
    ADD CONSTRAINT restaurant_categories_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

