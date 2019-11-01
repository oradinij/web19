--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-08-21 12:16:40 CEST

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

--
-- TOC entry 2929 (class 1262 OID 16705)
-- Name: web19; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE web19 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


\connect web19

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

--
-- TOC entry 2922 (class 0 OID 16729)
-- Dependencies: 199
-- Data for Name: medici; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.medici (id_medico, email, pswd) FROM stdin;
1	mario.rossi@gmail.com	1000:39a9dfde43b0057e36130bb4fa13051b:16e3743403568be1b5190a2949d79f52d0286d3d63e11611bc652e3ab87f9e7d52d93b22113462cff1b6771f17bad921ec9e11a2e7edf76cd3fd0cbe4b86a798
\.


--
-- TOC entry 2920 (class 0 OID 16713)
-- Dependencies: 197
-- Data for Name: pazienti; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pazienti (codice_fiscale, email, foto_path, luogo_nascita, nome, sesso, id_medico, data_nascita, cognome, id_paziente, pswd) FROM stdin;
CLDMRA22T60G224P	maria.caldera22@.gmail.com	\N	Padova	Maria	F	1	20/12/1922	Caldera	1	1000:b488979d971672cf1e80674a7c5902e7:36edb533d044c83419b6af762b72b1e90193e9530ddcaa40cb27072abf26d7b2b9e6ab92118049c739058f9bb8d981605590d414509d2e31af3675fa3afc8b06
MSSNDR16A06D643G	andrea.massano16@gmail.com	\N	Foggia	Andrea	M	1	06/01/2016	Massano	2	1000:ea62cefe01ae078d2dbf8618b7d65d32:04aa3a5323363df809e0a421dbda0ccbf83ee0c2182fd42b62c7dd1d221f0015a4964b8c048b548c002dad39eefa1831186a594cf06e8c99ceef7e715ef34b3a
BRBGPP63A07E625H	giuseppe.barbero63@hotmail.com	\N	Livorno	Giuseppe	M	1	07/01/1963	Barbero	3	1000:24c83e72a111d1832681fb11dd03a3a6:4a912d6dbb0ed74d9355af2047860e91020be09bce6dfa9239aff60afdb159641d361554ec0f0aee598771f7b2bcd61a8622d3399d554d3eb9a074927feb167a
\.


--
-- TOC entry 2921 (class 0 OID 16721)
-- Dependencies: 198
-- Data for Name: sessione; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessione (id_paziente, id_sessione) FROM stdin;
3	D1F8AD63AF0804BD4441A98248BB7460
\.


--
-- TOC entry 2923 (class 0 OID 24921)
-- Dependencies: 200
-- Data for Name: sessione_medico; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sessione_medico (id_medico, id_sessione) FROM stdin;
1	7b8f5f72-9773-4be3-b273-5b506f31335b
\.


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 196
-- Name: pazienti2_id_paziente_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pazienti2_id_paziente_seq', 1, false);


-- Completed on 2019-08-21 12:16:40 CEST

--
-- PostgreSQL database dump complete
--

