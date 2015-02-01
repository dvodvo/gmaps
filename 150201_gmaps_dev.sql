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


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: centers; Type: TABLE; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE TABLE centers (
    id integer NOT NULL,
    lat character varying(255),
    lng character varying(255),
    itinerario_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.centers OWNER TO gmaps_user;

--
-- Name: centers_id_seq; Type: SEQUENCE; Schema: public; Owner: gmaps_user
--

CREATE SEQUENCE centers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.centers_id_seq OWNER TO gmaps_user;

--
-- Name: centers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gmaps_user
--

ALTER SEQUENCE centers_id_seq OWNED BY centers.id;


--
-- Name: itinerarios; Type: TABLE; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE TABLE itinerarios (
    id integer NOT NULL,
    zoom integer,
    tilt character varying(255),
    map_type_id character varying(255),
    map_from_json text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    lonlat_center geography(Point,4326),
    zoom_level integer
);


ALTER TABLE public.itinerarios OWNER TO gmaps_user;

--
-- Name: itinerarios_id_seq; Type: SEQUENCE; Schema: public; Owner: gmaps_user
--

CREATE SEQUENCE itinerarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerarios_id_seq OWNER TO gmaps_user;

--
-- Name: itinerarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gmaps_user
--

ALTER SEQUENCE itinerarios_id_seq OWNED BY itinerarios.id;


--
-- Name: overlays; Type: TABLE; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE TABLE overlays (
    id integer NOT NULL,
    itinerario_id integer,
    gmap_type character varying(255),
    title character varying(255),
    content text,
    "fillColor" character varying(255),
    "fillOpacity" numeric,
    "strokeColor" character varying(255),
    "strokeOpacity" numeric,
    "strokeWeight" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.overlays OWNER TO gmaps_user;

--
-- Name: overlays_id_seq; Type: SEQUENCE; Schema: public; Owner: gmaps_user
--

CREATE SEQUENCE overlays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.overlays_id_seq OWNER TO gmaps_user;

--
-- Name: overlays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gmaps_user
--

ALTER SEQUENCE overlays_id_seq OWNED BY overlays.id;


--
-- Name: paths; Type: TABLE; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE TABLE paths (
    id integer NOT NULL,
    itinerario_id integer,
    lat character varying(255),
    lng character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.paths OWNER TO gmaps_user;

--
-- Name: paths_id_seq; Type: SEQUENCE; Schema: public; Owner: gmaps_user
--

CREATE SEQUENCE paths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paths_id_seq OWNER TO gmaps_user;

--
-- Name: paths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gmaps_user
--

ALTER SEQUENCE paths_id_seq OWNED BY paths.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO gmaps_user;

--
-- Name: strutturas; Type: TABLE; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE TABLE strutturas (
    id integer NOT NULL,
    lat numeric(15,10),
    lon numeric(15,10),
    nome character varying(255),
    address text,
    master_struttura_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    lonlat geography(Point,4326)
);


ALTER TABLE public.strutturas OWNER TO gmaps_user;

--
-- Name: strutturas_id_seq; Type: SEQUENCE; Schema: public; Owner: gmaps_user
--

CREATE SEQUENCE strutturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strutturas_id_seq OWNER TO gmaps_user;

--
-- Name: strutturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gmaps_user
--

ALTER SEQUENCE strutturas_id_seq OWNED BY strutturas.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gmaps_user
--

ALTER TABLE ONLY centers ALTER COLUMN id SET DEFAULT nextval('centers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gmaps_user
--

ALTER TABLE ONLY itinerarios ALTER COLUMN id SET DEFAULT nextval('itinerarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gmaps_user
--

ALTER TABLE ONLY overlays ALTER COLUMN id SET DEFAULT nextval('overlays_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gmaps_user
--

ALTER TABLE ONLY paths ALTER COLUMN id SET DEFAULT nextval('paths_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gmaps_user
--

ALTER TABLE ONLY strutturas ALTER COLUMN id SET DEFAULT nextval('strutturas_id_seq'::regclass);


--
-- Data for Name: centers; Type: TABLE DATA; Schema: public; Owner: gmaps_user
--

COPY centers (id, lat, lng, itinerario_id, created_at, updated_at) FROM stdin;
1	41.30404103430294	16.4007458496094	1	2015-02-01 09:08:17.527378	2015-02-01 09:08:17.527378
2	41.2097326245832	9.311817626953149	2	2015-02-01 10:25:06.086512	2015-02-01 10:25:06.086512
\.


--
-- Name: centers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gmaps_user
--

SELECT pg_catalog.setval('centers_id_seq', 2, true);


--
-- Data for Name: itinerarios; Type: TABLE DATA; Schema: public; Owner: gmaps_user
--

COPY itinerarios (id, zoom, tilt, map_type_id, map_from_json, created_at, updated_at, lonlat_center, zoom_level) FROM stdin;
1	\N	\N	\N	{"zoom":10,"tilt":0,"mapTypeId":"hybrid","center":{"lat":41.30404103430294,"lng":16.4007458496094},"overlays":[{"type":"polygon","title":"Bari","content":"centrale","fillColor":"#000000","fillOpacity":0.3,"strokeColor":"#000000","strokeOpacity":0.9,"strokeWeight":3,"paths":[[{"lat":"41.22520205795077","lng":"16.626434326171875"},{"lat":"41.14355310755207","lng":"16.623687744140625"},{"lat":"41.06387326747578","lng":"16.777496337890625"},{"lat":"41.06180237316445","lng":"16.864013671875"},{"lat":"41.1239008331216","lng":"17.0233154296875"}]]}]}	2015-02-01 09:08:17.52383	2015-02-01 09:08:17.545672	\N	\N
2	11	0	hybrid	{"zoom":11,"tilt":0,"mapTypeId":"hybrid","center":{"lat":41.2097326245832,"lng":9.311817626953149},"overlays":[{"type":"polygon","title":"hmm","content":"sex on the beach","fillColor":"#000000","fillOpacity":0.3,"strokeColor":"#000000","strokeOpacity":0.9,"strokeWeight":3,"paths":[[{"lat":"41.36877027284703","lng":"9.33837890625"},{"lat":"41.27388455204884","lng":"9.2724609375"},{"lat":"41.210636759631875","lng":"9.351425170898438"},{"lat":"41.15663414545461","lng":"9.479827880859375"},{"lat":"41.28214096826941","lng":"9.51416015625"}]]}]}	2015-02-01 10:25:06.055653	2015-02-01 10:33:42.103523	\N	\N
\.


--
-- Name: itinerarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gmaps_user
--

SELECT pg_catalog.setval('itinerarios_id_seq', 2, true);


--
-- Data for Name: overlays; Type: TABLE DATA; Schema: public; Owner: gmaps_user
--

COPY overlays (id, itinerario_id, gmap_type, title, content, "fillColor", "fillOpacity", "strokeColor", "strokeOpacity", "strokeWeight", created_at, updated_at) FROM stdin;
1	1	polygon	Bari	centrale	#000000	0.3	#000000	0.9	3	2015-02-01 09:08:17.530275	2015-02-01 09:08:17.530275
2	2	polygon	hmm	sex on the beach	#000000	0.3	#000000	0.9	3	2015-02-01 10:25:06.090948	2015-02-01 10:25:06.090948
\.


--
-- Name: overlays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gmaps_user
--

SELECT pg_catalog.setval('overlays_id_seq', 2, true);


--
-- Data for Name: paths; Type: TABLE DATA; Schema: public; Owner: gmaps_user
--

COPY paths (id, itinerario_id, lat, lng, created_at, updated_at) FROM stdin;
1	1	41.22520205795077	16.626434326171875	2015-02-01 09:08:17.533657	2015-02-01 09:08:17.533657
2	1	41.14355310755207	16.623687744140625	2015-02-01 09:08:17.536365	2015-02-01 09:08:17.536365
3	1	41.06387326747578	16.777496337890625	2015-02-01 09:08:17.537928	2015-02-01 09:08:17.537928
4	1	41.06180237316445	16.864013671875	2015-02-01 09:08:17.53929	2015-02-01 09:08:17.53929
5	1	41.1239008331216	17.0233154296875	2015-02-01 09:08:17.540403	2015-02-01 09:08:17.540403
6	2	41.36877027284703	9.33837890625	2015-02-01 10:25:06.09859	2015-02-01 10:25:06.09859
7	2	41.27388455204884	9.2724609375	2015-02-01 10:25:06.101952	2015-02-01 10:25:06.101952
8	2	41.210636759631875	9.351425170898438	2015-02-01 10:25:06.103324	2015-02-01 10:25:06.103324
9	2	41.15663414545461	9.479827880859375	2015-02-01 10:25:06.104485	2015-02-01 10:25:06.104485
10	2	41.28214096826941	9.51416015625	2015-02-01 10:25:06.10566	2015-02-01 10:25:06.10566
\.


--
-- Name: paths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gmaps_user
--

SELECT pg_catalog.setval('paths_id_seq', 10, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: gmaps_user
--

COPY schema_migrations (version) FROM stdin;
20140803102430
20140806103416
20140807090629
20140807103416
20140923065302
20140923065818
20140923065947
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: gmaps_user
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: strutturas; Type: TABLE DATA; Schema: public; Owner: gmaps_user
--

COPY strutturas (id, lat, lon, nome, address, master_struttura_id, created_at, updated_at, lonlat) FROM stdin;
1	41.1242220000	16.8707370000	Vinny's Lounge		1	2015-02-01 10:39:22.848748	2015-02-01 10:39:57.936613	0101000020E6100000CA6ABA9EE8DE3040CCB8A981E68F4440
2	40.6739120000	17.4424590000	Trullo Terturiello		27	2015-02-01 10:45:39.740912	2015-02-01 10:46:10.448435	0101000020E610000024D236FE44713140E43098BF42564440
3	40.8340140000	19.3143190000	Trullo Antico		28	2015-02-01 10:47:18.956908	2015-02-01 10:47:48.307497	0101000020E6100000ED82C13577503340FD3383F8C06A4440
4	40.7890320000	17.3935180000	Vigne di Salamina		26	2015-02-01 10:48:26.646999	2015-02-01 10:48:50.013998	0101000020E610000028637C98BD643140ADBF2500FF644440
\.


--
-- Name: strutturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gmaps_user
--

SELECT pg_catalog.setval('strutturas_id_seq', 4, true);


--
-- Name: centers_pkey; Type: CONSTRAINT; Schema: public; Owner: gmaps_user; Tablespace: 
--

ALTER TABLE ONLY centers
    ADD CONSTRAINT centers_pkey PRIMARY KEY (id);


--
-- Name: itinerarios_pkey; Type: CONSTRAINT; Schema: public; Owner: gmaps_user; Tablespace: 
--

ALTER TABLE ONLY itinerarios
    ADD CONSTRAINT itinerarios_pkey PRIMARY KEY (id);


--
-- Name: overlays_pkey; Type: CONSTRAINT; Schema: public; Owner: gmaps_user; Tablespace: 
--

ALTER TABLE ONLY overlays
    ADD CONSTRAINT overlays_pkey PRIMARY KEY (id);


--
-- Name: paths_pkey; Type: CONSTRAINT; Schema: public; Owner: gmaps_user; Tablespace: 
--

ALTER TABLE ONLY paths
    ADD CONSTRAINT paths_pkey PRIMARY KEY (id);


--
-- Name: strutturas_pkey; Type: CONSTRAINT; Schema: public; Owner: gmaps_user; Tablespace: 
--

ALTER TABLE ONLY strutturas
    ADD CONSTRAINT strutturas_pkey PRIMARY KEY (id);


--
-- Name: index_itinerarios_on_lonlat_center; Type: INDEX; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE INDEX index_itinerarios_on_lonlat_center ON itinerarios USING btree (lonlat_center);


--
-- Name: index_overlays_on_itinerario_id; Type: INDEX; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE INDEX index_overlays_on_itinerario_id ON overlays USING btree (itinerario_id);


--
-- Name: index_paths_on_itinerario_id; Type: INDEX; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE INDEX index_paths_on_itinerario_id ON paths USING btree (itinerario_id);


--
-- Name: index_strutturas_on_lonlat; Type: INDEX; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE INDEX index_strutturas_on_lonlat ON strutturas USING btree (lonlat);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: gmaps_user; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: gmaps_user
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM gmaps_user;
GRANT ALL ON SCHEMA public TO gmaps_user;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

