--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-12-05 11:02:07 CET

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
-- TOC entry 2992 (class 1262 OID 16705)
-- Name: web19; Type: DATABASE; Schema: -; Owner: jan
--

CREATE DATABASE web19 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE web19 OWNER TO jan;

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 24941)
-- Name: esami; Type: TABLE; Schema: public; Owner: jan
--

CREATE TABLE public.esami (
    nome_esame character varying,
    id_esame integer NOT NULL,
    costo_esame money
);


ALTER TABLE public.esami OWNER TO jan;

--
-- TOC entry 206 (class 1259 OID 25045)
-- Name: esami_id_esame_seq; Type: SEQUENCE; Schema: public; Owner: jan
--

CREATE SEQUENCE public.esami_id_esame_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.esami_id_esame_seq OWNER TO jan;

--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 206
-- Name: esami_id_esame_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jan
--

ALTER SEQUENCE public.esami_id_esame_seq OWNED BY public.esami.id_esame;


--
-- TOC entry 198 (class 1259 OID 16729)
-- Name: medici; Type: TABLE; Schema: public; Owner: jan
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


ALTER TABLE public.medici OWNER TO jan;

--
-- TOC entry 208 (class 1259 OID 25077)
-- Name: medici_id_medico_seq; Type: SEQUENCE; Schema: public; Owner: jan
--

CREATE SEQUENCE public.medici_id_medico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medici_id_medico_seq OWNER TO jan;

--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 208
-- Name: medici_id_medico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jan
--

ALTER SEQUENCE public.medici_id_medico_seq OWNED BY public.medici.id_medico;


--
-- TOC entry 196 (class 1259 OID 16713)
-- Name: pazienti; Type: TABLE; Schema: public; Owner: jan
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


ALTER TABLE public.pazienti OWNER TO jan;

--
-- TOC entry 207 (class 1259 OID 25066)
-- Name: pazienti_id_paziente_seq; Type: SEQUENCE; Schema: public; Owner: jan
--

CREATE SEQUENCE public.pazienti_id_paziente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pazienti_id_paziente_seq OWNER TO jan;

--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 207
-- Name: pazienti_id_paziente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jan
--

ALTER SEQUENCE public.pazienti_id_paziente_seq OWNED BY public.pazienti.id_paziente;


--
-- TOC entry 201 (class 1259 OID 24932)
-- Name: prenotazioni_esami; Type: TABLE; Schema: public; Owner: jan
--

CREATE TABLE public.prenotazioni_esami (
    id_esame integer,
    id_paziente integer,
    data_ora timestamp without time zone,
    referto character varying,
    id_medico integer,
    id_prenotazione integer NOT NULL,
    stato smallint
);


ALTER TABLE public.prenotazioni_esami OWNER TO jan;

--
-- TOC entry 209 (class 1259 OID 25086)
-- Name: prenotazioni_esami_id_esame_seq; Type: SEQUENCE; Schema: public; Owner: jan
--

CREATE SEQUENCE public.prenotazioni_esami_id_esame_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prenotazioni_esami_id_esame_seq OWNER TO jan;

--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 209
-- Name: prenotazioni_esami_id_esame_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jan
--

ALTER SEQUENCE public.prenotazioni_esami_id_esame_seq OWNED BY public.prenotazioni_esami.id_prenotazione;


--
-- TOC entry 200 (class 1259 OID 24929)
-- Name: prenotazioni_visite; Type: TABLE; Schema: public; Owner: jan
--

CREATE TABLE public.prenotazioni_visite (
    data timestamp(4) without time zone,
    id_paziente integer,
    id_medico integer,
    id_prenotazione integer NOT NULL,
    stato smallint,
    referto character varying
);


ALTER TABLE public.prenotazioni_visite OWNER TO jan;

--
-- TOC entry 210 (class 1259 OID 25095)
-- Name: prenotazioni_visite_id_prenotazione_seq; Type: SEQUENCE; Schema: public; Owner: jan
--

CREATE SEQUENCE public.prenotazioni_visite_id_prenotazione_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prenotazioni_visite_id_prenotazione_seq OWNER TO jan;

--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 210
-- Name: prenotazioni_visite_id_prenotazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jan
--

ALTER SEQUENCE public.prenotazioni_visite_id_prenotazione_seq OWNED BY public.prenotazioni_visite.id_prenotazione;


--
-- TOC entry 204 (class 1259 OID 24963)
-- Name: prescrizioni; Type: TABLE; Schema: public; Owner: jan
--

CREATE TABLE public.prescrizioni (
    id_medico integer,
    id_paziente integer,
    "timestamp" timestamp with time zone,
    farmaco character varying,
    id_prescrizione bigint NOT NULL,
    id_visita integer,
    id_farmacia integer
);


ALTER TABLE public.prescrizioni OWNER TO jan;

--
-- TOC entry 205 (class 1259 OID 24971)
-- Name: prescrizioni_id_prescrizione_seq; Type: SEQUENCE; Schema: public; Owner: jan
--

CREATE SEQUENCE public.prescrizioni_id_prescrizione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescrizioni_id_prescrizione_seq OWNER TO jan;

--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 205
-- Name: prescrizioni_id_prescrizione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jan
--

ALTER SEQUENCE public.prescrizioni_id_prescrizione_seq OWNED BY public.prescrizioni.id_prescrizione;


--
-- TOC entry 211 (class 1259 OID 25104)
-- Name: richieste_cambio_password; Type: TABLE; Schema: public; Owner: jan
--

CREATE TABLE public.richieste_cambio_password (
    id_utente integer,
    token character varying,
    "timestamp" timestamp with time zone DEFAULT now(),
    tipologia_utente smallint
);


ALTER TABLE public.richieste_cambio_password OWNER TO jan;

--
-- TOC entry 197 (class 1259 OID 16721)
-- Name: sessione; Type: TABLE; Schema: public; Owner: jan
--

CREATE TABLE public.sessione (
    id_paziente integer NOT NULL,
    id_sessione character varying
);


ALTER TABLE public.sessione OWNER TO jan;

--
-- TOC entry 199 (class 1259 OID 24921)
-- Name: sessione_medico; Type: TABLE; Schema: public; Owner: jan
--

CREATE TABLE public.sessione_medico (
    id_medico integer NOT NULL,
    id_sessione character varying
);


ALTER TABLE public.sessione_medico OWNER TO jan;

--
-- TOC entry 203 (class 1259 OID 24950)
-- Name: specializzazioni; Type: TABLE; Schema: public; Owner: jan
--

CREATE TABLE public.specializzazioni (
    id_specializzazione integer NOT NULL,
    descrizione character varying
);


ALTER TABLE public.specializzazioni OWNER TO jan;

--
-- TOC entry 2835 (class 2604 OID 25047)
-- Name: esami id_esame; Type: DEFAULT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.esami ALTER COLUMN id_esame SET DEFAULT nextval('public.esami_id_esame_seq'::regclass);


--
-- TOC entry 2832 (class 2604 OID 25079)
-- Name: medici id_medico; Type: DEFAULT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.medici ALTER COLUMN id_medico SET DEFAULT nextval('public.medici_id_medico_seq'::regclass);


--
-- TOC entry 2830 (class 2604 OID 25068)
-- Name: pazienti id_paziente; Type: DEFAULT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.pazienti ALTER COLUMN id_paziente SET DEFAULT nextval('public.pazienti_id_paziente_seq'::regclass);


--
-- TOC entry 2834 (class 2604 OID 25088)
-- Name: prenotazioni_esami id_prenotazione; Type: DEFAULT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.prenotazioni_esami ALTER COLUMN id_prenotazione SET DEFAULT nextval('public.prenotazioni_esami_id_esame_seq'::regclass);


--
-- TOC entry 2833 (class 2604 OID 25097)
-- Name: prenotazioni_visite id_prenotazione; Type: DEFAULT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.prenotazioni_visite ALTER COLUMN id_prenotazione SET DEFAULT nextval('public.prenotazioni_visite_id_prenotazione_seq'::regclass);


--
-- TOC entry 2836 (class 2604 OID 24973)
-- Name: prescrizioni id_prescrizione; Type: DEFAULT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.prescrizioni ALTER COLUMN id_prescrizione SET DEFAULT nextval('public.prescrizioni_id_prescrizione_seq'::regclass);


--
-- TOC entry 2977 (class 0 OID 24941)
-- Dependencies: 202
-- Data for Name: esami; Type: TABLE DATA; Schema: public; Owner: jan
--

INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esame 1', 1, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esame 2', 2, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esame 3', 3, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esame 4', 4, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esame 5', 5, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esame 6', 6, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('(Laser) dopplergrafia degli arti superiori o inferiori', 7, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('11 deossicortisolo', 8, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('17 alfa idrossiprogesterone (17 OH-P)', 9, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('17 chetosteroidi ', 10, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('17 idrossicorticoidi [dU]', 11, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('3 metil istidina', 12, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('7 deidrocolesterolo. Dosaggio', 13, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aberrometria oculare', 14, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acidi biliari', 15, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acidi grassi a catena molto lunga (VLCFA)', 16, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acidi nucleici di microrganismi (batteri, virus, miceti, protozoi) ricerca in materiali biologici vari multiplex ', 17, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acidi organici urinari (NAS) in gc/ms. Dosaggio', 18, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido 5 idrossi 3 indolacetico', 19, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido acetoacetico', 20, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido citrico', 21, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido delta aminolevulinico (ALA)', 22, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido fitanico. Dosaggio', 23, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido guanidino acetico. Dosaggio', 24, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido ippurico', 25, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido lattico', 26, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido omovanillico', 27, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido orotico urinario. Dosaggio', 28, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido para aminoippurico (PAI)', 29, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido pipecolico. Dosaggio', 30, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido piruvico', 31, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido pristanico. Dosaggio', 32, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido sialico', 33, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido sialico libero. Dosaggio', 34, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido sialico totale. Dosaggio', 35, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido valproico ', 36, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acido vanilmandelico ', 37, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Actinomiceti in materiali biologici ', 38, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 39, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Acufenometria, prove audiometriche sopraliminari', 40, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Adiuretina [vasopressina] (ADH)', 41, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Adrenalina - Noradrenalina', 42, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Adrenalina - noradrenalina [p]', 43, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Adrenalina - noradrenalina [u]', 44, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aeromonas nelle feci ', 45, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale ', 46, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agglutinine a freddo', 47, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agoaspirato della mammella', 48, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agoaspirato della mammella in stereotassi', 49, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agoaspirato ecoguidato della mammella', 50, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agoaspirazione di cisti dell&#39;ovaio', 51, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agoaspirazione ecoguidata dei follicoli [pick up ovocitario]. Prelievo ovociti', 52, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agoaspirazione testicolare (TESA)', 53, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agoaspirazione/Drenaggio nella regione tiroidea', 54, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agobiopsia ecoguidata della prostata (approccio transperineale o transrettale)', 55, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agobiopsia ecoguidata delle vescicole seminali', 56, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agobiopsia ecoguidata transtracheale o transbronchiale di linfonodi ilo mediastinici', 57, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agobiopsia linfonodale', 58, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agobiopsia orbitaria', 59, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Agobiopsia percutanea o agoaspirato del fegato', 60, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ala deidrasi eritrocitaria', 61, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alanina aminotransferasi (ALT / GPT)', 62, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Albumina', 63, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Albuminuria [microalbuminuria]', 64, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aldolasi', 65, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aldosterone', 66, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alfa 1 antitripsina', 67, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alfa 1 fetoproteina', 68, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alfa 1 glicoproteina acida', 69, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alfa 1 microglobulina', 70, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alfa 2 antiplasmina', 71, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alfa 2 macroglobulina', 72, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alfa amilasi isoenzimi ', 73, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alfa amilasi totale', 74, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Alluminio', 75, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amebe a vita libera ', 76, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 77, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amebe a vita libera ', 78, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale ', 79, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amebe a vita libera ', 80, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico (con colorazioni specifiche)', 81, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aminoacidi totali, frazionamento cromatografico', 82, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aminoacidi. Dosaggio', 83, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amitriptilina', 84, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ammonio', 85, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amniocentesi', 86, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amniocentesi diagnostica prelievo dei villi coriali', 87, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amniocentesi tardiva', 88, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amnioscopia', 89, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amplificazione gene N-MYC', 90, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Amplificazione MDM2', 91, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi cinematica dell&#39;arto superiore o inferiore o del tronco', 92, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica molecolare. Incluso: fish con sonda di DNA su metafasi/nuclei interfasici/mlpa e coltura del materiale biologico da analizzare', 93, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica per patologia da fragilità cromosomica', 94, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica per ricerca siti fragili', 95, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica per scambi di cromatidi fratelli', 96, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica per studio mosaicismo cromosomico', 97, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica per studio riarrangiamenti cromosomici indotti', 98, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica postnatale. Analisi del cariotipo', 99, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica prenatale. Analisi del cariotipo', 100, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica prenatale. Ricerca aneuploidie dei cromosomi 13, 18, 21, X e Y', 101, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi citogenetica prenatale. Ricerca aneuploidie dei cromosomi 15, 16, 22', 102, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi del carattere', 103, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi del DNA cellulare per lo studio citometrico del ciclo cellulare e della ploidia', 104, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi del DNA e ibridazione con sonda molecolare (southern blot)', 105, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi del DNA per polimorfismo', 106, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi della cinematica dell&#39;arto superiore ', 107, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi della cinematica e della dinamica del passo ', 108, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi della superficie oculare [test di Schirmer, break up time (BUT), ', 109, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('con coloranti]', 110, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi di contaminazione materna. Zigosità, PCR qualitativa (real-time PCR)', 111, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi di mutazione del DNA con elettroforesi', 112, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi di mutazione del DNA con ibridazione con sonde', 113, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi di mutazione nota. Ricerca di mutazione identificata in caso di familiarità', 114, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi di mutazioni del DNA', 115, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi di polimorfismi (STR, VNTR)', 116, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi di regione cromosomica mediante southern blot (blotting)', 117, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi di segmenti di DNA mediante sequenziamento', 118, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi di sequenza geniche mediante next generation sequencing (NGS) e tecniche assimilabili', 119, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi dinamometrica dell&#39;arto superiore o inferiore o del tronco', 120, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi dinamometrica isocinetica segmentale', 121, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi microsatelliti tx-eterologo', 122, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi mutazionale di malattia che necessita del sequenziamento del DNA mitocondriale per la diagnosi', 123, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi mutazionale di malattia che necessita di più di un gene per la diagnosi. Sequenziamento ed eventuale metodica quantitativa.', 124, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi mutazionale di malattia che necessita di un solo gene per la diagnosi', 125, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi quantitativa di acidi nucleici umani mediante PCR real time (RT-PCR) o tecniche assimilabili', 126, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Analisi strumentale della voce / ', 127, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('fonetografico', 128, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Androstanediolo glucuronide', 129, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM coronarica', 130, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM dei vasi del collo', 131, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM dei vasi del collo senza e con MDC', 132, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM del distretto toracico', 133, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM del distretto vascolare intracranico', 134, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM del distretto vascolare intracranico senza e con MDC', 135, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM dell&#39;addome inferiore', 136, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM dell&#39;addome superiore', 137, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM dell&#39;arto inferiore', 138, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM dell&#39;arto superiore', 139, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM dell&#39;arto superiore o inferiore', 140, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio RM midollo spinale con mezzo di contrasto', 141, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC [arteriosa e venosa] degli arti inferiori', 142, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC [arteriosa e venosa] degli arti superiori', 143, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC dei vasi del collo [carotidi]', 144, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC dei vasi intracranici', 145, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC dei vasi intracranici e del collo [carotidi]', 146, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC del circolo polmonare', 147, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC dell&#39;aorta addominale', 148, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC dell&#39;aorta toracica', 149, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC dell&#39;aorta toraco addominale', 150, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC di aorta addominale e arterie renali', 151, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angio TC di aorta addominale e arti inferiori', 152, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angiocardiografia combinata del cuore destro e sinistro', 153, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angiocardiografia del cuore destro', 154, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angiocardiografia del cuore sinistro', 155, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angiocardiografia della vena cava', 156, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angiocardioscintigrafia all&#39;equilibrio ', 157, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angiocardioscintigrafia di primo passaggio (first pass)', 158, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angiografia con fluoresceina o angioscopia oculare', 159, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angiografia oculistica con verde indocianina', 160, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angioscintigrafia [angiografia, venografia radioisotopica]', 161, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angioscopia percutanea', 162, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Angiotensina II', 163, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anisakis anticorpi', 164, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anoscopia', 165, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ansogramma colico per atresia anorettale', 166, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antibiotici', 167, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticoagulante lupus-like (LAC)', 168, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticoagulanti acquisiti ricerca', 169, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti A/B', 170, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti antigeni nucleari estraibili (ENA). Test di screening', 171, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti canale del calcio', 172, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti cardiolipina [igG, IgM ed eventuali igA]', 173, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti cellule parietali gastriche (PCA)', 174, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti centromero', 175, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti citoplasma dei neutrofili (ANCA: p-ANCA e c-ANCA) ', 176, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti citrullina (peptide)', 177, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti DNA nativo', 178, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti endomisio', 179, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti endotelio', 180, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti eritrocitari (caratterizzazione del range termico)', 181, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti eritrocitari (con mezzo potenziante)', 182, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti eritrocitari (identificazione)', 183, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti eritrocitari (titolazione)', 184, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti eritrocitari [test di Coombs diretto]', 185, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti eritrociti [test di Coombs indiretto]', 186, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti fattore VIII', 187, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti fosfolipidi (IgG, IgM) ', 188, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti gliadina deamidata (DPG-AGA) IgG', 189, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti glicoproteina oligodendrocitaria mielinica (MOG)', 190, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti glutammico decarbossilasi (GAD)', 191, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti GM1 (monosialoganglioside)', 192, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti HLA (cross-match, singolo individuo)', 193, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti HLA contro sospensioni linfocitarie (almeno 10 soggetti)', 194, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti insula pancreatica (ICA)', 195, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti insulina (AIAA)', 196, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti interferone', 197, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti istoni', 198, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti JO1. Determinazione singola', 199, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti leucociti', 200, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti MAG', 201, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti membrana basale glomerulare', 202, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti microsomi (AbTMS) o anti tireoperossidasi (AbTPO)', 203, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti microsomi epatici e renali (LKMA)', 204, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti mieloperossidasi (MPO)', 205, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti mitocondri (AMA)', 206, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti muscolo liscio (ASMA)', 207, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti muscolo striato (cuore)', 208, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti nucleo (ANA)', 209, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti organo', 210, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti ovaio', 211, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti piastrine ', 212, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti piastrine adese ', 213, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti piastrine circolanti', 214, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti piastrine identificazione', 215, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti proteinasi 3 (PR3)', 216, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti recettore acetilcolina', 217, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti recettore del TSH', 218, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti recettore nicotinico muscolare', 219, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti RNP. Determinazione singola', 220, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Deidroepiandrosterone (DEA)', 658, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti saccaromyces cerevisiae ', 221, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti Scl-70. Determinazione singola', 222, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti Sm. Determinazione singola', 223, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti spermatozoi ', 224, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti SSA. Determinazione singola', 225, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti SSB. Determinazione singola', 226, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti surrene', 227, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti testicolo (ATLA)', 228, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti tireoglobulina (ABTG)', 229, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi anti transglutaminasi (IgG, IgA)', 230, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi emolitici anti eritrocitari', 231, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi IgG avidity per rosolia, citomegalovirus.', 232, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Anticorpi in fase solida anticorpi anti-at1r', 233, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene carboidratico 125 (CA 125)', 234, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene carboidratico 15.3 (CA 15.3)', 235, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene carboidratico 19.9 (CA 19.9)', 236, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene carboidratico 195 (CA 195)', 237, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene carboidratico 50 (CA 50) ', 238, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene carboidratico 72-4 (CA 72-4) ', 239, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene carboidratico mucinoso [MCA]', 240, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene carcinoembrionario [CEA]', 241, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene polipeptidico tissutale [TPA]', 242, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene prostatico specifico [PSA]', 243, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene prostatico specifico [PSA] reflex', 244, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigene ta 4 [SCC]', 245, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigeni eritrocitari CD55/CD59', 246, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigeni hla ', 247, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antigeni piastrinici', 248, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Antitrombina funzionale [AT3]', 249, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aortografia addominale', 250, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aortografia toracica', 251, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Apicocardiogramma (con elettrodo ECG)', 252, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Apolipoproteina A1', 253, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Apolipoproteina B', 254, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aptoglobina', 255, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Arteriografia coronarica con catetere doppio', 256, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Arteriografia coronarica con catetere singolo', 257, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Arteriografia della placenta', 258, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Arteriografia di arterie cerebrali', 259, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Arteriografia monolaterale dell&#39;arto superiore', 260, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Artro RM: RMN (risonanza magnetica nucleare) muscoloscheletrica', 261, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Artro RM: RMN (risonanza magnetica nucleare) muscoloscheletrica senza e con mezzo di contrasto', 262, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Artro TC (tomografia computerizzata) spalla o gomito o ginocchio', 263, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Artrografia con mezzo di contrasto', 264, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Artrografia temporomandibolare con contrasto bilaterale', 265, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Artrografia temporomandibolare con contrasto monolaterale', 266, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aspartato aminotransferasi (AST / GOT)', 267, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Aspirazione percutanea di cisti nella ghiandola del Bartolino', 268, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Attivatore tissutale del plasminogeno [TPA]', 269, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Audiometria', 270, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Audiometria automatica', 271, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Balanoscopia', 272, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Barbiturici', 273, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bartonella hanselae anticorpi, IgG e IgM per classe di anticorpi', 274, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bartonella ricerca anticorpi IgG e IgM', 275, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri acidi nucleici in materiali biologici ibridazione', 276, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri acidi nucleici in materiali biologici ibridazione diretta', 277, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri acidi nucleici in materiali biologici ricerca qualitativa/quantitativa', 278, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri anaerobi antibiogramma da coltura (M.I.C., almeno 10 antibiotici)', 279, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri anaerobi da coltura identificazione biochimica', 280, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri anaerobi in materiali biologici ', 281, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 282, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri antibiogramma da coltura (attività associazioni antibiotiche)', 283, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri antibiogramma da coltura (attività battericida C.M.B.)', 284, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri antibiogramma da coltura (kirby bauer, almeno 10 antibiotici)', 285, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri antibiogramma da coltura (M.I.C., almeno 10 antibiotici)', 286, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri anticorpi immunoblotting (saggio di conferma)', 287, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri antigeni cellulari ed extracellulari identificazione diretta', 288, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri antigeni cellulari ed extracellulari ricerca diretta in materiali biologici', 289, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri da coltura identificazione biochimica', 290, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri da coltura identificazione sierologica', 291, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri determinazione carica microbica in liquidi biologici diversi', 292, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri in campioni biologici diversi ricerca microscopica', 293, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri potere antibatterico residuo in materiali biologici diversi', 294, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri potere battericida del siero sull&#39;isolato clinico', 295, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri prodotti metabolici in materiali biologici diversi identificazione', 296, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Batteri respiratori ricerca acidi nucleici multiplex. Almeno tre microrganismi', 297, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Benzodiazepine', 298, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Benzolo', 299, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Beta tromboglobulina', 300, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Beta-Idrossibutirrato', 301, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Beta2 microglobulina', 302, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bicarbonati (idrogenocarbonato)', 303, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bilirubina (curva spettrofotometrica nel liquido amniotico)', 304, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bilirubina diretta', 305, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bilirubina reflex', 306, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bilirubina totale', 307, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bioimpedenziometria, valutazione dello stato di idratazione', 308, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biomicroscopia corneale con conta cellule endoteliali', 309, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [agobiopsia] del midollo osseo', 310, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [agobiopsia] della lingua', 311, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [agobiopsia] di ghiandola o dotto salivare', 312, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [endoscopica] del retto', 313, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [endoscopica] dell&#39;esofago', 314, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [endoscopica] dell&#39;intestino tenue', 315, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [endoscopica] dello stomaco', 316, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] [aspirazione] del pancreas eco-guidata', 317, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] [aspirazione] del pancreas TC guidata', 318, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] dei nervi cranici o periferici o dei gangli', 319, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] dei nervi periferici', 320, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] del mediastino', 321, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] del polmone', 322, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dello scroto o della tunica vaginale', 431, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] del rene alla cieca, ecoguidata, tac-guidata, endoscopica', 323, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] del testicolo', 324, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] della colecisti e dei dotti biliari', 325, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] della tiroide', 326, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] delle ghiandole surrenali', 327, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] delle meningi cerebrali', 328, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] di lesione cerebrale', 329, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] di massa intraddominale eco-guidata', 330, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia [percutanea] [agobiopsia] di massa intraddominale TC guidata', 331, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a celo aperto del retto', 332, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto dei bronchi', 333, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto dei legamenti uterini', 334, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto dei nervi cranici o periferici o dei gangli', 335, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto dei seni nasali', 336, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto del fegato', 337, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto del pancreas', 338, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto del polmone', 339, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto del testicolo', 340, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto dell&#39;intestino tenue', 341, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto dell&#39;uretere', 342, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto dell&#39;utero', 343, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto della colecisti e dei dotti biliari', 344, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto della laringe o trachea', 345, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto della lingua', 346, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto della mammella', 347, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto della milza', 348, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto della prostata', 349, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto della tiroide', 350, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto delle ghiandole surrenali', 351, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto delle meningi cerebrali', 352, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto delle vescicole seminali', 353, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto di ghiandola o dotto salivare', 354, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia a cielo aperto di lesione cerebrale', 355, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia aspirativa dell&#39;ovaio', 356, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia bronchiale [endoscopica]', 357, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia chirurgica della mammella con o senza reperaggio stereotassico', 358, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia chiusa [endoscopica] della trachea', 359, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia chiusa [percutanea] [agobiopsia] del polmone', 360, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dei legamenti uterini', 361, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dei seni nasali', 362, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dei tessuti molli/muscoli', 363, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dei vasi sanguigni', 364, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del bulbo oculare e dell&#39;orbita', 365, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del carpo e metacarpo', 366, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del cordone spermatico, dell&#39;epididimo o dei dotti deferenti', 367, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del cul de sac', 368, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del cuore', 369, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del diaframma', 370, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del femore', 371, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del labbro', 372, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del naso', 373, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del palato osseo', 374, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del pene', 375, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del pericardio', 376, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del peritoneo', 377, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del radio e dell&#39;ulna', 378, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del sacco lacrimale', 379, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del tarso e metatarso', 380, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del tessuto periprostatico', 381, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del tessuto perirenale o perivescicale', 382, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del tessuto periuretrale', 383, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia del timo', 384, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;alveolo', 385, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;ano o dei tessuti perianali', 386, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;intestino tenue in corso di enteroscopia ', 387, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;ipofisi per via non specificata', 388, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;ipofisi per via trans-frontale', 389, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;ipofisi per via trans-sfenoidale', 390, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;iride', 391, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;omero', 392, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;orecchio esterno', 393, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;orecchio interno e dell&#39;orecchio medio', 394, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;orecchio medio', 395, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;osso in sede non specificata', 396, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;ugola', 397, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;uretra', 398, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;utero', 399, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia dell&#39;utero con dilatazione del canale cervicale', 400, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della bocca (cavo orale)', 401, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della congiuntiva', 402, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della cornea', 403, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della cute e del tessuto sottocutaneo', 404, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della gengiva', 405, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della ghiandola lacrimale', 406, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della ghiandola pineale', 407, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della laringe', 408, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della mammella con tru-cut', 409, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della palpebra', 410, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della parete addominale o dell&#39;ombelico', 411, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della parete toracica ', 412, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della pleura', 413, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della rotula', 414, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della scapola, clavicola e torace (coste e sterno)', 415, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della tibia e fibula', 416, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia della vulva o della cute perineale', 417, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle ossa facciali', 418, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle paratiroidi', 419, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle pareti vaginali a guida colposcopica', 420, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle strutture articolari del ginocchio', 421, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle strutture articolari del gomito', 422, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle strutture articolari del piede e delle dita del piede', 423, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle strutture articolari del polso', 424, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle strutture articolari dell&#39;anca', 425, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle strutture articolari della caviglia', 426, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle strutture articolari della mano e delle dita della mano', 427, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle strutture articolari della spalla', 428, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle strutture articolari, sede non specificata ', 429, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia delle tube', 430, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia di muscoli o tendini extraoculari', 432, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia di strutture linfatiche', 433, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia di tessuti perirettali', 434, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia di tonsille e adenoidi', 435, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia endocervicale', 436, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia endometriale', 437, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia endoscopica del polmone', 438, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia endoscopica dell&#39;albero biliare o dello sfintere di Oddi', 439, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia faringea', 440, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia in sede multipla in corso di ileocolonscopia retrograda', 441, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia laparoscopica dell&#39;ovaio', 442, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia mediastinica a cielo aperto', 443, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia mirata della portio e dell&#39;endocervice ', 444, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia mirata endocervicale a guida isteroscopica', 445, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia per aspirazione [percutanea] [agobiopsia] della milza', 446, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia percutanea dell&#39;uretere', 447, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia percutanea mammaria vacuum assisted', 448, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia renale a cielo aperto', 449, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia RM della mammella con retroaspirazione', 450, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia transparietale [ecoendoscopica] biliopancreatica', 451, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia transparietale [ecoendoscopica] del colon ', 452, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia transparietale [ecoendoscopica] del retto-sigma', 453, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia transureteroscopica', 454, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia vaginale o delle pareti vaginali', 455, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biopsia vescicale a cielo aperto', 456, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Biotinidasi. Dosaggio', 457, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bordetella anticorpi (E.I.A.)', 458, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bordetella anticorpi IgG e IgM. Incluso: IgA se IgM negative', 459, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Bordetella ', 460, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale ', 461, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Borrelia analisi qualitativa DNA o RNA', 462, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Borrelia anticorpi IgG e IgM. Incluso: eventuale immunoblotting', 463, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Borrelia burgdorferi anticorpi (E.I.A.)', 464, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Borrelia burgdorferi anticorpi (I.F.)', 465, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('BRCA1 e 2 reflex: sequenziamento completo e riarrangiamento con consulenza genetica pre-post test', 466, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Breath test per determinazione di colonizzazione batterica anomala', 467, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Breath test per determinazione tempo di transito intestinale, svuotamento gastrico', 468, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Breath test per helycobacter pylori (Urea C13)', 469, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Breath test per intolleranza al lattosio', 470, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Breath test per lo studio della funzionalità epatica', 471, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Breath test per lo studio della funzionalità pancreatica', 472, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Broncoscopia', 473, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Brucelle anticorpi (E.I.A.)', 474, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Brucelle anticorpi (titolazione mediante agglutinazione) [Wright]', 475, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Brucelle anticorpi incompleti (Coombs)', 476, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Brushing nasale per battito ciliare', 477, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('C peptide', 478, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('C peptide. Dosaggio basale e dopo stimolo', 479, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cadmio', 480, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Calcio ionizzato (calcolo indiretto)', 481, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Calcio ionizzato determinazione diretta', 482, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Calcio totale', 483, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Calcitonina', 484, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Calcoli e concrezioni (ricerca semiquantitativa)', 485, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Calcoli ', 486, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('chimico di base (ricerca qualitativa)', 487, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Calprotectina fecale', 488, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Campylobacter antibiogramma', 489, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Campylobacter da coltura identificazione biochimica', 490, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Campylobacter ', 491, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 492, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Capacitazione del materiale seminale [swim up]', 493, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Capillaroscopia con videoregistrazione', 494, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Captazione tiroidea', 495, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Carbamazepina', 496, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Carbossiemoglobina [(Sg)Hb/(Sg)Er]', 497, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cardiotocografia esterna', 498, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cariotipo ad alta risoluzione', 499, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cariotipo da metafasi di fibroblasti o di altri tessuti (materiale abortivo, ecc.)', 500, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cariotipo da metafasi di liquido amniotico', 501, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cariotipo da metafasi linfocitarie', 502, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cariotipo da metafasi spontanee di midollo osseo', 503, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cariotipo da metafasi spontanee di villi coriali', 504, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Carnitina esterificata', 505, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Carnitina libera', 506, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Catecolamine totali urinarie', 507, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Catene kappa e lamba [s/u] dosaggio (per ogni dosaggio)', 508, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cavografia inferiore', 509, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cavografia superiore', 510, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ceruloplasmina', 511, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cheratoestesiometria', 512, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chimotripsina', 513, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydia pneumoniae anticorpi IgG e IgM. Incluso: IgA se IgM negative', 514, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydia psittaci anticorpi IgG e IgM. Incluso: IgA se IgM negative', 515, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydia trachomatis anticorpi IgG e IgM. Incluso: IgA se IgM negative', 516, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydie anticorpi (E.I.A.)', 517, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydie anticorpi (titolazione mediante F.C.)', 518, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydie da coltura identificazione (I.F.)', 519, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydie da coltura identificazione microscopica (colorazione iodio, giemsa)', 520, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydie ', 521, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 522, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydie ricerca diretta (E.I.A.)', 523, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydie ricerca diretta (I.F.)', 524, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydie ricerca diretta (mediante ibridazione)', 525, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Chlamydie ricerca qualitativa DNA', 526, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ciclosporina ', 527, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cine RM (risonanza magnetica) del cuore', 528, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cine RM (risonanza magnetica) del cuore senza e con mezzo di contrasto', 529, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cine RM (risonanza magnetica) del cuore senza e con stress funzionale', 530, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cistatina C ', 531, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cistina intraleucocitaria', 532, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cistografia', 533, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cistografia con doppio contrasto', 534, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cistometrografia', 535, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cistoscopia attraverso stoma artificiale', 536, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cistosonografia con mezzo di contrasto', 537, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cistouretrografia minzionale', 538, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cistouretrografia retrograda', 539, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Citotossicità (CTL)', 540, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Citotossicità (LAK)', 541, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Citotossicità con antigeni specifici', 542, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Citotossicità spontanea NK', 543, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Clisma con doppio contrasto dell&#39;intestino', 544, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Clisma del tenue con doppio contrasto dell&#39;intestino', 545, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Clisma opaco semplice dell&#39;intestino', 546, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cloruro', 547, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cloruro, sodio e potassio [SD] (stimolazione con pilocarpina)', 548, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Clostridium difficile da coltura identificazione biochimica', 549, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Clostridium difficile ', 550, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 551, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Clostridium difficile tossine nelle feci ricerca diretta', 552, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cobalammina (vitamina B12)', 553, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cobalto', 554, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Codelezione 1p-19q', 555, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cofattore ristocetinico', 556, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colangio RM', 557, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colangiografia epatica percutanea', 558, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colangiografia intraoperatoria', 559, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colangiografia intravenosa', 560, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colangiografia retrograda endoscopica [ERC]', 561, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colangiografia transcatetere', 562, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colangiopancreatografia retrograda endoscopica [ERCP]', 563, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colecistografia', 564, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colesterolo HDL', 565, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colesterolo LDL', 566, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colesterolo LDL. Determinazione diretta', 567, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colesterolo LDL. Determinazione indiretta', 568, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colesterolo totale', 569, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colinesterasi (pseudo-che) ', 570, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colonscopia - ileoscopia retrograda', 571, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colonscopia con endoscopio flessibile', 572, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colonscopia con endoscopio flessibile con biopsia', 573, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Color doppler transcranico', 574, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazione aggiuntiva in bande: actinomicina D', 575, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazione aggiuntiva in bande: bandeggio C', 576, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazione aggiuntiva in bande: bandeggio G', 577, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazione aggiuntiva in bande: bandeggio G ad alta risoluzione', 578, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazione aggiuntiva in bande: bandeggio NOR', 579, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazione aggiuntiva in bande: bandeggio Q', 580, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazione aggiuntiva in bande: bandeggio R', 581, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazione aggiuntiva in bande: bandeggio T', 582, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazione aggiuntiva in bande: distamicina A', 583, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colorazioni vitali in corso di EGDS o colonscopia', 584, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colpografia', 585, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Colposcopia', 586, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di amniociti', 587, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di cellule di altri tessuti', 588, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di fibroblasti', 589, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di linee cellulari stabilizzate con virus', 590, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di linee linfocitarie stabilizzate con virus o interleuchina', 591, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di linfociti fetali con PHA', 592, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di linfociti periferici con PHA o altri mitogeni', 593, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di materiale abortivo', 594, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di villi coriali', 595, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura di villi coriali (a breve termine)', 596, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura mista linfocitaria unidirezionale', 597, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura per studio del cromosoma X a replicazione tardiva', 598, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coltura semisolida di cellule emopoietiche', 599, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Complemento (C1 inibitore) quantitativo', 600, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Complemento: C3, C3 Naf, C4, CH50', 601, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Compliance polmonare statica e dinamica', 602, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Conservazione di campioni di DNA o di RNA', 603, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Consulenza genetica associata al test', 604, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Controllo del set-up iniziale per prima seduta, controllo portale e/o della ripetibilità del set up del paziente', 605, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Controllo della forma dell&#39;onda del pace-maker', 606, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Controllo della impedenza dell&#39;elettrodo del pace-maker', 607, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Controllo della soglia di voltaggio o amperaggio del pace-maker', 608, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Controllo di cardiovertore/defibrillatore impiantabile automatico (AICD)', 609, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Controllo di frequenza del pace-maker', 610, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Controllo e programmazione defibrillatore impiantabile', 611, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Controllo radiologico di derivazioni liquorali', 612, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coproporfirine', 613, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Corneometria', 614, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coronarografia (angiografia coronarica)', 615, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Corpi chetonici', 616, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Corticotropina (ACTH)', 617, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cortisolo', 618, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Corynebacterium diphteriae ', 619, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 620, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Coxiella burneti anticorpi', 621, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Creatina. Dosaggio', 622, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Creatinchinasi (CPK o CK)', 623, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Creatinchinasi isoenzima MB (CK-MB) ', 624, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Creatinchinasi isoenzimi', 625, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Creatinchinasi isoforme', 626, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Creatinina ', 627, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Creatinina clearance ', 628, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Crioconservazione cellule staminali [placentari] per trapianto', 629, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Crioconservazione in azoto liquido di cellule e tessuti', 630, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Crioconservazione in azoto liquido di colture cellulari', 631, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Crioconservazione siero pre-trapianto', 632, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Crioconservazione sospensioni linfocitarie', 633, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Crioglobuline ricerca', 634, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Crioglobuline tipizzazione', 635, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Criptococco ricerca diretta', 636, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cromatografia zuccheri urinari', 637, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cromo', 638, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cromocistoscopia', 639, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cromogranina A', 640, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cross-Match citofluorietrico linfociti T IgM', 641, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cross-Match citofluorimetrico linfociti B IgG', 642, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cross-Match citofluorimetrico linfociti T IgG', 643, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cross-Match citotossico con linfociti B', 644, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cross-Match citotossico con linfociti T', 645, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cryptosporidium ricerca diretta nelle feci', 646, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Culdoscopia', 647, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Curettage della cornea per striscio o coltura', 648, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Cyfra 21-1', 649, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('D-dimero (test al latice)', 650, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('D-Dimero. Dosaggio con metodo immunometrico', 651, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Dacriocistografia', 652, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Decarbossiprotrombina', 653, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Defecografia', 654, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Deferentografia con contrasto', 655, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Definizione del volume bersaglio e degli organi a rischio per tecniche 2D', 656, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Definizione del volume bersaglio e degli organi a rischio per tecniche 3D e IMRT', 657, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Deidroepiandrosterone solfato (DEA-S)', 659, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Delta 4 androstenedione', 660, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Desipramina', 661, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Desossipiridinolina', 662, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Determinazione del pattern respiratorio a riposo', 663, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Determinazione del volume plasmatico o del volume eritrocitario', 664, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Determinazione della capacità vitale', 665, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Determinazione della P 0.1', 666, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Determinazione delle massime pressioni inspiratorie ed espiratorie o transdiaframmatiche', 667, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Determinazione e localizzazione perdite di LCR', 668, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Diffusione alveolo-capillare del CO', 669, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Digestione di DNA con enzimi di restrizione', 670, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Diidrotestosterone (DHT)', 671, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Dopamina [s/u]', 672, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Dosaggio attività anticoagulante dei farmaci inibitori fattore X attivato (eparina, rivaroxaban, etc.)', 673, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Dosaggio dell&#39;attività anticoagulante fattore anti IIa (dabigatran, etc)', 674, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Dosaggio quantitativo di un singolo acido organico in liquidi biologici mediante gc/ms con isotopi stabili', 675, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Dosimetria in vivo', 676, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Doxepina', 677, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Droghe d&#39;abuso', 678, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Du variante ricerca', 679, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Duplicazione di MLL', 680, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('ECG fetale (cuoio capelluto)', 681, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Echinococco [idatidosi] anticorpi ', 682, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eco(color)doppler dei reni e dei surreni', 683, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eco(color)doppler del fegato e delle vie biliari', 684, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eco(color)doppler del pancreas', 685, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eco(color)doppler dell&#39;addome inferiore', 686, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eco(color)doppler della mammella', 687, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eco(color)doppler della milza', 688, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eco(color)dopplergrafia degli arti superiori o inferiori o distrettuale', 689, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecobiometria, ', 690, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('biometrico interferometrico', 691, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler arterie renali', 692, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler cardiaco', 693, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler cardiaco a riposo', 694, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler cardiaco transesofagea ', 695, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler degli arti inferiori o superiori arterioso e/o venoso', 696, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler dei grossi vasi addominali arteriosi o venosi', 697, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler dei tronchi sovraaortici', 698, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler paratiroidi', 699, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler penieno dinamico con stimolazione farmacologica', 700, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler scrotale', 701, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler vasi splancnici', 702, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordoppler vasi viscerali', 703, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordopplergrafia cardiaca fetale / ecocardiogramma fetale', 704, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecocolordopplergrafia dei vasi venosi del collo', 705, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecodoppler fistola arterovenosa', 706, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecoencefalografia. Ecografia transfontanellare', 707, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecoendoscopia biliopancreatica [ERP]', 708, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecoendoscopia del colon ', 709, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecoendoscopia del pancreas', 710, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecoendoscopia del pancreas con biopsia', 711, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecoendoscopia del retto-sigma', 712, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecoendoscopia di esofago, stomaco, duodeno', 713, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecoendoscopia di esofago, stomaco, duodeno con biopsia', 714, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia cardiaca', 715, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia cardiaca senza e con contrasto', 716, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia degli arti superiori o inferiori o distrettuale, arteriosa', 717, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia del capo, del collo e della tiroide', 718, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia del pene', 719, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia dell&#39;addome completo', 720, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia dell&#39;addome inferiore (inclusi ureteri, vescica e pelvi maschile o femminile)', 721, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia dell&#39;addome superiore (inclusi fegato e vie biliari, pancreas, milza, reni e surreni, retroperineo)', 722, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia della cute e del tessuto sottocutaneo', 723, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia della mammella (bilaterale)', 724, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia della mammella (monolaterale)', 725, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia delle anche nel neonato', 726, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia delle anse intestinali', 727, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia delle vie digestive', 728, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia di grossi vasi addominali', 729, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia di grossi vasi addominali senza e con contrasto', 730, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia endoanale', 731, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia ginecologica', 732, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia mediastinica transesofagea ', 733, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia muscolotendinea e osteoarticolare', 734, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia oculare', 735, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia organo mirata con mezzo di contrasto', 736, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia ostetrica', 737, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia ostetrica con translucenza nucale', 738, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia ostetrica morfologica', 739, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia parete addominale', 740, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia regione inguino-crurale', 741, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia scrotale e dei testicoli', 742, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia stazioni linfonodali pluridistrettuali (laterocervicale, sovraclaveare, ascellare, inguinale)', 743, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia toracica / polmonare', 744, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia transesofagea del torace', 745, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia transrettale', 746, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ecografia transvaginale', 747, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elastasi 1 pancreatica', 748, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elastometria', 749, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettrocardiogramma', 750, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettrocardiogramma dinamico (secondo Holter)', 751, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettrocardiogramma per lo studio del ritmo', 752, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettrocardiogramma transesofageo', 753, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettrococleografia', 754, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettroencefalogramma (EEG)', 755, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettroencefalogramma con analisi spettrale', 756, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettroencefalogramma con privazione del sonno', 757, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettroencefalogramma con sonno farmacologico', 758, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettroencefalogramma con videoregistrazione', 759, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettroencefalogramma dinamico [12-24 ore]', 760, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettrogustometria', 761, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettromiografia (EMG) dell&#39;occhio', 762, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettromiografia (EMG) di muscoli speciali [laringei, faringei, diaframma, perineali]', 763, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettromiografia (EMG) di una singola fibra ', 764, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettromiografia (EMG) di unità motoria analisi quantitativa. Con ', 765, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('ad ago', 766, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettromiografia dello sfintere uretrale', 767, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettromiografia semplice (EMG) ', 768, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettronistagmografia (ENG)', 769, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettrooculografia (EOG)', 770, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Elettroretinografia (ERG, flash-pattern)', 771, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emazie (conteggio), emoglobina', 772, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('EMG (elettromiografia) dinamica dell&#39;arto superiore ', 773, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emissioni otoacustiche', 774, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emocromo con formula', 775, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emogasanalisi arteriosa prima e durante somministrazione di ossigeno', 776, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emogasanalisi arteriosa sistemica ', 777, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emogasanalisi continua intra-arteriosa', 778, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emogasanalisi di sangue misto venoso', 779, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emogasanalisi durante respirazione di O2 a bassa concentrazione. Test dell&#39;ipossia', 780, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emogasanalisi durante respirazione di O2 ad alta concentrazione. Test dell&#39;iperossia', 781, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emogasanalisi prima e dopo iperventilazione', 782, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Emolisina bifasica', 783, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Endoscopia del condotto ileale (dotto artificiale realizzato negli interventi di cistectomia)', 784, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Endoscopia dell&#39;intestino crasso attraverso stoma artificiale', 785, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Endoscopia dell&#39;intestino tenue attraverso stoma artificiale', 786, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Endoscopia transaddominale dell&#39;intestino crasso', 787, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Endoscopia transaddominale dell&#39;intestino tenue', 788, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enolasi neuronespecifica (NSE)', 789, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Entamoeba histolytica anticorpi', 790, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Entamoeba histolytica nelle feci ', 791, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (coltura xenica)', 792, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Entamoeba histolytica/dispar antigeni ricerca diretta nelle feci ', 793, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enterobius vermicularis [ossiuri] ricerca microscopica su materiale perianale. Scotch test o tampone perianale', 794, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enterocolpocistodefecografia', 795, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enteroscopia con microcamera ingeribile [VCE]', 796, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enteroscopia per via anterograda con pallone [BAE]', 797, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enteroscopia per via anterograda con pallone [BAE] con biopsia', 798, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzima di conversione dell&#39;angiotensina (ACE)', 799, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi del metabolismo glicidico. Dosaggio', 800, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi della beta-ossidazione. Dosaggio', 801, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi eritrocitari', 802, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi glicosilazione delle proteine. Dosaggio', 803, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi lisosomiali. Dosaggio', 804, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi metabolismo degli amminoacidi. Dosaggio', 805, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi metabolismo delle porfirine. Dosaggio', 806, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi metabolismo lipidico. Dosaggio', 807, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi metabolismo pirimidinico. Dosaggio', 808, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi metabolismo purinico. Dosaggio', 809, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Enzimi mitocondriali. Dosaggio', 810, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eosinofili (conteggio) [Alb]', 811, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Epididimografia con contrasto', 812, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eritrociti: antigeni non AB0 e non Rh', 813, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Eritropoietina', 814, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('allergologico strumentale per orticarie da agenti fisici', 815, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('approfondito dell&#39;occhio', 816, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('audiometrico condizionato infantile', 817, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('audiometrico tonale', 818, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('audiometrico vocale', 819, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico da agoaspirato apparato digerente', 820, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico da agoaspirato apparato respiratorio', 821, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico da agoaspirato della tiroide', 822, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico da agoaspirato di tessuto emopoietico', 823, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico da agoaspirazione', 824, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico da agoaspirazione ecoguidata: sedi multiple', 825, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico da agoaspirazione: sedi multiple', 826, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico di espettorato', 827, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico di versamenti (fino a 5 vetrini e/o colorazioni)', 828, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico esfoliativo apparato digerente', 829, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico esfoliativo apparato respiratorio', 830, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico esfoliativo cute', 831, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico esfoliativo mammella', 832, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico esfoliativo sierose', 833, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico urine per ricerca cellule neoplastiche', 834, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale broncolavaggio [prelievo protetto di secrezioni respiratorie]', 835, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale campioni apparato genitourinario / Tampone cervico vaginale', 836, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale campioni biologici diversi', 837, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale del sangue [emocoltura]', 838, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale dell&#39;urina [urinocoltura]', 839, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale delle feci [coprocoltura]', 840, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale espettorato', 841, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale essudati [pleurico, peritoneale, articolare, pericardico]', 842, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale essudati purulenti [pus] da lesioni profonde', 843, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale essudati purulenti [pus] da lesioni superficiali', 844, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale essudato auricolare otite esterna monolaterale', 845, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale essudato auricolare otite media acuta monolaterale / Tampone auricolare', 846, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale essudato oculare monolaterale', 847, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale essudato oro-faringo-nasale / Tampone nasale', 848, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale seriato di: urine primo mitto, urine mitto intermedio, liquido prostatico e/o urine dopo massaggio prostatico [test di Stamey] ricerca batteri patogeni', 849, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale seriato di: urine primo mitto, urine mitto intermedio, liquido prostatico o seminale [test di Stamey]', 850, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('dei denti', 851, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('del midollo osseo per apposizione e/o striscio', 852, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('dell&#39;afasia ', 853, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('dell&#39;occhio sotto anestesia', 854, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('elettroglottografico', 855, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico altri organi da agobiopsia', 856, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente. Mapping per malattia infiammatoria cronica intestinale (IBD)', 857, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: agobiopsia epatica', 858, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: biopsia endoscopica (sede unica)', 859, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: biopsia endoscopica (sedi multiple)', 860, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: biopsia endoscopica per celiachia', 861, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: biopsia endoscopica per studio gastrite cronica', 862, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: biopsia ghiandola salivare', 863, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: biopsia semplice', 864, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: escissione di neoformazione', 865, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: mucosectomia', 866, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: polipectomia endoscopica (sedi multiple)', 867, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato digerente: polipectomia endoscopica (singola)', 868, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato genitale maschile: agobiopsia prostatica su prelievi multipli', 869, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato genitale: biopsia semplice', 870, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato genitale: da conizzazione cervice uterina ', 871, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato genitale: escissione di neoformazione', 872, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato muscolo scheletrico: biopsia incisionale o punch', 873, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato muscolo scheletrico: biopsia semplice ossea', 874, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato respiratorio: agobiopsia pleurica', 875, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato respiratorio: biopsia cavità nasali', 876, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato respiratorio: biopsia endobronchiale (sede unica)', 877, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato respiratorio: biopsia endobronchiale (sedi multiple)', 878, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato respiratorio: biopsia laringea', 879, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato respiratorio: biopsia semplice', 880, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato respiratorio: biopsia vie aeree (sedi multiple)', 881, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato respiratorio: polipectomia endoscopica', 882, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urinario per lesione diffusa: biopsia renale', 883, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urinario per lesione focale: biopsia renale', 884, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urinario: biopsia semplice', 885, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urinario: mapping da biopsia endoscopica vescicale', 886, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: biopsia cervicale e endometriale', 887, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: biopsia cervice uterina', 888, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: biopsia endometriale (VABRA)', 889, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: biopsia vaginale', 890, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: biopsia vulvare (sede unica)', 891, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: biopsia vulvare (sedi multiple)', 892, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: biopsie cervicali (sedi multiple)', 893, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: conizzazione della cervice', 894, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: polipectomia endocervicale', 895, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale femminile: raschiamento endometriale', 896, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale maschile: biopsia annessi testicolari', 897, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale maschile: biopsia pene', 898, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale maschile: biopsia testicolare', 899, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale: agobiopsia ovarica', 900, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale: biopsia endoscopica vescicale (sede unica)', 901, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico apparato urogenitale: biopsia endoscopica vescicale (sedi multiple)', 902, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico articolazioni. Biopsia semplice', 903, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico articolazioni: biopsia sinoviale, biopsia tendinea', 904, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico articolazioni: tessuto fibrotendineo', 905, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico bulbo oculare. Biopsia semplice', 906, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico cavo orale. Biopsia semplice', 907, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico cavo orale. Escissione di neoformazione', 908, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico cavo orale: biopsia multiple', 909, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico cute (shave o punch)', 910, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico cute e/o tessuti molli. Con biopsia o escissione di neoformazione', 911, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico cute e/o tessuti molli: biopsia incisionale', 912, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico cute e/o tessuti molli: biopsie multiple', 913, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico cute e/o tessuti molli: escissione neoformazioni multiple', 914, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico da agobiopsia di organo/tessuto superficiale o profondo', 915, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico della mammella: biopsia vacuum assisted', 916, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico di cute e/o tessuti molli. Escissione allargata di neoplasia maligna', 917, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico mammella: biopsia semplice', 918, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico mammella: biopsia stereotassica', 919, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico mammella: escissione di neoformazione', 920, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico mammella: nodulectomia', 921, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico naso e cavità nasali. Escissione di neoformazione', 922, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico orecchio. Biopsia semplice', 923, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sierose. Biopsia semplice', 924, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sierose: escissione di neoformazione', 925, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sistema circolatorio', 926, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sistema emopoietico: agobiopsia linfonodale', 927, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sistema emopoietico: agobiopsia linfonodale (sedi multiple)', 928, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sistema emopoietico: asportazione di linfonodo unico superficiale', 929, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sistema emopoietico: biopsia osteo midollare', 930, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sistema emopoietico: biopsia osteo-midollare (BOM)', 931, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sistema endocrino: agobiopsia tiroidea', 932, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sistema endocrino: biopsia semplice', 933, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico sistema linfoemopoietico: da agobiopsia linfonodale', 934, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico SNP (biopsia di nervo periferico)', 935, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico ultrastrutturale (SEM, TEM)', 936, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('istocitopatologico. Biopsia semplice di organo/tessuto superficiale o profondo', 937, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microbiologico del secreto endocervicale / Tampone vaginale', 938, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microbiologico del secreto uretrale/urine primo mitto', 939, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microbiologico del secreto vaginale', 940, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico del sangue periferico', 941, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di ferita operatoria - coltura', 942, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di ferita operatoria - coltura e sensibilità', 943, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di ferita operatoria - gruppo di cellule e striscio di Papanicolaou', 944, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di ferita operatoria - parassitologia', 945, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di ferita operatoria - striscio batterico', 946, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di ferita operatoria - tossicologia', 947, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di sistema muscoloscheletrico e liquido articolare - coltura', 948, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di sistema muscoloscheletrico e liquido articolare - coltura e sensibilità', 949, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di sistema muscoloscheletrico e liquido articolare - gruppo di cellule e striscio di Papanicolaou', 950, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di sistema muscoloscheletrico e liquido articolare - parassitologia', 951, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di sistema muscoloscheletrico e liquido articolare - striscio batterico', 952, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di sistema muscoloscheletrico e liquido articolare - tossicologia', 953, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di campione di vie genitali femminili, feto, sacco amniotico - tossicologia', 954, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico di striscio o apposizione di citoaspirato linfoghiandolare', 955, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('urodinamico invasivo ', 956, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('urodinamico non invasivo (uroflussometria)', 957, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('urovideodinamico', 958, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Escherichia coli nelle feci ', 959, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 960, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Escherichia coli patogeni da coltura identificazione biochimica', 961, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Escherichia coli patogeni da coltura identificazione sierologica', 962, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esofagogastroduodenoscopia [EGDS] con biopsia dell&#39;esofago', 963, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esoftalmometria', 964, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esplorazione digitale di stoma di enterostomia', 965, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esplorazione retroperitoneo', 966, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esplorazione rettale digitale', 967, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Esteri organofosforici', 968, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Estradiolo (E2)', 969, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Estrazione di DNA o di RNA (nucleare o mitocondriale)', 970, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Estriolo', 971, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Estriolo non coniugato', 972, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Estrone', 973, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Etanolo', 974, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Etosuccimide', 975, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Faringografia', 976, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Faringoscopia', 977, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Farmaci anti epilettici', 978, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Farmaci antiaritmici', 979, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Farmaci antiinfiammatori', 980, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Farmaci antitumorali', 981, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Farmaci con metodi cromatografici', 982, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Farmaci con tecniche non cromatografiche', 983, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Farmaci digitalici', 984, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Farmaci dosaggio quantitativo in cromatografia', 985, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fattore natriuretico atriale (ANP)', 986, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fattore reumatoide', 987, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fattore von Willebrand', 988, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fattore vWF', 989, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fattore vWF antigene (EIA)', 990, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fattore vWF CBA (EIA)', 991, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fattori della coagulazione (II, V, VII, VIII, IX, X, XI, XII, XIII) ', 992, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Feci ', 993, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('chimico e microscopico (grassi, prodotto di digestione, parassiti)', 994, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Feci sangue occulto', 995, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fenilalanina', 996, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fenitoina', 997, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fenolo [u]', 998, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fenotipo Rh', 999, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ferritina', 1000, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ferro', 1001, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ferro [dU]', 1002, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fibrina/Fibrinogeno ', 1003, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fibrinogeno clauss', 1004, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fibrinogeno funzionale ', 1005, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fibrinogeno immunologico', 1006, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fish BCL6', 1007, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fistolografia', 1008, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fistolografia dell&#39;arto inferiore', 1009, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fistolografia dell&#39;arto superiore', 1010, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fistulografia retroperitoneale', 1011, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia a impedenza', 1012, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia con mezzo di contrasto del sistema portale', 1013, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia con mezzo di contrasto delle vene del capo e del collo', 1014, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia con mezzo di contrasto delle vene polmonari', 1015, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia degli arti inferiori bilaterale', 1016, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia degli arti inferiori monolaterale', 1017, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia giugulare', 1018, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia iliaca', 1019, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia monolaterale dell&#39;arto superiore', 1020, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia orbitaria', 1021, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia renale', 1022, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia spermatica', 1023, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flebografia spinale', 1024, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fluoro', 1025, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Flussimetria (Ecocolordoppler fetoplacentare)', 1026, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Folato', 1027, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Follitropina (FSH)', 1028, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fondo oculare (', 1029, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('del fundus oculi)', 1030, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fonocardiogramma con elettrodo ECG', 1031, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fosfatasi acida', 1032, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fosfatasi alcalina', 1033, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fosfatasi alcalina isoenzima osseo', 1034, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fosfatasi prostatica ', 1035, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fosfato inorganico (fosforo)', 1036, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fosfoesosoisomerasi (PHI)', 1037, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fosforo', 1038, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fotografia del fondo oculare (fundus oculi)', 1039, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fotografia del segmento anteriore', 1040, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fotopletismografia degli arti superiori o inferiori', 1041, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fotopletismografia di altri distretti', 1042, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fragilità del cromosoma X (fraxa). Test di primo livello', 1043, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fragilità del cromosoma X (fraxa). Test di secondo livello', 1044, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Francisella tularensis [tularemia] anticorpi', 1045, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fruttosamina (proteine glicate) [S]', 1046, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fruttosio [ls]', 1047, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Funicolocentesi per la diagnosi prenatale di patologie del feto', 1048, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Fusione di immagini (RM, TC/PET, volumi biologici, volumi molecolari) con TC di pianificazione', 1049, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gait analysis: valutazione clinica della menomazione degli arti inferiori, incluso EMG dinamica del cammino', 1050, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Galattografia [duttografia, duttogalattografia]', 1051, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Galattosio (prova da carico)', 1052, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Galattosio 1-fosfato uridil transferasi (GALT)', 1053, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Galattosio [s/u]', 1054, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Galattosio-1-Fosfato. Dosaggio', 1055, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gamma-Glutamiltransferasi (Gamma GT)', 1056, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gastrina', 1057, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gastroscopia attraverso stoma artificiale', 1058, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gastroscopia transaddominale', 1059, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Giardia antigene nelle feci ricerca diretta (I.F.)', 1060, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Giardia antigeni ricerca diretta nelle feci', 1061, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Glicoproteina ricca in istidina', 1062, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Globulina da trasporto ormoni sessuali (SHBG)', 1063, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Globulina legante la tiroxina (TBG)', 1064, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Glucagone', 1065, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Glucosio', 1066, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Glucosio (Curva glicemica da carico 3 determinazioni)', 1067, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Glucosio (Curva glicemica da carico 6 determinazioni)', 1068, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Glucosio 6 fosfato deidrogenasi (G6PDH)', 1069, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Glutammato deidrogenasi', 1070, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gonadotropina corionica (prova immunologica di gravidanza)', 1071, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gonadotropina corionica (subunità beta, frazione libera)', 1072, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gonadotropina corionica (subunità beta, molecola intera)', 1073, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gruppo sanguigno AB0 (agglutinogeni e agglutinine) e Rh (D)', 1074, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gruppo sanguigno AB0/Rh II controllo', 1075, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Gustometria [olfattometria]', 1076, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - biosintesi in vitro', 1077, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - emoglobina [Sg/La]', 1078, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - emoglobina A2', 1079, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - emoglobina fetale (dosaggio)', 1080, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - emoglobina glicata', 1081, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - emoglobina plasmatica libera', 1082, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - emoglobina. Dosaggio frazioni (HbA2, HbF, Hb anomale)', 1083, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - emoglobine anomale (HbS, HbD, HbH, ecc.)', 1084, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - isoelettrofocalizzazione', 1085, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - ricerca mutazioni delle catene globiniche (cromatografia)', 1086, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Hb - test di stabilità [(Sg)Er]', 1087, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('HcG frazione libera e Papp-a', 1088, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Head up tilt test', 1089, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Helicobacter pylori anticorpi (E.I.A.)', 1090, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Helicobacter pylori antigene nelle feci ricerca diretta', 1091, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Helicobacter pylori in materiali biologici ', 1092, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1093, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Helicobacter pylori ureasi nel materiale bioptico (saggio mediante prova biochimica)', 1094, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ibridazione con sonda molecolare', 1095, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ibridazione genomica comparativa su Array (Array - CGH)', 1096, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ibridazione genomica comparativa su microarray. Incluso: estrazione DNA, CGH-Array, SNPS-Array, coltura del materiale biologico da analizzare', 1097, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ibridazione in situ (FISH) su metafasi, nuclei interfasici, tessuti - mediante sequenze genomiche in YAC', 1098, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ibridazione in situ (FISH) su metafasi, nuclei interfasici, tessuti - mediante sonde molecolari', 1099, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Identificazione di specificità anti HLA contro pannello linfocitario-(1 siero/30 cellule a antigenicità nota)', 1100, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Identificazione in fase solida anticorpi anti-HLA fissanti il complemento classe I', 1101, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Identificazione in fase solida anticorpi anti-HLA fissanti il complemento classe II', 1102, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Identificazione in fase solida specificità anti-HLA classe I. Isotipo IgG', 1103, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Identificazione in fase solida specificità anti-HLA classe I. Isotipo IgM', 1104, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Identificazione in fase solida specificità anti-HLA classe II. Isotipo IgG', 1105, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Identificazione in fase solida specificità anti-HLA classe II. Isotipo IgM', 1106, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Idrossiprolina [u]', 1107, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgA secretorie', 1108, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgE specifiche [RAST test] per allergeni singoli ricombinanti molecolari', 1109, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgE specifiche allergologiche [RAST test]: screening multiallergenico qualitativo', 1110, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgE specifiche allergologiche quantitativo [RAST test]', 1111, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgE specifiche allergologiche quantitativo [RAST test] per farmaci e veleni. Fino a 12 allergeni', 1112, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgE specifiche allergologiche quantitativo [RAST test] per inalanti e alimenti. Fino a 12 allergeni', 1113, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgE specifiche pannello [RAST test] per alimenti', 1114, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgE specifiche pannello [RAST test] per inalanti', 1115, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgE totali', 1116, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgG specifiche allergologiche', 1117, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('IgG, IgA sottoclassi', 1118, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ileocolonscopia per via retrograda con pallone [BAE]', 1119, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ileocolonscopia per via retrograda con pallone [BAE] con biopsia', 1120, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Imaging intravascolare dei vasi cerebrali extracranici', 1121, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Imaging intravascolare dei vasi coronarici', 1122, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Imaging intravascolare dei vasi intratoracici', 1123, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Imaging intravascolare dei vasi periferici', 1124, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Imaging intravascolare dei vasi renali', 1125, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Imipramina', 1126, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Immunocomplessi circolanti', 1127, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Immunofenotipizzazione leuco/linfocitaria', 1128, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Immunofissazione', 1129, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Immunoglobuline di superficie linfocitarie', 1130, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Immunoglobuline IgA, IgD, IgG o IgM', 1131, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Immunoglobuline: catene kappa e lambda', 1132, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Immunoglobuline: catene kappa e lambda libere', 1133, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Impedenziometria', 1134, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Impedenziometria esofagea (24 ore)', 1135, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Indagini fotobiologiche per fotodermatosi [foto patch test]', 1136, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Indagini fotobiologiche per fotodermatosi [fototest]', 1137, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Individuazione del volume bersaglio e organi critici ', 1138, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Individuazione del volume bersaglio e simulazione con PET-TC ', 1139, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Inibina B', 1140, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Inibitore attivatore del plasminogeno (PAI 1)', 1141, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Inibitori dei fattori della coagulazione', 1142, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Instabilità microsatellitare', 1143, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Insulin growth factor [IGF-1 o somatomedina C]', 1144, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Insulin growth factor binding protein 3 [IGF-BP3]', 1145, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Insulina', 1146, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Insulina (curva da carico o dopo test farmacologici, max. 5)', 1147, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Interferometria', 1148, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Interferone', 1149, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Interleuchina 2', 1150, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Intradermoreazione con PPD (intradermoreazione con tubercolina secondo mantoux)', 1151, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('INV(16). Test qualitativo', 1152, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('INV(16). Test quantitativo', 1153, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ioduria', 1154, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Isolelettrofocusing della transferrina sierica', 1155, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Isterografia percutanea', 1156, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Isterosalpingografia', 1157, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Isterosalpingografia con contrasto gassoso', 1158, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Isterosalpingosonografia', 1159, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Isteroscopia', 1160, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Isteroscopia diagnostica con o senza biopsia dell&#39;endometrio', 1161, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Isterosonografia [idrosonografia]', 1162, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Laringografia con contrasto', 1163, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Laringoscopia', 1164, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Laringostroboscopia', 1165, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Lattato deidrogenasi (LDH)', 1166, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Latte muliebre', 1167, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Lattosio [u/ls]', 1168, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Legionella pneumophila antigene urinario ricerca diretta (E.I.A. o immunocromatografico)', 1169, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Legionelle anticorpi (E.I.A.)', 1170, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Legionelle anticorpi (titolazione mediante I.F.)', 1171, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Legionelle antigene nelle urine', 1172, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Legionelle in materiali biologici ', 1173, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1174, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Leishmania acidi nucleici', 1175, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Leishmania anticorpi', 1176, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Leishmania ', 1177, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1178, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Leishmania ricerca microscopica previa colorazione specifica', 1179, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Leptospire anticorpi', 1180, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Leptospire ', 1181, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1182, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Leucin amino peptidasi (LAP) [s]', 1183, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Leucociti (conteggio e formula leucocitaria microscopica) [Sg]', 1184, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Leucociti (conteggio) [(Sg)]', 1185, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Levodopa', 1186, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Linfangiografia intratoracica', 1187, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Linfografia addominale', 1188, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Linfografia arto inferiore', 1189, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Linfografia arto superiore', 1190, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Linfografia cervicale', 1191, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Lipasi pancreatica', 1192, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Lipoproteina (A)', 1193, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquidi da versamenti ', 1194, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('chimico fisico e microscopico', 1195, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido amniotico enzimi (cellobiasi, lattasi, maltasi, palatinasi, saccarasi, trealasi, acetil-colinesterasi)', 1196, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido amniotico fosfolipidi (cromatografia)', 1197, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido amniotico rapporto lecitina/sfingomielina', 1198, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido amniotico test alla schiuma di clements', 1199, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido seminale [spermiogramma]. ', 1200, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('macroscopico e microscopico', 1201, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido seminale [spermiogramma]. Test di vitalità previa colorazione con eosina', 1202, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido seminale ', 1203, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('morfologico e indice di fertilità', 1204, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido seminale profilo biochimico (fruttosio, carnitina, fosfatasi prostatica o zinco o acido citrico, alfa glucosidasi o maltasi) ', 1205, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido seminale prove di valutazione della fertilità', 1206, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Liquido sinoviale ', 1207, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('chimico fisico e microscopico', 1208, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Lisozima/S', 1209, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Listeria in materiali biologici ', 1210, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1211, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Listeria monocytogenes anticorpi (titolazione mediante agglutinazione)', 1212, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Litio', 1213, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Localizzazione radiologica di corpo estraneo', 1214, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Luteotropina (LH) [s/u]', 1215, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Luteotropina (LH) e follitropina (FSH): dosaggi seriati dopo GNRH o altro stimolo (da 3 a 6) ', 1216, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Macroprolattina', 1217, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Magnesio totale', 1218, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mammografia bilaterale', 1219, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mammografia monolaterale', 1220, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Manganese [s]', 1221, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Manometria ano-rettale', 1222, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Manometria del colon', 1223, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Manometria esofagea', 1224, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Manometria urinaria', 1225, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mappatura dei nevi (nei) - Osservazione delle lesioni cutanee o annessi cutanei con videodermatoscopio', 1226, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Marcatura di lesione del tubo digerente', 1227, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Massaggio cardiaco a torace chiuso', 1228, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mediastinoscopia', 1229, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Meprobamato', 1230, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mercurio', 1231, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Messa a punto della dentatura', 1232, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Metaemoglobina [(Sg)er]', 1233, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Metanefrine frazionate', 1234, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Metilazione promotore MGMT', 1235, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti [lieviti] antimicogramma da coltura (M.I.C., fino a 5 antimicotici)', 1236, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti [lieviti] identificazione biochimica', 1237, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti anticorpi (D.I.D.)', 1238, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti anticorpi (titolazione mediante agglutinazione)', 1239, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti anticorpi (titolazione mediante F.C.)', 1240, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti antigeni (metodi immunologici)', 1241, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti antigeni cellulari ed extracellulari in materiali biologici diversi', 1242, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti da coltura identificazione microscopica (osservazione morfologica)', 1243, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti da coltura identificazione sierologica', 1244, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti ricerca acidi nucleici in materiali biologici ricerca qualitativa/quantitativa', 1245, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Miceti ricerca in materiali biologici diversi. Incluso: ', 1246, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico ed ', 1247, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1248, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri antibiogramma da coltura (metodo tradizionale, almeno 3 antibiotici)', 1249, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri antibiogramma da coltura in terreno liquido', 1250, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri da coltura identificazione (biochimica e metodo radiometrico)', 1251, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri da coltura identificazione di specie', 1252, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri da coltura identificazione mediante ibridazione (previa reazione polimerasica a catena)', 1253, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri diagnosi immunologica di infezione tubercolare latente [IGRA]', 1254, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri in campioni biologici diversi ', 1255, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (metodo radiometrico)', 1256, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri in campioni biologici diversi ', 1257, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (metodo tradizionale)', 1258, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri in campioni biologici ricerca microscopica (Ziehl-Neelsen, Kinyiun)', 1259, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri ricerca acidi nucleici di m. tuberculosis complex in materiali biologici', 1260, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micobatteri ricerca in campioni biologici vari', 1261, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micoplasma pneumoniae anticorpi (E.I.A.)', 1262, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micoplasma pneumoniae anticorpi (titolazione mediante I.F.)', 1263, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micoplasma pneumoniae da coltura identificazione biochimica', 1264, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micoplasma pneumoniae da coltura identificazione sierologica', 1265, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micoplasma pneumoniae in materiali biologici diversi ', 1266, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1267, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Micoplasmi urogenitali ', 1268, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1269, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Microbatteri anticorpi (E.I.A.)', 1270, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Microdelezione del cromosoma Y', 1271, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Microfilarie [W. Bancrofti] antigeni ricerca diretta', 1272, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Microfilarie nel sangue (Giemsa) dopo concentrazione o arricchimento', 1273, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Microsporidi ', 1274, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale su linee cellulari', 1275, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Microsporidi ', 1276, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico dopo concentrazione (colorazioni specifiche)', 1277, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mielografia con contrasto', 1278, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mioglobina', 1279, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Misura della perdita transepidermica di acqua (TEWL)', 1280, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Misura di lunghezza degli arti', 1281, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Misura ossido nitrico esalato', 1282, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Misura transcutanea della PO2 e della PCO2 con utilizzo di membrane monouso', 1283, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Misurazione di pressione dello sfintere di oddi', 1284, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Misurazione indice pressorio caviglia/braccio (ABI) [indice di Winsor]', 1285, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Misure del corpo', 1286, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Misure protesiche in situ', 1287, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('MOC (densitometria ossea) a ultrasuoni', 1288, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('MOC (densitometria ossea) con TC ', 1289, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('MOC (densitometria ossea) con tecnica di assorbimento a fotone', 1290, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('MOC (densitometria ossea). DXA lombare, femorale, ultradistale', 1291, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('MOC (densitometria ossea). DXA total body', 1292, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio cardiorespiratorio notturno completo', 1293, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio continuo [24 ore] della pressione arteriosa - Holter pressorio', 1294, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio del flusso ematico coronarico', 1295, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio della gettata cardiaca mediante la tecnica del consumo di ossigeno (metodo di Fick)', 1296, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio della pressione arteriosa sistemica', 1297, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio della pressione dell&#39;arteria polmonare', 1298, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio della pressione in arteria polmonare', 1299, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio della pressione venosa centrale', 1300, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio dinamico della glicemia (Holter glicemico)', 1301, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio doppler transcranico per il microembolismo [Mesh]', 1302, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio ecografico del ciclo ovulatorio / Ecografia ovarica', 1303, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio elettrocardiografico ', 1304, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio incruento della saturazione arteriosa / pulsossimetria', 1305, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monitoraggio transcutaneo di O2 e CO2', 1306, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Monomeri solubili di fibrina (FS test)', 1307, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mucopolisaccaridi', 1308, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mucopolisaccaridi urinari test di screening', 1309, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mucopolisaccaridi urinari totali. Dosaggio', 1310, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazione di BRAF ', 1311, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazione di C-KIT', 1312, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazione di EGFR ', 1313, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazione di KRAS ', 1314, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazione di PDGFRA', 1315, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazione di PIK3CA ', 1316, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazione JAK2 V617F test qualitativo', 1317, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazione JAK2 V617F test quantitativo', 1318, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni CEBPA', 1319, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni del fattore II', 1320, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni del fattore V Leiden', 1321, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della alfa-talassemia', 1322, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della beta-talassemia', 1323, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della connessina 26 in familiari. Test mirato', 1324, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della connessina 26. Test completo', 1325, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della connessina 30 in familiari. Test mirato', 1326, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della connessina 30. Test completo', 1327, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della emocromatosi', 1328, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della fibrosi cistica in familiari. Test mirato', 1329, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della fibrosi cistica. Test di primo livello', 1330, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni della fibrosi cistica. Test di secondo livello', 1331, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni di BRCA1 in familiari. Test mirato', 1332, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni di BRCA1. Test completo', 1333, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni di BRCA2 in familiari. Test mirato', 1334, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni di BRCA2. Test completo', 1335, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni di MTHFR', 1336, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni FLT-3 (D385)', 1337, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni FLT-3 (ITD)', 1338, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni gene IgHV', 1339, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni IDH1-2', 1340, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni nucleofosmina test qualitativo', 1341, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mutazioni nucleofosmina test quantitativo', 1342, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mycoplasma pneumoniae anticorpi IgG e IgM. Incluso: IgA se IgM negative', 1343, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Mycoplasma/Ureaplasma urogenitali ', 1344, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1345, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('N-Acetilaspartato', 1346, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('N-Acetilglucosaminidasi', 1347, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('NEFA (acidi grassi non esterificati)', 1348, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Neisseria gonorrhoeae ', 1349, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1350, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Neisseria meningitidis ', 1351, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1352, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Neisseriae identificazione biochimica', 1353, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Neisseriae identificazione sierologica', 1354, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Neopterina', 1355, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Neurotrasmettitori. Dosaggio liquor', 1356, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Nichel', 1357, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Nortriptilina', 1358, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Oftalmoscopia', 1359, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Oligoelementi. Dosaggio per ciascun oligoelemento', 1360, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Oligosaccaridi urinari', 1361, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Omocisteina', 1362, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ormone anti-mulleriano (AMH). Dosaggio', 1363, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ormone lattogeno placentare o somatomammotropina (HPL) [s]', 1364, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ormone somatotropo (GH)', 1365, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ormoni: dosaggi seriati dopo stimolo (17 OH-P, FSH, LH, TSH, ACTH, cortisolo, GH, aldosterone, PRL, renina o altri ormoni)', 1366, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ortopanoramica delle arcate dentarie', 1367, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Osmolalità', 1368, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Osmolalità/Osmolarità. Determinazione diretta', 1369, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ossalati [u]', 1370, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Osservazione dermatologica in epidiascopia', 1371, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Osservazione dermatologica in epiluminescenza', 1372, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ossimetria fetale', 1373, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Osteocalcina (BGP)', 1374, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Otomicroscopia', 1375, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Otoscopia', 1376, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pachimetria corneale', 1377, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Palpazione del seno', 1378, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pannello di immunofenotipizzazione di fattori prognostici e predittivi per melanoma', 1379, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pannello di immunofenotipizzazione di fattori prognostici e predittivi per patologia tumorale maligna del polmone', 1380, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pterine plasmatiche e urinarie', 1490, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pannello di immunofenotipizzazione di fattori prognostici e predittivi per patologia tumorale maligna del sistema nervoso centrale', 1381, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pannello di immunofenotipizzazione di fattori prognostici e predittivi per patologia tumorale maligna dell&#39;apparato gastroenterico', 1382, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pannello di immunofenotipizzazione di fattori prognostici e predittivi per patologia tumorale maligna della mammella', 1383, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('PAP test - screening per il tumore dell&#39;utero - ', 1384, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('citologico cervico vaginale', 1385, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Parassiti [elminti, protozoi] acidi nucleici in materiali biologici. Ricerca qualitativa/quantitativa', 1386, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Parassiti [elminti, protozoi] anticorpi', 1387, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Parassiti [elminti, protozoi] nel sangue ', 1388, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico (Giemsa)', 1389, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Parassiti in materiali biologici, ricerca macro e microscopica', 1390, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Parassiti intestinali [elminti, protozoi] ricerca macro e microscopica', 1391, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Parassiti intestinali [elminti, protozoi] ricerca macro e microscopica (', 1392, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('diretto e dopo concentrazione o arricchimento)', 1393, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Parassiti intestinali [protozoi] ', 1394, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (coltura xenica)', 1395, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Parassiti intestinali ricerca microscopica', 1396, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Paratormone (PTH). Molecola intatta', 1397, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Paratormone related peptide [S]', 1398, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pelvimetria', 1399, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pepsinogeno A (I)', 1400, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pepsinogeno C (II)', 1401, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Peptide natriuretico tipo B (BNP o N-probnp)', 1402, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('PH ematico', 1403, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('PH-Metria esofagea (24 ore)', 1404, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('PH-Metria telemetrica', 1405, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Piastrine (conteggio) [(Sg)]', 1406, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pielografia percutanea', 1407, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pielografia retrograda', 1408, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pielografia transpielostomica', 1409, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pink test', 1410, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Piombo', 1411, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Piridinolina', 1412, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Piruvatochinasi (PK)', 1413, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Plasminogeno', 1414, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Plasmodi della malaria nel sangue ricerca diretta antigeni', 1415, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Plasmodi della malaria nel sangue ricerca microscopica (Giemsa) / Goccia spessa', 1416, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Plasmodi della malaria nel sangue ricerca microscopica (striscio sottile e goccia spessa previa colorazione specifica) e ricerca diretta antigeni (metodi immunologici)', 1417, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Plasmodio falciparum anticorpi (titolazione mediante I.F.)', 1418, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pletismografia ad occlusione venosa degli arti superiori o inferiori', 1419, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pletismografia di altri distretti', 1420, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pletismografia di un arto', 1421, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pletismografia peniena', 1422, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pletismogramma', 1423, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pneumocistigrafia mammaria', 1424, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pneumocistis carinii nel broncolavaggio', 1425, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pneumocystis jirovecii in secrezioni respiratorie acidi nucleici', 1426, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pneumocystis jirovecii in secrezioni respiratorie ', 1427, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('microscopico e/o ricerca diretta', 1428, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pneumoencefalografia', 1429, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pneumografia retroperitoneale', 1430, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pneumomediastino', 1431, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Poligrafia con videoregistrazione', 1432, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Poligrafia dinamica', 1433, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Polipeptide intestinale vasoattivo (VIP)', 1434, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Polipeptide specifico tissutale (PPS)', 1435, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Polisonnografia diurna o notturna', 1436, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Porfirine totali e frazionate', 1437, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Porfobilinogeno', 1438, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Post coital test', 1439, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potassio', 1440, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potenziali evocati acustici', 1441, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potenziali evocati da stimolo laser (LEP)', 1442, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potenziali evocati motori. Arto superiore o inferiore', 1443, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potenziali evocati somato sensoriali. Per nervo o dermatomero', 1444, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potenziali evocati stimolo ed evento correlati ', 1445, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potenziali evocati uditivi da stimolo elettrico', 1446, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potenziali evocati uditivi per ricerca di soglia', 1447, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potenziali evocati vestibolari (VEMPS)', 1448, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Potenziali evocati visivi (VEP)', 1449, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prealbumina', 1450, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prelievo citologico', 1451, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prelievo dei villi coriali - villocentesi', 1452, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prelievo di sangue arterioso', 1453, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prelievo di sangue capillare', 1454, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prelievo di sangue fetale e biopsia', 1455, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prelievo di sangue venoso', 1456, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prelievo microbiologico', 1457, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prick by prick con allergeni freschi', 1458, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Primidone', 1459, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proctorettosigmoidoscopia con endoscopio rigido', 1460, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proctorettosigmoidoscopia con endoscopio rigido con biopsia', 1461, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proctosigmoidoscopia attraverso orifizio artificiale', 1462, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Profilo acilcarnitine plasmatiche con ms/ms', 1463, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Profilo pressorio uretrale', 1464, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Progesterone', 1465, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prolattina (PRL)', 1466, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prolattina (PRL). Dosaggi seriati dopo TRH (5)', 1467, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Propeptide ammino-terminale del procollagene tipo 1 (P1NP)', 1468, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteina 4 dell&#39;epididimo umano (HE4). Dosaggio', 1469, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteina C anticoagulante antigene [P]', 1470, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteina C anticoagulante funzionale [P]', 1471, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteina C reattiva (quantitativa)', 1472, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteina cationica eosinofila (ECP)', 1473, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteina legante il retinolo', 1474, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteina S 100', 1475, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteina S libera', 1476, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteina S totale', 1477, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteine plasmatiche (elettroforesi delle) ', 1478, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteine totali', 1479, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Proteine urinarie (elettroforesi)', 1480, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Protoporfirina IX eritrocitaria', 1481, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Protozoi enterici ricerca acidi nucleici multiplex', 1482, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Protozoi enterici ricerca diretta multipla antigeni fecali', 1483, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Protozoi in materiali biologici diversi ', 1484, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1485, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Protrombina frammenti 1, 2', 1486, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prova crociata di compatibilità trasfusionale', 1487, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prova crociata piastrinica', 1488, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Prova di compatibilità molecolare pre-trapianto (reazione polimerasica a catena-fingerprint)', 1489, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pulsossimetria notturna', 1491, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Pupillometria', 1492, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Purine e loro metaboliti', 1493, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia articolazione temporomandibolare monolaterale', 1494, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia assiale della rotula', 1495, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia completa degli arti inferiori e del bacino sotto carico', 1496, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia completa del lattante', 1497, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia completa del tubo digerente con mezzo di contrasto', 1498, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia completa della colonna e del bacino sotto carico', 1499, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia completa delle arcate dentarie', 1500, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia con occlusale delle arcate dentarie', 1501, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia degli arti inferiori (femore ginocchio e gamba)', 1502, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dei tessuti molli della faccia, del capo e del collo', 1503, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del braccio', 1504, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del gomito', 1505, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del gomito e dell&#39;avambraccio', 1506, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del pancreas con contrasto', 1507, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del piede', 1508, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del piede e della caviglia', 1509, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del polso', 1510, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del polso e della mano', 1511, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del torace', 1512, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del tratto faringo-crico-esofageo-cardiale', 1513, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia del tratto gastrointestinale superiore con mezzo di contrasto', 1514, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dell&#39;addome', 1515, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dell&#39;apparato urinario', 1516, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dell&#39;arto superiore, senza altra indicazione', 1517, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dell&#39;avambraccio', 1518, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dell&#39;esofago con mezzo di contrasto', 1519, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dell&#39;esofago, stomaco e duodeno con doppio mezzo di contrasto', 1520, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dell&#39;utero gravido', 1521, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della caviglia', 1522, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della clavicola', 1523, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della colonna cervicale', 1524, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della colonna lombosacrale', 1525, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della colonna toracica (dorsale)', 1526, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della mano', 1527, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della pelvi con contrasto gassoso', 1528, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della pelvi con contrasto opaco', 1529, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della spalla', 1530, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della spalla e degli arti superiori', 1531, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia della trachea', 1532, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dello scheletro in toto', 1533, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dello sterno', 1534, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia dello stretto toracico superiore-studio dell&#39;articolazione sternoclaveare', 1535, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia di arcata dentaria', 1536, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia di bacino e anca', 1537, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia di coste, sterno e clavicola', 1538, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia di vescica ileale', 1539, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia emimandibola', 1540, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia endorale', 1541, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia ghiandole salivari con mezzo di contrasto', 1542, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia morfometria vertebrale dorsale', 1543, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia morfometria vertebrale lombare', 1544, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia orbitale con contrasto', 1545, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia sinusale con contrasto', 1546, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia standard del cranio', 1547, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Radiografia standard sacrococcige', 1548, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Rame', 1549, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Rame tissutale. Dosaggio', 1550, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Reazione di Waaler Rose ', 1551, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Recettore solubile transferrina', 1552, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Recettori degli estrogeni', 1553, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Recettori del progesterone', 1554, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Renina', 1555, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Resistenza osmotica eritrocitaria (test di Simmel)', 1556, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Resistenze delle vie aeree', 1557, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Resistenze osmotico globulari (curva)', 1558, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Reticolociti. Conteggio', 1559, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamenti (delezioni e duplicazioni) di altri geni umani mediante MLPA e tecniche assimilabili (per ciascun gene)', 1560, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamenti in BRCA1 mediante MLPA', 1561, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamenti in BRCA2 mediante MLPA', 1562, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento ALK. In caso di negatività incluso: ROS1', 1563, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento del recettore delle cellule t (TCR)', 1564, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento EWSR1', 1565, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento gene DDIT3', 1566, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento gene FOXO1', 1567, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento geni delle immunoglobuline', 1568, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento IgH test qualitativo', 1569, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento IgH test quantitativo', 1570, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento IgK test qualitativo', 1571, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento IgK test quantitativo', 1572, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento TCR B test qualitativo', 1573, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento TCR B test quantitativo', 1574, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento TCR D test qualitativo', 1575, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento TCR D test quantitativo', 1576, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento TCR G test qualitativo', 1577, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Riarrangiamento TCR G test quantitativo', 1578, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricerca autoanticorpi immunoblotting', 1579, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricerca del treponema al paraboloide', 1580, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricerca di metastasi di tumori tiroidei', 1581, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricerca di mucosa gastrica ectopica', 1582, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricerca di mutazioni note/polimorfismi noti. Farmacogenetica dei geni del metabolismo dei farmaci: CYP2C19', 1583, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricerca di mutazioni note/polimorfismi noti. Farmacogenetica dei geni del metabolismo dei farmaci: CYP2D6', 1584, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricerca di mutazioni note/polimorfismi noti. Farmacogenetica in oncologia: UGT1A1', 1585, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricerca mutazione (DGGE)', 1586, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricerca mutazione (SSCP)', 1587, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Rickettsie anticorpi (titolazione mediante I.F.)', 1588, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Rickettsie anticorpi [anti proteus spp] (titolazione mediante agglutinazione) [Weil-Felix]', 1589, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Rickettsie conorii anticorpi IgG e IgM', 1590, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ricostruzione tridimensionale TC', 1591, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Rinomanometria con o senza test di provocazione', 1592, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Rinoscopia', 1593, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Risposte riflesse. H, F, blink reflex, riflesso bulbocavernoso, riflessi esterocettivi agli arti', 1594, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) addome inferiore con studio dinamico del pavimento pelvico', 1595, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione (X:18)', 1986, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) addome inferiore e zona pelvica', 1596, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) addome inferiore e zona pelvica, senza e con contrasto', 1597, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) cervello e tronco encefalico', 1598, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) colonna vertebrale', 1599, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del bacino', 1600, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del braccio', 1601, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del collo', 1602, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del ginocchio', 1603, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del gomito', 1604, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del massiccio facciale ', 1605, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del massiccio facciale complessivo', 1606, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del piede', 1607, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del polso', 1608, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del rachide cervicale', 1609, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del rachide dorsale', 1610, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del rachide lombosacrale', 1611, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del rachide sacrococcigeo', 1612, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) del torace ', 1613, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) dell&#39;addome superiore', 1614, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) dell&#39;articolazione coxofemorale mono e/o bilaterale', 1615, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) dell&#39;articolazione temporomandibolare monolaterale e/o bilaterale', 1616, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) dell&#39;avambraccio', 1617, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della caviglia', 1618, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della colonna, senza e con contrasto', 1619, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della coscia [RM del femore]', 1620, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della gamba', 1621, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della mammella bilaterale', 1622, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della mammella monolaterale', 1623, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della mammella, senza e con contrasto, bilaterale', 1624, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della mammella, senza e con contrasto, monolaterale', 1625, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della mano', 1626, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della sella turcica', 1627, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) della spalla', 1628, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) delle orbite', 1629, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) delle rocche petrose. Incluso: relativo distretto vascolare', 1630, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) delle vie digestive ', 1631, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) di inguine, scroto e/o pene', 1632, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) diffusione', 1633, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) endocavitaria', 1634, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) fetale', 1635, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) flussimetria liquorale quantitativa', 1636, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) perfusione', 1637, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) spettroscopia', 1638, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) studi funzionali attivazione corticale', 1639, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RM (risonanza magnetica) urografia', 1640, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('RMN (risonanza magnetica nucleare) di pelvi, prostata e vescica', 1641, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Roentgengrafia cardiaca con contrasto negativo', 1642, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('S-Adenosilmetionina. Dosaggio', 1643, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('S-Adenosilomocisteina. Dosaggio', 1644, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Salmonella nelle feci ', 1645, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1646, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Salmonelle anticorpi (E.I.A.)', 1647, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Salmonelle anticorpi (titolazione mediante agglutinazione) [Widal]', 1648, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Salmonelle da coltura identificazione biochimica e sierologica di gruppo', 1649, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Salmonelle da coltura identificazione sierologica', 1650, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Salmonelle e brucelle anticorpi (titolazione mediante agglutinazione) [Widal-Wright]', 1651, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Schistosoma anticorpi o ricerca urinaria degli antigeni circolanti', 1652, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Schistosoma haematobium in campioni urinari', 1653, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia cerebrale con angioscintigrafia, studio completo', 1654, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia cerebrale, statica, studio completo', 1655, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia dei testicoli', 1656, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia del midollo osseo total body', 1657, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia del sistema linfatico', 1658, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia della placenta', 1659, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia delle ossa', 1660, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia delle paratiroidi ', 1661, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia delle paratiroidi con indagine tomografica', 1662, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia epatica', 1663, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia epatica con indicatori positivi', 1664, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia epatica per ricerca di lesioni angiomatose con indagine tomografica', 1665, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia globale corporea con cellule autologhe marcate', 1666, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia globale corporea con indicatori positivi di neoplasia o di flogosi ', 1667, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia globale corporea con traccianti immunologici e recettoriali', 1668, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia linfatica e linfoghiandolare segmentaria', 1669, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia mammaria con indicatori positivi di neoplasia', 1670, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia miocardica con indicatori di lesione', 1671, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia miocardica di perfusione', 1672, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia ossea o articolare', 1673, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia ossea o articolare o segmentaria trifasica', 1674, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia ossea o articolare segmentaria', 1675, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia ossea o articolare segmentaria polifasica', 1676, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia polmonare', 1677, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia renale ', 1678, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia renale con angioscintigrafia', 1679, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia segmentaria con indicatori positivi di neoplasia o di flogosi ', 1680, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia segmentaria dopo scintigrafia total body', 1681, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia sequenziale delle ghiandole salivari con studio funzionale', 1682, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia sequenziale epatobiliare con valutazione della funzione colecistica e/o del reflusso duodeno-gastrico', 1683, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia sequenziale renale', 1684, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia splenica', 1685, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia surrenalica corticale', 1686, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia surrenalica midollare', 1687, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia tiroidea', 1688, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia tiroidea con captazione, con o senza prove farmacologiche', 1689, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia tiroidea con indicatori positivi', 1690, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Scintigrafia tiroidea con iodio-123', 1691, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione der(17)t(X:17)', 1987, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Screening allergologico per inalanti e alimenti [prick test]', 1692, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Screening in fase solida anticorpi anti-HLA classe I e II. Isotipo IgG', 1693, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Screening in fase solida anticorpi anti-hla classe I e II. Isotipo IgM', 1694, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Screening in fase solida anticorpi anti-mica', 1695, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Screening in fase solida specificità anticorpi anti-mica', 1696, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Screening urinari errori congeniti del metabolismo', 1697, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Screening/Identificazione mediante citotossicità di anticorpi anti-hla con pannello di linfociti B', 1698, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Screening/Identificazione mediante citotossicità di anticorpi anti-hla con pannello di linfociti T', 1699, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sebometria', 1700, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Selenio', 1701, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Selezione nemaspermica per migrazione o su gradiente', 1702, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Shigella nelle feci ', 1703, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1704, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Shigelle da coltura identificazione biochimica e sierologica', 1705, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sigmoidoscopia con endoscopio flessibile', 1706, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sintesi di oligonucleotidi (ciascuno)', 1707, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sirolimus', 1708, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sodio', 1709, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Somatostatina', 1710, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sondaggio gastrico frazionato', 1711, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sostanza amiloide ricerca', 1712, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sostanze d&#39;abuso identificazione e/o dosaggio di singole sostanze e relativi metaboliti ', 1713, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sostanze d&#39;abuso test di screening ', 1714, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Spirometria', 1715, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Spirometria globale con tecnica pletismografica', 1716, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Spirometria separata dei due polmoni (metodica di Arnaud)', 1717, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stato HER2/neu', 1718, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stato mutazionale B-RAF', 1719, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stato mutazionale c-KIT', 1720, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stato mutazionale EGFR', 1721, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stato mutazionale H-RAS', 1722, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stato mutazionale K-RAS', 1723, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stato mutazionale K-RAS, N-RAS', 1724, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stato mutazionale PDGFRA', 1725, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stato mutazionale RET', 1726, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Steroli. Dosaggio plasma', 1727, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stimolazione ripetitiva ', 1728, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stimolazioni vestibolari rotatorie. Prove rotatorie, prove pendolari a smorzamento meccanico', 1729, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stratigrafia dell&#39;articolazione temporomandibolare bilaterale', 1730, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Stratigrafia dell&#39;articolazione temporomandibolare monolaterale', 1731, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Streptococco agalactiae nel tampone vagino-rettale ', 1732, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1733, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Streptococco anticorpi anti antistreptolisina-o [TAS]', 1734, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Streptococco anticorpi anti DNAsi B', 1735, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Streptococcus pneumoniae antigeni nelle urine ricerca diretta ', 1736, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Streptococcus pyogenes nel tampone orofaringeo ', 1737, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 1738, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Strongyloides stercoralis anticorpi', 1739, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Strongyloides stercoralis ricerca larve nelle feci ', 1740, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio articolare dinamico sotto stress e/o sottocarico', 1741, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio del campo visivo ', 1742, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio del reflusso gastro-esofageo', 1743, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio del reflusso vescico-ureterale', 1744, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio del transito esofageo', 1745, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio dell&#39;adattabilità al buio', 1746, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio dell&#39;età ossea', 1747, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio della motilità oculare', 1748, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio della sensibilità al colore ', 1749, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio della sensibilità al contrasto', 1750, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio della topografia corneale', 1751, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio ecografico del reflusso gastroesofageo', 1752, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio ecografico del tempo di svuotamento gastrico', 1753, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio fisico-dosimetrico ', 1754, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio fisico-dosimetrico 3D con elaboratore su scansioni TC di elevata complessità', 1755, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio fisico-dosimetrico con elaboratore per calcolo dose da somministrare', 1756, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio fisico-dosimetrico con elaboratore su scansioni TC in modalità IMRT', 1757, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio radiologico dell&#39;occhio', 1758, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio registrato del nistagmo (spontaneo, posizionale, provocato) / Videoculografia', 1759, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio seriato dell&#39;intestino tenue con singolo contrasto', 1760, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Studio strumentale della conformazione della papilla ottica [HRT o GDX o OCT] ', 1761, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Succinilacetone urinario', 1762, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Succo gastrico ', 1763, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('chimico completo', 1764, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sudore (', 1765, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('con determinazione di NA+ e K+)', 1766, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Sulfiti. Screening urine mediante sulfitest', 1767, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Svuotamento gastrico: valutazione della funzione motoria gastrica', 1768, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Swelling test', 1769, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(11:14)', 1770, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(12:21) test qualitativo', 1771, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(12:21) test quantitativo', 1772, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(14:18) test qualitativo', 1773, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(14:18) test quantitativo', 1774, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(15:17) test qualitativo', 1775, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(15:17) test quantitativo', 1776, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(1:19) test qualitativo', 1777, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(1:19) test quantitativo', 1778, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(4:11) test qualitativo', 1779, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(4:11) test quantitativo', 1780, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(8:21) test qualitativo', 1781, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(8:21) test quantitativo', 1782, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(9:22) test qualitativo', 1783, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('T(9:22) test quantitativo', 1784, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TAC (tomografia assiale computerizzata) del rene', 1785, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TAC (tomografia assiale computerizzata) dell&#39;addome', 1786, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Taenia solium [cisticercosi] anticorpi', 1787, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Taenia solium [cisticercosi] immunoblotting (saggio di conferma)', 1788, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata)  dell&#39;addome completo', 1789, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dei reni, senza e con contrasto', 1790, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del bacino', 1791, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del braccio', 1792, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del collo ', 1793, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del colon', 1794, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del cranio-encefalo', 1795, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del cuore', 1796, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del fegato multifasica', 1797, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del ginocchio', 1798, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del gomito', 1799, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del massiccio facciale', 1800, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del piede', 1801, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del polso', 1802, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del rachide e dello speco vertebrale', 1803, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del rachide e dello speco vertebrale cervicale', 1804, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del rachide e dello speco vertebrale toracico', 1805, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del rachide e dello speco vertebrale, senza e con contrasto', 1806, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del rachide, dello speco vertebrale lombosacrale e del sacro coccige', 1807, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) del torace ', 1808, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;addome inferiore', 1809, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;addome superiore', 1810, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;articolazione coxofemorale', 1811, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;arto inferiore', 1812, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;arto inferiore, senza e con contrasto', 1813, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;arto superiore', 1814, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;arto superiore, senza e con contrasto', 1815, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;avambraccio', 1816, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;intestino tenue (con enteroclisi)', 1817, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) dell&#39;orecchio ', 1818, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) della caviglia', 1819, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) della caviglia e del piede', 1820, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) della coscia [TC del femore]', 1821, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) della gamba', 1822, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) della mano', 1823, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) della sella turcica ', 1824, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) della spalla', 1825, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) delle arcate dentarie [DENTALSCAN]', 1826, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) delle ghiandole salivari', 1827, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) delle orbite', 1828, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) di ginocchio e gamba', 1829, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) di gomito e avambraccio', 1830, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) di polso e mano', 1831, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) di spalla e braccio', 1832, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) total body', 1833, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('TC (tomografia computerizzata) urografia', 1834, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Telecuore con esofago baritato', 1835, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Teleradiografia del cranio', 1836, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Teletermografia osteoarticolare', 1837, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Telopeptide c-terminale del collagene tipo 1 (CTX)', 1838, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tempo di botroxina (reptilase)', 1839, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tempo di emorragia sec. mielke', 1840, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tempo di lisi euglobulinica', 1841, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tempo di protrombina (PT)', 1842, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tempo di transito intestinale', 1843, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tempo di trombina (TT)', 1844, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tempo di tromboplastina parziale attivata (APTT)', 1845, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tenorrafia', 1846, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Teofillina', 1847, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test cardiovascolare da sforzo al tallio', 1848, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test cardiovascolare da sforzo con cicloergometro o con pedana mobile', 1849, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test cardiovascolari per valutazione di neuropatia autonomica', 1850, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test clinico della funzionalità vestibolare ', 1851, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test da sforzo cardiopolmonare', 1852, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test da sforzo dei due gradini di masters', 1853, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test del cammino con valutazione della saturazione arteriosa [walking test]', 1854, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test del siero autologo', 1855, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test del sudore', 1856, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test della memoria. Memoria implicita, esplicita, a breve e lungo termine, test di attenzione, test di abilità di lettura (somministrazione e interpretazione)', 1857, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test della scala di memoria di Wechsler [WMS] (somministrazione e interpretazione)', 1858, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test delle abilità visuo spaziali (somministrazione e interpretazione)', 1859, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test delle funzioni esecutive (somministrazione e interpretazione)', 1860, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di aggregazione piastrinica', 1861, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di Bernstein', 1862, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di broncodilatazione farmacologica ', 1863, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di deterioramento o sviluppo intellettivo (somministrazione e interpretazione)', 1864, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di distribuzione della ventilazione con gas non radioattivi', 1865, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di emolisi al saccarosio', 1866, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di equilibrazione peritoneale ', 1867, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di falcizzazione', 1868, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di funzionaltà piastrinica (PFA)', 1869, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di Ham', 1870, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di inibizione delle IgE specifiche con allergene specifico', 1871, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di intelligenza (somministrazione e interpretazione)', 1872, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di intolleranze o allergie sulla congiuntiva ', 1873, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di ischemia prolungata', 1874, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di kleihauer (ricerca emazie fetali)', 1875, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di permeabilità intestinale (test del lattulosio e mannitolo)', 1876, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di provocazione bronchiale con agente broncocostrittore', 1877, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di provocazione e curva tonometrica per glaucoma', 1878, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di resistenza alla proteina C attivata', 1879, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di stimolazione elettrica al promontorio', 1880, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di stimolazione linfocitaria (per mitogeno)', 1881, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di stimolazione linfocitaria con antigeni specifici', 1882, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di tolleranza/provocazione con farmaci, alimenti e additivi', 1883, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di valutazione del carico familiare e delle strategie di coping (somministrazione e interpretazione)', 1884, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di valutazione della disabilità sociale (somministrazione e interpretazione)', 1885, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test di valutazione della risposta motoria alla levodopa/apomorfina', 1886, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test epicutanei a lettura ritardata [patch test]', 1887, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test epicutanei a lettura ritardata per serie professionali, metalli e ortopedici', 1888, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test epicutaneo in aperto [open test]', 1889, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test funzionali obiettivi dell&#39;occhio (test di Hess-Lancaster)', 1890, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test funzionali pre-trapianto (HTLp, CTLp)', 1891, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test intracarotideo con amobarbitale', 1892, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione t(11:18), t(1:14), t(3:14)', 1988, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test neurofisiologici per la valutazione del sistema nervoso vegetativo', 1893, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test per tetania latente', 1894, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test percutanei e intracutanei a lettura immediata (fino a 12 allergeni)', 1895, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test percutanei e intracutanei a lettura immediata e ritardata per farmaci', 1896, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test percutanei e intracutanei a lettura immediata per veleno di imenotteri', 1897, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test polisonnografici del livello di vigilanza', 1898, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test posturografico', 1899, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test proiettivi e della personalità (somministrazione e interpretazione)', 1900, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Test stabilometrico statico e/o dinamico su pedana', 1901, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Testosterone', 1902, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Testosterone libero ', 1903, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tine test (reazione cutanea alla turbecolina)', 1904, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione eritrocitaria per D variant', 1905, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione geni KIR in trapianto mismatch', 1906, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus A (HLA-A) - alta risoluzione', 1907, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus A (HLA-A) - bassa risoluzione', 1908, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus A (HLA-A) mediante sequenziamento diretto', 1909, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus B (HLA-B) - alta risoluzione', 1910, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus B (HLA-B) - bassa risoluzione', 1911, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus B (HLA-B) mediante sequenziamento diretto', 1912, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus C (HLA-C) - alta risoluzione', 1913, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus C (HLA-C) - bassa risoluzione', 1914, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus C (HLA-C) mediante sequenziamento diretto', 1915, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DP (HLA-DP) mediante sequenziamento diretto', 1916, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DPA1 (HLA-DPA1) - alta risoluzione', 1917, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DPB1 (HLA-DPB1) - alta risoluzione', 1918, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DQ (HLA-DQ) mediante sequenziamento diretto', 1919, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DQA1 (HLA-DQA1) - alta risoluzione', 1920, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DQB1 (HLA-DQB1) - alta risoluzione', 1921, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DQB1 (HLA-DQB1) - bassa risoluzione', 1922, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DR (HLA-DR) mediante sequenziamento diretto', 1923, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DRB (HLA-DRB1 e DRB3, DRB4, DRB5) - alta risoluzione', 1924, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DRB (HLA-DRB1 e DRB3, DRB4, DRB5) - bassa risoluzione', 1925, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DRB1. Alta risoluzione', 1926, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DRB3. Alta risoluzione', 1927, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DRB4. Alta risoluzione', 1928, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione genomica locus DRB5. Alta risoluzione', 1929, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione sierologica HLA classe I (Fenot. compl. loci A, B, C, o loci A, B)', 1930, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione sierologica HLA classe II (Fenot. compl. loci DR, DQ o locus DP)', 1931, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tipizzazione sottopopolazioni di cellule del sangue (per ciascun anticorpo)', 1932, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tireoglobulina (TG)', 1933, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tireotropina (TSH)', 1934, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tireotropina (TSH): dosaggi seriati dopo TRH (4)', 1935, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tireotropina [TSH] test reflex ', 1936, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tiroxina libera (FT4)', 1937, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia [stratigrafia] articolazione temporomandibolare', 1938, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia [stratigrafia] contemporanea a ', 1939, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('di: ghiandole salivari, trachea', 1940, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia [stratigrafia] del mediastino', 1941, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia [stratigrafia] della laringe', 1942, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia [stratigrafia] delle arcate dentarie', 1943, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia [stratigrafia] di segmento scheletrico', 1944, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia [stratigrafia] renale', 1945, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia [stratigrafia] toracica bilaterale', 1946, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia [stratigrafia] toracica monolaterale', 1947, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia a emissione di positroni [PET TC] miocardica', 1948, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia a emissione di positroni [PET] cerebrale qualitativa / quantitativa', 1949, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia ad emissione di positroni [PET TC] miocardica di perfusione a riposo e da stimolo', 1950, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia ad emissione di positroni [PET] cerebrale con altri radiofarmaci', 1951, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia ad emissione di positroni [PET] segmentaria ai fini di piano dosimetrico', 1952, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomografia retinica (OCT) a luce coerente', 1953, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomoscintigrafia [G-SPET] miocardica di perfusione a riposo', 1954, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomoscintigrafia [PET] globale corporea ', 1955, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomoscintigrafia [SPET] cerebrale con tracciante di perfusione ', 1956, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomoscintigrafia [SPET] cerebrale con traccianti recettoriali o indicatori positivi di neoplasia', 1957, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomoscintigrafia [SPET] miocardica con indicatori di lesione', 1958, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomoscintigrafia [SPET] miocardica con tracciante di innervazione o recettoriale o neurorecettoriale o di metabolismo', 1959, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomoscintigrafia [SPET] miocardica di perfusione a riposo o dopo stimolo', 1960, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tomoscintigrafia [SPET] segmentaria ai fini di piano dosimetrico', 1961, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tonometria', 1962, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Toracoscopia transpleurica', 1963, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tossina difterica anticorpi', 1964, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tossina tetanica anticorpi', 1965, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Toxocara anticorpi', 1966, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Toxoplasma acidi nucleici in materiali biologici ricerca qualitativa/quantitativa', 1967, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Toxoplasma anticorpi (E.I.A.)', 1968, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Toxoplasma anticorpi (titolazione mediante agglutinazione) [test di Fulton]', 1969, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Toxoplasma anticorpi (titolazione mediante I.F.)', 1970, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Toxoplasma anticorpi IgG e IgM', 1971, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Toxoplasma anticorpi immunoblotting per IgG e IgM (saggio di conferma) per classe di anticorpi', 1972, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tracciato dell&#39;impulso carotideo con elettrodo ECG', 1973, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tracheoscopia attraverso stoma artificiale', 1974, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Transferrina', 1975, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Transferrina (capacità ferrolegante)', 1976, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Transferrina desialata (CDT)', 1977, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Transilluminazione dei seni nasali', 1978, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Transilluminazione di cranio di neonato', 1979, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione (11:14)', 1980, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione (2:17)', 1981, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione (2:5), (1:2)', 1982, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione (7:16)', 1983, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione (8:14), (2:8), (8:22), (8:9), (3:8)', 1984, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione (9:14)', 1985, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione t(12:15)', 1989, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione t(14:18)', 1990, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Traslocazione t(2:12)', 1991, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Treponema pallidum anticorpi (E.I.A.)', 1992, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Treponema pallidum anticorpi (I.F.) [FTA-ABS]', 1993, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Treponema pallidum anticorpi (ricerca qualitatativa mediante emoagglutinazione passiva) [TPHA]', 1994, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Treponema pallidum anticorpi (ricerca quantitativa mediante emoagglutinazione passiva) [TPHA]', 1995, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Treponema pallidum anticorpi anti cardiolipina (flocculazione) [VDRL] [RPR]', 1996, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Treponema pallidum anticorpi anti cardiolipina (flocculazione) [VDRL] [RPR] quantitativa', 1997, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Treponema pallidum sierologia della sifilide. Anticorpi EIA/CLIA e/o TPHA [TPPA] più VDRL [RPR]', 1998, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tri test: alfafetoproteina (AFP), HCG totale o frazione libera, estriolo (E3). Determinazioni di rischio prenatale per anomalie cromosomiche e difetti del tubo neurale', 1999, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Trichinella anticorpi', 2000, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Trichomonas vaginalis nel secreto vaginale ', 2001, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 2002, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Trichomonas vaginalis, ', 2003, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale e/o ricerca diretta antigeni', 2004, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Trigliceridi', 2005, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Triodotironina libera (FT3)', 2006, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tripanosoma cruzi anticorpi', 2007, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tripanosomi nel sangue ricerca microscopica', 2008, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Tripsina', 2009, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Triptasi', 2010, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Trombina - Antitrombina III complesso (TAT)', 2011, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Trombossano B2', 2012, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Troponina I', 2013, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Troponina T', 2014, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Urato', 2015, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Urea', 2016, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Ureteroscopia', 2017, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Uretrocistoscopia', 2018, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Uretrocistoscopia con biopsia', 2019, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Uretrografia', 2020, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Uretroscopia', 2021, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Uretroscopia trans-perineale', 2022, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Urine conta di addis', 2023, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Urine ', 2024, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('completo ', 2025, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Urine ', 2026, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('morfologico a fresco', 2027, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Urine ', 2028, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('parziale (acetone e glucosio quantitativo)', 2029, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Urine ricerca di spermatozoi', 2030, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Urografia endovenosa', 2031, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valore ematocrito', 2032, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione del livello di autonomia nella cura della propria persona (ADL primarie o di base) ', 2033, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione del livello di autonomia nelle attività di vita domestica e aree di vita principale (ADL secondarie e\o IADL)', 2034, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione del ricircolo di fistola arterovenosa', 2035, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione della portata della fistola arterovenosa', 2036, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione della soglia di sensibilità vibratoria', 2037, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione della ventilazione e dei gas espirati e relativi parametri ', 2038, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione delle gastroenterorragie', 2039, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione di ampiezza del movimento', 2040, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione e assistenza protesica ', 2041, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione EMG dinamica del cammino ', 2042, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione funzionale delle funzioni corticali superiori', 2043, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione funzionale globale ', 2044, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione funzionale segmentaria', 2045, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione globale del livello di autonomia (ADL primarie o di base e ADL secondarie e\o IADL) ', 2046, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione manuale di funzione muscolare', 2047, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale del dolore  ', 2048, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale del movimento ', 2049, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale del sistema cardiovascolare e dell&#39;apparato respiratorio  ', 2050, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale dell&#39;apparato digerente [disfagia-turbe della defecazione]  ', 2051, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale della voce e dell&#39;eloquio [afasia-disartria] ', 2052, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale delle funzioni delle articolazioni e delle ossa ', 2053, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale delle funzioni genito urinarie [turbe vescico minzionali-perineali]  ', 2054, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale delle funzioni mentali globali ', 2055, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale delle funzioni muscolari [forza-tono-resistenza] ', 2056, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione monofunzionale delle funzioni vestibolari [equilibrio]  ', 2057, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione ortesica ', 2058, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione ortottica con studio completo della motilità oculare', 2059, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Valutazione psichiatrica dello stato mentale', 2060, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Velocità di conduzione nervosa motoria', 2061, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Velocità di conduzione nervosa sensitiva ', 2062, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Velocità di sedimentazione delle emazie (VES)', 2063, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Verifica beneficio protesico. Audiometria tonale/vocale protesica', 2064, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Vesciculografia seminale con contrasto', 2065, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Vettocardiografia', 2066, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Vibrio da coltura identificazione biochimica e sierologica', 2067, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Vibrio nelle feci ', 2068, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 2069, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Videoendoscopia delle vie aeree e digestive superiori (VADS)', 2070, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus [echo, polio, coxsackie, enterovirus] anticorpi IgG e IgM', 2071, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus acidi nucleici in materiali biologici ibridazione (previa reazione polimerasica a catena)', 2072, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus acidi nucleici in materiali biologici ibridazione (previa retrotrascrizione-reazione polimerasica a catena)', 2073, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus acidi nucleici in materiali biologici ibridazione diretta', 2074, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus acidi nucleici in materiali biologici. ricerca qualitativa/quantitativa', 2075, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus adenovirus anticorpi (E.I.A.)', 2076, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus adenovirus anticorpi (titolazione mediante F.C.)', 2077, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus adenovirus antigeni ricerca diretta nelle feci', 2078, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus adenovirus in materiali biologici ', 2079, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 2080, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus anticorpi (Titolazione mediante F.C.)', 2081, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus anticorpi immunoblotting Virus anticorpi immunoblotting', 2082, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus antigeni ricerca diretta in materiali biologici (Agglutinazione passiva) (Adenovirus, Rotavirus, Virus dell&#39;apparato gastroenterico)', 2083, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus antigeni ricerca diretta in materiali biologici (E.I.A.) (Adenovirus, Parvovirus B19, Rotavirus)', 2084, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus antigeni ricerca diretta in materiali biologici (I.F.) (Citomegalovirus, Herpes, Virus dell&#39;apparato respiratorio)', 2085, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus antigeni ricerca diretta in materiali biologici non altrimenti specificato', 2086, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus astrovirus ricerca antigene diretta nelle feci', 2087, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus anticorpi (E.I.A.)', 2088, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus anticorpi (titolazione mediante F.C.)', 2089, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus anticorpi IgG e IgM', 2090, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus anticorpi IgM (E.I.A.)', 2091, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus da coltura identificazione mediante ibridazione', 2092, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus in materiali biologici diversi ricerca mediante ', 2093, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 2094, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus in materiali biologici diversi ricerca mediante ', 2095, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (metodo rapido)', 2096, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus nel latte materno e nel tampone faringeo ', 2097, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (metodo tradizionale)', 2098, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus nel sangue acidi nucleici identificazione mediante ibridazione', 2099, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus nel sangue ', 2100, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (metodo tradizionale)', 2101, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus nell&#39;urina acidi nucleici identificazione mediante ibridazione', 2102, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus nell&#39;urina ', 2103, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (metodo tradizionale)', 2104, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus. ricerca antigeni su granulociti (antigenemia) (IF o EIA)', 2105, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus: analisi qualitativa del DNA', 2106, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus citomegalovirus: analisi quantitativa del DNA', 2107, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus coxsackie [B1, B2, B3, B4, B5, B6] anticorpi (titolazione mediante F.C.)', 2108, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus coxsackie [B1, B2, B3, B4, B5, B6] anticorpi (titolazione mediante I.F.)', 2109, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus da coltura identificazione (mediante I.F.)', 2110, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus da coltura identificazione (mediante M.E.)', 2111, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus da coltura identificazione (mediante neutralizzazione)', 2112, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus echo (titolazione mediante I.F.)', 2113, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus enterici ricerca acidi nucleici multiplex', 2114, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite A [HAV] anticorpi', 2115, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite A [HAV] anticorpi IgG e IgM per sospetta infezione acuta', 2116, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite A [HAV] anticorpi IgG per controllo stato immunitario', 2117, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite A [HAV] anticorpi IgM', 2118, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] acidi nucleici ibridazione (previa reazione polimerasica a catena)', 2119, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] acidi nucleici ibridazione diretta', 2120, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] analisi di mutazione del DNA per rilevamento resistenze ai farmaci antivirali', 2121, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] analisi qualitativa di HBV DNA', 2122, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] anticorpi HBcAg', 2123, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] anticorpi HBcAg IgM', 2124, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] anticorpi HBeAg', 2125, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] anticorpi HBsAg', 2126, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] antigene HBeAg', 2127, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] antigene HBsAg', 2128, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] antigene HBsAg (saggio di conferma)', 2129, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] DNA-polimerasi', 2130, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite B [HBV] tipizzazione genomica', 2131, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite C [HCV] analisi di mutazione del DNA per rilevamento resistenze ai farmaci antivirali', 2132, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite C [HCV] analisi qualitativa di HCV RNA', 2133, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite C [HCV] analisi quantitativa di HCV RNA', 2134, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite C [HCV] anticorpi', 2135, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite C [HCV] immunoblotting (saggio di conferma)', 2136, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite C [HCV] tipizzazione genomica', 2137, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite C antigene', 2138, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite delta [HDV] anticorpi', 2139, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite delta [HDV] anticorpi IgG e IgM', 2140, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite delta [HDV] anticorpi IgM', 2141, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite delta [HDV] antigene HDVAg', 2142, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epatite E [HEV] anticorpi', 2143, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epstein barr [EBV] analisi qualitativa/quantitativa del DNA', 2144, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epstein barr [EBV] anticorpi (EA o EBNA o VCA) (E.I.A.)', 2145, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epstein barr [EBV] anticorpi (EA o EBNA o VCA) (titolazione mediante I.F.)', 2146, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epstein barr [EBV] anticorpi EBNA + VCA IgG + VCA IgM', 2147, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epstein barr [EBV] anticorpi eterofili (test rapido)', 2148, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus epstein barr [EBV] anticorpi eterofili [R. Paul Bunnel Davidsohn]', 2149, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus genotipizzazione', 2150, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus HBV [HBV] reflex. Antigene HBsAg + anticorpi anti HBsAg + anticorpi anti HBcAg', 2151, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus herpes anticorpi (titolazione mediante F.C.)', 2152, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus herpes simplex (tipo 1 e 2) anticorpi IgG', 2153, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus herpes simplex (tipo 1 o 2) anticorpi', 2154, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodef. acquisita [HIV 1-2] anticorpi', 2155, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodef. acquisita [HIV 1] antigene P24 (E.I.A.)', 2156, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodef. acquisita [HIV 1] antigene P24 da colture linfocitarie (E.I.A.)', 2157, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodef. acquisita [HIV 2] anticorpi immunoblotting (saggio di conferma)', 2158, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodef. acquisita [HIV]: Analisi di mutazione dell&#39;acido nucleico per rilevamento resistenze ai farmaci antivirali', 2159, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodeficenza acquisita [HIV 1-2] .Test combinato anticorpi e antigene P24', 2160, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodeficenza acquisita [HIV] analisi qualitativa di DNA provirale', 2161, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodeficenza acquisita [HIV] analisi quantitativa di RNA', 2162, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodeficienza acquisita [HIV 1-2] anticorpi immunoblotting (saggio di conferma)', 2163, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodeficienza acquisita [HIV 1] anticorpi anti antigene P24 (E.I.A.)', 2164, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus immunodeficienza acquisita [HIV 1] anticorpi immunoblotting (saggio di conferma)', 2165, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus in materiali biologici ', 2166, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 2167, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus in materiali biologici ', 2168, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (metodo rapido)', 2169, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus in materiali biologici ', 2170, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale (metodo tradizionale)', 2171, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus morbillo anticorpi (E.I.A.)', 2172, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus morbillo anticorpi (I.F.)', 2173, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus morbillo anticorpi (titolazione mediante F.C.)', 2174, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus morbillo anticorpi IgG e IgM', 2175, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus norovirus antigeni ricerca diretta nelle feci', 2176, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus papillomavirus [HPV] in materiali biologici mediante ibridazione diretta', 2177, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus papillomavirus [HPV] tipizzazione genomica', 2178, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus papillomavirus [HPV]. Analisi qualitativa/quantitativa DNA', 2179, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus parotite anticorpi (E.I.A.)', 2180, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus parotite anticorpi (I.F.)', 2181, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus parotite anticorpi (titolazione mediante F.C.)', 2182, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus parotite anticorpi IgG e IgM', 2183, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus parvovirus b19 anticorpi IgG e IgM', 2184, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus respiratori ricerca acidi nucleici multiplex', 2185, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus respiratorio sinciziale anticorpi (I.F.)', 2186, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus respiratorio sinciziale anticorpi (titolazione mediante F.C.)', 2187, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus respiratorio sinciziale ricerca anticorpi (E.I.A.)', 2188, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus respiratorio sinciziale ricerca diretta in materiali biologici', 2189, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus retrovirus ricerca anticorpi anti HTLV1-HTLV2', 2190, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus rosolia anticorpi (titolazione mediante I.H.A.)', 2191, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus rosolia anticorpi IgG per controllo stato immunitario', 2192, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus rosolia IgG e IgM (incluso test di avidità IgG)', 2193, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus rotavirus antigeni ricerca diretta nelle feci', 2194, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus varicella zoster anticorpi (E.I.A.)', 2195, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus varicella zoster anticorpi (I.F.)', 2196, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus varicella zoster anticorpi (titolazione mediante F.C.)', 2197, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Virus varicella zoster anticorpi IgG ed eventuali IgM', 2198, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Viscosità ematica', 2199, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Viscosità plasmatica', 2200, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Vitamina D (1,25 OH)', 2201, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Vitamina D (25 OH)', 2202, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Vitamine idrosolubili: dosaggio plasmatico', 2203, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Vitamine liposolubili: dosaggio plasmatico', 2204, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Wilms tumor 1 test quantitativo', 2205, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Xerografia della mammella', 2206, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Xilosio (test di assorbimento)', 2207, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Yersinia da coltura identificazione biochimica', 2208, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Yersinia nelle feci ', 2209, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('colturale', 2210, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Zinco', 2211, NULL);
INSERT INTO public.esami (nome_esame, id_esame, costo_esame) VALUES ('Zincoprotoporfirina [(Sg)er]', 2212, NULL);


--
-- TOC entry 2973 (class 0 OID 16729)
-- Dependencies: 198
-- Data for Name: medici; Type: TABLE DATA; Schema: public; Owner: jan
--

INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('giovanni@specialista.com', '1000:c9b81dbda1e497521c857f9c1949f068:0900db7271b7f5926682ff329cfe65019ab427be6eeed1975b84d59cc08a53aaf92ea960e941aa582c388fc0d37ed32e6c6482f46d0d64d3d6fdb064b537d623', 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('franco@medicobase.com', '1000:8863974d3d37cbb0e5896c67f234fe7a:69b308cb08092dcc96fe7bb536066c0a572eaccd4f97a097207c12915801215d1127949ef0d03d9d6ce89ce9b5908b1915d8660d2ff80594fd50edd49ac3edb0', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('giovanni@specialista.com', '1000:74e2cf9dc31918299e8502ac80a4d92e:06bfaf04dfdbd26822600bd4936900a327366e9b80e9b83da305ecb7e007e62aa8d181dd08d1e8f32d8cbd8aad502a3f63be22916b51d6fb921dd33214ee7e7e', 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('giovanni@specialista.com', '1000:793def2918b03f347ff3914f84de3b6d:266c5fce491bc9227ce8ebae44ddc12b6de29f18c335f0f019ba5503a9e07f495bd52072967fbc4ffa1e1fe37a74ec577a968cb4062625b5f6911f45e73b583c', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('mario.rossi@gmail.com', '1000:39a9dfde43b0057e36130bb4fa13051b:16e3743403568be1b5190a2949d79f52d0286d3d63e11611bc652e3ab87f9e7d52d93b22113462cff1b6771f17bad921ec9e11a2e7edf76cd3fd0cbe4b86a798', 0, 1, 'Mario', 'Rossi', '0464551567', '3274455007', '/uploadFiles/default_user.png', 'TN', 'Lun-Ven 8:00-12:00', 'Via Santa Madonna, 5, Arco');
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('Web 2019 apssweb19@gmail.com', '1000:1be963d2036c70dfbd8f3f3577469332:ffd1adc5ec37dd06aea06dbd11624075e868d5aac9bba4667504fadfb1259d2b4837a4280cd4758e4c8205f4f73f83212a261ee9e27811b5008c2a1d66ad8a51', 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.medici (email, pswd, id_specializzazione, id_medico, nome, cognome, telefono_studio, telefono_cellulare, immagine, provincia, orario_visite, struttura) VALUES ('apssweb19@gmail.com', '1000:0d5c68a923d6aba2b560889526bc5c2d:c8897c5e61fc9f56c6525411ac8cd27cfd2dbf81d1613802203b4bf95e4f3453768d8c928d9e4c095a1b94f907778aae1b3ca343268974a1518ac2a0b1045217', 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2971 (class 0 OID 16713)
-- Dependencies: 196
-- Data for Name: pazienti; Type: TABLE DATA; Schema: public; Owner: jan
--

INSERT INTO public.pazienti (codice_fiscale, email, luogo_nascita, nome, sesso, id_medico, data_nascita, cognome, pswd, immagine, provincia, id_paziente) VALUES ('CLDMRA22T60G224P', 'maria.caldera22@.gmail.com', 'Padova', 'Maria', 'F', 6, '20/12/1922', 'Caldera', '1000:b488979d971672cf1e80674a7c5902e7:36edb533d044c83419b6af762b72b1e90193e9530ddcaa40cb27072abf26d7b2b9e6ab92118049c739058f9bb8d981605590d414509d2e31af3675fa3afc8b06', NULL, NULL, 2);
INSERT INTO public.pazienti (codice_fiscale, email, luogo_nascita, nome, sesso, id_medico, data_nascita, cognome, pswd, immagine, provincia, id_paziente) VALUES ('MSSNDR16A06D643G', 'andrea.massano16@gmail.com', 'Foggia', 'Andrea', 'M', 6, '06/01/2016', 'Massano', '1000:4b3a4f0391ef6e2ebdcb0b5e8a0207b1:5d567c410c6a940e5dc2995c0ff02c154c44fcfbdb917f0f63b61e997860517f8f2b47ab68ad1bf89d9051aa71b359a60ac4675897816ea6fc5ab00803eb3814', NULL, NULL, 1);
INSERT INTO public.pazienti (codice_fiscale, email, luogo_nascita, nome, sesso, id_medico, data_nascita, cognome, pswd, immagine, provincia, id_paziente) VALUES ('BRBGPP63A07E625H', 'giuseppe.barbero63@hotmail.com', 'Livorno', 'Giuseppe', 'M', 1, '07/01/1963', 'Barbero', '1000:d854627ddd74e8ad818551140f4fe762:5bb9ac1c6e6d1e203ed45e588804106858f9552eed76a614552dbed1e569ad282601d81d93d860112776ad87b6d31922d2a562a5111fa68acd3b8f1ee0f63d9a', '/web2019/uploadFiles/Giuseppe Barbero2.jpg', NULL, 3);


--
-- TOC entry 2976 (class 0 OID 24932)
-- Dependencies: 201
-- Data for Name: prenotazioni_esami; Type: TABLE DATA; Schema: public; Owner: jan
--

INSERT INTO public.prenotazioni_esami (id_esame, id_paziente, data_ora, referto, id_medico, id_prenotazione, stato) VALUES (2, 3, '20219-03-22 08:35:00', 'Non male dai', NULL, 1, NULL);
INSERT INTO public.prenotazioni_esami (id_esame, id_paziente, data_ora, referto, id_medico, id_prenotazione, stato) VALUES (4, 3, '2019-05-18 09:25:00', 'Benone', NULL, 2, NULL);


--
-- TOC entry 2975 (class 0 OID 24929)
-- Dependencies: 200
-- Data for Name: prenotazioni_visite; Type: TABLE DATA; Schema: public; Owner: jan
--



--
-- TOC entry 2979 (class 0 OID 24963)
-- Dependencies: 204
-- Data for Name: prescrizioni; Type: TABLE DATA; Schema: public; Owner: jan
--

INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_visita, id_farmacia) VALUES (1, 3, '2019-10-02 15:40:23+02', 'oki', 1, NULL, NULL);
INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_visita, id_farmacia) VALUES (1, 3, '2019-08-12 17:50:23+02', 'ibuprofene', 2, NULL, NULL);
INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_visita, id_farmacia) VALUES (1, 1, '2019-08-12 17:50:23+02', 'coca', 3, NULL, NULL);
INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_visita, id_farmacia) VALUES (1, 2, '2019-10-23 18:32:49.978+02', 'fdsfdff', 4, NULL, NULL);
INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_visita, id_farmacia) VALUES (1, 2, '2019-10-23 18:43:30.049+02', 'yololol trololol', 5, NULL, NULL);
INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_visita, id_farmacia) VALUES (1, 2, '2019-10-23 18:44:59.072+02', 'bkbjkjbjkj', 6, NULL, NULL);
INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_visita, id_farmacia) VALUES (1, 2, '2019-10-23 18:47:45.274+02', 'test', 7, NULL, NULL);
INSERT INTO public.prescrizioni (id_medico, id_paziente, "timestamp", farmaco, id_prescrizione, id_visita, id_farmacia) VALUES (6, 2, '2019-11-06 10:40:52.511+01', 'kljlnk jn', 8, NULL, NULL);


--
-- TOC entry 2986 (class 0 OID 25104)
-- Dependencies: 211
-- Data for Name: richieste_cambio_password; Type: TABLE DATA; Schema: public; Owner: jan
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


--
-- TOC entry 2972 (class 0 OID 16721)
-- Dependencies: 197
-- Data for Name: sessione; Type: TABLE DATA; Schema: public; Owner: jan
--

INSERT INTO public.sessione (id_paziente, id_sessione) VALUES (3, '99969A9281428E2B1763B30E5E9B0FAE');


--
-- TOC entry 2974 (class 0 OID 24921)
-- Dependencies: 199
-- Data for Name: sessione_medico; Type: TABLE DATA; Schema: public; Owner: jan
--

INSERT INTO public.sessione_medico (id_medico, id_sessione) VALUES (1, '77850d24-4a68-4810-9fb2-853604693e8c');


--
-- TOC entry 2978 (class 0 OID 24950)
-- Dependencies: 203
-- Data for Name: specializzazioni; Type: TABLE DATA; Schema: public; Owner: jan
--



--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 206
-- Name: esami_id_esame_seq; Type: SEQUENCE SET; Schema: public; Owner: jan
--

SELECT pg_catalog.setval('public.esami_id_esame_seq', 2212, true);


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 208
-- Name: medici_id_medico_seq; Type: SEQUENCE SET; Schema: public; Owner: jan
--

SELECT pg_catalog.setval('public.medici_id_medico_seq', 7, true);


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 207
-- Name: pazienti_id_paziente_seq; Type: SEQUENCE SET; Schema: public; Owner: jan
--

SELECT pg_catalog.setval('public.pazienti_id_paziente_seq', 3, true);


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 209
-- Name: prenotazioni_esami_id_esame_seq; Type: SEQUENCE SET; Schema: public; Owner: jan
--

SELECT pg_catalog.setval('public.prenotazioni_esami_id_esame_seq', 2, true);


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 210
-- Name: prenotazioni_visite_id_prenotazione_seq; Type: SEQUENCE SET; Schema: public; Owner: jan
--

SELECT pg_catalog.setval('public.prenotazioni_visite_id_prenotazione_seq', 3, true);


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 205
-- Name: prescrizioni_id_prescrizione_seq; Type: SEQUENCE SET; Schema: public; Owner: jan
--

SELECT pg_catalog.setval('public.prescrizioni_id_prescrizione_seq', 8, true);


--
-- TOC entry 2845 (class 2606 OID 25055)
-- Name: esami esami_pkey; Type: CONSTRAINT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.esami
    ADD CONSTRAINT esami_pkey PRIMARY KEY (id_esame);


--
-- TOC entry 2839 (class 2606 OID 16720)
-- Name: pazienti pazienti_pkey; Type: CONSTRAINT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.pazienti
    ADD CONSTRAINT pazienti_pkey PRIMARY KEY (email);


--
-- TOC entry 2849 (class 2606 OID 24981)
-- Name: prescrizioni prescrizioni_pkey; Type: CONSTRAINT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.prescrizioni
    ADD CONSTRAINT prescrizioni_pkey PRIMARY KEY (id_prescrizione);


--
-- TOC entry 2843 (class 2606 OID 24928)
-- Name: sessione_medico sessione_medico_pkey; Type: CONSTRAINT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.sessione_medico
    ADD CONSTRAINT sessione_medico_pkey PRIMARY KEY (id_medico);


--
-- TOC entry 2841 (class 2606 OID 16728)
-- Name: sessione sessione_pkey; Type: CONSTRAINT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.sessione
    ADD CONSTRAINT sessione_pkey PRIMARY KEY (id_paziente);


--
-- TOC entry 2847 (class 2606 OID 24957)
-- Name: specializzazioni specializzazioni_pkey; Type: CONSTRAINT; Schema: public; Owner: jan
--

ALTER TABLE ONLY public.specializzazioni
    ADD CONSTRAINT specializzazioni_pkey PRIMARY KEY (id_specializzazione);


-- Completed on 2019-12-05 11:02:07 CET

--
-- PostgreSQL database dump complete
--

