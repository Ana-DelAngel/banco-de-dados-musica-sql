--
-- PostgreSQL database dump
--

\restrict b7huc4szL8hxbcRA95oifeYThyvSPentLRH7grdvi715l12mruVq1FqrsIUlsy1

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-08 11:33:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16713)
-- Name: artista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artista (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    genero_musical character varying(100) NOT NULL
);


ALTER TABLE public.artista OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16712)
-- Name: artista_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artista_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artista_id_seq OWNER TO postgres;

--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 219
-- Name: artista_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artista_id_seq OWNED BY public.artista.id;


--
-- TOC entry 227 (class 1259 OID 16764)
-- Name: musica_playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musica_playlist (
    id_musica integer NOT NULL,
    id_playlist integer NOT NULL
);


ALTER TABLE public.musica_playlist OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16723)
-- Name: musicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musicas (
    id integer NOT NULL,
    titulo_faixa character varying(100) NOT NULL,
    duracao_segundos integer NOT NULL,
    artista_id integer,
    CONSTRAINT musicas_duracao_segundos_check CHECK ((duracao_segundos >= 0))
);


ALTER TABLE public.musicas OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16722)
-- Name: musicas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.musicas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.musicas_id_seq OWNER TO postgres;

--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 221
-- Name: musicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.musicas_id_seq OWNED BY public.musicas.id;


--
-- TOC entry 226 (class 1259 OID 16750)
-- Name: playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist (
    id integer NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    nome character varying(100) NOT NULL,
    usuario_id integer
);


ALTER TABLE public.playlist OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16749)
-- Name: playlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playlist_id_seq OWNER TO postgres;

--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 225
-- Name: playlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlist_id_seq OWNED BY public.playlist.id;


--
-- TOC entry 224 (class 1259 OID 16739)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    senha character varying(60) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16738)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 223
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4875 (class 2604 OID 16716)
-- Name: artista id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artista ALTER COLUMN id SET DEFAULT nextval('public.artista_id_seq'::regclass);


--
-- TOC entry 4876 (class 2604 OID 16726)
-- Name: musicas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musicas ALTER COLUMN id SET DEFAULT nextval('public.musicas_id_seq'::regclass);


--
-- TOC entry 4878 (class 2604 OID 16753)
-- Name: playlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist ALTER COLUMN id SET DEFAULT nextval('public.playlist_id_seq'::regclass);


--
-- TOC entry 4877 (class 2604 OID 16742)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 5043 (class 0 OID 16713)
-- Dependencies: 220
-- Data for Name: artista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artista (id, nome, genero_musical) FROM stdin;
1	Ariana Grande	Pop
2	Bon Jovi	Rock
3	ROSÉ	Kpop
\.


--
-- TOC entry 5050 (class 0 OID 16764)
-- Dependencies: 227
-- Data for Name: musica_playlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.musica_playlist (id_musica, id_playlist) FROM stdin;
1	2
4	2
3	1
2	1
2	3
4	3
\.


--
-- TOC entry 5045 (class 0 OID 16723)
-- Dependencies: 222
-- Data for Name: musicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.musicas (id, titulo_faixa, duracao_segundos, artista_id) FROM stdin;
1	We cant be friends	190	1
2	Livin On Prayer	360	2
3	APT	172	3
4	Its My life	234	2
\.


--
-- TOC entry 5049 (class 0 OID 16750)
-- Dependencies: 226
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist (id, data_criacao, nome, usuario_id) FROM stdin;
1	2026-06-08 11:11:55.924166	Animada	2
2	2026-06-08 11:11:55.924166	Favoritas	1
3	2026-06-08 11:11:55.924166	Rock	3
4	2026-06-08 11:27:35.574892	Viagens	3
\.


--
-- TOC entry 5047 (class 0 OID 16739)
-- Dependencies: 224
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nome, email, senha) FROM stdin;
1	Ana	ana@gmail.com	123
2	Taissa	taissa@gmail.com	456
3	Clara	clara@gmail.com	789
\.


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 219
-- Name: artista_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artista_id_seq', 3, true);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 221
-- Name: musicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.musicas_id_seq', 4, true);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 225
-- Name: playlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlist_id_seq', 4, true);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 223
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 3, true);


--
-- TOC entry 4882 (class 2606 OID 16721)
-- Name: artista artista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artista
    ADD CONSTRAINT artista_pkey PRIMARY KEY (id);


--
-- TOC entry 4890 (class 2606 OID 16770)
-- Name: musica_playlist musica_playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica_playlist
    ADD CONSTRAINT musica_playlist_pkey PRIMARY KEY (id_playlist, id_musica);


--
-- TOC entry 4884 (class 2606 OID 16732)
-- Name: musicas musicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musicas
    ADD CONSTRAINT musicas_pkey PRIMARY KEY (id);


--
-- TOC entry 4888 (class 2606 OID 16758)
-- Name: playlist playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (id);


--
-- TOC entry 4886 (class 2606 OID 16748)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4893 (class 2606 OID 16771)
-- Name: musica_playlist musica_playlist_id_musica_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica_playlist
    ADD CONSTRAINT musica_playlist_id_musica_fkey FOREIGN KEY (id_musica) REFERENCES public.musicas(id);


--
-- TOC entry 4894 (class 2606 OID 16776)
-- Name: musica_playlist musica_playlist_id_playlist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musica_playlist
    ADD CONSTRAINT musica_playlist_id_playlist_fkey FOREIGN KEY (id_playlist) REFERENCES public.playlist(id);


--
-- TOC entry 4891 (class 2606 OID 16733)
-- Name: musicas musicas_artista_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musicas
    ADD CONSTRAINT musicas_artista_id_fkey FOREIGN KEY (artista_id) REFERENCES public.artista(id);


--
-- TOC entry 4892 (class 2606 OID 16759)
-- Name: playlist playlist_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


-- Completed on 2026-06-08 11:33:08

--
-- PostgreSQL database dump complete
--

\unrestrict b7huc4szL8hxbcRA95oifeYThyvSPentLRH7grdvi715l12mruVq1FqrsIUlsy1

