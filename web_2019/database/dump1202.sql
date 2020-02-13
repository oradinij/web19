--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8
-- Dumped by pg_dump version 10.8

-- Started on 2020-02-12 22:17:29

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

DROP DATABASE web19;
--
-- TOC entry 2923 (class 1262 OID 35018)
-- Name: web19; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE web19 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Italian_Italy.1252' LC_CTYPE = 'Italian_Italy.1252';


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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_with_oids = false;

--
-- TOC entry 211 (class 1259 OID 35341)
-- Name: esami; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.esami (
    nome_esame character varying,
    id_esame integer NOT NULL,
    costo_esame money,
    id_specializzazione integer
);


--
-- TOC entry 196 (class 1259 OID 35146)
-- Name: farmacie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.farmacie (
    id_farmacia integer NOT NULL,
    email character varying NOT NULL,
    pswd character varying NOT NULL,
    indirizzo character varying,
    nome_farmacia character varying
);


--
-- TOC entry 197 (class 1259 OID 35152)
-- Name: farmacie_id_farmacia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.farmacie_id_farmacia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 197
-- Name: farmacie_id_farmacia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.farmacie_id_farmacia_seq OWNED BY public.farmacie.id_farmacia;


--
-- TOC entry 198 (class 1259 OID 35154)
-- Name: id_farmacia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.id_farmacia (
    id_farmacia integer,
    id_sessione integer
);


--
-- TOC entry 199 (class 1259 OID 35157)
-- Name: medici; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.medici (
    email character varying,
    pswd character varying,
    id_specializzazione integer DEFAULT 0 NOT NULL,
    id_medico integer NOT NULL,
    nome character varying,
    cognome character varying,
    telefono_studio character varying,
    telefono_cellulare character varying,
    immagine character varying,
    provincia character varying,
    orario_visite character varying,
    struttura character varying
);


--
-- TOC entry 200 (class 1259 OID 35164)
-- Name: medici_id_medico_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.medici_id_medico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 200
-- Name: medici_id_medico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.medici_id_medico_seq OWNED BY public.medici.id_medico;


--
-- TOC entry 216 (class 1259 OID 35396)
-- Name: operatori; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.operatori (
    codice_fiscale character varying,
    email character varying NOT NULL,
    luogo_nascita character varying,
    nome character varying,
    sesso "char",
    data_nascita character varying,
    cognome character varying,
    pswd character varying,
    immagine character varying,
    provincia character varying,
    id_operatore integer NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 35166)
-- Name: pazienti; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pazienti (
    codice_fiscale character varying,
    email character varying NOT NULL,
    luogo_nascita character varying,
    nome character varying,
    sesso "char",
    id_medico integer,
    data_nascita character varying,
    cognome character varying,
    pswd character varying,
    immagine character varying,
    provincia character varying,
    id_paziente integer NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 35172)
-- Name: pazienti_id_paziente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pazienti_id_paziente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 202
-- Name: pazienti_id_paziente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pazienti_id_paziente_seq OWNED BY public.pazienti.id_paziente;


--
-- TOC entry 208 (class 1259 OID 35316)
-- Name: prenotazioni_esami; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prenotazioni_esami (
    id_esame integer,
    id_paziente integer,
    data_ora timestamp without time zone DEFAULT now(),
    referto character varying,
    id_medico integer,
    stato smallint DEFAULT 0,
    id_prenotazione integer NOT NULL,
    id_riferimento integer
);


--
-- TOC entry 215 (class 1259 OID 35368)
-- Name: prenotazioni_esami_id_prenotazione_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prenotazioni_esami_id_prenotazione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 215
-- Name: prenotazioni_esami_id_prenotazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prenotazioni_esami_id_prenotazione_seq OWNED BY public.prenotazioni_esami.id_prenotazione;


--
-- TOC entry 209 (class 1259 OID 35324)
-- Name: prenotazioni_visite; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prenotazioni_visite (
    data timestamp(4) without time zone,
    id_paziente integer,
    id_medico integer,
    stato smallint DEFAULT 0,
    referto character varying,
    id_prenotazione integer NOT NULL,
    id_visita integer DEFAULT 0,
    id_riferimento integer
);


