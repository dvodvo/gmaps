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
-- Name: centers; Type: TABLE; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE TABLE centers (
    id integer NOT NULL,
    lat character varying(255),
    lng character varying(255),
    itinerario_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.centers OWNER TO jerdvo;

--
-- Name: centers_id_seq; Type: SEQUENCE; Schema: public; Owner: jerdvo
--

CREATE SEQUENCE centers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.centers_id_seq OWNER TO jerdvo;

--
-- Name: centers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jerdvo
--

ALTER SEQUENCE centers_id_seq OWNED BY centers.id;


--
-- Name: itinerarios; Type: TABLE; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE TABLE itinerarios (
    id integer NOT NULL,
    nome character varying(255),
    zoom integer,
    tilt character varying(255),
    map_type_id character varying(255),
    center_lat numeric,
    center_lon numeric,
    map_from_json text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    lonlat_center geography(Point,4326),
    zoom_level integer
);


ALTER TABLE public.itinerarios OWNER TO jerdvo;

--
-- Name: itinerarios_id_seq; Type: SEQUENCE; Schema: public; Owner: jerdvo
--

CREATE SEQUENCE itinerarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itinerarios_id_seq OWNER TO jerdvo;

--
-- Name: itinerarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jerdvo
--

ALTER SEQUENCE itinerarios_id_seq OWNED BY itinerarios.id;


--
-- Name: lonlats; Type: TABLE; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE TABLE lonlats (
    id integer NOT NULL,
    lat character varying(255),
    lon character varying(255),
    itinerario_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.lonlats OWNER TO jerdvo;

--
-- Name: lonlats_id_seq; Type: SEQUENCE; Schema: public; Owner: jerdvo
--

CREATE SEQUENCE lonlats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lonlats_id_seq OWNER TO jerdvo;

--
-- Name: lonlats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jerdvo
--

ALTER SEQUENCE lonlats_id_seq OWNED BY lonlats.id;


--
-- Name: overlays; Type: TABLE; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE TABLE overlays (
    id integer NOT NULL,
    itinerario_id integer,
    type character varying(255),
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


ALTER TABLE public.overlays OWNER TO jerdvo;

--
-- Name: overlays_id_seq; Type: SEQUENCE; Schema: public; Owner: jerdvo
--

CREATE SEQUENCE overlays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.overlays_id_seq OWNER TO jerdvo;

--
-- Name: overlays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jerdvo
--

ALTER SEQUENCE overlays_id_seq OWNED BY overlays.id;


--
-- Name: paths; Type: TABLE; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE TABLE paths (
    id integer NOT NULL,
    overlay_id integer,
    lat character varying(255),
    lng character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.paths OWNER TO jerdvo;

--
-- Name: paths_id_seq; Type: SEQUENCE; Schema: public; Owner: jerdvo
--

CREATE SEQUENCE paths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paths_id_seq OWNER TO jerdvo;

--
-- Name: paths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jerdvo
--

ALTER SEQUENCE paths_id_seq OWNED BY paths.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO jerdvo;

--
-- Name: strutturas; Type: TABLE; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE TABLE strutturas (
    id integer NOT NULL,
    latitude numeric,
    longitude numeric,
    nome character varying(255),
    servizi text,
    telefono character varying(255),
    web character varying(255),
    address character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.strutturas OWNER TO jerdvo;

--
-- Name: strutturas_id_seq; Type: SEQUENCE; Schema: public; Owner: jerdvo
--

CREATE SEQUENCE strutturas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strutturas_id_seq OWNER TO jerdvo;

--
-- Name: strutturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jerdvo
--

ALTER SEQUENCE strutturas_id_seq OWNED BY strutturas.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jerdvo
--

ALTER TABLE ONLY centers ALTER COLUMN id SET DEFAULT nextval('centers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jerdvo
--

ALTER TABLE ONLY itinerarios ALTER COLUMN id SET DEFAULT nextval('itinerarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jerdvo
--

ALTER TABLE ONLY lonlats ALTER COLUMN id SET DEFAULT nextval('lonlats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jerdvo
--

ALTER TABLE ONLY overlays ALTER COLUMN id SET DEFAULT nextval('overlays_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jerdvo
--

ALTER TABLE ONLY paths ALTER COLUMN id SET DEFAULT nextval('paths_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jerdvo
--

ALTER TABLE ONLY strutturas ALTER COLUMN id SET DEFAULT nextval('strutturas_id_seq'::regclass);


--
-- Data for Name: centers; Type: TABLE DATA; Schema: public; Owner: jerdvo
--

COPY centers (id, lat, lng, itinerario_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: centers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jerdvo
--

SELECT pg_catalog.setval('centers_id_seq', 1, false);


--
-- Data for Name: itinerarios; Type: TABLE DATA; Schema: public; Owner: jerdvo
--

COPY itinerarios (id, nome, zoom, tilt, map_type_id, center_lat, center_lon, map_from_json, created_at, updated_at, lonlat_center, zoom_level) FROM stdin;
1	\N	\N	\N	\N	\N	\N	"{\\"zoom\\"=>8, \\"tilt\\"=>0, \\"mapTypeId\\"=>\\"hybrid\\"}"	2014-09-23 10:55:53.716429	2014-09-23 11:03:27.495589	\N	\N
2	\N	\N	\N	\N	\N	\N	"{\\"zoom\\":8,\\"tilt\\":0,\\"mapTypeId\\":\\"hybrid\\",\\"center\\":{\\"lat\\":40.437932451597206,\\"lng\\":9.082478027343774},\\"overlays\\":[{\\"type\\":\\"polygon\\",\\"title\\":\\"Le più belle strade \\",\\"content\\":\\"\\",\\"fillColor\\":\\"#000000\\",\\"fillOpacity\\":0.3,\\"strokeColor\\":\\"#000000\\",\\"strokeOpacity\\":0.9,\\"strokeWeight\\":3,\\"paths\\":[[{\\"lat\\":\\"40.85755175501825\\",\\"lng\\":\\"8.68194580078125\\"},{\\"lat\\":\\"40.921918153400185\\",\\"lng\\":\\"8.37158203125\\"},{\\"lat\\":\\"41.07945464282617\\",\\"lng\\":\\"8.1683349609375\\"},{\\"lat\\":\\"40.549391572632544\\",\\"lng\\":\\"7.91839599609375\\"},{\\"lat\\":\\"40.32990040841309\\",\\"lng\\":\\"8.074951171875\\"},{\\"lat\\":\\"40.2252338644797\\",\\"lng\\":\\"8.525390625\\"},{\\"lat\\":\\"40.330005072961804\\",\\"lng\\":\\"8.624267578125\\"},{\\"lat\\":\\"40.48894625649553\\",\\"lng\\":\\"8.4814453125\\"},{\\"lat\\":\\"40.70583609726883\\",\\"lng\\":\\"8.4539794921875\\"}]]}]}\\r\\n"	2014-09-23 11:11:18.030063	2014-09-23 11:11:18.030063	\N	\N
3	\N	\N	\N	\N	\N	\N	"{\\"zoom\\":8,\\"tilt\\":0,\\"mapTypeId\\":\\"hybrid\\",\\"center\\":{\\"lat\\":40.437932451597206,\\"lng\\":9.082478027343774},\\"overlays\\":[{\\"type\\":\\"polygon\\",\\"title\\":\\"Le più belle strade \\",\\"content\\":\\"\\",\\"fillColor\\":\\"#000000\\",\\"fillOpacity\\":0.3,\\"strokeColor\\":\\"#000000\\",\\"strokeOpacity\\":0.9,\\"strokeWeight\\":3,\\"paths\\":[[{\\"lat\\":\\"40.85755175501825\\",\\"lng\\":\\"8.68194580078125\\"},{\\"lat\\":\\"40.921918153400185\\",\\"lng\\":\\"8.37158203125\\"},{\\"lat\\":\\"41.07945464282617\\",\\"lng\\":\\"8.1683349609375\\"},{\\"lat\\":\\"40.549391572632544\\",\\"lng\\":\\"7.91839599609375\\"},{\\"lat\\":\\"40.32990040841309\\",\\"lng\\":\\"8.074951171875\\"},{\\"lat\\":\\"40.2252338644797\\",\\"lng\\":\\"8.525390625\\"},{\\"lat\\":\\"40.330005072961804\\",\\"lng\\":\\"8.624267578125\\"},{\\"lat\\":\\"40.48894625649553\\",\\"lng\\":\\"8.4814453125\\"},{\\"lat\\":\\"40.70583609726883\\",\\"lng\\":\\"8.4539794921875\\"}]]}]}\\r\\n"	2014-09-23 11:17:12.148765	2014-09-23 11:17:12.148765	\N	\N
4	\N	\N	\N	\N	\N	\N	"{\\"zoom\\":8,\\"tilt\\":0,\\"mapTypeId\\":\\"hybrid\\",\\"center\\":{\\"lat\\":40.437932451597206,\\"lng\\":9.082478027343774},\\"overlays\\":[{\\"type\\":\\"polygon\\",\\"title\\":\\"Le più belle strade \\",\\"content\\":\\"\\",\\"fillColor\\":\\"#000000\\",\\"fillOpacity\\":0.3,\\"strokeColor\\":\\"#000000\\",\\"strokeOpacity\\":0.9,\\"strokeWeight\\":3,\\"paths\\":[[{\\"lat\\":\\"40.85755175501825\\",\\"lng\\":\\"8.68194580078125\\"},{\\"lat\\":\\"40.921918153400185\\",\\"lng\\":\\"8.37158203125\\"},{\\"lat\\":\\"41.07945464282617\\",\\"lng\\":\\"8.1683349609375\\"},{\\"lat\\":\\"40.549391572632544\\",\\"lng\\":\\"7.91839599609375\\"},{\\"lat\\":\\"40.32990040841309\\",\\"lng\\":\\"8.074951171875\\"},{\\"lat\\":\\"40.2252338644797\\",\\"lng\\":\\"8.525390625\\"},{\\"lat\\":\\"40.330005072961804\\",\\"lng\\":\\"8.624267578125\\"},{\\"lat\\":\\"40.48894625649553\\",\\"lng\\":\\"8.4814453125\\"},{\\"lat\\":\\"40.70583609726883\\",\\"lng\\":\\"8.4539794921875\\"}]]}]}\\r\\n"	2014-09-23 11:19:06.622798	2014-09-23 11:19:06.622798	\N	\N
\.


--
-- Name: itinerarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jerdvo
--

SELECT pg_catalog.setval('itinerarios_id_seq', 4, true);


--
-- Data for Name: lonlats; Type: TABLE DATA; Schema: public; Owner: jerdvo
--

COPY lonlats (id, lat, lon, itinerario_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: lonlats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jerdvo
--

SELECT pg_catalog.setval('lonlats_id_seq', 1, false);


--
-- Data for Name: overlays; Type: TABLE DATA; Schema: public; Owner: jerdvo
--

COPY overlays (id, itinerario_id, type, title, content, "fillColor", "fillOpacity", "strokeColor", "strokeOpacity", "strokeWeight", created_at, updated_at) FROM stdin;
\.


--
-- Name: overlays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jerdvo
--

SELECT pg_catalog.setval('overlays_id_seq', 1, false);


--
-- Data for Name: paths; Type: TABLE DATA; Schema: public; Owner: jerdvo
--

COPY paths (id, overlay_id, lat, lng, created_at, updated_at) FROM stdin;
\.


--
-- Name: paths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jerdvo
--

SELECT pg_catalog.setval('paths_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jerdvo
--

COPY schema_migrations (version) FROM stdin;
20140803101051
20140803102430
20140807090629
20140807103416
20140902144100
20140923065302
20140923065818
20140923065947
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: jerdvo
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: strutturas; Type: TABLE DATA; Schema: public; Owner: jerdvo
--

COPY strutturas (id, latitude, longitude, nome, servizi, telefono, web, address, created_at, updated_at) FROM stdin;
\.


--
-- Name: strutturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jerdvo
--

SELECT pg_catalog.setval('strutturas_id_seq', 1, false);


--
-- Name: centers_pkey; Type: CONSTRAINT; Schema: public; Owner: jerdvo; Tablespace: 
--

ALTER TABLE ONLY centers
    ADD CONSTRAINT centers_pkey PRIMARY KEY (id);


--
-- Name: itinerarios_pkey; Type: CONSTRAINT; Schema: public; Owner: jerdvo; Tablespace: 
--

ALTER TABLE ONLY itinerarios
    ADD CONSTRAINT itinerarios_pkey PRIMARY KEY (id);


--
-- Name: lonlats_pkey; Type: CONSTRAINT; Schema: public; Owner: jerdvo; Tablespace: 
--

ALTER TABLE ONLY lonlats
    ADD CONSTRAINT lonlats_pkey PRIMARY KEY (id);


--
-- Name: overlays_pkey; Type: CONSTRAINT; Schema: public; Owner: jerdvo; Tablespace: 
--

ALTER TABLE ONLY overlays
    ADD CONSTRAINT overlays_pkey PRIMARY KEY (id);


--
-- Name: paths_pkey; Type: CONSTRAINT; Schema: public; Owner: jerdvo; Tablespace: 
--

ALTER TABLE ONLY paths
    ADD CONSTRAINT paths_pkey PRIMARY KEY (id);


--
-- Name: strutturas_pkey; Type: CONSTRAINT; Schema: public; Owner: jerdvo; Tablespace: 
--

ALTER TABLE ONLY strutturas
    ADD CONSTRAINT strutturas_pkey PRIMARY KEY (id);


--
-- Name: index_itinerarios_on_lonlat_center; Type: INDEX; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE INDEX index_itinerarios_on_lonlat_center ON itinerarios USING btree (lonlat_center);


--
-- Name: index_lonlats_on_itinerario_id; Type: INDEX; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE INDEX index_lonlats_on_itinerario_id ON lonlats USING btree (itinerario_id);


--
-- Name: index_overlays_on_itinerario_id; Type: INDEX; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE INDEX index_overlays_on_itinerario_id ON overlays USING btree (itinerario_id);


--
-- Name: index_paths_on_overlay_id; Type: INDEX; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE INDEX index_paths_on_overlay_id ON paths USING btree (overlay_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: jerdvo; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: jerdvo
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jerdvo;
GRANT ALL ON SCHEMA public TO jerdvo;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