--
-- TOC entry 213 (class 1259 OID 35362)
-- Name: prenotazioni_visite_id_prenotazione_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prenotazioni_visite_id_prenotazione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 213
-- Name: prenotazioni_visite_id_prenotazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prenotazioni_visite_id_prenotazione_seq OWNED BY public.prenotazioni_visite.id_prenotazione;


--
-- TOC entry 210 (class 1259 OID 35333)
-- Name: prescrizioni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.prescrizioni (
    id_medico integer,
    id_paziente integer,
    "timestamp" timestamp without time zone DEFAULT now(),
    farmaco character varying,
    id_prescrizione bigint NOT NULL,
    id_farmacia integer,
    stato smallint DEFAULT 0,
    id_riferimento integer
);


--
-- TOC entry 214 (class 1259 OID 35365)
-- Name: prescrizioni_id_prescrizione_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prescrizioni_id_prescrizione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2931 (class 0 OID 0)
-- Dependencies: 214
-- Name: prescrizioni_id_prescrizione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.prescrizioni_id_prescrizione_seq OWNED BY public.prescrizioni.id_prescrizione;


--
-- TOC entry 203 (class 1259 OID 35205)
-- Name: richieste_cambio_password; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.richieste_cambio_password (
    id_utente integer,
    token character varying,
    "timestamp" timestamp with time zone DEFAULT now(),
    tipologia_utente smallint
);


--
-- TOC entry 204 (class 1259 OID 35212)
-- Name: sessione; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessione (
    id_paziente integer NOT NULL,
    id_sessione character varying
);


--
-- TOC entry 205 (class 1259 OID 35218)
-- Name: sessione_farmacia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessione_farmacia (
    id_farmacia integer,
    id_sessione character varying
);


--
-- TOC entry 206 (class 1259 OID 35224)
-- Name: sessione_medico; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessione_medico (
    id_medico integer NOT NULL,
    id_sessione character varying
);


--
-- TOC entry 207 (class 1259 OID 35230)
-- Name: specializzazioni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.specializzazioni (
    id_specializzazione integer NOT NULL,
    descrizione character varying
);


--
-- TOC entry 212 (class 1259 OID 35347)
-- Name: visite_specialistiche; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visite_specialistiche (
    id_visita integer NOT NULL,
    id_specializzazione integer,
    nome_visita character varying,
    durata interval DEFAULT '00:25:00'::interval,
    costo_visita character varying DEFAULT '50 €'::character varying
);


--
-- TOC entry 2750 (class 2604 OID 35246)
-- Name: farmacie id_farmacia; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmacie ALTER COLUMN id_farmacia SET DEFAULT nextval('public.farmacie_id_farmacia_seq'::regclass);


--
-- TOC entry 2752 (class 2604 OID 35247)
-- Name: medici id_medico; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medici ALTER COLUMN id_medico SET DEFAULT nextval('public.medici_id_medico_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 35248)
-- Name: pazienti id_paziente; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pazienti ALTER COLUMN id_paziente SET DEFAULT nextval('public.pazienti_id_paziente_seq'::regclass);


--
-- TOC entry 2757 (class 2604 OID 35370)
-- Name: prenotazioni_esami id_prenotazione; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prenotazioni_esami ALTER COLUMN id_prenotazione SET DEFAULT nextval('public.prenotazioni_esami_id_prenotazione_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 35364)
-- Name: prenotazioni_visite id_prenotazione; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prenotazioni_visite ALTER COLUMN id_prenotazione SET DEFAULT nextval('public.prenotazioni_visite_id_prenotazione_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 35367)
-- Name: prescrizioni id_prescrizione; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.prescrizioni ALTER COLUMN id_prescrizione SET DEFAULT nextval('public.prescrizioni_id_prescrizione_seq'::regclass);


--
-- TOC entry 2912 (class 0 OID 35341)
-- Dependencies: 211
-- Data for Name: esami; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.esami (nome_esame, id_esame, costo_esame, id_specializzazione) VALUES ('Esame 1', 1, '30,00 €', 1);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame, id_specializzazione) VALUES ('Esame 3', 3, '30,00 €', 2);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame, id_specializzazione) VALUES ('Esame 5', 5, '30,00 €', 5);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame, id_specializzazione) VALUES ('Esame 6', 6, '30,00 €', 4);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame, id_specializzazione) VALUES ('Esame 4', 4, '30,00 €', 1);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame, id_specializzazione) VALUES ('Esame 2', 2, '30,00 €', 2);


--
-- TOC entry 2897 (class 0 OID 35146)
-- Dependencies: 196
-- Data for Name: farmacie; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.farmacie (id_farmacia, email, pswd, indirizzo, nome_farmacia) VALUES (1, 'francescobertamini@gmail.com', '1000:82859e901d73d4590c78e396dfbf7e97:d5c7760eca92d023abcdd4f0e3f946f49471e9f30f0b9038e454f36ef051aa4b3050d6d154a4e05e08a0308e62c3f32553d2d9c8376c57e1fa9fc7e977ffada2', 'via bayer 84137', 'Farmacia Bayer');


--
-- TOC entry 2899 (class 0 OID 35154)
-- Dependencies: 198
-- Data for Name: id_farmacia; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2900 (class 0 OID 35157)
-- Dependencies: 199
-- Data for Name: medici; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('sdfdsf', NULL, 2, 4, 'ciccio', 'bello', '980', '87', NULL, 'TN', NULL, 'Clinica Solatrix');
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('fica.iolo@email.com', NULL, 2, 2, 'fica', 'iolo', '897987', '98', NULL, 'TN', '', 'Ospedale San Camillo');
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('fsdfsdf', '', 0, 8, 'Cazzo', 'In Culo', '87678', '8768', NULL, 'TN', NULL, NULL);
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('franco@medicobase.com', '1000:8863974d3d37cbb0e5896c67f234fe7a:69b308cb08092dcc96fe7bb536066c0a572eaccd4f97a097207c12915801215d1127949ef0d03d9d6ce89ce9b5908b1915d8660d2ff80594fd50edd49ac3edb0', 0, 3, 'Franco', 'Base', '0445519346', '324234234', '/web2019\immagini_pazienti\Giuseppe_Barbero_3.jfif', 'TN', NULL, 'Via Dai Coglioni 11');
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('mario.rossi@gmail.com', '1000:39a9dfde43b0057e36130bb4fa13051b:16e3743403568be1b5190a2949d79f52d0286d3d63e11611bc652e3ab87f9e7d52d93b22113462cff1b6771f17bad921ec9e11a2e7edf76cd3fd0cbe4b86a798', 1, 1, 'Mario', 'Rossi', '0464551567', '3274455007', '/web2019\immagini_pazienti\Giuseppe_Barbero_3.jfif', 'TN', 'Lun-Ven 8:00-12:00', 'Clinica Solatrix');


--
-- TOC entry 2917 (class 0 OID 35396)
-- Dependencies: 216
-- Data for Name: operatori; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.operatori (codice_fiscale, email, luogo_nascita, nome, sesso, data_nascita, cognome, pswd, immagine, provincia, id_operatore) VALUES ('sdfsdf4w', 'francescobertamini@gmail.com', 'dwada', 'Cocco', 'M', '02/03/1996', 'Bertamini', '1000:992d28c12ae72a6961fe1072d5a63958:ef123a30c2556fb9075ba4f2572a15a3f830baa49ec9bbb7915a6a8f01dcd2c4517774e38b5e35c7bb9649218a4611d8e76f2f43023a9a2cba9c1ab9b7f315c3', '/web2019\immagini_pazienti\Giuseppe_Barbero_3.jfif', 'TN', 1);


--
-- TOC entry 2902 (class 0 OID 35166)
-- Dependencies: 201
-- Data for Name: pazienti; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pazienti (codice_fiscale, email, luogo_nascita, nome, sesso, id_medico, data_nascita, cognome, pswd, immagine, provincia, id_paziente) VALUES ('BRBGPP63A07E625H', 'francescobertamini@gmail.com', 'Livorno', 'Giuseppe', 'M', 3, '07/01/1963', 'Barbero', '1000:15feabc348862871eefc4a1a8e4c3d17:bd6d1444aa62aa857c8d35e138a9ef32e8c34ae8d999e87c5937b623f032ef75e69e3c13d92170180f02cd8eda4b477eb32bd17ce5bd649ede7d781159053c92', '/web2019\immagini_pazienti\Giuseppe_Barbero_3.jfif', 'TN', 3);
INSERT INTO public.pazienti (codice_fiscale, email, luogo_nascita, nome, sesso, id_medico, data_nascita, cognome, pswd, immagine, provincia, id_paziente) VALUES ('CLDMRA22T60G224P', 'maria.caldera22@.gmail.com', 'Padova', 'Maria', 'F', 6, '20/12/1922', 'Caldera', '1000:b488979d971672cf1e80674a7c5902e7:36edb533d044c83419b6af762b72b1e90193e9530ddcaa40cb27072abf26d7b2b9e6ab92118049c739058f9bb8d981605590d414509d2e31af3675fa3afc8b06', NULL, 'TN', 2);
INSERT INTO public.pazienti (codice_fiscale, email, luogo_nascita, nome, sesso, id_medico, data_nascita, cognome, pswd, immagine, provincia, id_paziente) VALUES ('MSSNDR16A06D643G', 'andrea.massano16@gmail.com', 'Foggia', 'Andrea', 'M', 6, '06/01/2016', 'Massano', '1000:4b3a4f0391ef6e2ebdcb0b5e8a0207b1:5d567c410c6a940e5dc2995c0ff02c154c44fcfbdb917f0f63b61e997860517f8f2b47ab68ad1bf89d9051aa71b359a60ac4675897816ea6fc5ab00803eb3814', NULL, 'BS', 1);


--
-- TOC entry 2909 (class 0 OID 35316)
-- Dependencies: 208
-- Data for Name: prenotazioni_esami; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.prenotazioni_esami (id_esame, id_paziente, data_ora, referto, id_medico, stato, id_prenotazione, id_riferimento) VALUES (2, 3, '2020-02-14 14:30:00', 'dsfsdfs', 2, 3, 19, 57);
INSERT INTO public.prenotazioni_esami (id_esame, id_paziente, data_ora, referto, id_medico, stato, id_prenotazione, id_riferimento) VALUES (3, 3, '2020-02-14 09:30:00', '', 2, 0, 20, 61);
INSERT INTO public.prenotazioni_esami (id_esame, id_paziente, data_ora, referto, id_medico, stato, id_prenotazione, id_riferimento) VALUES (2, 3, '2020-02-12 09:14:16', '', 2, 1, 21, 57);
INSERT INTO public.prenotazioni_esami (id_esame, id_paziente, data_ora, referto, id_medico, stato, id_prenotazione, id_riferimento) VALUES (5, 3, '2020-02-14 00:00:00', NULL, 3, 0, 23, 71);
INSERT INTO public.prenotazioni_esami (id_esame, id_paziente, data_ora, referto, id_medico, stato, id_prenotazione, id_riferimento) VALUES (2, 3, '2020-02-21 00:00:00', 'ASWEWQD', 1, 2, 24, 69);
INSERT INTO public.prenotazioni_esami (id_esame, id_paziente, data_ora, referto, id_medico, stato, id_prenotazione, id_riferimento) VALUES (2, 3, '2020-02-12 09:15:18', 'fsdfsfgre33', 2, 3, 22, 69);


--
-- TOC entry 2910 (class 0 OID 35324)
-- Dependencies: 209
-- Data for Name: prenotazioni_visite; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.prenotazioni_visite (data, id_paziente, id_medico, stato, referto, id_prenotazione, id_visita, id_riferimento) VALUES ('2020-02-12 16:15:09', 3, 3, 3, 'df3errer', 76, 2, 69);
INSERT INTO public.prenotazioni_visite (data, id_paziente, id_medico, stato, referto, id_prenotazione, id_visita, id_riferimento) VALUES ('2020-02-19 00:00:00', 3, 3, 2, 'dfgfdgd', 69, 1, 57);


--
-- TOC entry 2911 (class 0 OID 35333)
-- Dependencies: 210
-- Data for Name: prescrizioni; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_farmacia, stato, id_riferimento) VALUES (3, 3, '2020-02-10 00:00:00', 'culo', 17, 1, 1, 57);
INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_farmacia, stato, id_riferimento) VALUES (3, 3, '2020-02-12 15:37:08.283', '4t43t45t4rt45t4', 18, 1, 1, 69);
INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_farmacia, stato, id_riferimento) VALUES (3, 3, '2020-02-12 17:05:37.324', 'cxgsfd', 19, 1, 1, 71);


--
-- TOC entry 2904 (class 0 OID 35205)
-- Dependencies: 203
-- Data for Name: richieste_cambio_password; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '5b4d399b-8ddf-4194-898c-3bbcfe800c41', '2019-11-30 11:56:21.089126+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '881d91ca-8ead-4566-a5a1-e2ea73280cb8', '2019-11-30 12:01:28.16667+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '04b845a0-6a3a-496a-99df-7a72cdd7bbfa', '2019-11-30 12:04:27.689057+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '9c118a07-d5c8-4a07-a398-82a1e9887e2b', '2019-11-30 12:09:33.12365+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'ca023cba-5289-41f9-9740-ebcf64195017', '2019-11-30 12:12:09.929891+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'a02c4934-d20b-4c92-85d2-68938700b79a', '2019-11-30 12:21:53.473491+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'a6d69b3b-a2b0-4ec6-896f-6e39a4e096f0', '2019-11-30 20:43:11.419641+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'd1476308-740c-4aeb-b6ec-3edd73a76480', '2019-11-30 20:44:34.936548+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'f695e7ec-478f-49ce-862a-7946e6e1f9ce', '2019-11-30 20:49:08.735215+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '22a0664e-ed57-4cba-92f5-d295ee89f9d3', '2019-12-01 14:38:29.464684+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'f349fff4-2252-4e4d-bb37-9bdd1d671b55', '2019-12-01 15:04:22.96833+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'cb90ce87-efe3-4057-a539-de77f9dad94d', '2019-12-01 15:09:43.435176+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '3ab8e01f-483f-4530-8676-d07ca7aeabf2', '2019-12-01 15:17:08.516852+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'ddcb3310-6b00-4203-a831-c0b4dff11b61', '2019-12-01 15:24:38.101302+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'd906e075-2fb8-481c-9840-ca3873c5a0f4', '2019-12-01 15:24:52.293356+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'd8b07fe1-2b14-4b96-9f59-988ded220ed4', '2019-12-01 15:32:03.509655+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'a8caaa3d-9afa-445d-8b67-df784bcab66d', '2019-12-01 16:22:05.179039+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'ba53f3e4-a18f-4036-a817-b9bf0ee336c2', '2019-12-01 16:29:20.848792+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, '1100dde8-08bf-49fa-9a51-3337d550359b', '2019-12-01 16:37:15.710646+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, '02d9e347-f205-49e2-81c9-20db601c8610', '2019-12-01 16:46:20.503047+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, '8ad7e037-7745-4d88-b5e2-ef18aed45715', '2019-12-01 16:49:48.344365+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, '43d885ce-2ea4-4a9e-850e-27919743c203', '2019-12-03 13:07:58.828956+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, '78e5991f-4a2e-4c41-8f26-c940adbcd0e9', '2019-12-03 13:11:06.609163+01', NULL);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, '0c56b11b-36a9-4a7e-bd25-0f3839bd8efe', '2019-12-03 16:05:52.964444+01', 0);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (7, 'a023c7d8-5ddf-4fcd-964e-95f549988fc4', '2019-12-03 16:27:22.25626+01', 1);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (7, '53bd3481-e900-4941-a228-06319aa92e3e', '2019-12-03 16:46:51.7502+01', 1);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, 'c2e8ade4-9b16-4d30-b6c6-ef027ab5e339', '2019-12-03 18:17:34.713471+01', 0);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, '8506abe8-d0eb-4497-8b17-25617c93daef', '2019-12-04 15:47:28.530341+01', 0);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, 'c9151954-fe62-4cb7-bfed-3f58ca3bf760', '2019-12-17 16:41:24.346032+01', 0);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (3, 'f947ddc0-a7fe-465b-a741-beb90c00ccb4', '2020-01-19 16:25:34.150854+01', 0);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '0f499319-86ad-4d44-b372-11ed30891019', '2020-02-11 17:32:22.961886+01', 3);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '0c043cde-a83d-4602-a3ca-25f8209270f3', '2020-02-11 23:00:32.279979+01', 2);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '8fa067fe-6901-4d4d-96f7-725573cf06b1', '2020-02-12 17:30:16.459934+01', 2);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'c5962298-93bf-42d8-a59a-ea5efbb3b55c', '2020-02-12 17:31:37.123997+01', 2);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'b8046b11-c992-4a8a-900f-4bc109b81ca4', '2020-02-12 17:43:23.342913+01', 2);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '5b8741c3-bd4a-46f1-b342-46b752a46bcb', '2020-02-12 17:49:17.490924+01', 2);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'cf51d9ee-179f-46d0-a8a3-58c82f0fe939', '2020-02-12 17:53:20.279583+01', 2);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, '5431c82c-e5bd-4948-a325-35274be90dfe', '2020-02-12 17:54:08.080933+01', 2);
INSERT INTO public.richieste_cambio_password (id_utente, token, "timestamp", tipologia_utente) VALUES (1, 'd76347e7-09cc-45bc-8c2b-f9aae04ae508', '2020-02-12 17:57:48.194496+01', 2);


--
-- TOC entry 2905 (class 0 OID 35212)
-- Dependencies: 204
-- Data for Name: sessione; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessione (id_paziente, id_sessione) VALUES (3, '142B5C7A971EECF6E3E1092C9EE53A59');


--
-- TOC entry 2906 (class 0 OID 35218)
-- Dependencies: 205
-- Data for Name: sessione_farmacia; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2907 (class 0 OID 35224)
-- Dependencies: 206
-- Data for Name: sessione_medico; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessione_medico (id_medico, id_sessione) VALUES (1, '77850d24-4a68-4810-9fb2-853604693e8c');
INSERT INTO public.sessione_medico (id_medico, id_sessione) VALUES (3, '22cc4f2d-d614-40c4-a509-ae67920fb0be');


--
-- TOC entry 2908 (class 0 OID 35230)
-- Dependencies: 207
-- Data for Name: specializzazioni; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.specializzazioni (id_specializzazione, descrizione) VALUES (0, 'Base');
INSERT INTO public.specializzazioni (id_specializzazione, descrizione) VALUES (2, 'Dermatologia');
INSERT INTO public.specializzazioni (id_specializzazione, descrizione) VALUES (3, 'Cardiologia');
INSERT INTO public.specializzazioni (id_specializzazione, descrizione) VALUES (4, 'Oculistica');
INSERT INTO public.specializzazioni (id_specializzazione, descrizione) VALUES (5, 'Ortopedia');
INSERT INTO public.specializzazioni (id_specializzazione, descrizione) VALUES (1, 'Cardiochirurgia');


--
-- TOC entry 2913 (class 0 OID 35347)
-- Dependencies: 212
-- Data for Name: visite_specialistiche; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (1, 0, 'visita medico di base', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (2, 1, 'Visita cardiochirurgica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (3, 1, 'Visita cardiochirurgica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (4, 1, 'Visita cardiochirurgica pediatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (35, 9, 'Visita oculistica pediatrica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (36, 10, 'Visita odontoiatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (37, 10, 'Visita odontoiatrica - odontostomatologica pediatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (38, 10, 'Visita odontoiatrica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (39, 11, 'Visita oncoematologica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (40, 11, 'Visita oncoematologica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (41, 11, 'Visita oncoematologica pediatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (42, 11, 'Visita oncoematologica pediatrica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (43, 12, 'Visita ortopedica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (44, 12, 'Visita ortopedica del ginocchio', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (45, 12, 'Visita ortopedica del ginocchio di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (46, 12, 'Visita ortopedica del gomito di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (47, 12, 'Visita ortopedica del piede', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (48, 12, 'Visita ortopedica del piede di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (49, 12, 'Visita ortopedica dell&#39;anca', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (50, 12, 'Visita ortopedica dell&#39;anca di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (51, 12, 'Visita ortopedica della caviglia', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (52, 12, 'Visita ortopedica della caviglia di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (53, 12, 'Visita ortopedica della colonna vertebrale', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (54, 12, 'Visita ortopedica della colonna vertebrale di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (55, 12, 'Visita ortopedica della mano', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (56, 12, 'Visita ortopedica della mano di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (57, 12, 'Visita ortopedica della spalla', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (58, 12, 'Visita ortopedica della spalla di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (59, 12, 'Visita ortopedica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (60, 12, 'Visita ortopedica oncologica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (61, 12, 'Visita ortopedica oncologica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (62, 12, 'Visita ortopedica pediatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (63, 12, 'Visita ortopedica pediatrica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (64, 13, 'Visita proctologica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (65, 13, 'Visita proctologica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (66, 13, 'Visita proctologica e anoscopia', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (67, 13, 'Visita proctologica per disfunzione del pavimento pelvico', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (68, 14, 'Visita urologica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (69, 14, 'Visita urologica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (70, 14, 'Visita urologica ed ecografia', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (71, 14, 'Visita urologica pediatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (72, 14, 'Visita urologica pediatrica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (5, 1, 'Visita cardiochirurgica pediatrica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (6, 2, 'Visita cardiologica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (7, 2, 'Visita cardiologica con ECG', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (8, 2, 'Visita cardiologica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (9, 2, 'Visita cardiologica per aritmie cardiache', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (10, 2, 'Visita cardiologica per aritmie cardiache di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (11, 2, 'Visita cardiologica riabilitativa di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (12, 3, 'Visita chirurgica plastica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (13, 3, 'Visita chirurgica plastica della mano', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (14, 3, 'Visita chirurgica plastica della mano di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (15, 3, 'Visita chirurgica plastica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (16, 4, 'Visita endocrinologica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (17, 4, 'Visita endocrinologica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (18, 4, 'Visita endocrinologica pediatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (19, 5, 'Visita multidisciplinare', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (20, 5, 'Visita multidisciplinare di 2° livello per disfunzione del pavimento pelvico di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (21, 5, 'Visita multidisciplinare per cure palliative', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (22, 6, 'Visita nefrologica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (23, 6, 'Visita nefrologica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (24, 6, 'Visita nefrologica pediatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (25, 6, 'Visita nefrologica pediatrica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (26, 7, 'Visita neurochirurgica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (27, 7, 'Visita neurochirurgica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (28, 7, 'Visita neurochirurgica pediatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (29, 8, 'Visita neurologica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (30, 8, 'Visita neurologica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (31, 8, 'Visita neurologica pediatrica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (32, 9, 'Visita oculistica', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (33, 9, 'Visita oculistica di controllo', '00:25:00', '50');
INSERT INTO public.visite_specialistiche (id_visita, id_specializzazione, nome_visita, durata, costo_visita) VALUES (34, 9, 'Visita oculistica pediatrica', '00:25:00', '50');


--
-- TOC entry 2932 (class 0 OID 0)
-- Dependencies: 197
-- Name: farmacie_id_farmacia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.farmacie_id_farmacia_seq', 1, true);


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 200
-- Name: medici_id_medico_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.medici_id_medico_seq', 8, true);


--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 202
-- Name: pazienti_id_paziente_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pazienti_id_paziente_seq', 3, true);


--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 215
-- Name: prenotazioni_esami_id_prenotazione_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prenotazioni_esami_id_prenotazione_seq', 24, true);


--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 213
-- Name: prenotazioni_visite_id_prenotazione_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prenotazioni_visite_id_prenotazione_seq', 76, true);


--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 214
-- Name: prescrizioni_id_prescrizione_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.prescrizioni_id_prescrizione_seq', 19, true);


--
-- TOC entry 2767 (class 2606 OID 35256)
-- Name: farmacie farmacie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.farmacie
    ADD CONSTRAINT farmacie_pkey PRIMARY KEY (id_farmacia);


--
-- TOC entry 2769 (class 2606 OID 35258)
-- Name: pazienti pazienti_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pazienti
    ADD CONSTRAINT pazienti_pkey PRIMARY KEY (email);


--
-- TOC entry 2773 (class 2606 OID 35262)
-- Name: sessione_medico sessione_medico_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessione_medico
    ADD CONSTRAINT sessione_medico_pkey PRIMARY KEY (id_medico);


--
-- TOC entry 2771 (class 2606 OID 35264)
-- Name: sessione sessione_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessione
    ADD CONSTRAINT sessione_pkey PRIMARY KEY (id_paziente);


--
-- TOC entry 2775 (class 2606 OID 35266)
-- Name: specializzazioni specializzazioni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.specializzazioni
    ADD CONSTRAINT specializzazioni_pkey PRIMARY KEY (id_specializzazione);


-- Completed on 2020-02-12 22:17:29

--
-- PostgreSQL database dump complete
--

