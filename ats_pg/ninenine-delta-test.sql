--
-- PostgreSQL database dump

CREATE USER "ninenine-delta-test";
CREATE DATABASE "ninenine-delta-test";
GRANT ALL PRIVILEGES ON DATABASE "ninenine-delta-test" TO "ninenine-delta-test";
--

-- Dumped from database version 14.3 (Debian 14.3-1.pgdg110+1)
-- Dumped by pg_dump version 14.3 (Debian 14.3-1.pgdg110+1)

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
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: abandonments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abandonments (
    id integer NOT NULL,
    user_id integer,
    reason character varying(255),
    detail text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.abandonments OWNER TO postgres;

--
-- Name: abandonments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abandonments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abandonments_id_seq OWNER TO postgres;

--
-- Name: abandonments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abandonments_id_seq OWNED BY public.abandonments.id;


--
-- Name: abilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.abilities (
    id integer NOT NULL,
    plan_id integer,
    feature_id integer,
    action_id integer,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.abilities OWNER TO postgres;

--
-- Name: abilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.abilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abilities_id_seq OWNER TO postgres;

--
-- Name: abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.abilities_id_seq OWNED BY public.abilities.id;


--
-- Name: accept_terms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accept_terms (
    id integer NOT NULL,
    company_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.accept_terms OWNER TO postgres;

--
-- Name: accept_terms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accept_terms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accept_terms_id_seq OWNER TO postgres;

--
-- Name: accept_terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accept_terms_id_seq OWNED BY public.accept_terms.id;


--
-- Name: action_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_logs (
    id integer NOT NULL,
    user_id integer,
    namespace character varying,
    uri character varying,
    kind character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.action_logs OWNER TO postgres;

--
-- Name: action_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_logs_id_seq OWNER TO postgres;

--
-- Name: action_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_logs_id_seq OWNED BY public.action_logs.id;


--
-- Name: actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actions (
    id integer NOT NULL,
    name character varying,
    key character varying,
    feature_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying,
    hidden boolean,
    tooltip character varying
);


ALTER TABLE public.actions OWNER TO postgres;

--
-- Name: actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_id_seq OWNER TO postgres;

--
-- Name: actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actions_id_seq OWNED BY public.actions.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    state_id integer,
    street character varying(255),
    number character varying(255),
    complement character varying(255),
    city character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    lat character varying(255),
    lng character varying(255),
    zipcode character varying(255),
    country_id integer,
    neighborhood character varying
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.areas (
    id integer NOT NULL,
    program_id integer,
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO postgres;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.awards (
    id integer NOT NULL,
    name character varying(255),
    company_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    year character varying(255),
    "from" character varying(255),
    "order" integer
);


ALTER TABLE public.awards OWNER TO postgres;

--
-- Name: awards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.awards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awards_id_seq OWNER TO postgres;

--
-- Name: awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.awards_id_seq OWNED BY public.awards.id;


--
-- Name: beliefs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beliefs (
    id integer NOT NULL,
    name character varying(255),
    description text,
    company_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.beliefs OWNER TO postgres;

--
-- Name: beliefs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beliefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beliefs_id_seq OWNER TO postgres;

--
-- Name: beliefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beliefs_id_seq OWNED BY public.beliefs.id;


--
-- Name: benefits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.benefits (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    icon character varying,
    category character varying
);


ALTER TABLE public.benefits OWNER TO postgres;

--
-- Name: benefits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.benefits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.benefits_id_seq OWNER TO postgres;

--
-- Name: benefits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.benefits_id_seq OWNED BY public.benefits.id;


--
-- Name: benefits_opportunities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.benefits_opportunities (
    benefit_id integer,
    opportunity_id integer
);


ALTER TABLE public.benefits_opportunities OWNER TO postgres;

--
-- Name: benefits_programs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.benefits_programs (
    id integer NOT NULL,
    benefit_id integer,
    program_id integer
);


ALTER TABLE public.benefits_programs OWNER TO postgres;

--
-- Name: benefits_programs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.benefits_programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.benefits_programs_id_seq OWNER TO postgres;

--
-- Name: benefits_programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.benefits_programs_id_seq OWNED BY public.benefits_programs.id;


--
-- Name: broad_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.broad_values (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.broad_values OWNER TO postgres;

--
-- Name: broad_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.broad_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.broad_values_id_seq OWNER TO postgres;

--
-- Name: broad_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.broad_values_id_seq OWNED BY public.broad_values.id;


--
-- Name: businesses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.businesses (
    id integer NOT NULL,
    name character varying(255),
    description text,
    program_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.businesses OWNER TO postgres;

--
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.businesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesses_id_seq OWNER TO postgres;

--
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.businesses_id_seq OWNED BY public.businesses.id;


--
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    id integer NOT NULL,
    institution_id integer,
    name character varying,
    is_other boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- Name: campus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campus_id_seq OWNER TO postgres;

--
-- Name: campus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campus_id_seq OWNED BY public.campus.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categories_sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories_sectors (
    category_id integer,
    sector_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.categories_sectors OWNER TO postgres;

--
-- Name: characteristics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characteristics (
    id integer NOT NULL,
    opportunities smallint,
    benefits smallint,
    work_life_balance smallint,
    leadership smallint,
    organization_values smallint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.characteristics OWNER TO postgres;

--
-- Name: characteristics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characteristics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characteristics_id_seq OWNER TO postgres;

--
-- Name: characteristics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characteristics_id_seq OWNED BY public.characteristics.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    ibge_id character varying,
    name character varying,
    abbr character varying
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: collection_opportunities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_opportunities (
    id integer NOT NULL,
    company_collection_id integer,
    opportunity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.collection_opportunities OWNER TO postgres;

--
-- Name: collection_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_opportunities_id_seq OWNER TO postgres;

--
-- Name: collection_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_opportunities_id_seq OWNED BY public.collection_opportunities.id;


--
-- Name: collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collections (
    id integer NOT NULL,
    name character varying,
    subtitle character varying,
    description text,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    slug character varying
);


ALTER TABLE public.collections OWNER TO postgres;

--
-- Name: collections_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collections_companies (
    collection_id integer,
    company_id integer
);


ALTER TABLE public.collections_companies OWNER TO postgres;

--
-- Name: collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collections_id_seq OWNER TO postgres;

--
-- Name: collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collections_id_seq OWNED BY public.collections.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    body text,
    order_id integer,
    author_id integer,
    review boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: communities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(255),
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO postgres;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.communities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO postgres;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    headquarters character varying(255),
    size_id integer,
    revenue_id integer,
    website character varying(255),
    sector_id integer,
    mission text,
    about text,
    founded integer,
    user_id integer,
    score double precision DEFAULT 0.0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    address_id integer,
    twitter character varying(255),
    featured boolean DEFAULT false,
    recommend_score double precision DEFAULT 0.0,
    learning_score double precision DEFAULT 0.0,
    deleted_at timestamp without time zone,
    work_environment_id integer,
    old_logo_url character varying(255),
    facebook public.hstore,
    characteristic_id integer,
    phone character varying(255),
    opportunities_count integer DEFAULT 0,
    evaluations_count integer DEFAULT 0,
    visit_id integer,
    values_headline text,
    followers_count integer DEFAULT 0,
    values_title character varying(255) DEFAULT 'Valores'::character varying,
    ats_allowed boolean DEFAULT false,
    last_ats_access timestamp without time zone,
    published_opportunities_count integer DEFAULT 0,
    about_business text,
    document character varying,
    pre_registration boolean DEFAULT false,
    personas public.hstore,
    tags text,
    social_reason character varying(255),
    linkedin_published_id integer,
    whitelabel_url character varying,
    whitelabel_ri_url character varying,
    errors_by_email boolean DEFAULT false
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: companies_sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies_sectors (
    company_id integer,
    sector_id integer
);


ALTER TABLE public.companies_sectors OWNER TO postgres;

--
-- Name: company_action_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_action_tags (
    id integer NOT NULL,
    company_id integer,
    action character varying NOT NULL,
    tag text
);


ALTER TABLE public.company_action_tags OWNER TO postgres;

--
-- Name: company_action_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_action_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_action_tags_id_seq OWNER TO postgres;

--
-- Name: company_action_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_action_tags_id_seq OWNED BY public.company_action_tags.id;


--
-- Name: company_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_addresses (
    id bigint NOT NULL,
    company_id bigint,
    address_id bigint,
    name character varying NOT NULL,
    company_integration_fields public.hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.company_addresses OWNER TO postgres;

--
-- Name: company_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_addresses_id_seq OWNER TO postgres;

--
-- Name: company_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_addresses_id_seq OWNED BY public.company_addresses.id;


--
-- Name: company_api_integrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_api_integrations (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    slug character varying NOT NULL,
    environment character varying NOT NULL,
    expires_at timestamp without time zone,
    value text NOT NULL,
    extra_fields public.hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.company_api_integrations OWNER TO postgres;

--
-- Name: company_api_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_api_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_api_integrations_id_seq OWNER TO postgres;

--
-- Name: company_api_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_api_integrations_id_seq OWNED BY public.company_api_integrations.id;


--
-- Name: company_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_collections (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    description text,
    company_id integer,
    visible_to_all boolean,
    need_auth boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.company_collections OWNER TO postgres;

--
-- Name: company_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_collections_id_seq OWNER TO postgres;

--
-- Name: company_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_collections_id_seq OWNED BY public.company_collections.id;


--
-- Name: company_integration_field_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_integration_field_columns (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    company_integration_field_id bigint NOT NULL,
    order_presenter integer,
    label character varying NOT NULL,
    slug character varying NOT NULL,
    type_of_column character varying,
    match_field character varying,
    active boolean DEFAULT true,
    domain_reference_id bigint,
    domain_column_reference_id bigint,
    created_at timestamp without time zone NOT NULL,
    created_by bigint,
    updated_at timestamp without time zone NOT NULL,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint,
    column_unico character varying
);


ALTER TABLE public.company_integration_field_columns OWNER TO postgres;

--
-- Name: company_integration_field_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_integration_field_columns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_integration_field_columns_id_seq OWNER TO postgres;

--
-- Name: company_integration_field_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_integration_field_columns_id_seq OWNED BY public.company_integration_field_columns.id;


--
-- Name: company_integration_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_integration_fields (
    id integer NOT NULL,
    company_id integer,
    field character varying NOT NULL,
    required_in_publish_api boolean DEFAULT false NOT NULL,
    required_in_candidate_status_api boolean DEFAULT false NOT NULL,
    format character varying,
    type_of_column character varying DEFAULT 'string'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_presenter integer,
    label character varying,
    used_for_filter boolean DEFAULT false,
    used_for_create_opportunity boolean DEFAULT false,
    used_for_create_user boolean DEFAULT false,
    required_fill boolean DEFAULT false,
    active boolean DEFAULT true,
    can_delete boolean DEFAULT true,
    created_by bigint,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint,
    used_for_filter_requisition boolean DEFAULT false,
    used_for_create_requisition boolean DEFAULT false,
    field_listening jsonb DEFAULT '{"field": "", "field_column": ""}'::jsonb,
    domain_unico character varying
);


ALTER TABLE public.company_integration_fields OWNER TO postgres;

--
-- Name: company_integration_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_integration_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_integration_fields_id_seq OWNER TO postgres;

--
-- Name: company_integration_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_integration_fields_id_seq OWNED BY public.company_integration_fields.id;


--
-- Name: company_integration_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_integration_statuses (
    id integer NOT NULL,
    company_id integer,
    name character varying,
    slug character varying,
    description character varying,
    move_candidate character varying,
    move_next_candidate character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role_status_class text[] DEFAULT '{}'::text[],
    status_before character varying,
    check_recommendation_trigger boolean DEFAULT false
);


ALTER TABLE public.company_integration_statuses OWNER TO postgres;

--
-- Name: company_integration_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_integration_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_integration_statuses_id_seq OWNER TO postgres;

--
-- Name: company_integration_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_integration_statuses_id_seq OWNED BY public.company_integration_statuses.id;


--
-- Name: company_internal_recruitment_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_internal_recruitment_fields (
    id bigint NOT NULL,
    company_id bigint,
    name character varying,
    slug character varying,
    "order" integer,
    is_eligibility boolean DEFAULT false,
    eligibility_type character varying,
    eligibility_source_values character varying,
    field_match character varying,
    active boolean DEFAULT true,
    can_edit boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    created_by bigint,
    updated_at timestamp without time zone NOT NULL,
    updated_by bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint
);


ALTER TABLE public.company_internal_recruitment_fields OWNER TO postgres;

--
-- Name: company_internal_recruitment_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_internal_recruitment_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_internal_recruitment_fields_id_seq OWNER TO postgres;

--
-- Name: company_internal_recruitment_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_internal_recruitment_fields_id_seq OWNED BY public.company_internal_recruitment_fields.id;


--
-- Name: company_internal_recruitments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_internal_recruitments (
    id bigint NOT NULL,
    company_id bigint,
    directory character varying,
    file_name character varying,
    login_type character varying DEFAULT 'email'::character varying NOT NULL,
    specific_domains boolean DEFAULT false,
    domains character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.company_internal_recruitments OWNER TO postgres;

--
-- Name: company_internal_recruitments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_internal_recruitments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_internal_recruitments_id_seq OWNER TO postgres;

--
-- Name: company_internal_recruitments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_internal_recruitments_id_seq OWNED BY public.company_internal_recruitments.id;


--
-- Name: company_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_locations (
    id integer NOT NULL,
    program_id integer,
    state_id integer,
    city character varying(255),
    observation text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.company_locations OWNER TO postgres;

--
-- Name: company_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_locations_id_seq OWNER TO postgres;

--
-- Name: company_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_locations_id_seq OWNED BY public.company_locations.id;


--
-- Name: company_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_messages (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    slug character varying NOT NULL,
    amount_allowed integer NOT NULL,
    can_send_after_limit boolean DEFAULT false NOT NULL,
    available_days integer,
    start_at timestamp without time zone,
    expires_at timestamp without time zone,
    new_limit integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.company_messages OWNER TO postgres;

--
-- Name: company_messages_configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_messages_configurations (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    channel character varying,
    period character varying,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.company_messages_configurations OWNER TO postgres;

--
-- Name: company_messages_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_messages_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_messages_configurations_id_seq OWNER TO postgres;

--
-- Name: company_messages_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_messages_configurations_id_seq OWNED BY public.company_messages_configurations.id;


--
-- Name: company_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_messages_id_seq OWNER TO postgres;

--
-- Name: company_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_messages_id_seq OWNED BY public.company_messages.id;


--
-- Name: company_notification_configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_notification_configurations (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    source character varying,
    days integer,
    schedule integer,
    scope character varying
);


ALTER TABLE public.company_notification_configurations OWNER TO postgres;

--
-- Name: company_notification_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_notification_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_notification_configurations_id_seq OWNER TO postgres;

--
-- Name: company_notification_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_notification_configurations_id_seq OWNED BY public.company_notification_configurations.id;


--
-- Name: company_opportunity_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_opportunity_areas (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    opportunity_area_id bigint,
    deleted_at timestamp without time zone,
    deleted_by bigint
);


ALTER TABLE public.company_opportunity_areas OWNER TO postgres;

--
-- Name: company_opportunity_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_opportunity_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_opportunity_areas_id_seq OWNER TO postgres;

--
-- Name: company_opportunity_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_opportunity_areas_id_seq OWNED BY public.company_opportunity_areas.id;


--
-- Name: company_opportunity_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_opportunity_groups (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    opportunity_group character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by bigint
);


ALTER TABLE public.company_opportunity_groups OWNER TO postgres;

--
-- Name: company_opportunity_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_opportunity_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_opportunity_groups_id_seq OWNER TO postgres;

--
-- Name: company_opportunity_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_opportunity_groups_id_seq OWNED BY public.company_opportunity_groups.id;


--
-- Name: company_proportions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_proportions (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.company_proportions OWNER TO postgres;

--
-- Name: company_proportions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_proportions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_proportions_id_seq OWNER TO postgres;

--
-- Name: company_proportions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_proportions_id_seq OWNED BY public.company_proportions.id;


--
-- Name: company_sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_sizes (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    proportion_id integer
);


ALTER TABLE public.company_sizes OWNER TO postgres;

--
-- Name: company_sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_sizes_id_seq OWNER TO postgres;

--
-- Name: company_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_sizes_id_seq OWNED BY public.company_sizes.id;


--
-- Name: company_token_apis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_token_apis (
    id integer NOT NULL,
    company_id integer NOT NULL,
    token character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.company_token_apis OWNER TO postgres;

--
-- Name: company_token_apis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_token_apis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_token_apis_id_seq OWNER TO postgres;

--
-- Name: company_token_apis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_token_apis_id_seq OWNED BY public.company_token_apis.id;


--
-- Name: company_work_value_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_work_value_answers (
    id integer NOT NULL,
    company_id integer,
    company_work_value_detail_id integer,
    priority integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.company_work_value_answers OWNER TO postgres;

--
-- Name: company_work_value_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_work_value_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_work_value_answers_id_seq OWNER TO postgres;

--
-- Name: company_work_value_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_work_value_answers_id_seq OWNED BY public.company_work_value_answers.id;


--
-- Name: company_work_value_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_work_value_details (
    id integer NOT NULL,
    persona_id integer,
    company_work_value_point_id integer,
    name character varying
);


ALTER TABLE public.company_work_value_details OWNER TO postgres;

--
-- Name: company_work_value_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_work_value_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_work_value_details_id_seq OWNER TO postgres;

--
-- Name: company_work_value_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_work_value_details_id_seq OWNED BY public.company_work_value_details.id;


--
-- Name: company_work_value_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_work_value_points (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.company_work_value_points OWNER TO postgres;

--
-- Name: company_work_value_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_work_value_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_work_value_points_id_seq OWNER TO postgres;

--
-- Name: company_work_value_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_work_value_points_id_seq OWNED BY public.company_work_value_points.id;


--
-- Name: compatible_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compatible_relations (
    id integer NOT NULL,
    ecosystem_id integer,
    compatible_id integer,
    compatible_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.compatible_relations OWNER TO postgres;

--
-- Name: compatible_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compatible_relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compatible_relations_id_seq OWNER TO postgres;

--
-- Name: compatible_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compatible_relations_id_seq OWNED BY public.compatible_relations.id;


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversations (
    id integer NOT NULL,
    subject character varying,
    user_id integer,
    company_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    opportunity_id integer,
    manager_id integer,
    slug character varying,
    user_cellphone character varying,
    user_cpf character varying,
    responsible_email character varying,
    send_by character varying,
    status character varying DEFAULT 'success'::character varying,
    message_status character varying
);


ALTER TABLE public.conversations OWNER TO postgres;

--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversations_id_seq OWNER TO postgres;

--
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    iso_code character varying(255)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name character varying,
    level character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_blank boolean DEFAULT false NOT NULL,
    is_other boolean DEFAULT false NOT NULL
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    progress_stage character varying,
    progress_current integer DEFAULT 0,
    progress_max integer DEFAULT 0
);


ALTER TABLE public.delayed_jobs OWNER TO postgres;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delayed_jobs_id_seq OWNER TO postgres;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.delayed_jobs_id_seq OWNED BY public.delayed_jobs.id;


--
-- Name: descriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.descriptions (
    id integer NOT NULL,
    data text,
    describable_id integer,
    describable_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "order" integer
);


ALTER TABLE public.descriptions OWNER TO postgres;

--
-- Name: descriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.descriptions_id_seq OWNER TO postgres;

--
-- Name: descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.descriptions_id_seq OWNED BY public.descriptions.id;


--
-- Name: details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.details (
    id integer NOT NULL,
    question character varying(255),
    answer text,
    detailable_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    detailable_type character varying(255),
    "order" integer
);


ALTER TABLE public.details OWNER TO postgres;

--
-- Name: details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.details_id_seq OWNER TO postgres;

--
-- Name: details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.details_id_seq OWNED BY public.details.id;


--
-- Name: disabilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disabilities (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.disabilities OWNER TO postgres;

--
-- Name: disabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disabilities_id_seq OWNER TO postgres;

--
-- Name: disabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disabilities_id_seq OWNED BY public.disabilities.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    file character varying,
    documentable_id integer,
    documentable_type character varying,
    upload_name character varying,
    secure_random character varying,
    original_file character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    documentable_key integer
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: domain_api_configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.domain_api_configurations (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    company_integration_field_id bigint NOT NULL,
    type_of_request character varying,
    request_url character varying,
    content_type character varying,
    "authorization" character varying,
    frequency character varying,
    ruby_code text,
    called_in timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    created_by bigint,
    updated_at timestamp without time zone NOT NULL,
    updated_by bigint
);


ALTER TABLE public.domain_api_configurations OWNER TO postgres;

--
-- Name: domain_api_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domain_api_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domain_api_configurations_id_seq OWNER TO postgres;

--
-- Name: domain_api_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domain_api_configurations_id_seq OWNED BY public.domain_api_configurations.id;


--
-- Name: dream_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dream_jobs (
    id integer NOT NULL,
    user_id integer,
    opportunity_level_id integer,
    work_environment_id integer,
    opportunity_category_id integer,
    proportion_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    characteristic public.hstore,
    city character varying(255),
    state_id integer,
    deleted_at timestamp without time zone
);


ALTER TABLE public.dream_jobs OWNER TO postgres;

--
-- Name: dream_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dream_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dream_jobs_id_seq OWNER TO postgres;

--
-- Name: dream_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dream_jobs_id_seq OWNED BY public.dream_jobs.id;


--
-- Name: ecosystems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecosystems (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    company_description character varying(255),
    candidate_description character varying(255)
);


ALTER TABLE public.ecosystems OWNER TO postgres;

--
-- Name: ecosystems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ecosystems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ecosystems_id_seq OWNER TO postgres;

--
-- Name: ecosystems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ecosystems_id_seq OWNED BY public.ecosystems.id;


--
-- Name: evaluations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluations (
    id integer NOT NULL,
    company_id integer,
    opinion text,
    positives text,
    improvements text,
    opportunities integer,
    benefits integer,
    work_life_balance integer,
    leadership integer,
    organization_values integer,
    recommend boolean,
    learning boolean,
    position_in_company character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    answer text,
    worked_at date
);


ALTER TABLE public.evaluations OWNER TO postgres;

--
-- Name: evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluations_id_seq OWNER TO postgres;

--
-- Name: evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evaluations_id_seq OWNED BY public.evaluations.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    description text,
    headline character varying(255),
    visit_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    company_id integer,
    subscription_message text,
    subscriptions_count integer DEFAULT 0,
    participant_description text,
    address_id integer,
    schedule_title character varying(255),
    show_location boolean DEFAULT true
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: extra_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extra_jobs (
    id integer NOT NULL,
    title character varying(255),
    price integer DEFAULT 9,
    job_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.extra_jobs OWNER TO postgres;

--
-- Name: extra_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.extra_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_jobs_id_seq OWNER TO postgres;

--
-- Name: extra_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.extra_jobs_id_seq OWNED BY public.extra_jobs.id;


--
-- Name: extra_jobs_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.extra_jobs_orders (
    extra_job_id integer,
    order_id integer
);


ALTER TABLE public.extra_jobs_orders OWNER TO postgres;

--
-- Name: feature_action_user_vieweds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature_action_user_vieweds (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    feature_id bigint NOT NULL,
    action_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.feature_action_user_vieweds OWNER TO postgres;

--
-- Name: feature_action_user_vieweds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feature_action_user_vieweds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feature_action_user_vieweds_id_seq OWNER TO postgres;

--
-- Name: feature_action_user_vieweds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feature_action_user_vieweds_id_seq OWNED BY public.feature_action_user_vieweds.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.features (
    id integer NOT NULL,
    name character varying,
    key character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text
);


ALTER TABLE public.features OWNER TO postgres;

--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.features_id_seq OWNER TO postgres;

--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.features_id_seq OWNED BY public.features.id;


--
-- Name: features_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.features_plans (
    feature_id integer,
    plan_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.features_plans OWNER TO postgres;

--
-- Name: file_integration_emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.file_integration_emails (
    id bigint NOT NULL,
    file character varying NOT NULL,
    opportunity_id bigint,
    company_id bigint,
    total_candidates_general integer,
    total_candidates_sent integer,
    type_of_file character varying,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.file_integration_emails OWNER TO postgres;

--
-- Name: file_integration_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.file_integration_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.file_integration_emails_id_seq OWNER TO postgres;

--
-- Name: file_integration_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.file_integration_emails_id_seq OWNED BY public.file_integration_emails.id;


--
-- Name: filters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filters (
    id integer NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    "order" integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    group_filter_id integer NOT NULL
);


ALTER TABLE public.filters OWNER TO postgres;

--
-- Name: filters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filters_id_seq OWNER TO postgres;

--
-- Name: filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filters_id_seq OWNED BY public.filters.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.followers (
    id integer NOT NULL,
    user_id integer,
    company_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.followers OWNER TO postgres;

--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.followers_id_seq OWNER TO postgres;

--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- Name: geolocations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geolocations (
    id bigint NOT NULL,
    zipcode character varying NOT NULL,
    street character varying,
    number character varying,
    neighborhood character varying,
    city character varying,
    state character varying,
    lat character varying NOT NULL,
    long character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.geolocations OWNER TO postgres;

--
-- Name: geolocations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geolocations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.geolocations_id_seq OWNER TO postgres;

--
-- Name: geolocations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geolocations_id_seq OWNED BY public.geolocations.id;


--
-- Name: global_profile_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_profile_statuses (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    slug character varying NOT NULL,
    name character varying NOT NULL,
    "default" boolean,
    expires_in integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.global_profile_statuses OWNER TO postgres;

--
-- Name: global_profile_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.global_profile_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.global_profile_statuses_id_seq OWNER TO postgres;

--
-- Name: global_profile_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.global_profile_statuses_id_seq OWNED BY public.global_profile_statuses.id;


--
-- Name: group_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_collections (
    id integer NOT NULL,
    group_id integer,
    company_collection_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_collections OWNER TO postgres;

--
-- Name: group_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_collections_id_seq OWNER TO postgres;

--
-- Name: group_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_collections_id_seq OWNED BY public.group_collections.id;


--
-- Name: group_filters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_filters (
    id integer NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    "order" integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_filters OWNER TO postgres;

--
-- Name: group_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_filters_id_seq OWNER TO postgres;

--
-- Name: group_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_filters_id_seq OWNED BY public.group_filters.id;


--
-- Name: group_group_question_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_group_question_permissions (
    id bigint NOT NULL,
    group_id bigint,
    group_question_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_group_question_permissions OWNER TO postgres;

--
-- Name: group_group_question_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_group_question_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_group_question_permissions_id_seq OWNER TO postgres;

--
-- Name: group_group_question_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_group_question_permissions_id_seq OWNED BY public.group_group_question_permissions.id;


--
-- Name: group_integrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_integrations (
    id bigint NOT NULL,
    company_id bigint,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    group_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_integrations OWNER TO postgres;

--
-- Name: group_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_integrations_id_seq OWNER TO postgres;

--
-- Name: group_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_integrations_id_seq OWNED BY public.group_integrations.id;


--
-- Name: group_opportunities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_opportunities (
    id integer NOT NULL,
    group_id integer,
    opportunity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_opportunities OWNER TO postgres;

--
-- Name: group_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_opportunities_id_seq OWNER TO postgres;

--
-- Name: group_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_opportunities_id_seq OWNED BY public.group_opportunities.id;


--
-- Name: group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_permissions (
    id integer NOT NULL,
    group_id integer,
    feature_id integer,
    action_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_permissions OWNER TO postgres;

--
-- Name: group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_permissions_id_seq OWNER TO postgres;

--
-- Name: group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_permissions_id_seq OWNED BY public.group_permissions.id;


--
-- Name: group_presential_event_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_presential_event_permissions (
    id bigint NOT NULL,
    group_id bigint,
    presential_event_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_presential_event_permissions OWNER TO postgres;

--
-- Name: group_presential_event_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_presential_event_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_presential_event_permissions_id_seq OWNER TO postgres;

--
-- Name: group_presential_event_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_presential_event_permissions_id_seq OWNED BY public.group_presential_event_permissions.id;


--
-- Name: group_question_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_question_permissions (
    id bigint NOT NULL,
    group_id bigint,
    question_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_question_permissions OWNER TO postgres;

--
-- Name: group_question_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_question_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_question_permissions_id_seq OWNER TO postgres;

--
-- Name: group_question_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_question_permissions_id_seq OWNED BY public.group_question_permissions.id;


--
-- Name: group_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_questions (
    id bigint NOT NULL,
    question_id bigint,
    company_id bigint,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint,
    deleted_at timestamp without time zone,
    deleted_user_id integer,
    default_group boolean DEFAULT false,
    duplicated_from integer
);


ALTER TABLE public.group_questions OWNER TO postgres;

--
-- Name: group_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_questions_id_seq OWNER TO postgres;

--
-- Name: group_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_questions_id_seq OWNED BY public.group_questions.id;


--
-- Name: group_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_requirements (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    company_id integer,
    group_id integer,
    user_id integer,
    requirements public.hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_requirements OWNER TO postgres;

--
-- Name: group_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_requirements_id_seq OWNER TO postgres;

--
-- Name: group_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_requirements_id_seq OWNED BY public.group_requirements.id;


--
-- Name: group_requisition_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_requisition_permissions (
    id bigint NOT NULL,
    group_id bigint,
    requisition_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_requisition_permissions OWNER TO postgres;

--
-- Name: group_requisition_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_requisition_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_requisition_permissions_id_seq OWNER TO postgres;

--
-- Name: group_requisition_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_requisition_permissions_id_seq OWNED BY public.group_requisition_permissions.id;


--
-- Name: group_template_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_template_permissions (
    id bigint NOT NULL,
    group_id bigint,
    template_message_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_template_permissions OWNER TO postgres;

--
-- Name: group_template_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_template_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_template_permissions_id_seq OWNER TO postgres;

--
-- Name: group_template_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_template_permissions_id_seq OWNED BY public.group_template_permissions.id;


--
-- Name: group_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_templates (
    id bigint NOT NULL,
    template_message_id bigint,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_templates OWNER TO postgres;

--
-- Name: group_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_templates_id_seq OWNER TO postgres;

--
-- Name: group_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_templates_id_seq OWNED BY public.group_templates.id;


--
-- Name: group_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_users (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.group_users OWNER TO postgres;

--
-- Name: group_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_users_id_seq OWNER TO postgres;

--
-- Name: group_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_users_id_seq OWNED BY public.group_users.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying,
    slug character varying,
    company_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_integration_condition public.hstore
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: header_tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.header_tests (
    id integer NOT NULL,
    user_id integer,
    source_test_id integer,
    opportunity_id integer,
    url_test character varying,
    score numeric,
    filled_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deadline_date timestamp without time zone,
    start_date timestamp without time zone,
    conclusion_time numeric,
    status character varying,
    has_movie boolean DEFAULT false,
    details public.hstore,
    reopen_at timestamp without time zone,
    reopen_by bigint
);


ALTER TABLE public.header_tests OWNER TO postgres;

--
-- Name: header_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.header_tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.header_tests_id_seq OWNER TO postgres;

--
-- Name: header_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.header_tests_id_seq OWNED BY public.header_tests.id;


--
-- Name: health_checks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.health_checks (
    id bigint NOT NULL,
    status character varying DEFAULT 'ok'::character varying NOT NULL
);


ALTER TABLE public.health_checks OWNER TO postgres;

--
-- Name: health_checks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.health_checks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.health_checks_id_seq OWNER TO postgres;

--
-- Name: health_checks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.health_checks_id_seq OWNED BY public.health_checks.id;


--
-- Name: highlights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.highlights (
    id integer NOT NULL,
    image character varying(255),
    link character varying(255),
    "position" integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.highlights OWNER TO postgres;

--
-- Name: highlights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.highlights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.highlights_id_seq OWNER TO postgres;

--
-- Name: highlights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.highlights_id_seq OWNED BY public.highlights.id;


--
-- Name: identities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identities (
    id integer NOT NULL,
    user_id integer,
    provider character varying(255),
    uid character varying(255),
    credentials public.hstore,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    graph json,
    status smallint DEFAULT 0,
    origin_company integer
);


ALTER TABLE public.identities OWNER TO postgres;

--
-- Name: identities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.identities_id_seq OWNER TO postgres;

--
-- Name: identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.identities_id_seq OWNED BY public.identities.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    file character varying(255),
    imageable_id integer,
    imageable_type character varying(255),
    width integer,
    height integer,
    retina boolean DEFAULT false,
    upload_name character varying(255),
    secure_random character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    original_file character varying(255)
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: incompleted_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incompleted_subscriptions (
    id bigint NOT NULL,
    opportunity_id bigint,
    user_id bigint,
    step character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.incompleted_subscriptions OWNER TO postgres;

--
-- Name: incompleted_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incompleted_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incompleted_subscriptions_id_seq OWNER TO postgres;

--
-- Name: incompleted_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incompleted_subscriptions_id_seq OWNED BY public.incompleted_subscriptions.id;


--
-- Name: indication_domains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indication_domains (
    id integer NOT NULL,
    domain character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    opportunity_id integer,
    company_id integer,
    company_default boolean DEFAULT false,
    opportunity_type character varying,
    disabled boolean DEFAULT false
);


ALTER TABLE public.indication_domains OWNER TO postgres;

--
-- Name: indication_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.indication_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indication_domains_id_seq OWNER TO postgres;

--
-- Name: indication_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.indication_domains_id_seq OWNED BY public.indication_domains.id;


--
-- Name: installments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.installments (
    id integer NOT NULL,
    name character varying,
    price numeric(7,2),
    quantity numeric(3,1),
    discount character varying,
    "position" integer,
    hidden boolean DEFAULT false,
    plan_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    duration numeric(3,1)
);


ALTER TABLE public.installments OWNER TO postgres;

--
-- Name: installments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.installments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.installments_id_seq OWNER TO postgres;

--
-- Name: installments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.installments_id_seq OWNED BY public.installments.id;


--
-- Name: institutions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institutions (
    id integer NOT NULL,
    name character varying(255),
    state_id integer,
    is_other boolean DEFAULT false NOT NULL,
    state_abbr character varying
);


ALTER TABLE public.institutions OWNER TO postgres;

--
-- Name: institutions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institutions_id_seq OWNER TO postgres;

--
-- Name: institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institutions_id_seq OWNED BY public.institutions.id;


--
-- Name: interviewer_candidates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interviewer_candidates (
    id integer NOT NULL,
    interviewer_id integer,
    user_id character varying,
    subscription_id character varying,
    opportunity_id integer NOT NULL,
    company_id integer NOT NULL,
    opnion_pending boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.interviewer_candidates OWNER TO postgres;

--
-- Name: interviewer_candidates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interviewer_candidates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interviewer_candidates_id_seq OWNER TO postgres;

--
-- Name: interviewer_candidates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interviewer_candidates_id_seq OWNED BY public.interviewer_candidates.id;


--
-- Name: interviewers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interviewers (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying,
    unique_identifier character varying,
    token character varying,
    valid_at date,
    company_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    extra_fields public.hstore
);


ALTER TABLE public.interviewers OWNER TO postgres;

--
-- Name: interviewers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interviewers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interviewers_id_seq OWNER TO postgres;

--
-- Name: interviewers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interviewers_id_seq OWNED BY public.interviewers.id;


--
-- Name: job_boards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_boards (
    id integer NOT NULL,
    name character varying NOT NULL,
    sigla character varying NOT NULL,
    site character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.job_boards OWNER TO postgres;

--
-- Name: job_boards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_boards_id_seq OWNER TO postgres;

--
-- Name: job_boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_boards_id_seq OWNED BY public.job_boards.id;


--
-- Name: job_boards_opportunities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_boards_opportunities (
    id integer NOT NULL,
    job_board_id integer,
    opportunity_id integer,
    status character varying DEFAULT 'unpublished'::character varying,
    error_message text
);


ALTER TABLE public.job_boards_opportunities OWNER TO postgres;

--
-- Name: job_boards_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_boards_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_boards_opportunities_id_seq OWNER TO postgres;

--
-- Name: job_boards_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_boards_opportunities_id_seq OWNED BY public.job_boards_opportunities.id;


--
-- Name: job_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_categories (
    id integer NOT NULL,
    name character varying(255),
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.job_categories OWNER TO postgres;

--
-- Name: job_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_categories_id_seq OWNER TO postgres;

--
-- Name: job_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_categories_id_seq OWNED BY public.job_categories.id;


--
-- Name: job_feedback_opportunities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_feedback_opportunities (
    id integer NOT NULL,
    opportunity_id integer,
    opportunity_status character varying,
    pending boolean DEFAULT true,
    sent_in timestamp without time zone,
    error boolean DEFAULT false,
    error_message character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.job_feedback_opportunities OWNER TO postgres;

--
-- Name: job_feedback_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_feedback_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_feedback_opportunities_id_seq OWNER TO postgres;

--
-- Name: job_feedback_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_feedback_opportunities_id_seq OWNED BY public.job_feedback_opportunities.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id integer NOT NULL,
    title character varying(255),
    featured boolean DEFAULT false,
    likes_count integer DEFAULT 0,
    dislikes_count integer DEFAULT 0,
    price integer DEFAULT 9,
    hidden boolean DEFAULT false,
    job_category_id integer,
    description text,
    instructions text,
    term integer,
    video text,
    published boolean DEFAULT true,
    seller_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: leads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leads (
    id integer NOT NULL,
    email character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.leads OWNER TO postgres;

--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leads_id_seq OWNER TO postgres;

--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- Name: log_integration_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_integration_files (
    id bigint NOT NULL,
    file character varying,
    file_name character varying NOT NULL,
    opportunity_id bigint,
    company_id bigint,
    total_candidates_general integer,
    total_candidates_sent integer,
    type_of_file character varying,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    log character varying
);


ALTER TABLE public.log_integration_files OWNER TO postgres;

--
-- Name: log_integration_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_integration_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_integration_files_id_seq OWNER TO postgres;

--
-- Name: log_integration_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_integration_files_id_seq OWNED BY public.log_integration_files.id;


--
-- Name: log_opportunity_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_opportunity_statuses (
    id bigint NOT NULL,
    opportunity_id integer NOT NULL,
    user_id integer,
    origin_of_change character varying,
    description character varying,
    old_status integer,
    new_status integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_id bigint
);


ALTER TABLE public.log_opportunity_statuses OWNER TO postgres;

--
-- Name: log_opportunity_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_opportunity_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_opportunity_statuses_id_seq OWNER TO postgres;

--
-- Name: log_opportunity_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_opportunity_statuses_id_seq OWNED BY public.log_opportunity_statuses.id;


--
-- Name: log_update_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_update_profiles (
    id bigint NOT NULL,
    company_id integer NOT NULL,
    user_id integer NOT NULL,
    uuid character varying DEFAULT 'c5d3fc23-448f-4073-a119-afe6525843a4'::character varying NOT NULL,
    params public.hstore,
    status character varying DEFAULT 'pending'::character varying,
    response_code character varying,
    response public.hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.log_update_profiles OWNER TO postgres;

--
-- Name: log_update_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_update_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_update_profiles_id_seq OWNER TO postgres;

--
-- Name: log_update_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_update_profiles_id_seq OWNED BY public.log_update_profiles.id;


--
-- Name: managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.managers (
    id integer NOT NULL,
    user_id integer,
    company_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    responsible_user_id integer,
    accepted_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.managers OWNER TO postgres;

--
-- Name: managers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.managers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.managers_id_seq OWNER TO postgres;

--
-- Name: managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.managers_id_seq OWNED BY public.managers.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    id integer NOT NULL,
    body character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    mediable_id integer,
    mediable_type character varying(255)
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: mentions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mentions (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    in_user_id integer,
    subscription_id character varying,
    profile_id character varying,
    origin_type character varying,
    company_id integer,
    opportunity_id integer,
    note_id character varying,
    read_at timestamp without time zone,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.mentions OWNER TO postgres;

--
-- Name: mentions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mentions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mentions_id_seq OWNER TO postgres;

--
-- Name: mentions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mentions_id_seq OWNED BY public.mentions.id;


--
-- Name: message_contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message_contents (
    id integer NOT NULL,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.message_contents OWNER TO postgres;

--
-- Name: message_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.message_contents_id_seq OWNER TO postgres;

--
-- Name: message_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_contents_id_seq OWNED BY public.message_contents.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    conversation_id integer,
    message_content_id integer,
    read_at timestamp without time zone,
    replied_at timestamp without time zone,
    parent_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    to_user_id integer,
    from_user_id integer
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: new_order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_order_details (
    id integer NOT NULL,
    new_order_id integer NOT NULL,
    status character varying NOT NULL,
    description character varying,
    postback_detail public.hstore,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.new_order_details OWNER TO postgres;

--
-- Name: new_order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.new_order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_order_details_id_seq OWNER TO postgres;

--
-- Name: new_order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.new_order_details_id_seq OWNED BY public.new_order_details.id;


--
-- Name: new_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    tid character varying,
    transaction_id integer,
    company_id integer NOT NULL,
    payment_type character varying NOT NULL,
    status character varying NOT NULL,
    installment_id integer NOT NULL,
    amount double precision,
    authorization_code character varying,
    payment_installments integer,
    boleto_url character varying,
    boleto_barcode character varying,
    payment_detail public.hstore,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    plan_installment_id integer,
    pagarme_subscription_id integer
);


ALTER TABLE public.new_orders OWNER TO postgres;

--
-- Name: new_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.new_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_orders_id_seq OWNER TO postgres;

--
-- Name: new_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.new_orders_id_seq OWNED BY public.new_orders.id;


--
-- Name: opportunities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunities (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    company_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    opportunity_category_id integer,
    address_id integer,
    expired_at date,
    other_benefit text,
    deleted_at timestamp without time zone,
    opportunity_level_id integer,
    characteristic_id integer,
    work_environment_id integer,
    external_url character varying(255),
    external_email character varying(255),
    visit_id integer,
    managed boolean DEFAULT true,
    subscription_message text,
    status integer DEFAULT 1,
    subscriptions_count integer DEFAULT 0,
    responsability text,
    requirement text,
    subscription_email_message text,
    work_environment text,
    occupation_area_id integer,
    enable_messages boolean DEFAULT true,
    published_at timestamp without time zone,
    tags text,
    required_profile boolean,
    closed_at timestamp without time zone,
    internal_recruitment boolean DEFAULT false,
    requisition_id integer,
    default_publishing_time integer,
    company_integration_fields public.hstore,
    pcd boolean DEFAULT false,
    eligibility_requirements public.hstore,
    continuous_capture boolean DEFAULT false,
    hidden boolean DEFAULT false,
    user_id integer,
    duplicated_from integer,
    params_api character varying,
    auto_update_curriculum boolean DEFAULT false,
    language character varying DEFAULT 'pt-BR'::character varying,
    number_of_positions integer,
    subscriber_edit_question boolean DEFAULT false,
    hiring_time integer,
    critical_period integer,
    days_type character varying,
    company_opportunity_area_id bigint,
    company_opportunity_group_id bigint,
    hiring_date date,
    deleted_by bigint,
    acting_mode character varying DEFAULT 'presential'::character varying,
    closed_by integer,
    highlighted boolean DEFAULT false
);


ALTER TABLE public.opportunities OWNER TO postgres;

--
-- Name: opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunities_id_seq OWNER TO postgres;

--
-- Name: opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunities_id_seq OWNED BY public.opportunities.id;


--
-- Name: opportunity_action_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_action_tags (
    id integer NOT NULL,
    opportunity_id integer,
    action character varying NOT NULL,
    tag text
);


ALTER TABLE public.opportunity_action_tags OWNER TO postgres;

--
-- Name: opportunity_action_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_action_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_action_tags_id_seq OWNER TO postgres;

--
-- Name: opportunity_action_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_action_tags_id_seq OWNED BY public.opportunity_action_tags.id;


--
-- Name: opportunity_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_areas (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "group" character(2)
);


ALTER TABLE public.opportunity_areas OWNER TO postgres;

--
-- Name: opportunity_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_areas_id_seq OWNER TO postgres;

--
-- Name: opportunity_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_areas_id_seq OWNED BY public.opportunity_areas.id;


--
-- Name: opportunity_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.opportunity_categories OWNER TO postgres;

--
-- Name: opportunity_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_categories_id_seq OWNER TO postgres;

--
-- Name: opportunity_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_categories_id_seq OWNED BY public.opportunity_categories.id;


--
-- Name: opportunity_configurations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_configurations (
    id integer NOT NULL,
    opportunity_id integer,
    number_opnions_to_finalize_opportunity integer DEFAULT 1,
    number_disabilities_to_finalize_opportunity integer,
    disable_migrate_candidate_disapproved boolean DEFAULT true,
    disable_rules_to_finalize_opportunity boolean DEFAULT false,
    min_days_allow_finalize_with_migrated integer DEFAULT 30,
    company_id integer,
    company_default boolean DEFAULT false,
    opportunity_type character varying,
    disabled boolean DEFAULT false,
    number_interviewers integer DEFAULT 1,
    evaluation_by_step boolean DEFAULT true,
    evaluation_characters_limit integer,
    opnion_after_integration boolean,
    auto_update_curriculum boolean DEFAULT false,
    number_interviewers_in_opinion integer DEFAULT 1,
    observation_field boolean DEFAULT false
);


ALTER TABLE public.opportunity_configurations OWNER TO postgres;

--
-- Name: opportunity_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_configurations_id_seq OWNER TO postgres;

--
-- Name: opportunity_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_configurations_id_seq OWNED BY public.opportunity_configurations.id;


--
-- Name: opportunity_email_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_email_messages (
    id integer NOT NULL,
    opportunity_id integer,
    no_reply boolean DEFAULT false,
    responsible_of_opportunity boolean DEFAULT false,
    emails text,
    company_id integer,
    company_default boolean DEFAULT false,
    opportunity_type character varying,
    disabled boolean DEFAULT false,
    subscription_message text,
    subscription_email_message text
);


ALTER TABLE public.opportunity_email_messages OWNER TO postgres;

--
-- Name: opportunity_email_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_email_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_email_messages_id_seq OWNER TO postgres;

--
-- Name: opportunity_email_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_email_messages_id_seq OWNED BY public.opportunity_email_messages.id;


--
-- Name: opportunity_integration_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_integration_statuses (
    id integer NOT NULL,
    opportunity_id integer,
    name character varying,
    slug character varying,
    description character varying,
    move_candidate character varying,
    move_next_candidate character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.opportunity_integration_statuses OWNER TO postgres;

--
-- Name: opportunity_integration_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_integration_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_integration_statuses_id_seq OWNER TO postgres;

--
-- Name: opportunity_integration_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_integration_statuses_id_seq OWNED BY public.opportunity_integration_statuses.id;


--
-- Name: opportunity_levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_levels (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    "order" integer
);


ALTER TABLE public.opportunity_levels OWNER TO postgres;

--
-- Name: opportunity_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_levels_id_seq OWNER TO postgres;

--
-- Name: opportunity_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_levels_id_seq OWNED BY public.opportunity_levels.id;


--
-- Name: opportunity_opinion_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_opinion_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    icon character varying,
    color character varying,
    move_to character varying,
    opportunity_id integer,
    company_id integer,
    company_default boolean DEFAULT false,
    disabled boolean DEFAULT false,
    opportunity_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fields public.hstore,
    evaluation_type character varying,
    evaluation_reasons character varying,
    check_recommendation_trigger boolean DEFAULT false
);


ALTER TABLE public.opportunity_opinion_types OWNER TO postgres;

--
-- Name: opportunity_opinion_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_opinion_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_opinion_types_id_seq OWNER TO postgres;

--
-- Name: opportunity_opinion_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_opinion_types_id_seq OWNED BY public.opportunity_opinion_types.id;


--
-- Name: opportunity_params; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_params (
    id integer NOT NULL,
    subsidiary character varying,
    name_store_manager character varying,
    email_store_manager character varying,
    name_regional_manager character varying,
    email_regional_manager character varying,
    publication_validity integer,
    interviewers integer,
    candidates_in_profile integer,
    adherents_verification_time integer,
    minimum_adhesion integer,
    opportunity_id integer
);


ALTER TABLE public.opportunity_params OWNER TO postgres;

--
-- Name: opportunity_params_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_params_id_seq OWNER TO postgres;

--
-- Name: opportunity_params_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_params_id_seq OWNED BY public.opportunity_params.id;


--
-- Name: opportunity_recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_recommendations (
    id bigint NOT NULL,
    profile_id character varying NOT NULL,
    user_id bigint,
    opportunity_id bigint,
    company_id bigint,
    sent_at timestamp without time zone,
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    "interval" integer DEFAULT 15 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.opportunity_recommendations OWNER TO postgres;

--
-- Name: opportunity_recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_recommendations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_recommendations_id_seq OWNER TO postgres;

--
-- Name: opportunity_recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_recommendations_id_seq OWNED BY public.opportunity_recommendations.id;


--
-- Name: opportunity_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_statuses (
    id integer NOT NULL,
    name character varying,
    "position" integer DEFAULT 0,
    opportunity_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    legacy_name character varying,
    opnion_store_approved boolean DEFAULT false,
    company_id integer,
    company_default boolean DEFAULT false,
    opportunity_type character varying,
    disabled boolean DEFAULT false
);


ALTER TABLE public.opportunity_statuses OWNER TO postgres;

--
-- Name: opportunity_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_statuses_id_seq OWNER TO postgres;

--
-- Name: opportunity_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_statuses_id_seq OWNED BY public.opportunity_statuses.id;


--
-- Name: opportunity_tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_tests (
    id integer NOT NULL,
    source_test_id integer,
    opportunity_id integer,
    required_in character varying,
    deadline_date timestamp without time zone,
    company_id integer,
    company_default boolean DEFAULT false,
    opportunity_type character varying,
    disabled boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.opportunity_tests OWNER TO postgres;

--
-- Name: opportunity_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_tests_id_seq OWNER TO postgres;

--
-- Name: opportunity_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_tests_id_seq OWNED BY public.opportunity_tests.id;


--
-- Name: opportunity_viewers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opportunity_viewers (
    id integer NOT NULL,
    visited_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    opportunity_id integer,
    previous_visit_in timestamp without time zone NOT NULL
);


ALTER TABLE public.opportunity_viewers OWNER TO postgres;

--
-- Name: opportunity_viewers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opportunity_viewers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opportunity_viewers_id_seq OWNER TO postgres;

--
-- Name: opportunity_viewers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opportunity_viewers_id_seq OWNED BY public.opportunity_viewers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    job_id integer,
    buyer_id integer,
    state character varying(255),
    amount integer,
    seller_id integer,
    "like" boolean DEFAULT false,
    likes_count integer DEFAULT 0,
    dislikes_count integer DEFAULT 0,
    reviewed_at timestamp without time zone,
    delivered_file_url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: origin_page_views; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.origin_page_views (
    id integer NOT NULL,
    type_id integer NOT NULL,
    type_name character varying NOT NULL,
    subscription_source_id integer NOT NULL,
    user_id integer,
    url character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.origin_page_views OWNER TO postgres;

--
-- Name: origin_page_views_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.origin_page_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_page_views_id_seq OWNER TO postgres;

--
-- Name: origin_page_views_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.origin_page_views_id_seq OWNED BY public.origin_page_views.id;


--
-- Name: packages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.packages (
    id integer NOT NULL,
    user_id integer,
    tid character varying,
    external_code character varying,
    card_last_digits character varying,
    card_expiration character varying,
    card_holder character varying,
    card_issuer character varying,
    address public.hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    payment_type character varying,
    status character varying,
    installments integer
);


ALTER TABLE public.packages OWNER TO postgres;

--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.packages_id_seq OWNER TO postgres;

--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.packages_id_seq OWNED BY public.packages.id;


--
-- Name: partner_integrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partner_integrations (
    id bigint NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    integration_type character varying NOT NULL,
    payload jsonb DEFAULT '{}'::jsonb,
    token character varying,
    company_id bigint,
    user_create_id bigint,
    user_update_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    deleted_user_id integer,
    endpoint text,
    partner text,
    company_domains jsonb DEFAULT '"{}"'::jsonb,
    configurations jsonb
);


ALTER TABLE public.partner_integrations OWNER TO postgres;

--
-- Name: partner_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partner_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partner_integrations_id_seq OWNER TO postgres;

--
-- Name: partner_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partner_integrations_id_seq OWNED BY public.partner_integrations.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    amount integer DEFAULT 0,
    token character varying(255),
    identifier character varying(255),
    payer_id character varying(255),
    state character varying(255),
    order_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: permitted_domain_emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permitted_domain_emails (
    id bigint NOT NULL,
    domain character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.permitted_domain_emails OWNER TO postgres;

--
-- Name: permitted_domain_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permitted_domain_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permitted_domain_emails_id_seq OWNER TO postgres;

--
-- Name: permitted_domain_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permitted_domain_emails_id_seq OWNED BY public.permitted_domain_emails.id;


--
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    background_color character varying,
    short_description text
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_id_seq OWNER TO postgres;

--
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_id_seq OWNED BY public.personas.id;


--
-- Name: plan_group_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan_group_features (
    id integer NOT NULL,
    plan_group_id integer,
    feature_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.plan_group_features OWNER TO postgres;

--
-- Name: plan_group_features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_group_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_group_features_id_seq OWNER TO postgres;

--
-- Name: plan_group_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plan_group_features_id_seq OWNED BY public.plan_group_features.id;


--
-- Name: plan_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan_groups (
    id integer NOT NULL,
    name character varying,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.plan_groups OWNER TO postgres;

--
-- Name: plan_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_groups_id_seq OWNER TO postgres;

--
-- Name: plan_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plan_groups_id_seq OWNED BY public.plan_groups.id;


--
-- Name: plan_installments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plan_installments (
    id integer NOT NULL,
    plan_id integer NOT NULL,
    installment_id integer NOT NULL,
    pagarme_plan_id integer,
    paid_in integer NOT NULL,
    description character varying
);


ALTER TABLE public.plan_installments OWNER TO postgres;

--
-- Name: plan_installments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plan_installments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plan_installments_id_seq OWNER TO postgres;

--
-- Name: plan_installments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plan_installments_id_seq OWNED BY public.plan_installments.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    name character varying,
    key character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.plans OWNER TO postgres;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_id_seq OWNER TO postgres;

--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- Name: pre_subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pre_subscriptions (
    id bigint NOT NULL,
    profile_id character varying,
    company_id bigint,
    user_id bigint,
    opportunity_id bigint,
    subscriber public.hstore,
    details json
);


ALTER TABLE public.pre_subscriptions OWNER TO postgres;

--
-- Name: pre_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pre_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pre_subscriptions_id_seq OWNER TO postgres;

--
-- Name: pre_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pre_subscriptions_id_seq OWNED BY public.pre_subscriptions.id;


--
-- Name: predispositions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.predispositions (
    id integer NOT NULL,
    name character varying,
    description text,
    persona_id integer,
    icon character varying
);


ALTER TABLE public.predispositions OWNER TO postgres;

--
-- Name: predispositions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.predispositions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.predispositions_id_seq OWNER TO postgres;

--
-- Name: predispositions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.predispositions_id_seq OWNED BY public.predispositions.id;


--
-- Name: presential_event_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presential_event_addresses (
    id integer NOT NULL,
    presential_event_id integer,
    date_begin date,
    date_end date,
    time_begin time without time zone,
    time_end time without time zone,
    location character varying,
    description character varying,
    max_candidates integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by integer
);


ALTER TABLE public.presential_event_addresses OWNER TO postgres;

--
-- Name: presential_event_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presential_event_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presential_event_addresses_id_seq OWNER TO postgres;

--
-- Name: presential_event_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presential_event_addresses_id_seq OWNED BY public.presential_event_addresses.id;


--
-- Name: presential_event_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presential_event_notifications (
    id integer NOT NULL,
    presential_event_id integer,
    type_of_notification character varying,
    "time" integer,
    "interval" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.presential_event_notifications OWNER TO postgres;

--
-- Name: presential_event_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presential_event_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presential_event_notifications_id_seq OWNER TO postgres;

--
-- Name: presential_event_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presential_event_notifications_id_seq OWNED BY public.presential_event_notifications.id;


--
-- Name: presential_event_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presential_event_rooms (
    id integer NOT NULL,
    presential_event_id integer,
    is_accessible character varying,
    name character varying,
    description character varying,
    total_candidates integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    presential_event_address_id integer,
    deleted_at timestamp without time zone,
    deleted_by integer
);


ALTER TABLE public.presential_event_rooms OWNER TO postgres;

--
-- Name: presential_event_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presential_event_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presential_event_rooms_id_seq OWNER TO postgres;

--
-- Name: presential_event_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presential_event_rooms_id_seq OWNED BY public.presential_event_rooms.id;


--
-- Name: presential_event_schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presential_event_schedules (
    id integer NOT NULL,
    presential_event_id integer,
    presential_event_room_id integer,
    schedule time without time zone,
    total_candidates integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by integer
);


ALTER TABLE public.presential_event_schedules OWNER TO postgres;

--
-- Name: presential_event_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presential_event_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presential_event_schedules_id_seq OWNER TO postgres;

--
-- Name: presential_event_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presential_event_schedules_id_seq OWNED BY public.presential_event_schedules.id;


--
-- Name: presential_event_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presential_event_users (
    id integer NOT NULL,
    presential_event_id integer,
    presential_event_room_id integer,
    presential_event_schedule_id integer,
    user_id integer,
    opportunity_id integer,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    presential_event_address_id integer,
    chosen_date date,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.presential_event_users OWNER TO postgres;

--
-- Name: presential_event_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presential_event_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presential_event_users_id_seq OWNER TO postgres;

--
-- Name: presential_event_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presential_event_users_id_seq OWNED BY public.presential_event_users.id;


--
-- Name: presential_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presential_events (
    id integer NOT NULL,
    title character varying,
    location character varying,
    description character varying,
    date date,
    initial_time time without time zone,
    final_time time without time zone,
    status character varying,
    company_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    deleted_by integer
);


ALTER TABLE public.presential_events OWNER TO postgres;

--
-- Name: presential_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presential_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presential_events_id_seq OWNER TO postgres;

--
-- Name: presential_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presential_events_id_seq OWNED BY public.presential_events.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    company_id integer,
    plan_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    price double precision,
    expires_at date,
    package_id integer,
    new_order_id integer,
    recurrence boolean,
    canceled_recurrence boolean,
    opportunities_limit integer DEFAULT 0,
    users_limit integer DEFAULT 0
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: profile_questions_to_updates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile_questions_to_updates (
    id bigint NOT NULL,
    company_id bigint,
    user_id bigint,
    opportunity_id integer,
    filled_date timestamp without time zone,
    status character varying,
    recruiter_id integer,
    details public.hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    limit_date date
);


ALTER TABLE public.profile_questions_to_updates OWNER TO postgres;

--
-- Name: profile_questions_to_updates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_questions_to_updates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_questions_to_updates_id_seq OWNER TO postgres;

--
-- Name: profile_questions_to_updates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_questions_to_updates_id_seq OWNED BY public.profile_questions_to_updates.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profiles (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    gender character varying(1),
    birthday date,
    phone character varying(255),
    mobile_phone character varying(255),
    nationality character varying(255),
    cpf character varying(255),
    skype character varying(255),
    deleted_at timestamp without time zone
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programs (
    id integer NOT NULL,
    title character varying(255),
    description text,
    company_id integer,
    other_benefit text,
    opportunity_level_id integer,
    visit_id integer,
    subscription_message text,
    external_url character varying(255),
    external_email character varying(255),
    managed boolean,
    status integer,
    duration integer,
    subscription_start_date date,
    subscription_end_date date,
    expired_at date,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    requirement_observation text,
    journey_observation text,
    show_location boolean DEFAULT true,
    subscriptions_count integer DEFAULT 0,
    subscription_email_message text,
    enable_messages boolean DEFAULT true
);


ALTER TABLE public.programs OWNER TO postgres;

--
-- Name: programs_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programs_categories (
    id integer NOT NULL,
    program_id integer,
    category_id integer
);


ALTER TABLE public.programs_categories OWNER TO postgres;

--
-- Name: programs_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programs_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programs_categories_id_seq OWNER TO postgres;

--
-- Name: programs_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programs_categories_id_seq OWNED BY public.programs_categories.id;


--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programs_id_seq OWNER TO postgres;

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    title text,
    html_type character varying,
    options text,
    slug character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    group_question_id bigint,
    hided_at timestamp without time zone,
    hided_user_id integer,
    in_subscription boolean DEFAULT false,
    candidate boolean DEFAULT false,
    hided boolean DEFAULT false,
    required boolean DEFAULT false,
    hint text,
    duplicated_from character varying,
    eliminatory_question boolean,
    eliminatory_aswers text,
    eliminatory_template text
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendations (
    id integer NOT NULL,
    user_id integer NOT NULL,
    user_name character varying NOT NULL,
    opportunity_id integer NOT NULL,
    opportunity_title character varying NOT NULL,
    opportunity_locale character varying NOT NULL,
    opportunity_responsabilities character varying NOT NULL,
    opportunity_expired_at timestamp without time zone NOT NULL,
    opportunity_link character varying NOT NULL,
    date_sent timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_email character varying
);


ALTER TABLE public.recommendations OWNER TO postgres;

--
-- Name: recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recommendations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recommendations_id_seq OWNER TO postgres;

--
-- Name: recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recommendations_id_seq OWNED BY public.recommendations.id;


--
-- Name: redactor_assets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redactor_assets (
    id integer NOT NULL,
    user_id integer,
    data_file_name character varying NOT NULL,
    data_content_type character varying,
    data_file_size integer,
    assetable_id integer,
    assetable_type character varying(30),
    type character varying(30),
    width integer,
    height integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.redactor_assets OWNER TO postgres;

--
-- Name: redactor_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.redactor_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.redactor_assets_id_seq OWNER TO postgres;

--
-- Name: redactor_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.redactor_assets_id_seq OWNED BY public.redactor_assets.id;


--
-- Name: requirement_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requirement_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.requirement_types OWNER TO postgres;

--
-- Name: requirement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requirement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requirement_types_id_seq OWNER TO postgres;

--
-- Name: requirement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requirement_types_id_seq OWNED BY public.requirement_types.id;


--
-- Name: requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requirements (
    id integer NOT NULL,
    program_id integer,
    requirement_type_id integer,
    subject character varying(255),
    eligibility text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.requirements OWNER TO postgres;

--
-- Name: requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requirements_id_seq OWNER TO postgres;

--
-- Name: requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requirements_id_seq OWNED BY public.requirements.id;


--
-- Name: requisition_area_approvers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requisition_area_approvers (
    id integer NOT NULL,
    requisition_area_id integer NOT NULL,
    user_id integer NOT NULL,
    priority integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.requisition_area_approvers OWNER TO postgres;

--
-- Name: requisition_area_approvers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requisition_area_approvers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requisition_area_approvers_id_seq OWNER TO postgres;

--
-- Name: requisition_area_approvers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requisition_area_approvers_id_seq OWNED BY public.requisition_area_approvers.id;


--
-- Name: requisition_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requisition_areas (
    id integer NOT NULL,
    name character varying NOT NULL,
    company_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.requisition_areas OWNER TO postgres;

--
-- Name: requisition_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requisition_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requisition_areas_id_seq OWNER TO postgres;

--
-- Name: requisition_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requisition_areas_id_seq OWNED BY public.requisition_areas.id;


--
-- Name: requisition_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requisition_fields (
    id bigint NOT NULL,
    requisition_id bigint,
    user_id bigint NOT NULL,
    company_id bigint NOT NULL,
    field_label character varying NOT NULL,
    name character varying NOT NULL,
    description text,
    field_type character varying NOT NULL,
    field_options text,
    field_validation character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    value text,
    deleted_at timestamp without time zone,
    user_deleted_id integer,
    field_order integer,
    viewed_in_workflow boolean,
    viewed boolean DEFAULT true,
    opportunity_field character varying,
    is_filter boolean DEFAULT false
);


ALTER TABLE public.requisition_fields OWNER TO postgres;

--
-- Name: requisition_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requisition_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requisition_fields_id_seq OWNER TO postgres;

--
-- Name: requisition_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requisition_fields_id_seq OWNED BY public.requisition_fields.id;


--
-- Name: requisition_workflows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requisition_workflows (
    id integer NOT NULL,
    requisition_id integer NOT NULL,
    user_id integer NOT NULL,
    status character varying NOT NULL,
    priority integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    action_date timestamp without time zone,
    justification character varying
);


ALTER TABLE public.requisition_workflows OWNER TO postgres;

--
-- Name: requisition_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requisition_workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requisition_workflows_id_seq OWNER TO postgres;

--
-- Name: requisition_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requisition_workflows_id_seq OWNED BY public.requisition_workflows.id;


--
-- Name: requisitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requisitions (
    id integer NOT NULL,
    company_id integer NOT NULL,
    opportunity_id integer,
    user_id integer,
    requisition_area_id integer,
    status character varying NOT NULL,
    justification character varying,
    remuneration integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying,
    opportunity_title character varying,
    street character varying,
    number character varying,
    zipcode character varying,
    complement character varying,
    neighborhood character varying,
    state character varying,
    city character varying,
    expiration_date timestamp without time zone,
    responsable_email character varying,
    pcd boolean,
    publish_opportunity boolean DEFAULT false,
    address_id integer,
    company_integration_fields public.hstore,
    deleted_by bigint,
    deleted_at timestamp without time zone,
    acting_mode character varying DEFAULT 'presential'::character varying
);


ALTER TABLE public.requisitions OWNER TO postgres;

--
-- Name: requisitions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requisitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requisitions_id_seq OWNER TO postgres;

--
-- Name: requisitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requisitions_id_seq OWNED BY public.requisitions.id;


--
-- Name: revenues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revenues (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.revenues OWNER TO postgres;

--
-- Name: revenues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.revenues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.revenues_id_seq OWNER TO postgres;

--
-- Name: revenues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.revenues_id_seq OWNED BY public.revenues.id;


--
-- Name: satisfaction_survey_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.satisfaction_survey_answers (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    satisfaction_survey_id bigint NOT NULL,
    answer json
);


ALTER TABLE public.satisfaction_survey_answers OWNER TO postgres;

--
-- Name: satisfaction_survey_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.satisfaction_survey_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satisfaction_survey_answers_id_seq OWNER TO postgres;

--
-- Name: satisfaction_survey_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.satisfaction_survey_answers_id_seq OWNED BY public.satisfaction_survey_answers.id;


--
-- Name: satisfaction_surveys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.satisfaction_surveys (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    controller character varying,
    action character varying,
    title character varying,
    subtitle character varying,
    options_type character varying,
    options json,
    buttons json,
    single_access integer DEFAULT 0,
    active boolean DEFAULT true,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    deleted_at timestamp without time zone,
    type_survey character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.satisfaction_surveys OWNER TO postgres;

--
-- Name: satisfaction_surveys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.satisfaction_surveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satisfaction_surveys_id_seq OWNER TO postgres;

--
-- Name: satisfaction_surveys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.satisfaction_surveys_id_seq OWNED BY public.satisfaction_surveys.id;


--
-- Name: saved_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saved_requirements (
    id integer NOT NULL,
    user_id integer,
    company_id integer,
    opportunity_id integer,
    step_id character varying,
    requirements public.hstore,
    name character varying,
    subscription_requirement boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    eligibility_requirements boolean DEFAULT false
);


ALTER TABLE public.saved_requirements OWNER TO postgres;

--
-- Name: saved_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.saved_requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_requirements_id_seq OWNER TO postgres;

--
-- Name: saved_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.saved_requirements_id_seq OWNED BY public.saved_requirements.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sectors (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    companies_count integer DEFAULT 0
);


ALTER TABLE public.sectors OWNER TO postgres;

--
-- Name: sectors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sectors_id_seq OWNER TO postgres;

--
-- Name: sectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sectors_id_seq OWNED BY public.sectors.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    session_id character varying NOT NULL,
    data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status boolean DEFAULT false,
    slug character varying
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skills_id_seq OWNER TO postgres;

--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;


--
-- Name: source_tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source_tests (
    id integer NOT NULL,
    name character varying NOT NULL,
    code character varying NOT NULL,
    source character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_id integer,
    estimated_time integer,
    details public.hstore,
    max_value integer,
    hidden boolean DEFAULT false,
    hide_to_candidate boolean DEFAULT false
);


ALTER TABLE public.source_tests OWNER TO postgres;

--
-- Name: source_tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.source_tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_tests_id_seq OWNER TO postgres;

--
-- Name: source_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.source_tests_id_seq OWNED BY public.source_tests.id;


--
-- Name: stages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stages (
    id integer NOT NULL,
    name character varying(255),
    description text,
    period text,
    program_id integer,
    "position" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.stages OWNER TO postgres;

--
-- Name: stages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stages_id_seq OWNER TO postgres;

--
-- Name: stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stages_id_seq OWNED BY public.stages.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id integer NOT NULL,
    name character varying(255),
    abbr character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_first boolean
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statistics (
    id integer NOT NULL,
    model character varying,
    slug character varying,
    description character varying,
    value integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.statistics OWNER TO postgres;

--
-- Name: statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statistics_id_seq OWNER TO postgres;

--
-- Name: statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statistics_id_seq OWNED BY public.statistics.id;


--
-- Name: steps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.steps (
    id integer NOT NULL,
    name character varying(255),
    description text,
    start_date date,
    end_date date,
    program_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.steps OWNER TO postgres;

--
-- Name: steps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steps_id_seq OWNER TO postgres;

--
-- Name: steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.steps_id_seq OWNED BY public.steps.id;


--
-- Name: subscription_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_questions (
    id integer NOT NULL,
    subscriptive_id integer,
    subscriptive_type character varying(255),
    title text,
    hint text,
    html_type character varying(255),
    options text,
    "order" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    required boolean DEFAULT false,
    company_id integer,
    company_default boolean DEFAULT false,
    disabled boolean DEFAULT false,
    opportunity_type character varying,
    candidate boolean DEFAULT false,
    slug character varying,
    identifier character varying,
    in_subscription boolean DEFAULT true,
    origin character varying,
    origin_id character varying,
    eliminatory_question boolean,
    eliminatory_aswers text,
    eliminatory_template text
);


ALTER TABLE public.subscription_questions OWNER TO postgres;

--
-- Name: subscription_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscription_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_questions_id_seq OWNER TO postgres;

--
-- Name: subscription_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscription_questions_id_seq OWNED BY public.subscription_questions.id;


--
-- Name: subscription_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_sources (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    slug character varying NOT NULL,
    picture character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.subscription_sources OWNER TO postgres;

--
-- Name: subscription_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscription_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_sources_id_seq OWNER TO postgres;

--
-- Name: subscription_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscription_sources_id_seq OWNED BY public.subscription_sources.id;


--
-- Name: suggestions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suggestions (
    id integer NOT NULL,
    title character varying(255),
    category_id integer,
    published boolean DEFAULT true,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.suggestions OWNER TO postgres;

--
-- Name: suggestions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suggestions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suggestions_id_seq OWNER TO postgres;

--
-- Name: suggestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suggestions_id_seq OWNED BY public.suggestions.id;


--
-- Name: template_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.template_messages (
    id integer NOT NULL,
    company_id integer,
    subject character varying,
    message character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    feedback_default boolean DEFAULT false,
    deleted_at timestamp without time zone,
    deleted_user_id integer,
    group_template_id bigint,
    duplicated_from integer,
    cover_template bytea
);


ALTER TABLE public.template_messages OWNER TO postgres;

--
-- Name: template_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.template_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_messages_id_seq OWNER TO postgres;

--
-- Name: template_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.template_messages_id_seq OWNED BY public.template_messages.id;


--
-- Name: terms_of_use_by_ninenine_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terms_of_use_by_ninenine_jobs (
    id bigint NOT NULL,
    user_id bigint,
    version character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.terms_of_use_by_ninenine_jobs OWNER TO postgres;

--
-- Name: terms_of_use_by_ninenine_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terms_of_use_by_ninenine_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terms_of_use_by_ninenine_jobs_id_seq OWNER TO postgres;

--
-- Name: terms_of_use_by_ninenine_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terms_of_use_by_ninenine_jobs_id_seq OWNED BY public.terms_of_use_by_ninenine_jobs.id;


--
-- Name: terms_of_use_by_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terms_of_use_by_sources (
    id bigint NOT NULL,
    company_id bigint,
    user_id bigint,
    source character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.terms_of_use_by_sources OWNER TO postgres;

--
-- Name: terms_of_use_by_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terms_of_use_by_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terms_of_use_by_sources_id_seq OWNER TO postgres;

--
-- Name: terms_of_use_by_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terms_of_use_by_sources_id_seq OWNED BY public.terms_of_use_by_sources.id;


--
-- Name: test_token_apis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test_token_apis (
    id integer NOT NULL,
    partner character varying NOT NULL,
    token character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.test_token_apis OWNER TO postgres;

--
-- Name: test_token_apis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_token_apis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_token_apis_id_seq OWNER TO postgres;

--
-- Name: test_token_apis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_token_apis_id_seq OWNED BY public.test_token_apis.id;


--
-- Name: tracking_pixels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracking_pixels (
    id integer NOT NULL,
    options public.hstore,
    url character varying(255),
    provider_id integer
);


ALTER TABLE public.tracking_pixels OWNER TO postgres;

--
-- Name: tracking_pixels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracking_pixels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_pixels_id_seq OWNER TO postgres;

--
-- Name: tracking_pixels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracking_pixels_id_seq OWNED BY public.tracking_pixels.id;


--
-- Name: tracking_providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracking_providers (
    id integer NOT NULL,
    name character varying(255),
    template text
);


ALTER TABLE public.tracking_providers OWNER TO postgres;

--
-- Name: tracking_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracking_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracking_providers_id_seq OWNER TO postgres;

--
-- Name: tracking_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracking_providers_id_seq OWNED BY public.tracking_providers.id;


--
-- Name: trend_attitudes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trend_attitudes (
    id integer NOT NULL,
    name character varying,
    description text,
    main_persona_id integer,
    support_persona_id integer
);


ALTER TABLE public.trend_attitudes OWNER TO postgres;

--
-- Name: trend_attitudes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trend_attitudes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trend_attitudes_id_seq OWNER TO postgres;

--
-- Name: trend_attitudes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trend_attitudes_id_seq OWNED BY public.trend_attitudes.id;


--
-- Name: trigger_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trigger_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    icon character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.trigger_types OWNER TO postgres;

--
-- Name: trigger_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trigger_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trigger_types_id_seq OWNER TO postgres;

--
-- Name: trigger_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trigger_types_id_seq OWNED BY public.trigger_types.id;


--
-- Name: triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.triggers (
    id integer NOT NULL,
    opportunity_id integer,
    trigger_type_id integer,
    destiny character varying,
    origin character varying,
    origin_param character varying,
    condition character varying,
    condition_param character varying,
    service_class character varying,
    company_id integer,
    company_default boolean DEFAULT false,
    opportunity_type character varying,
    disabled boolean DEFAULT false,
    fields public.hstore,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    total_reactivations integer,
    last_reactivation_at timestamp without time zone
);


ALTER TABLE public.triggers OWNER TO postgres;

--
-- Name: triggers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.triggers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.triggers_id_seq OWNER TO postgres;

--
-- Name: triggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.triggers_id_seq OWNED BY public.triggers.id;


--
-- Name: user_accesses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_accesses (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    company_id bigint NOT NULL,
    controller character varying,
    action character varying,
    access_count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_accesses OWNER TO postgres;

--
-- Name: user_accesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_accesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_accesses_id_seq OWNER TO postgres;

--
-- Name: user_accesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_accesses_id_seq OWNED BY public.user_accesses.id;


--
-- Name: user_group_question_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group_question_permissions (
    id bigint NOT NULL,
    user_id bigint,
    group_question_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_group_question_permissions OWNER TO postgres;

--
-- Name: user_group_question_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_group_question_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_group_question_permissions_id_seq OWNER TO postgres;

--
-- Name: user_group_question_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_group_question_permissions_id_seq OWNED BY public.user_group_question_permissions.id;


--
-- Name: user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    opportunity_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_permissions OWNER TO postgres;

--
-- Name: user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_permissions_id_seq OWNER TO postgres;

--
-- Name: user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_permissions_id_seq OWNED BY public.user_permissions.id;


--
-- Name: user_presential_event_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_presential_event_permissions (
    id bigint NOT NULL,
    user_id bigint,
    presential_event_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_presential_event_permissions OWNER TO postgres;

--
-- Name: user_presential_event_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_presential_event_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_presential_event_permissions_id_seq OWNER TO postgres;

--
-- Name: user_presential_event_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_presential_event_permissions_id_seq OWNED BY public.user_presential_event_permissions.id;


--
-- Name: user_question_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_question_permissions (
    id bigint NOT NULL,
    user_id bigint,
    question_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_question_permissions OWNER TO postgres;

--
-- Name: user_question_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_question_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_question_permissions_id_seq OWNER TO postgres;

--
-- Name: user_question_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_question_permissions_id_seq OWNED BY public.user_question_permissions.id;


--
-- Name: user_requisition_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_requisition_permissions (
    id bigint NOT NULL,
    user_id bigint,
    requisition_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_requisition_permissions OWNER TO postgres;

--
-- Name: user_requisition_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_requisition_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_requisition_permissions_id_seq OWNER TO postgres;

--
-- Name: user_requisition_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_requisition_permissions_id_seq OWNED BY public.user_requisition_permissions.id;


--
-- Name: user_template_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_template_permissions (
    id bigint NOT NULL,
    user_id bigint,
    template_message_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.user_template_permissions OWNER TO postgres;

--
-- Name: user_template_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_template_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_template_permissions_id_seq OWNER TO postgres;

--
-- Name: user_template_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_template_permissions_id_seq OWNED BY public.user_template_permissions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    provider character varying(255),
    uid character varying(255),
    name character varying(255),
    graph text,
    old_avatar_url character varying(255),
    token character varying(255),
    enterprise boolean,
    api_token character varying(255),
    deleted_at timestamp without time zone,
    oauth_expires_at timestamp without time zone,
    level integer DEFAULT 0,
    requesting_money boolean DEFAULT false,
    role character varying(255),
    expire_api_token_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    company_integration_fields public.hstore,
    pre_registration boolean DEFAULT false,
    origin_company integer,
    document character varying,
    foreigner boolean DEFAULT false,
    new_cv boolean DEFAULT false,
    deleted_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    user_ats boolean DEFAULT false,
    token_change_email character varying,
    token_change_email_valid_at timestamp without time zone,
    preferences public.hstore,
    superuser boolean,
    session_active boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.videos (
    id integer NOT NULL,
    url character varying,
    company_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.videos OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO postgres;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visits (
    id integer NOT NULL,
    visit_token character varying(255),
    visitor_token character varying(255),
    ip character varying(255),
    user_agent text,
    referrer text,
    landing_page text,
    user_id integer,
    user_type character varying(255),
    referring_domain character varying(255),
    search_keyword character varying(255),
    browser character varying(255),
    os character varying(255),
    device_type character varying(255),
    country character varying(255),
    region character varying(255),
    city character varying(255),
    utm_source character varying(255),
    utm_medium character varying(255),
    utm_term character varying(255),
    utm_content character varying(255),
    utm_campaign character varying(255),
    created_at timestamp without time zone
);


ALTER TABLE public.visits OWNER TO postgres;

--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visits_id_seq OWNER TO postgres;

--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visits_id_seq OWNED BY public.visits.id;


--
-- Name: work_environments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_environments (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.work_environments OWNER TO postgres;

--
-- Name: work_environments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.work_environments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_environments_id_seq OWNER TO postgres;

--
-- Name: work_environments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.work_environments_id_seq OWNED BY public.work_environments.id;


--
-- Name: work_value_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work_value_details (
    id integer NOT NULL,
    broad_value_id integer,
    persona_id integer,
    question character varying,
    left_answer character varying,
    right_answer character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    required boolean DEFAULT false
);


ALTER TABLE public.work_value_details OWNER TO postgres;

--
-- Name: work_value_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.work_value_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_value_details_id_seq OWNER TO postgres;

--
-- Name: work_value_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.work_value_details_id_seq OWNED BY public.work_value_details.id;


--
-- Name: abandonments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abandonments ALTER COLUMN id SET DEFAULT nextval('public.abandonments_id_seq'::regclass);


--
-- Name: abilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities ALTER COLUMN id SET DEFAULT nextval('public.abilities_id_seq'::regclass);


--
-- Name: accept_terms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accept_terms ALTER COLUMN id SET DEFAULT nextval('public.accept_terms_id_seq'::regclass);


--
-- Name: action_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_logs ALTER COLUMN id SET DEFAULT nextval('public.action_logs_id_seq'::regclass);


--
-- Name: actions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions ALTER COLUMN id SET DEFAULT nextval('public.actions_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: awards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards ALTER COLUMN id SET DEFAULT nextval('public.awards_id_seq'::regclass);


--
-- Name: beliefs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beliefs ALTER COLUMN id SET DEFAULT nextval('public.beliefs_id_seq'::regclass);


--
-- Name: benefits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefits ALTER COLUMN id SET DEFAULT nextval('public.benefits_id_seq'::regclass);


--
-- Name: benefits_programs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefits_programs ALTER COLUMN id SET DEFAULT nextval('public.benefits_programs_id_seq'::regclass);


--
-- Name: broad_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broad_values ALTER COLUMN id SET DEFAULT nextval('public.broad_values_id_seq'::regclass);


--
-- Name: businesses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businesses ALTER COLUMN id SET DEFAULT nextval('public.businesses_id_seq'::regclass);


--
-- Name: campus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus ALTER COLUMN id SET DEFAULT nextval('public.campus_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: characteristics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characteristics ALTER COLUMN id SET DEFAULT nextval('public.characteristics_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: collection_opportunities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_opportunities ALTER COLUMN id SET DEFAULT nextval('public.collection_opportunities_id_seq'::regclass);


--
-- Name: collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections ALTER COLUMN id SET DEFAULT nextval('public.collections_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: company_action_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_action_tags ALTER COLUMN id SET DEFAULT nextval('public.company_action_tags_id_seq'::regclass);


--
-- Name: company_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_addresses ALTER COLUMN id SET DEFAULT nextval('public.company_addresses_id_seq'::regclass);


--
-- Name: company_api_integrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_api_integrations ALTER COLUMN id SET DEFAULT nextval('public.company_api_integrations_id_seq'::regclass);


--
-- Name: company_collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_collections ALTER COLUMN id SET DEFAULT nextval('public.company_collections_id_seq'::regclass);


--
-- Name: company_integration_field_columns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_integration_field_columns ALTER COLUMN id SET DEFAULT nextval('public.company_integration_field_columns_id_seq'::regclass);


--
-- Name: company_integration_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_integration_fields ALTER COLUMN id SET DEFAULT nextval('public.company_integration_fields_id_seq'::regclass);


--
-- Name: company_integration_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_integration_statuses ALTER COLUMN id SET DEFAULT nextval('public.company_integration_statuses_id_seq'::regclass);


--
-- Name: company_internal_recruitment_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_internal_recruitment_fields ALTER COLUMN id SET DEFAULT nextval('public.company_internal_recruitment_fields_id_seq'::regclass);


--
-- Name: company_internal_recruitments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_internal_recruitments ALTER COLUMN id SET DEFAULT nextval('public.company_internal_recruitments_id_seq'::regclass);


--
-- Name: company_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_locations ALTER COLUMN id SET DEFAULT nextval('public.company_locations_id_seq'::regclass);


--
-- Name: company_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_messages ALTER COLUMN id SET DEFAULT nextval('public.company_messages_id_seq'::regclass);


--
-- Name: company_messages_configurations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_messages_configurations ALTER COLUMN id SET DEFAULT nextval('public.company_messages_configurations_id_seq'::regclass);


--
-- Name: company_notification_configurations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_notification_configurations ALTER COLUMN id SET DEFAULT nextval('public.company_notification_configurations_id_seq'::regclass);


--
-- Name: company_opportunity_areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_opportunity_areas ALTER COLUMN id SET DEFAULT nextval('public.company_opportunity_areas_id_seq'::regclass);


--
-- Name: company_opportunity_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_opportunity_groups ALTER COLUMN id SET DEFAULT nextval('public.company_opportunity_groups_id_seq'::regclass);


--
-- Name: company_proportions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_proportions ALTER COLUMN id SET DEFAULT nextval('public.company_proportions_id_seq'::regclass);


--
-- Name: company_sizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_sizes ALTER COLUMN id SET DEFAULT nextval('public.company_sizes_id_seq'::regclass);


--
-- Name: company_token_apis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_token_apis ALTER COLUMN id SET DEFAULT nextval('public.company_token_apis_id_seq'::regclass);


--
-- Name: company_work_value_answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_work_value_answers ALTER COLUMN id SET DEFAULT nextval('public.company_work_value_answers_id_seq'::regclass);


--
-- Name: company_work_value_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_work_value_details ALTER COLUMN id SET DEFAULT nextval('public.company_work_value_details_id_seq'::regclass);


--
-- Name: company_work_value_points id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_work_value_points ALTER COLUMN id SET DEFAULT nextval('public.company_work_value_points_id_seq'::regclass);


--
-- Name: compatible_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compatible_relations ALTER COLUMN id SET DEFAULT nextval('public.compatible_relations_id_seq'::regclass);


--
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delayed_jobs ALTER COLUMN id SET DEFAULT nextval('public.delayed_jobs_id_seq'::regclass);


--
-- Name: descriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.descriptions ALTER COLUMN id SET DEFAULT nextval('public.descriptions_id_seq'::regclass);


--
-- Name: details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details ALTER COLUMN id SET DEFAULT nextval('public.details_id_seq'::regclass);


--
-- Name: disabilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disabilities ALTER COLUMN id SET DEFAULT nextval('public.disabilities_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: domain_api_configurations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain_api_configurations ALTER COLUMN id SET DEFAULT nextval('public.domain_api_configurations_id_seq'::regclass);


--
-- Name: dream_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dream_jobs ALTER COLUMN id SET DEFAULT nextval('public.dream_jobs_id_seq'::regclass);


--
-- Name: ecosystems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecosystems ALTER COLUMN id SET DEFAULT nextval('public.ecosystems_id_seq'::regclass);


--
-- Name: evaluations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluations ALTER COLUMN id SET DEFAULT nextval('public.evaluations_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: extra_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extra_jobs ALTER COLUMN id SET DEFAULT nextval('public.extra_jobs_id_seq'::regclass);


--
-- Name: feature_action_user_vieweds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_action_user_vieweds ALTER COLUMN id SET DEFAULT nextval('public.feature_action_user_vieweds_id_seq'::regclass);


--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.features ALTER COLUMN id SET DEFAULT nextval('public.features_id_seq'::regclass);


--
-- Name: file_integration_emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_integration_emails ALTER COLUMN id SET DEFAULT nextval('public.file_integration_emails_id_seq'::regclass);


--
-- Name: filters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filters ALTER COLUMN id SET DEFAULT nextval('public.filters_id_seq'::regclass);


--
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- Name: geolocations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geolocations ALTER COLUMN id SET DEFAULT nextval('public.geolocations_id_seq'::regclass);


--
-- Name: global_profile_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_profile_statuses ALTER COLUMN id SET DEFAULT nextval('public.global_profile_statuses_id_seq'::regclass);


--
-- Name: group_collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_collections ALTER COLUMN id SET DEFAULT nextval('public.group_collections_id_seq'::regclass);


--
-- Name: group_filters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_filters ALTER COLUMN id SET DEFAULT nextval('public.group_filters_id_seq'::regclass);


--
-- Name: group_group_question_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_group_question_permissions ALTER COLUMN id SET DEFAULT nextval('public.group_group_question_permissions_id_seq'::regclass);


--
-- Name: group_integrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_integrations ALTER COLUMN id SET DEFAULT nextval('public.group_integrations_id_seq'::regclass);


--
-- Name: group_opportunities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_opportunities ALTER COLUMN id SET DEFAULT nextval('public.group_opportunities_id_seq'::regclass);


--
-- Name: group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_permissions ALTER COLUMN id SET DEFAULT nextval('public.group_permissions_id_seq'::regclass);


--
-- Name: group_presential_event_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_presential_event_permissions ALTER COLUMN id SET DEFAULT nextval('public.group_presential_event_permissions_id_seq'::regclass);


--
-- Name: group_question_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_question_permissions ALTER COLUMN id SET DEFAULT nextval('public.group_question_permissions_id_seq'::regclass);


--
-- Name: group_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_questions ALTER COLUMN id SET DEFAULT nextval('public.group_questions_id_seq'::regclass);


--
-- Name: group_requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_requirements ALTER COLUMN id SET DEFAULT nextval('public.group_requirements_id_seq'::regclass);


--
-- Name: group_requisition_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_requisition_permissions ALTER COLUMN id SET DEFAULT nextval('public.group_requisition_permissions_id_seq'::regclass);


--
-- Name: group_template_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_template_permissions ALTER COLUMN id SET DEFAULT nextval('public.group_template_permissions_id_seq'::regclass);


--
-- Name: group_templates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_templates ALTER COLUMN id SET DEFAULT nextval('public.group_templates_id_seq'::regclass);


--
-- Name: group_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_users ALTER COLUMN id SET DEFAULT nextval('public.group_users_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: header_tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_tests ALTER COLUMN id SET DEFAULT nextval('public.header_tests_id_seq'::regclass);


--
-- Name: health_checks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.health_checks ALTER COLUMN id SET DEFAULT nextval('public.health_checks_id_seq'::regclass);


--
-- Name: highlights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highlights ALTER COLUMN id SET DEFAULT nextval('public.highlights_id_seq'::regclass);


--
-- Name: identities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities ALTER COLUMN id SET DEFAULT nextval('public.identities_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: incompleted_subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incompleted_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.incompleted_subscriptions_id_seq'::regclass);


--
-- Name: indication_domains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indication_domains ALTER COLUMN id SET DEFAULT nextval('public.indication_domains_id_seq'::regclass);


--
-- Name: installments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.installments ALTER COLUMN id SET DEFAULT nextval('public.installments_id_seq'::regclass);


--
-- Name: institutions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions ALTER COLUMN id SET DEFAULT nextval('public.institutions_id_seq'::regclass);


--
-- Name: interviewer_candidates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interviewer_candidates ALTER COLUMN id SET DEFAULT nextval('public.interviewer_candidates_id_seq'::regclass);


--
-- Name: interviewers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interviewers ALTER COLUMN id SET DEFAULT nextval('public.interviewers_id_seq'::regclass);


--
-- Name: job_boards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_boards ALTER COLUMN id SET DEFAULT nextval('public.job_boards_id_seq'::regclass);


--
-- Name: job_boards_opportunities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_boards_opportunities ALTER COLUMN id SET DEFAULT nextval('public.job_boards_opportunities_id_seq'::regclass);


--
-- Name: job_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_categories ALTER COLUMN id SET DEFAULT nextval('public.job_categories_id_seq'::regclass);


--
-- Name: job_feedback_opportunities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_feedback_opportunities ALTER COLUMN id SET DEFAULT nextval('public.job_feedback_opportunities_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- Name: log_integration_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_integration_files ALTER COLUMN id SET DEFAULT nextval('public.log_integration_files_id_seq'::regclass);


--
-- Name: log_opportunity_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_opportunity_statuses ALTER COLUMN id SET DEFAULT nextval('public.log_opportunity_statuses_id_seq'::regclass);


--
-- Name: log_update_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_update_profiles ALTER COLUMN id SET DEFAULT nextval('public.log_update_profiles_id_seq'::regclass);


--
-- Name: managers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers ALTER COLUMN id SET DEFAULT nextval('public.managers_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: mentions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentions ALTER COLUMN id SET DEFAULT nextval('public.mentions_id_seq'::regclass);


--
-- Name: message_contents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_contents ALTER COLUMN id SET DEFAULT nextval('public.message_contents_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: new_order_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_order_details ALTER COLUMN id SET DEFAULT nextval('public.new_order_details_id_seq'::regclass);


--
-- Name: new_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_orders ALTER COLUMN id SET DEFAULT nextval('public.new_orders_id_seq'::regclass);


--
-- Name: opportunities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunities ALTER COLUMN id SET DEFAULT nextval('public.opportunities_id_seq'::regclass);


--
-- Name: opportunity_action_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_action_tags ALTER COLUMN id SET DEFAULT nextval('public.opportunity_action_tags_id_seq'::regclass);


--
-- Name: opportunity_areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_areas ALTER COLUMN id SET DEFAULT nextval('public.opportunity_areas_id_seq'::regclass);


--
-- Name: opportunity_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_categories ALTER COLUMN id SET DEFAULT nextval('public.opportunity_categories_id_seq'::regclass);


--
-- Name: opportunity_configurations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_configurations ALTER COLUMN id SET DEFAULT nextval('public.opportunity_configurations_id_seq'::regclass);


--
-- Name: opportunity_email_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_email_messages ALTER COLUMN id SET DEFAULT nextval('public.opportunity_email_messages_id_seq'::regclass);


--
-- Name: opportunity_integration_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_integration_statuses ALTER COLUMN id SET DEFAULT nextval('public.opportunity_integration_statuses_id_seq'::regclass);


--
-- Name: opportunity_levels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_levels ALTER COLUMN id SET DEFAULT nextval('public.opportunity_levels_id_seq'::regclass);


--
-- Name: opportunity_opinion_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_opinion_types ALTER COLUMN id SET DEFAULT nextval('public.opportunity_opinion_types_id_seq'::regclass);


--
-- Name: opportunity_params id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_params ALTER COLUMN id SET DEFAULT nextval('public.opportunity_params_id_seq'::regclass);


--
-- Name: opportunity_recommendations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_recommendations ALTER COLUMN id SET DEFAULT nextval('public.opportunity_recommendations_id_seq'::regclass);


--
-- Name: opportunity_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_statuses ALTER COLUMN id SET DEFAULT nextval('public.opportunity_statuses_id_seq'::regclass);


--
-- Name: opportunity_tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_tests ALTER COLUMN id SET DEFAULT nextval('public.opportunity_tests_id_seq'::regclass);


--
-- Name: opportunity_viewers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_viewers ALTER COLUMN id SET DEFAULT nextval('public.opportunity_viewers_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: origin_page_views id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.origin_page_views ALTER COLUMN id SET DEFAULT nextval('public.origin_page_views_id_seq'::regclass);


--
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages ALTER COLUMN id SET DEFAULT nextval('public.packages_id_seq'::regclass);


--
-- Name: partner_integrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_integrations ALTER COLUMN id SET DEFAULT nextval('public.partner_integrations_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: permitted_domain_emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permitted_domain_emails ALTER COLUMN id SET DEFAULT nextval('public.permitted_domain_emails_id_seq'::regclass);


--
-- Name: personas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN id SET DEFAULT nextval('public.personas_id_seq'::regclass);


--
-- Name: plan_group_features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_group_features ALTER COLUMN id SET DEFAULT nextval('public.plan_group_features_id_seq'::regclass);


--
-- Name: plan_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_groups ALTER COLUMN id SET DEFAULT nextval('public.plan_groups_id_seq'::regclass);


--
-- Name: plan_installments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_installments ALTER COLUMN id SET DEFAULT nextval('public.plan_installments_id_seq'::regclass);


--
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- Name: pre_subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.pre_subscriptions_id_seq'::regclass);


--
-- Name: predispositions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predispositions ALTER COLUMN id SET DEFAULT nextval('public.predispositions_id_seq'::regclass);


--
-- Name: presential_event_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_addresses ALTER COLUMN id SET DEFAULT nextval('public.presential_event_addresses_id_seq'::regclass);


--
-- Name: presential_event_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_notifications ALTER COLUMN id SET DEFAULT nextval('public.presential_event_notifications_id_seq'::regclass);


--
-- Name: presential_event_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_rooms ALTER COLUMN id SET DEFAULT nextval('public.presential_event_rooms_id_seq'::regclass);


--
-- Name: presential_event_schedules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_schedules ALTER COLUMN id SET DEFAULT nextval('public.presential_event_schedules_id_seq'::regclass);


--
-- Name: presential_event_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_users ALTER COLUMN id SET DEFAULT nextval('public.presential_event_users_id_seq'::regclass);


--
-- Name: presential_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_events ALTER COLUMN id SET DEFAULT nextval('public.presential_events_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: profile_questions_to_updates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_questions_to_updates ALTER COLUMN id SET DEFAULT nextval('public.profile_questions_to_updates_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- Name: programs_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs_categories ALTER COLUMN id SET DEFAULT nextval('public.programs_categories_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Name: recommendations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations ALTER COLUMN id SET DEFAULT nextval('public.recommendations_id_seq'::regclass);


--
-- Name: redactor_assets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redactor_assets ALTER COLUMN id SET DEFAULT nextval('public.redactor_assets_id_seq'::regclass);


--
-- Name: requirement_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirement_types ALTER COLUMN id SET DEFAULT nextval('public.requirement_types_id_seq'::regclass);


--
-- Name: requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirements ALTER COLUMN id SET DEFAULT nextval('public.requirements_id_seq'::regclass);


--
-- Name: requisition_area_approvers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisition_area_approvers ALTER COLUMN id SET DEFAULT nextval('public.requisition_area_approvers_id_seq'::regclass);


--
-- Name: requisition_areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisition_areas ALTER COLUMN id SET DEFAULT nextval('public.requisition_areas_id_seq'::regclass);


--
-- Name: requisition_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisition_fields ALTER COLUMN id SET DEFAULT nextval('public.requisition_fields_id_seq'::regclass);


--
-- Name: requisition_workflows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisition_workflows ALTER COLUMN id SET DEFAULT nextval('public.requisition_workflows_id_seq'::regclass);


--
-- Name: requisitions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisitions ALTER COLUMN id SET DEFAULT nextval('public.requisitions_id_seq'::regclass);


--
-- Name: revenues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenues ALTER COLUMN id SET DEFAULT nextval('public.revenues_id_seq'::regclass);


--
-- Name: satisfaction_survey_answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satisfaction_survey_answers ALTER COLUMN id SET DEFAULT nextval('public.satisfaction_survey_answers_id_seq'::regclass);


--
-- Name: satisfaction_surveys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satisfaction_surveys ALTER COLUMN id SET DEFAULT nextval('public.satisfaction_surveys_id_seq'::regclass);


--
-- Name: saved_requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_requirements ALTER COLUMN id SET DEFAULT nextval('public.saved_requirements_id_seq'::regclass);


--
-- Name: sectors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors ALTER COLUMN id SET DEFAULT nextval('public.sectors_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- Name: source_tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_tests ALTER COLUMN id SET DEFAULT nextval('public.source_tests_id_seq'::regclass);


--
-- Name: stages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stages ALTER COLUMN id SET DEFAULT nextval('public.stages_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: statistics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistics ALTER COLUMN id SET DEFAULT nextval('public.statistics_id_seq'::regclass);


--
-- Name: steps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.steps ALTER COLUMN id SET DEFAULT nextval('public.steps_id_seq'::regclass);


--
-- Name: subscription_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_questions ALTER COLUMN id SET DEFAULT nextval('public.subscription_questions_id_seq'::regclass);


--
-- Name: subscription_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_sources ALTER COLUMN id SET DEFAULT nextval('public.subscription_sources_id_seq'::regclass);


--
-- Name: suggestions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggestions ALTER COLUMN id SET DEFAULT nextval('public.suggestions_id_seq'::regclass);


--
-- Name: template_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_messages ALTER COLUMN id SET DEFAULT nextval('public.template_messages_id_seq'::regclass);


--
-- Name: terms_of_use_by_ninenine_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_of_use_by_ninenine_jobs ALTER COLUMN id SET DEFAULT nextval('public.terms_of_use_by_ninenine_jobs_id_seq'::regclass);


--
-- Name: terms_of_use_by_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_of_use_by_sources ALTER COLUMN id SET DEFAULT nextval('public.terms_of_use_by_sources_id_seq'::regclass);


--
-- Name: test_token_apis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test_token_apis ALTER COLUMN id SET DEFAULT nextval('public.test_token_apis_id_seq'::regclass);


--
-- Name: tracking_pixels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_pixels ALTER COLUMN id SET DEFAULT nextval('public.tracking_pixels_id_seq'::regclass);


--
-- Name: tracking_providers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_providers ALTER COLUMN id SET DEFAULT nextval('public.tracking_providers_id_seq'::regclass);


--
-- Name: trend_attitudes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trend_attitudes ALTER COLUMN id SET DEFAULT nextval('public.trend_attitudes_id_seq'::regclass);


--
-- Name: trigger_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trigger_types ALTER COLUMN id SET DEFAULT nextval('public.trigger_types_id_seq'::regclass);


--
-- Name: triggers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.triggers ALTER COLUMN id SET DEFAULT nextval('public.triggers_id_seq'::regclass);


--
-- Name: user_accesses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accesses ALTER COLUMN id SET DEFAULT nextval('public.user_accesses_id_seq'::regclass);


--
-- Name: user_group_question_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_question_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_group_question_permissions_id_seq'::regclass);


--
-- Name: user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_permissions_id_seq'::regclass);


--
-- Name: user_presential_event_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_presential_event_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_presential_event_permissions_id_seq'::regclass);


--
-- Name: user_question_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_question_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_question_permissions_id_seq'::regclass);


--
-- Name: user_requisition_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_requisition_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_requisition_permissions_id_seq'::regclass);


--
-- Name: user_template_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_template_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_template_permissions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- Name: visits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits ALTER COLUMN id SET DEFAULT nextval('public.visits_id_seq'::regclass);


--
-- Name: work_environments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_environments ALTER COLUMN id SET DEFAULT nextval('public.work_environments_id_seq'::regclass);


--
-- Name: work_value_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_value_details ALTER COLUMN id SET DEFAULT nextval('public.work_value_details_id_seq'::regclass);


--
-- Data for Name: abandonments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abandonments (id, user_id, reason, detail, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.abilities (id, plan_id, feature_id, action_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: accept_terms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accept_terms (id, company_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: action_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_logs (id, user_id, namespace, uri, kind, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actions (id, name, key, feature_id, created_at, updated_at, description, hidden, tooltip) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, state_id, street, number, complement, city, created_at, updated_at, lat, lng, zipcode, country_id, neighborhood) FROM stdin;
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.areas (id, program_id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.awards (id, name, company_id, created_at, updated_at, year, "from", "order") FROM stdin;
\.


--
-- Data for Name: beliefs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beliefs (id, name, description, company_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: benefits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.benefits (id, name, created_at, updated_at, icon, category) FROM stdin;
\.


--
-- Data for Name: benefits_opportunities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.benefits_opportunities (benefit_id, opportunity_id) FROM stdin;
\.


--
-- Data for Name: benefits_programs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.benefits_programs (id, benefit_id, program_id) FROM stdin;
\.


--
-- Data for Name: broad_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.broad_values (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: businesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.businesses (id, name, description, program_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (id, institution_id, name, is_other, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories_sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories_sectors (category_id, sector_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: characteristics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characteristics (id, opportunities, benefits, work_life_balance, leadership, organization_values, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, ibge_id, name, abbr) FROM stdin;
\.


--
-- Data for Name: collection_opportunities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection_opportunities (id, company_collection_id, opportunity_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collections (id, name, subtitle, description, deleted_at, created_at, updated_at, slug) FROM stdin;
\.


--
-- Data for Name: collections_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collections_companies (collection_id, company_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, body, order_id, author_id, review, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.communities (id, name, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, name, slug, headquarters, size_id, revenue_id, website, sector_id, mission, about, founded, user_id, score, created_at, updated_at, address_id, twitter, featured, recommend_score, learning_score, deleted_at, work_environment_id, old_logo_url, facebook, characteristic_id, phone, opportunities_count, evaluations_count, visit_id, values_headline, followers_count, values_title, ats_allowed, last_ats_access, published_opportunities_count, about_business, document, pre_registration, personas, tags, social_reason, linkedin_published_id, whitelabel_url, whitelabel_ri_url, errors_by_email) FROM stdin;
\.


--
-- Data for Name: companies_sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies_sectors (company_id, sector_id) FROM stdin;
\.


--
-- Data for Name: company_action_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_action_tags (id, company_id, action, tag) FROM stdin;
\.


--
-- Data for Name: company_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_addresses (id, company_id, address_id, name, company_integration_fields, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_api_integrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_api_integrations (id, company_id, slug, environment, expires_at, value, extra_fields, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_collections (id, name, slug, description, company_id, visible_to_all, need_auth, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_integration_field_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_integration_field_columns (id, company_id, company_integration_field_id, order_presenter, label, slug, type_of_column, match_field, active, domain_reference_id, domain_column_reference_id, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by, column_unico) FROM stdin;
\.


--
-- Data for Name: company_integration_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_integration_fields (id, company_id, field, required_in_publish_api, required_in_candidate_status_api, format, type_of_column, created_at, updated_at, order_presenter, label, used_for_filter, used_for_create_opportunity, used_for_create_user, required_fill, active, can_delete, created_by, updated_by, deleted_at, deleted_by, used_for_filter_requisition, used_for_create_requisition, field_listening, domain_unico) FROM stdin;
\.


--
-- Data for Name: company_integration_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_integration_statuses (id, company_id, name, slug, description, move_candidate, move_next_candidate, created_at, updated_at, role_status_class, status_before, check_recommendation_trigger) FROM stdin;
\.


--
-- Data for Name: company_internal_recruitment_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_internal_recruitment_fields (id, company_id, name, slug, "order", is_eligibility, eligibility_type, eligibility_source_values, field_match, active, can_edit, created_at, created_by, updated_at, updated_by, deleted_at, deleted_by) FROM stdin;
\.


--
-- Data for Name: company_internal_recruitments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_internal_recruitments (id, company_id, directory, file_name, login_type, specific_domains, domains, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_locations (id, program_id, state_id, city, observation, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_messages (id, company_id, slug, amount_allowed, can_send_after_limit, available_days, start_at, expires_at, new_limit, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_messages_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_messages_configurations (id, company_id, channel, period, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_notification_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_notification_configurations (id, company_id, source, days, schedule, scope) FROM stdin;
\.


--
-- Data for Name: company_opportunity_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_opportunity_areas (id, company_id, name, created_at, updated_at, opportunity_area_id, deleted_at, deleted_by) FROM stdin;
\.


--
-- Data for Name: company_opportunity_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_opportunity_groups (id, company_id, opportunity_group, name, created_at, updated_at, deleted_at, deleted_by) FROM stdin;
\.


--
-- Data for Name: company_proportions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_proportions (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_sizes (id, name, created_at, updated_at, proportion_id) FROM stdin;
\.


--
-- Data for Name: company_token_apis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_token_apis (id, company_id, token, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_work_value_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_work_value_answers (id, company_id, company_work_value_detail_id, priority, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: company_work_value_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_work_value_details (id, persona_id, company_work_value_point_id, name) FROM stdin;
\.


--
-- Data for Name: company_work_value_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_work_value_points (id, name) FROM stdin;
\.


--
-- Data for Name: compatible_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compatible_relations (id, ecosystem_id, compatible_id, compatible_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversations (id, subject, user_id, company_id, created_at, updated_at, opportunity_id, manager_id, slug, user_cellphone, user_cpf, responsible_email, send_by, status, message_status) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, created_at, updated_at, iso_code) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, name, level, created_at, updated_at, is_blank, is_other) FROM stdin;
\.


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at, progress_stage, progress_current, progress_max) FROM stdin;
\.


--
-- Data for Name: descriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.descriptions (id, data, describable_id, describable_type, created_at, updated_at, "order") FROM stdin;
\.


--
-- Data for Name: details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.details (id, question, answer, detailable_id, created_at, updated_at, detailable_type, "order") FROM stdin;
\.


--
-- Data for Name: disabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disabilities (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, file, documentable_id, documentable_type, upload_name, secure_random, original_file, created_at, updated_at, documentable_key) FROM stdin;
\.


--
-- Data for Name: domain_api_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.domain_api_configurations (id, company_id, company_integration_field_id, type_of_request, request_url, content_type, "authorization", frequency, ruby_code, called_in, created_at, created_by, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: dream_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dream_jobs (id, user_id, opportunity_level_id, work_environment_id, opportunity_category_id, proportion_id, created_at, updated_at, characteristic, city, state_id, deleted_at) FROM stdin;
\.


--
-- Data for Name: ecosystems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecosystems (id, name, description, created_at, updated_at, company_description, candidate_description) FROM stdin;
\.


--
-- Data for Name: evaluations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluations (id, company_id, opinion, positives, improvements, opportunities, benefits, work_life_balance, leadership, organization_values, recommend, learning, position_in_company, created_at, updated_at, user_id, answer, worked_at) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, slug, start_date, end_date, description, headline, visit_id, created_at, updated_at, company_id, subscription_message, subscriptions_count, participant_description, address_id, schedule_title, show_location) FROM stdin;
\.


--
-- Data for Name: extra_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extra_jobs (id, title, price, job_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: extra_jobs_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.extra_jobs_orders (extra_job_id, order_id) FROM stdin;
\.


--
-- Data for Name: feature_action_user_vieweds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_action_user_vieweds (id, user_id, feature_id, action_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.features (id, name, key, created_at, updated_at, description) FROM stdin;
\.


--
-- Data for Name: features_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.features_plans (feature_id, plan_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: file_integration_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.file_integration_emails (id, file, opportunity_id, company_id, total_candidates_general, total_candidates_sent, type_of_file, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: filters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filters (id, name, slug, "order", created_at, updated_at, group_filter_id) FROM stdin;
\.


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.followers (id, user_id, company_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: geolocations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geolocations (id, zipcode, street, number, neighborhood, city, state, lat, long, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: global_profile_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_profile_statuses (id, company_id, slug, name, "default", expires_in, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_collections (id, group_id, company_collection_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_filters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_filters (id, name, slug, "order", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_group_question_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_group_question_permissions (id, group_id, group_question_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_integrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_integrations (id, company_id, name, slug, group_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_opportunities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_opportunities (id, group_id, opportunity_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_permissions (id, group_id, feature_id, action_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_presential_event_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_presential_event_permissions (id, group_id, presential_event_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_question_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_question_permissions (id, group_id, question_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_questions (id, question_id, company_id, name, created_at, updated_at, user_id, deleted_at, deleted_user_id, default_group, duplicated_from) FROM stdin;
\.


--
-- Data for Name: group_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_requirements (id, name, slug, company_id, group_id, user_id, requirements, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_requisition_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_requisition_permissions (id, group_id, requisition_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_template_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_template_permissions (id, group_id, template_message_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_templates (id, template_message_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_users (id, user_id, group_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, slug, company_id, created_at, updated_at, company_integration_condition) FROM stdin;
\.


--
-- Data for Name: header_tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.header_tests (id, user_id, source_test_id, opportunity_id, url_test, score, filled_date, created_at, updated_at, deadline_date, start_date, conclusion_time, status, has_movie, details, reopen_at, reopen_by) FROM stdin;
\.


--
-- Data for Name: health_checks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.health_checks (id, status) FROM stdin;
\.


--
-- Data for Name: highlights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.highlights (id, image, link, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identities (id, user_id, provider, uid, credentials, created_at, updated_at, deleted_at, graph, status, origin_company) FROM stdin;
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, file, imageable_id, imageable_type, width, height, retina, upload_name, secure_random, created_at, updated_at, original_file) FROM stdin;
\.


--
-- Data for Name: incompleted_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incompleted_subscriptions (id, opportunity_id, user_id, step, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: indication_domains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indication_domains (id, domain, created_at, updated_at, opportunity_id, company_id, company_default, opportunity_type, disabled) FROM stdin;
\.


--
-- Data for Name: installments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.installments (id, name, price, quantity, discount, "position", hidden, plan_id, created_at, updated_at, duration) FROM stdin;
\.


--
-- Data for Name: institutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institutions (id, name, state_id, is_other, state_abbr) FROM stdin;
\.


--
-- Data for Name: interviewer_candidates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interviewer_candidates (id, interviewer_id, user_id, subscription_id, opportunity_id, company_id, opnion_pending, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: interviewers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interviewers (id, name, email, unique_identifier, token, valid_at, company_id, created_at, updated_at, extra_fields) FROM stdin;
\.


--
-- Data for Name: job_boards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_boards (id, name, sigla, site, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: job_boards_opportunities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_boards_opportunities (id, job_board_id, opportunity_id, status, error_message) FROM stdin;
\.


--
-- Data for Name: job_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_categories (id, name, parent_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: job_feedback_opportunities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_feedback_opportunities (id, opportunity_id, opportunity_status, pending, sent_in, error, error_message, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, title, featured, likes_count, dislikes_count, price, hidden, job_category_id, description, instructions, term, video, published, seller_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leads (id, email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: log_integration_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_integration_files (id, file, file_name, opportunity_id, company_id, total_candidates_general, total_candidates_sent, type_of_file, status, created_at, updated_at, log) FROM stdin;
\.


--
-- Data for Name: log_opportunity_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_opportunity_statuses (id, opportunity_id, user_id, origin_of_change, description, old_status, new_status, created_at, updated_at, company_id) FROM stdin;
\.


--
-- Data for Name: log_update_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_update_profiles (id, company_id, user_id, uuid, params, status, response_code, response, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.managers (id, user_id, company_id, created_at, updated_at, responsible_user_id, accepted_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (id, body, description, created_at, updated_at, mediable_id, mediable_type) FROM stdin;
\.


--
-- Data for Name: mentions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mentions (id, from_user_id, to_user_id, in_user_id, subscription_id, profile_id, origin_type, company_id, opportunity_id, note_id, read_at, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: message_contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.message_contents (id, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, conversation_id, message_content_id, read_at, replied_at, parent_id, created_at, updated_at, to_user_id, from_user_id) FROM stdin;
\.


--
-- Data for Name: new_order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_order_details (id, new_order_id, status, description, postback_detail, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: new_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_orders (id, user_id, tid, transaction_id, company_id, payment_type, status, installment_id, amount, authorization_code, payment_installments, boleto_url, boleto_barcode, payment_detail, created_at, updated_at, plan_installment_id, pagarme_subscription_id) FROM stdin;
\.


--
-- Data for Name: opportunities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunities (id, title, slug, company_id, created_at, updated_at, opportunity_category_id, address_id, expired_at, other_benefit, deleted_at, opportunity_level_id, characteristic_id, work_environment_id, external_url, external_email, visit_id, managed, subscription_message, status, subscriptions_count, responsability, requirement, subscription_email_message, work_environment, occupation_area_id, enable_messages, published_at, tags, required_profile, closed_at, internal_recruitment, requisition_id, default_publishing_time, company_integration_fields, pcd, eligibility_requirements, continuous_capture, hidden, user_id, duplicated_from, params_api, auto_update_curriculum, language, number_of_positions, subscriber_edit_question, hiring_time, critical_period, days_type, company_opportunity_area_id, company_opportunity_group_id, hiring_date, deleted_by, acting_mode, closed_by, highlighted) FROM stdin;
\.


--
-- Data for Name: opportunity_action_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_action_tags (id, opportunity_id, action, tag) FROM stdin;
\.


--
-- Data for Name: opportunity_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_areas (id, name, created_at, updated_at, "group") FROM stdin;
\.


--
-- Data for Name: opportunity_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: opportunity_configurations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_configurations (id, opportunity_id, number_opnions_to_finalize_opportunity, number_disabilities_to_finalize_opportunity, disable_migrate_candidate_disapproved, disable_rules_to_finalize_opportunity, min_days_allow_finalize_with_migrated, company_id, company_default, opportunity_type, disabled, number_interviewers, evaluation_by_step, evaluation_characters_limit, opnion_after_integration, auto_update_curriculum, number_interviewers_in_opinion, observation_field) FROM stdin;
\.


--
-- Data for Name: opportunity_email_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_email_messages (id, opportunity_id, no_reply, responsible_of_opportunity, emails, company_id, company_default, opportunity_type, disabled, subscription_message, subscription_email_message) FROM stdin;
\.


--
-- Data for Name: opportunity_integration_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_integration_statuses (id, opportunity_id, name, slug, description, move_candidate, move_next_candidate, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: opportunity_levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_levels (id, name, created_at, updated_at, "order") FROM stdin;
\.


--
-- Data for Name: opportunity_opinion_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_opinion_types (id, name, slug, icon, color, move_to, opportunity_id, company_id, company_default, disabled, opportunity_type, created_at, updated_at, fields, evaluation_type, evaluation_reasons, check_recommendation_trigger) FROM stdin;
\.


--
-- Data for Name: opportunity_params; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_params (id, subsidiary, name_store_manager, email_store_manager, name_regional_manager, email_regional_manager, publication_validity, interviewers, candidates_in_profile, adherents_verification_time, minimum_adhesion, opportunity_id) FROM stdin;
\.


--
-- Data for Name: opportunity_recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_recommendations (id, profile_id, user_id, opportunity_id, company_id, sent_at, status, "interval", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: opportunity_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_statuses (id, name, "position", opportunity_id, created_at, updated_at, legacy_name, opnion_store_approved, company_id, company_default, opportunity_type, disabled) FROM stdin;
\.


--
-- Data for Name: opportunity_tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_tests (id, source_test_id, opportunity_id, required_in, deadline_date, company_id, company_default, opportunity_type, disabled, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: opportunity_viewers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opportunity_viewers (id, visited_at, created_at, updated_at, user_id, opportunity_id, previous_visit_in) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, job_id, buyer_id, state, amount, seller_id, "like", likes_count, dislikes_count, reviewed_at, delivered_file_url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: origin_page_views; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.origin_page_views (id, type_id, type_name, subscription_source_id, user_id, url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.packages (id, user_id, tid, external_code, card_last_digits, card_expiration, card_holder, card_issuer, address, created_at, updated_at, payment_type, status, installments) FROM stdin;
\.


--
-- Data for Name: partner_integrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partner_integrations (id, name, slug, integration_type, payload, token, company_id, user_create_id, user_update_id, created_at, updated_at, deleted_at, deleted_user_id, endpoint, partner, company_domains, configurations) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, amount, token, identifier, payer_id, state, order_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: permitted_domain_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permitted_domain_emails (id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (id, name, description, created_at, updated_at, background_color, short_description) FROM stdin;
\.


--
-- Data for Name: plan_group_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan_group_features (id, plan_group_id, feature_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: plan_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan_groups (id, name, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: plan_installments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plan_installments (id, plan_id, installment_id, pagarme_plan_id, paid_in, description) FROM stdin;
\.


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plans (id, name, key, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pre_subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pre_subscriptions (id, profile_id, company_id, user_id, opportunity_id, subscriber, details) FROM stdin;
\.


--
-- Data for Name: predispositions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.predispositions (id, name, description, persona_id, icon) FROM stdin;
\.


--
-- Data for Name: presential_event_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presential_event_addresses (id, presential_event_id, date_begin, date_end, time_begin, time_end, location, description, max_candidates, created_at, updated_at, deleted_at, deleted_by) FROM stdin;
\.


--
-- Data for Name: presential_event_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presential_event_notifications (id, presential_event_id, type_of_notification, "time", "interval", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: presential_event_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presential_event_rooms (id, presential_event_id, is_accessible, name, description, total_candidates, created_at, updated_at, presential_event_address_id, deleted_at, deleted_by) FROM stdin;
\.


--
-- Data for Name: presential_event_schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presential_event_schedules (id, presential_event_id, presential_event_room_id, schedule, total_candidates, created_at, updated_at, deleted_at, deleted_by) FROM stdin;
\.


--
-- Data for Name: presential_event_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presential_event_users (id, presential_event_id, presential_event_room_id, presential_event_schedule_id, user_id, opportunity_id, status, created_at, updated_at, presential_event_address_id, chosen_date, confirmed_at) FROM stdin;
\.


--
-- Data for Name: presential_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presential_events (id, title, location, description, date, initial_time, final_time, status, company_id, created_at, updated_at, deleted_at, deleted_by) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, company_id, plan_id, created_at, updated_at, price, expires_at, package_id, new_order_id, recurrence, canceled_recurrence, opportunities_limit, users_limit) FROM stdin;
\.


--
-- Data for Name: profile_questions_to_updates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile_questions_to_updates (id, company_id, user_id, opportunity_id, filled_date, status, recruiter_id, details, created_at, updated_at, limit_date) FROM stdin;
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profiles (id, user_id, created_at, updated_at, gender, birthday, phone, mobile_phone, nationality, cpf, skype, deleted_at) FROM stdin;
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programs (id, title, description, company_id, other_benefit, opportunity_level_id, visit_id, subscription_message, external_url, external_email, managed, status, duration, subscription_start_date, subscription_end_date, expired_at, deleted_at, created_at, updated_at, requirement_observation, journey_observation, show_location, subscriptions_count, subscription_email_message, enable_messages) FROM stdin;
\.


--
-- Data for Name: programs_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programs_categories (id, program_id, category_id) FROM stdin;
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, title, html_type, options, slug, created_at, updated_at, group_question_id, hided_at, hided_user_id, in_subscription, candidate, hided, required, hint, duplicated_from, eliminatory_question, eliminatory_aswers, eliminatory_template) FROM stdin;
\.


--
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recommendations (id, user_id, user_name, opportunity_id, opportunity_title, opportunity_locale, opportunity_responsabilities, opportunity_expired_at, opportunity_link, date_sent, created_at, updated_at, user_email) FROM stdin;
\.


--
-- Data for Name: redactor_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redactor_assets (id, user_id, data_file_name, data_content_type, data_file_size, assetable_id, assetable_type, type, width, height, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: requirement_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requirement_types (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requirements (id, program_id, requirement_type_id, subject, eligibility, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: requisition_area_approvers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requisition_area_approvers (id, requisition_area_id, user_id, priority, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: requisition_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requisition_areas (id, name, company_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: requisition_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requisition_fields (id, requisition_id, user_id, company_id, field_label, name, description, field_type, field_options, field_validation, created_at, updated_at, value, deleted_at, user_deleted_id, field_order, viewed_in_workflow, viewed, opportunity_field, is_filter) FROM stdin;
\.


--
-- Data for Name: requisition_workflows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requisition_workflows (id, requisition_id, user_id, status, priority, created_at, updated_at, action_date, justification) FROM stdin;
\.


--
-- Data for Name: requisitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requisitions (id, company_id, opportunity_id, user_id, requisition_area_id, status, justification, remuneration, created_at, updated_at, title, opportunity_title, street, number, zipcode, complement, neighborhood, state, city, expiration_date, responsable_email, pcd, publish_opportunity, address_id, company_integration_fields, deleted_by, deleted_at, acting_mode) FROM stdin;
\.


--
-- Data for Name: revenues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.revenues (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: satisfaction_survey_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.satisfaction_survey_answers (id, user_id, satisfaction_survey_id, answer) FROM stdin;
\.


--
-- Data for Name: satisfaction_surveys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.satisfaction_surveys (id, company_id, controller, action, title, subtitle, options_type, options, buttons, single_access, active, start_date, end_date, deleted_at, type_survey, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: saved_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.saved_requirements (id, user_id, company_id, opportunity_id, step_id, requirements, name, subscription_requirement, created_at, updated_at, eligibility_requirements) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20130905221856
20130909150715
20130909192513
20130910192606
20130911175746
20130912131714
20130919171246
20130919172350
20130919173448
20130919173536
20130919180534
20130919180602
20130919181306
20130919181435
20130919181751
20130919182845
20130919182930
20130919183911
20130919185832
20130919194820
20131010134400
20131010170253
20131010171308
20131010174142
20131010175239
20131010194613
20131011174735
20131015210602
20131016183812
20131021134904
20131028164659
20131029162208
20131029175832
20131031211336
20131104164917
20131105165636
20131114202329
20131114202532
20131121205040
20131121205226
20131122175116
20131122195421
20131125195803
20131202184510
20131202185802
20131202204541
20131202204639
20131202204843
20131202212235
20131203123200
20131203155635
20131203201326
20131204194353
20131205143131
20131205144234
20131219135121
20140107202208
20140108131805
20140108160814
20140108160835
20140115141607
20140115171311
20140123202402
20140123202424
20140129132619
20140121164025
20140121164857
20140121170321
20140121175151
20140121175906
20140121182833
20140203174333
20140205165511
20140205165856
20140205172134
20140205205940
20140205212136
20140211194923
20140211195231
20140212135916
20140212140119
20140214141653
20140214193826
20140214194929
20140225152821
20140225204318
20140226183143
20140226203301
20140227132412
20140228181233
20140228201458
20140228205508
20140306222826
20140306231222
20140306232341
20140307143025
20140311150309
20140311150350
20140312152653
20140312153105
20140312172609
20140312172729
20140318181758
20140330230352
20140330231744
20140330233102
20140330233222
20140330233822
20140330234129
20140330234727
20140330234927
20140330235414
20140401125715
20140402132019
20140403201830
20140405155937
20140408224338
20140408225402
20140411133609
20140414220538
20140410202731
20140428190500
20140511191026
20140511192042
20140508183000
20140508183213
20140508183239
20140512182245
20140516204907
20140530145121
20140604145949
20140508182831
20140513175743
20140513221652
20140520193519
20140521173611
20140526210353
20140526210927
20140526211220
20140527192328
20140530174518
20140606171343
20140613182019
20140618112300
20140630211947
20140718172447
20140724165453
20140725174729
20140505113226
20140505114016
20140515130334
20140515145056
20140521221115
20140602163031
20140602164717
20140602164744
20140603141424
20140604182933
20140605224710
20140628211412
20140629000239
20140808224721
20140814220513
20140825205020
20140826040911
20140826203641
20140826205701
20140826205735
20140826211923
20140827174851
20140827174956
20140827182846
20140827185633
20140828190325
20140828213105
20140829235337
20140901044816
20140901082417
20140901093203
20140904220520
20140904231936
20140904235930
20140905221805
20140910210741
20140911020013
20140911232858
20140912232051
20140916173033
20141001230315
20141001232700
20141002144814
20141003231145
20141010194839
20141015145058
20141016211930
20141016213937
20141017181014
20141106143855
20141107154542
20141201184025
20141201184126
20141201184308
20141202170225
20141202174125
20150112151109
20150114191744
20150116160041
20150120132653
20150130132929
20150130153351
20150219223825
20150220183820
20150226184915
20150303203006
20150226180944
20150312204501
20150313220042
20150325181840
20150325181912
20150325202045
20150327182149
20150327182607
20150328234652
20150329170312
20150329174041
20150329194223
20150329200903
20150329211539
20150330195024
20150331163535
20150331194323
20150406185226
20150418220929
20150419215602
20150430172815
20150401220345
20150402135434
20150406202959
20150407142916
20150407174948
20150407181433
20150407182640
20150407182822
20150408162018
20150409142207
20150409185453
20150409210543
20150410174637
20150410181010
20150410203258
20150505214029
20150505220704
20150506172010
20150508145432
20150511193904
20150511201730
20150512224549
20150513181402
20150521175641
20150525201002
20150527024931
20150527052927
20150601184943
20150603192104
20150609132539
20150713025707
20150727232614
20150805193639
20150805221523
20150805222638
20150805222845
20150805222946
20150818181210
20150819190928
20150915194158
20150916143412
20151007205941
20151208161115
20151216172849
20151218164744
20151218165953
20151218170021
20151218170030
20160120125131
20160120171715
20160120204013
20160315165638
20160330202815
20160418172929
20160421193017
20160426144310
20160224144622
20160225133536
20160321165851
20160321174439
20160602165732
20160721144847
20160803173401
20160805140023
20160805140408
20160805141534
20160805141554
20160822213115
20160729140141
20160621183018
20160621185416
20160622212253
20161014115843
20170112193106
20170117174215
20170313211906
20170313211945
20170313212002
20170314000340
20170308232713
20170308232820
20170308232837
20170317191652
20170221155310
20170221155432
20170221160615
20170307210124
20170320203350
20170322201124
20170328173208
20170405175712
20170417192548
20170426144727
20170515202003
20170516162747
20170519171515
20170522160919
20170605034637
20170606182746
20170525202437
20170616190721
20170215125330
20170219144817
20170220220905
20170222002026
20170222003121
20170222133419
20170630202721
20170701162704
20170704140408
20170704144226
20170704165409
20170704172232
20170705193459
20170710154231
20170711183916
20170713163749
20170815013552
20170816203443
20170818140821
20170821024428
20170823194712
20170829170453
20170830170307
20170817162247
20170817172418
20170817201230
20170818134224
20170818140746
20170818140759
20170818140811
20170818140823
20170818141501
20170829175554
20170831155255
20170820000340
20170903000340
20170912200221
20170921193049
20170927134730
20171027012719
20171114185343
20171026084046
20171026084127
20171026084238
20171026091153
20171029083706
20171029171815
20171103211228
20171121153903
20171121165341
20171122162812
20171003195521
20171004144430
20171024193500
20171127184241
20171130130404
20171206190156
20171207181057
20171207184812
20171213195857
20171214130311
20171218180848
20171110135332
20171110153730
20171110154121
20171110154511
20171110154859
20171207152915
20171207154125
20171212144858
20171212161715
20171212164752
20171214162738
20171215175207
20171220132855
20171227015423
20170607210102
20171221151301
20171222195208
20171222195547
20171222195555
20180110151706
20180118162636
20180119163732
20180122003424
20180131203915
20180131124011
20180201080427
20180208125625
20180208220735
20180215154139
20180216105820
20180216110000
20180221184950
20180226132512
20180226154645
20180301191556
20180301192603
20180302161031
20180302210000
20180302210556
20180308131336
20180312173322
20180420101152
20171127203053
20180322141706
20180322142307
20180322170932
20180328122525
20180425181156
20180507133043
20180316161149
20180316182135
20180504020435
20180510205419
20180511111950
20180517135602
20180410162222
20180425174945
20180702161320
20180704001606
20180727171501
20180730211023
20180731124315
20180821173927
20180822174008
20170822000340
20170829194712
20180604152650
20180604155000
20180611172712
20180615231929
20180624224017
20180624224050
20180702004237
20180801185537
20180807124315
20180827140234
20180827140406
20180827182015
20180827185814
20180827191845
20180827193601
20180827195854
20180827200804
20180827202215
20180827202509
20180827204050
20180827204429
20180828205758
20180828210827
20180828211506
20180829005835
20180829012127
20180829012526
20180829015854
20180829021427
20180830171650
20180830175940
20180905215609
20180718182302
20180718182338
20180910200549
20180829003445
20180925203040
20180918184929
20180920164201
20180921180042
20180924023120
20180926132258
20180927204224
20181003223211
20181004012407
20181008203327
20181010144333
20181015143716
20181026173650
20181030190825
20181030195903
20181105125251
20181128115519
20181205124842
20181211124806
20190102161318
20190110184204
20190114095357
20190114184819
20190122192352
20190129170441
20181205122758
20190116084943
20190116091007
20190121122837
20190124165436
20190124175253
20190129161301
20190129190623
20190214124511
20190221123500
20190227164451
20190228130004
20190301214705
20190315211528
20190312142652
20190318144138
20190318150714
20190319195243
20190319195354
20190320195629
20190321131448
20190321141828
20190321154903
20190321190333
20190321203049
20190322140159
20190322140434
20190322142443
20190322162002
20190401180331
20190404152645
20190405143930
20190409172603
20190406231212
20190410031255
20190410143559
20190411132855
20190412154549
20190412164642
20190415203431
20190417210122
20190410145717
20190418132600
20190424204619
20190509132602
20190521123209
20190521183118
20190510164629
20190528005747
20190530223408
20190530234524
20190605220937
20190605225505
20190520030415
20190516131357
20190516134029
20190521025404
20190521225346
20190522002837
20190528170912
20190528171401
20190612204304
20190612205657
20190531175616
20190614201545
20190614022051
20190620004642
20190701205641
20190712162457
20190712190814
20190712204356
20190712204404
20190702192018
20190702202452
20190704163835
20190706182126
20190708182439
20190711124123
20190715012119
20190719143735
20190719150421
20190805175626
20190723171931
20190806133320
20190808143512
20190806212424
20190816175726
20190814015212
20190814034856
20190821194414
20190827161124
20190826201659
20190909193709
20190912210733
20190913153548
20190913191550
20190914193910
20190914195611
20190914201647
20190914213400
20190915035600
20190915053711
20190919164851
20190920192032
20190920215245
20190924173608
20190924184633
20190925190913
20190926021121
20191007153939
20191007205513
20191011143150
20191011135601
20191011155125
20191011160601
20191016001433
20191028201154
20191008182357
20191008212627
20191014173729
20191017200945
20191021160521
20191021162528
20191021200514
20191029185403
20191029185534
20200403140139
20191107182852
20191201074042
20191106194732
20191111210553
20191111211718
20191111214943
20191113191522
20191216140120
20191223190233
20200110162914
20200205135224
20200207190721
20200228142724
20191128200313
20191211123003
20191211143483
20191212194850
20191212195133
20191216190017
20191217175842
20191219145133
20200106133702
20200115181528
20200120211209
20200120220119
20200121142019
20200123175842
20200127185421
20200128021335
20200203164331
20200204000340
20200212140441
20200214164642
20200310164826
20200311140624
20200311181421
20200313215646
20200319181210
20200901200114
20200918225921
20200507211953
20200504214203
20200316190721
20200320181420
20200323190109
20200323195122
20200331201023
20200401181445
20200403142245
20200519230721
20200522190946
20200518190109
20200508140420
20200601145234
20200616133034
20200618150244
20200705212308
20200724202720
20200729182759
20200409170137
20200409172008
20200409192909
20200414133357
20200414134428
20200414144816
20200414172447
20200416202855
20200417155932
20200505171846
20200505174005
20200518161939
20200611144032
20200615180317
20200616161014
20200618180107
20200618201317
20200618210932
20200625203927
20200702190605
20200703214717
20200921174240
20200922142636
20200728104631
20200827104542
20200827104603
20200916235226
20200923003053
20200930004647
20201007190146
20201014172523
20201020220347
20201020214549
20201023215550
20201028200224
20201029111443
20201029203906
20201111115313
20201112222743
20201112115856
20200623182224
20200624144802
20200630170034
20200701145031
20200702135050
20200702135813
20200804184548
20201014215158
20201022132426
20201023110403
20201103160329
20201105133529
20201105221104
20201105223711
20201105224236
20201105224250
20201110185410
20201111174411
20201111184838
20201116225416
20201116230156
20201118225358
20201118230623
20201119220725
20201204142030
20201209134155
20200708133736
20200716183204
20200716184312
20200731192716
20200901132242
20200901174214
20200901180554
20200901211848
20200914031925
20200914035327
20201217192639
20201222004023
20201223231108
20201226183238
20201227161630
20201228144253
20201228180153
20201228215604
20201229223355
20210112152404
20210112163635
20201105175311
20210112221657
20210113184906
20210120215604
20210205174709
20210205190145
20210205191326
20210202133441
20210209171727
20210211135430
20210211142400
20210210144438
20210210145038
20210210183942
20210218183832
20210222201638
20210222203414
20210210152330
20201211133527
20210224152159
20210226213823
20210226152427
20210302175902
20210309211001
20210310142559
20210310144159
20210305120459
20210310182314
20210311135305
20210311140908
20210311141126
20210311193243
20210311205525
20210311205933
20210315142451
20210315145735
20210315180510
20210319175308
20210319175321
20210319221749
20210309134113
20210319141818
20210323144227
20210323144238
20210324173737
20210331204452
20210331204741
20210401210247
20210401210848
20210401213542
20210401213836
20210401214148
20210405151740
20210329174405
20210409222022
20210409223343
20210419205142
20210420132928
20210422130256
20210428144750
20210429143033
20210426201541
20210428190455
20210514134311
20210514134721
20210517095655
20210517153515
20210518202320
20210514221900
20210519211910
20210505145648
20210526134728
20210528141523
20210528143202
20210609181854
20210616174632
20210617143148
20210622144802
20210622145507
20210630135239
20210212192434
20210518132346
20210521143112
20210513184311
20210708184322
20210616210833
20210617220242
20210629175639
20210629180434
20210701204310
20210702151416
20210715142140
20210722170613
20210727173533
20210727183603
20210727191233
20210707193133
20210820150642
20210823153725
20210825193043
20210902150444
20210902180026
20210913134347
20210401171230
20210401171848
20210422134416
20210423190239
20210615135706
20210616142346
20210616175027
20210616200731
20210819143850
20210824145157
20210827131512
20210915181259
20210924183655
20210928212929
20210930164400
20211001162246
20211001170026
20211005170713
20211005183004
20211005184108
20211005210412
20211019131102
20211117153428
20211117174938
20211118215924
20211123174452
20211201214646
20211208164505
20211208171140
20211208184821
20220120181041
20220201130931
20220215135935
20220215163412
20220218141656
20220307192925
20220308133948
20220310173537
20220322192106
20220323172435
20220407154837
20220426163339
20220502145417
20220513165918
20220513183628
20220517214802
20220517214835
20220517215156
20220524193859
20220525194047
20220606163123
20220608232443
\.


--
-- Data for Name: sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sectors (id, name, created_at, updated_at, companies_count) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, session_id, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skills (id, name, created_at, updated_at, status, slug) FROM stdin;
\.


--
-- Data for Name: source_tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source_tests (id, name, code, source, created_at, updated_at, company_id, estimated_time, details, max_value, hidden, hide_to_candidate) FROM stdin;
\.


--
-- Data for Name: stages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stages (id, name, description, period, program_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, name, abbr, created_at, updated_at, is_first) FROM stdin;
\.


--
-- Data for Name: statistics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statistics (id, model, slug, description, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.steps (id, name, description, start_date, end_date, program_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: subscription_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_questions (id, subscriptive_id, subscriptive_type, title, hint, html_type, options, "order", created_at, updated_at, required, company_id, company_default, disabled, opportunity_type, candidate, slug, identifier, in_subscription, origin, origin_id, eliminatory_question, eliminatory_aswers, eliminatory_template) FROM stdin;
\.


--
-- Data for Name: subscription_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_sources (id, name, description, slug, picture, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: suggestions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suggestions (id, title, category_id, published, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: template_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_messages (id, company_id, subject, message, name, created_at, updated_at, feedback_default, deleted_at, deleted_user_id, group_template_id, duplicated_from, cover_template) FROM stdin;
\.


--
-- Data for Name: terms_of_use_by_ninenine_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terms_of_use_by_ninenine_jobs (id, user_id, version, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: terms_of_use_by_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.terms_of_use_by_sources (id, company_id, user_id, source, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: test_token_apis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test_token_apis (id, partner, token, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tracking_pixels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracking_pixels (id, options, url, provider_id) FROM stdin;
\.


--
-- Data for Name: tracking_providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracking_providers (id, name, template) FROM stdin;
\.


--
-- Data for Name: trend_attitudes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trend_attitudes (id, name, description, main_persona_id, support_persona_id) FROM stdin;
\.


--
-- Data for Name: trigger_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trigger_types (id, name, slug, icon, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.triggers (id, opportunity_id, trigger_type_id, destiny, origin, origin_param, condition, condition_param, service_class, company_id, company_default, opportunity_type, disabled, fields, active, created_at, updated_at, total_reactivations, last_reactivation_at) FROM stdin;
\.


--
-- Data for Name: user_accesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_accesses (id, user_id, company_id, controller, action, access_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_group_question_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group_question_permissions (id, user_id, group_question_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_permissions (id, user_id, opportunity_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_presential_event_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_presential_event_permissions (id, user_id, presential_event_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_question_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_question_permissions (id, user_id, question_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_requisition_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_requisition_permissions (id, user_id, requisition_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_template_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_template_permissions (id, user_id, template_message_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, created_at, updated_at, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, provider, uid, name, graph, old_avatar_url, token, enterprise, api_token, deleted_at, oauth_expires_at, level, requesting_money, role, expire_api_token_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, company_integration_fields, pre_registration, origin_company, document, foreigner, new_cv, deleted_email, failed_attempts, unlock_token, locked_at, user_ats, token_change_email, token_change_email_valid_at, preferences, superuser, session_active) FROM stdin;
\.


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.videos (id, url, company_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visits (id, visit_token, visitor_token, ip, user_agent, referrer, landing_page, user_id, user_type, referring_domain, search_keyword, browser, os, device_type, country, region, city, utm_source, utm_medium, utm_term, utm_content, utm_campaign, created_at) FROM stdin;
\.


--
-- Data for Name: work_environments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_environments (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: work_value_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work_value_details (id, broad_value_id, persona_id, question, left_answer, right_answer, created_at, updated_at, required) FROM stdin;
\.


--
-- Name: abandonments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.abandonments_id_seq', 1, false);


--
-- Name: abilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.abilities_id_seq', 1, false);


--
-- Name: accept_terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accept_terms_id_seq', 1, false);


--
-- Name: action_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_logs_id_seq', 1, false);


--
-- Name: actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actions_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 10, true);


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, false);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.areas_id_seq', 1, false);


--
-- Name: awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.awards_id_seq', 1, false);


--
-- Name: beliefs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beliefs_id_seq', 1, false);


--
-- Name: benefits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.benefits_id_seq', 1, false);


--
-- Name: benefits_programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.benefits_programs_id_seq', 1, false);


--
-- Name: broad_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.broad_values_id_seq', 1, false);


--
-- Name: businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.businesses_id_seq', 1, false);


--
-- Name: campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: characteristics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characteristics_id_seq', 1, false);


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- Name: collection_opportunities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_opportunities_id_seq', 1, false);


--
-- Name: collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collections_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.communities_id_seq', 1, false);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 5, true);


--
-- Name: company_action_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_action_tags_id_seq', 1, false);


--
-- Name: company_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_addresses_id_seq', 1, false);


--
-- Name: company_api_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_api_integrations_id_seq', 1, false);


--
-- Name: company_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_collections_id_seq', 1, false);


--
-- Name: company_integration_field_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_integration_field_columns_id_seq', 1, false);


--
-- Name: company_integration_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_integration_fields_id_seq', 1, false);


--
-- Name: company_integration_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_integration_statuses_id_seq', 1, false);


--
-- Name: company_internal_recruitment_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_internal_recruitment_fields_id_seq', 1, false);


--
-- Name: company_internal_recruitments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_internal_recruitments_id_seq', 1, false);


--
-- Name: company_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_locations_id_seq', 1, false);


--
-- Name: company_messages_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_messages_configurations_id_seq', 1, false);


--
-- Name: company_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_messages_id_seq', 1, false);


--
-- Name: company_notification_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_notification_configurations_id_seq', 1, false);


--
-- Name: company_opportunity_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_opportunity_areas_id_seq', 1, false);


--
-- Name: company_opportunity_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_opportunity_groups_id_seq', 1, false);


--
-- Name: company_proportions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_proportions_id_seq', 1, false);


--
-- Name: company_sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_sizes_id_seq', 1, false);


--
-- Name: company_token_apis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_token_apis_id_seq', 1, false);


--
-- Name: company_work_value_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_work_value_answers_id_seq', 1, false);


--
-- Name: company_work_value_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_work_value_details_id_seq', 1, false);


--
-- Name: company_work_value_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_work_value_points_id_seq', 1, false);


--
-- Name: compatible_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compatible_relations_id_seq', 1, false);


--
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conversations_id_seq', 1, false);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 1, false);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, false);


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.delayed_jobs_id_seq', 1, false);


--
-- Name: descriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.descriptions_id_seq', 1, false);


--
-- Name: details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.details_id_seq', 1, false);


--
-- Name: disabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disabilities_id_seq', 1, false);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_id_seq', 1, false);


--
-- Name: domain_api_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.domain_api_configurations_id_seq', 1, false);


--
-- Name: dream_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dream_jobs_id_seq', 1, false);


--
-- Name: ecosystems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ecosystems_id_seq', 1, false);


--
-- Name: evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluations_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: extra_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.extra_jobs_id_seq', 1, false);


--
-- Name: feature_action_user_vieweds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feature_action_user_vieweds_id_seq', 1, false);


--
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.features_id_seq', 1, false);


--
-- Name: file_integration_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.file_integration_emails_id_seq', 1, false);


--
-- Name: filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filters_id_seq', 1, false);


--
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.followers_id_seq', 1, false);


--
-- Name: geolocations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geolocations_id_seq', 1, false);


--
-- Name: global_profile_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.global_profile_statuses_id_seq', 15, true);


--
-- Name: group_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_collections_id_seq', 1, false);


--
-- Name: group_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_filters_id_seq', 1, false);


--
-- Name: group_group_question_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_group_question_permissions_id_seq', 1, false);


--
-- Name: group_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_integrations_id_seq', 1, false);


--
-- Name: group_opportunities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_opportunities_id_seq', 1, false);


--
-- Name: group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_permissions_id_seq', 1, false);


--
-- Name: group_presential_event_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_presential_event_permissions_id_seq', 1, false);


--
-- Name: group_question_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_question_permissions_id_seq', 1, false);


--
-- Name: group_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_questions_id_seq', 1, false);


--
-- Name: group_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_requirements_id_seq', 1, false);


--
-- Name: group_requisition_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_requisition_permissions_id_seq', 1, false);


--
-- Name: group_template_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_template_permissions_id_seq', 1, false);


--
-- Name: group_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_templates_id_seq', 1, false);


--
-- Name: group_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_users_id_seq', 1, false);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Name: header_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.header_tests_id_seq', 1, false);


--
-- Name: health_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.health_checks_id_seq', 1, false);


--
-- Name: highlights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.highlights_id_seq', 1, false);


--
-- Name: identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.identities_id_seq', 1, false);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 1, false);


--
-- Name: incompleted_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incompleted_subscriptions_id_seq', 1, false);


--
-- Name: indication_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.indication_domains_id_seq', 1, false);


--
-- Name: installments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.installments_id_seq', 1, false);


--
-- Name: institutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institutions_id_seq', 1, false);


--
-- Name: interviewer_candidates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interviewer_candidates_id_seq', 1, false);


--
-- Name: interviewers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interviewers_id_seq', 1, false);


--
-- Name: job_boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_boards_id_seq', 1, false);


--
-- Name: job_boards_opportunities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_boards_opportunities_id_seq', 1, false);


--
-- Name: job_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_categories_id_seq', 1, false);


--
-- Name: job_feedback_opportunities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_feedback_opportunities_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 1, false);


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leads_id_seq', 1, false);


--
-- Name: log_integration_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_integration_files_id_seq', 1, false);


--
-- Name: log_opportunity_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_opportunity_statuses_id_seq', 1, false);


--
-- Name: log_update_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_update_profiles_id_seq', 1, false);


--
-- Name: managers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.managers_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 1, false);


--
-- Name: mentions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mentions_id_seq', 1, false);


--
-- Name: message_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_contents_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: new_order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_order_details_id_seq', 1, false);


--
-- Name: new_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_orders_id_seq', 1, false);


--
-- Name: opportunities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunities_id_seq', 5, true);


--
-- Name: opportunity_action_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_action_tags_id_seq', 1, false);


--
-- Name: opportunity_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_areas_id_seq', 1, false);


--
-- Name: opportunity_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_categories_id_seq', 1, false);


--
-- Name: opportunity_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_configurations_id_seq', 1, false);


--
-- Name: opportunity_email_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_email_messages_id_seq', 1, false);


--
-- Name: opportunity_integration_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_integration_statuses_id_seq', 1, false);


--
-- Name: opportunity_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_levels_id_seq', 1, false);


--
-- Name: opportunity_opinion_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_opinion_types_id_seq', 1, false);


--
-- Name: opportunity_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_params_id_seq', 1, false);


--
-- Name: opportunity_recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_recommendations_id_seq', 1, false);


--
-- Name: opportunity_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_statuses_id_seq', 1, false);


--
-- Name: opportunity_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_tests_id_seq', 1, false);


--
-- Name: opportunity_viewers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opportunity_viewers_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: origin_page_views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.origin_page_views_id_seq', 1, false);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.packages_id_seq', 1, false);


--
-- Name: partner_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partner_integrations_id_seq', 1, false);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- Name: permitted_domain_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permitted_domain_emails_id_seq', 1, false);


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personas_id_seq', 1, false);


--
-- Name: plan_group_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_group_features_id_seq', 1, false);


--
-- Name: plan_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_groups_id_seq', 1, false);


--
-- Name: plan_installments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plan_installments_id_seq', 1, false);


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plans_id_seq', 1, false);


--
-- Name: pre_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pre_subscriptions_id_seq', 1, false);


--
-- Name: predispositions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.predispositions_id_seq', 1, false);


--
-- Name: presential_event_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presential_event_addresses_id_seq', 1, false);


--
-- Name: presential_event_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presential_event_notifications_id_seq', 1, false);


--
-- Name: presential_event_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presential_event_rooms_id_seq', 1, false);


--
-- Name: presential_event_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presential_event_schedules_id_seq', 1, false);


--
-- Name: presential_event_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presential_event_users_id_seq', 1, false);


--
-- Name: presential_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presential_events_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: profile_questions_to_updates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_questions_to_updates_id_seq', 1, false);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profiles_id_seq', 1, false);


--
-- Name: programs_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programs_categories_id_seq', 1, false);


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programs_id_seq', 1, false);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 1, false);


--
-- Name: recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recommendations_id_seq', 1, false);


--
-- Name: redactor_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.redactor_assets_id_seq', 1, false);


--
-- Name: requirement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requirement_types_id_seq', 1, false);


--
-- Name: requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requirements_id_seq', 1, false);


--
-- Name: requisition_area_approvers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requisition_area_approvers_id_seq', 1, false);


--
-- Name: requisition_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requisition_areas_id_seq', 1, false);


--
-- Name: requisition_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requisition_fields_id_seq', 1, false);


--
-- Name: requisition_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requisition_workflows_id_seq', 1, false);


--
-- Name: requisitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requisitions_id_seq', 1, false);


--
-- Name: revenues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.revenues_id_seq', 1, false);


--
-- Name: satisfaction_survey_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.satisfaction_survey_answers_id_seq', 1, false);


--
-- Name: satisfaction_surveys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.satisfaction_surveys_id_seq', 1, false);


--
-- Name: saved_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.saved_requirements_id_seq', 1, false);


--
-- Name: sectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sectors_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_id_seq', 1, false);


--
-- Name: source_tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.source_tests_id_seq', 1, false);


--
-- Name: stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stages_id_seq', 1, false);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 10, true);


--
-- Name: statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statistics_id_seq', 1, false);


--
-- Name: steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.steps_id_seq', 1, false);


--
-- Name: subscription_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscription_questions_id_seq', 1, false);


--
-- Name: subscription_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscription_sources_id_seq', 1, false);


--
-- Name: suggestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suggestions_id_seq', 1, false);


--
-- Name: template_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.template_messages_id_seq', 1, false);


--
-- Name: terms_of_use_by_ninenine_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terms_of_use_by_ninenine_jobs_id_seq', 1, false);


--
-- Name: terms_of_use_by_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terms_of_use_by_sources_id_seq', 1, false);


--
-- Name: test_token_apis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_token_apis_id_seq', 1, false);


--
-- Name: tracking_pixels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracking_pixels_id_seq', 1, false);


--
-- Name: tracking_providers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracking_providers_id_seq', 1, false);


--
-- Name: trend_attitudes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trend_attitudes_id_seq', 1, false);


--
-- Name: trigger_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trigger_types_id_seq', 1, false);


--
-- Name: triggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.triggers_id_seq', 1, false);


--
-- Name: user_accesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_accesses_id_seq', 1, false);


--
-- Name: user_group_question_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_group_question_permissions_id_seq', 1, false);


--
-- Name: user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_permissions_id_seq', 1, false);


--
-- Name: user_presential_event_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_presential_event_permissions_id_seq', 1, false);


--
-- Name: user_question_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_question_permissions_id_seq', 1, false);


--
-- Name: user_requisition_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_requisition_permissions_id_seq', 1, false);


--
-- Name: user_template_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_template_permissions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.videos_id_seq', 1, false);


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visits_id_seq', 1, false);


--
-- Name: work_environments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.work_environments_id_seq', 1, false);


--
-- Name: work_value_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.work_value_details_id_seq', 1, false);


--
-- Name: abandonments abandonments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abandonments
    ADD CONSTRAINT abandonments_pkey PRIMARY KEY (id);


--
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (id);


--
-- Name: accept_terms accept_terms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accept_terms
    ADD CONSTRAINT accept_terms_pkey PRIMARY KEY (id);


--
-- Name: action_logs action_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_logs
    ADD CONSTRAINT action_logs_pkey PRIMARY KEY (id);


--
-- Name: actions actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: awards awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (id);


--
-- Name: beliefs beliefs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beliefs
    ADD CONSTRAINT beliefs_pkey PRIMARY KEY (id);


--
-- Name: benefits benefits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefits
    ADD CONSTRAINT benefits_pkey PRIMARY KEY (id);


--
-- Name: benefits_programs benefits_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefits_programs
    ADD CONSTRAINT benefits_programs_pkey PRIMARY KEY (id);


--
-- Name: broad_values broad_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broad_values
    ADD CONSTRAINT broad_values_pkey PRIMARY KEY (id);


--
-- Name: businesses businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);


--
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (id);


--
-- Name: characteristics characteristics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characteristics
    ADD CONSTRAINT characteristics_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: collection_opportunities collection_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_opportunities
    ADD CONSTRAINT collection_opportunities_pkey PRIMARY KEY (id);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: categories communities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities communities_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey1 PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: company_action_tags company_action_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_action_tags
    ADD CONSTRAINT company_action_tags_pkey PRIMARY KEY (id);


--
-- Name: company_addresses company_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_addresses
    ADD CONSTRAINT company_addresses_pkey PRIMARY KEY (id);


--
-- Name: company_api_integrations company_api_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_api_integrations
    ADD CONSTRAINT company_api_integrations_pkey PRIMARY KEY (id);


--
-- Name: company_collections company_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_collections
    ADD CONSTRAINT company_collections_pkey PRIMARY KEY (id);


--
-- Name: company_integration_field_columns company_integration_field_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_integration_field_columns
    ADD CONSTRAINT company_integration_field_columns_pkey PRIMARY KEY (id);


--
-- Name: company_integration_fields company_integration_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_integration_fields
    ADD CONSTRAINT company_integration_fields_pkey PRIMARY KEY (id);


--
-- Name: company_integration_statuses company_integration_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_integration_statuses
    ADD CONSTRAINT company_integration_statuses_pkey PRIMARY KEY (id);


--
-- Name: company_internal_recruitment_fields company_internal_recruitment_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_internal_recruitment_fields
    ADD CONSTRAINT company_internal_recruitment_fields_pkey PRIMARY KEY (id);


--
-- Name: company_internal_recruitments company_internal_recruitments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_internal_recruitments
    ADD CONSTRAINT company_internal_recruitments_pkey PRIMARY KEY (id);


--
-- Name: company_locations company_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_locations
    ADD CONSTRAINT company_locations_pkey PRIMARY KEY (id);


--
-- Name: company_messages_configurations company_messages_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_messages_configurations
    ADD CONSTRAINT company_messages_configurations_pkey PRIMARY KEY (id);


--
-- Name: company_messages company_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_messages
    ADD CONSTRAINT company_messages_pkey PRIMARY KEY (id);


--
-- Name: company_notification_configurations company_notification_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_notification_configurations
    ADD CONSTRAINT company_notification_configurations_pkey PRIMARY KEY (id);


--
-- Name: company_opportunity_areas company_opportunity_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_opportunity_areas
    ADD CONSTRAINT company_opportunity_areas_pkey PRIMARY KEY (id);


--
-- Name: company_opportunity_groups company_opportunity_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_opportunity_groups
    ADD CONSTRAINT company_opportunity_groups_pkey PRIMARY KEY (id);


--
-- Name: company_proportions company_proportions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_proportions
    ADD CONSTRAINT company_proportions_pkey PRIMARY KEY (id);


--
-- Name: company_sizes company_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_sizes
    ADD CONSTRAINT company_sizes_pkey PRIMARY KEY (id);


--
-- Name: company_token_apis company_token_apis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_token_apis
    ADD CONSTRAINT company_token_apis_pkey PRIMARY KEY (id);


--
-- Name: company_work_value_answers company_work_value_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_work_value_answers
    ADD CONSTRAINT company_work_value_answers_pkey PRIMARY KEY (id);


--
-- Name: company_work_value_details company_work_value_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_work_value_details
    ADD CONSTRAINT company_work_value_details_pkey PRIMARY KEY (id);


--
-- Name: company_work_value_points company_work_value_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_work_value_points
    ADD CONSTRAINT company_work_value_points_pkey PRIMARY KEY (id);


--
-- Name: compatible_relations compatible_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compatible_relations
    ADD CONSTRAINT compatible_relations_pkey PRIMARY KEY (id);


--
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: descriptions descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_pkey PRIMARY KEY (id);


--
-- Name: details details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.details
    ADD CONSTRAINT details_pkey PRIMARY KEY (id);


--
-- Name: disabilities disabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disabilities
    ADD CONSTRAINT disabilities_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: domain_api_configurations domain_api_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain_api_configurations
    ADD CONSTRAINT domain_api_configurations_pkey PRIMARY KEY (id);


--
-- Name: dream_jobs dream_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dream_jobs
    ADD CONSTRAINT dream_jobs_pkey PRIMARY KEY (id);


--
-- Name: ecosystems ecosystems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecosystems
    ADD CONSTRAINT ecosystems_pkey PRIMARY KEY (id);


--
-- Name: evaluations evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluations
    ADD CONSTRAINT evaluations_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: extra_jobs extra_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.extra_jobs
    ADD CONSTRAINT extra_jobs_pkey PRIMARY KEY (id);


--
-- Name: feature_action_user_vieweds feature_action_user_vieweds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_action_user_vieweds
    ADD CONSTRAINT feature_action_user_vieweds_pkey PRIMARY KEY (id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- Name: file_integration_emails file_integration_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_integration_emails
    ADD CONSTRAINT file_integration_emails_pkey PRIMARY KEY (id);


--
-- Name: filters filters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filters
    ADD CONSTRAINT filters_pkey PRIMARY KEY (id);


--
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: geolocations geolocations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geolocations
    ADD CONSTRAINT geolocations_pkey PRIMARY KEY (id);


--
-- Name: global_profile_statuses global_profile_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_profile_statuses
    ADD CONSTRAINT global_profile_statuses_pkey PRIMARY KEY (id);


--
-- Name: group_collections group_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_collections
    ADD CONSTRAINT group_collections_pkey PRIMARY KEY (id);


--
-- Name: group_filters group_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_filters
    ADD CONSTRAINT group_filters_pkey PRIMARY KEY (id);


--
-- Name: group_group_question_permissions group_group_question_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_group_question_permissions
    ADD CONSTRAINT group_group_question_permissions_pkey PRIMARY KEY (id);


--
-- Name: group_integrations group_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_integrations
    ADD CONSTRAINT group_integrations_pkey PRIMARY KEY (id);


--
-- Name: group_opportunities group_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_opportunities
    ADD CONSTRAINT group_opportunities_pkey PRIMARY KEY (id);


--
-- Name: group_permissions group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_permissions
    ADD CONSTRAINT group_permissions_pkey PRIMARY KEY (id);


--
-- Name: group_presential_event_permissions group_presential_event_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_presential_event_permissions
    ADD CONSTRAINT group_presential_event_permissions_pkey PRIMARY KEY (id);


--
-- Name: group_question_permissions group_question_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_question_permissions
    ADD CONSTRAINT group_question_permissions_pkey PRIMARY KEY (id);


--
-- Name: group_questions group_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_questions
    ADD CONSTRAINT group_questions_pkey PRIMARY KEY (id);


--
-- Name: group_requirements group_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_requirements
    ADD CONSTRAINT group_requirements_pkey PRIMARY KEY (id);


--
-- Name: group_requisition_permissions group_requisition_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_requisition_permissions
    ADD CONSTRAINT group_requisition_permissions_pkey PRIMARY KEY (id);


--
-- Name: group_template_permissions group_template_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_template_permissions
    ADD CONSTRAINT group_template_permissions_pkey PRIMARY KEY (id);


--
-- Name: group_templates group_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_templates
    ADD CONSTRAINT group_templates_pkey PRIMARY KEY (id);


--
-- Name: group_users group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_users
    ADD CONSTRAINT group_users_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: header_tests header_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.header_tests
    ADD CONSTRAINT header_tests_pkey PRIMARY KEY (id);


--
-- Name: health_checks health_checks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.health_checks
    ADD CONSTRAINT health_checks_pkey PRIMARY KEY (id);


--
-- Name: highlights highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.highlights
    ADD CONSTRAINT highlights_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: incompleted_subscriptions incompleted_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incompleted_subscriptions
    ADD CONSTRAINT incompleted_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: indication_domains indication_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indication_domains
    ADD CONSTRAINT indication_domains_pkey PRIMARY KEY (id);


--
-- Name: installments installments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.installments
    ADD CONSTRAINT installments_pkey PRIMARY KEY (id);


--
-- Name: institutions institutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (id);


--
-- Name: interviewer_candidates interviewer_candidates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interviewer_candidates
    ADD CONSTRAINT interviewer_candidates_pkey PRIMARY KEY (id);


--
-- Name: interviewers interviewers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interviewers
    ADD CONSTRAINT interviewers_pkey PRIMARY KEY (id);


--
-- Name: job_boards_opportunities job_boards_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_boards_opportunities
    ADD CONSTRAINT job_boards_opportunities_pkey PRIMARY KEY (id);


--
-- Name: job_boards job_boards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_boards
    ADD CONSTRAINT job_boards_pkey PRIMARY KEY (id);


--
-- Name: opportunity_categories job_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_categories
    ADD CONSTRAINT job_categories_pkey PRIMARY KEY (id);


--
-- Name: job_categories job_categories_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_categories
    ADD CONSTRAINT job_categories_pkey1 PRIMARY KEY (id);


--
-- Name: job_feedback_opportunities job_feedback_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_feedback_opportunities
    ADD CONSTRAINT job_feedback_opportunities_pkey PRIMARY KEY (id);


--
-- Name: opportunity_levels job_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_levels
    ADD CONSTRAINT job_levels_pkey PRIMARY KEY (id);


--
-- Name: opportunities jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunities
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey1 PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: log_integration_files log_integration_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_integration_files
    ADD CONSTRAINT log_integration_files_pkey PRIMARY KEY (id);


--
-- Name: log_opportunity_statuses log_opportunity_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_opportunity_statuses
    ADD CONSTRAINT log_opportunity_statuses_pkey PRIMARY KEY (id);


--
-- Name: log_update_profiles log_update_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_update_profiles
    ADD CONSTRAINT log_update_profiles_pkey PRIMARY KEY (id);


--
-- Name: managers managers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: mentions mentions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentions
    ADD CONSTRAINT mentions_pkey PRIMARY KEY (id);


--
-- Name: message_contents message_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message_contents
    ADD CONSTRAINT message_contents_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: new_order_details new_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_order_details
    ADD CONSTRAINT new_order_details_pkey PRIMARY KEY (id);


--
-- Name: new_orders new_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_orders
    ADD CONSTRAINT new_orders_pkey PRIMARY KEY (id);


--
-- Name: opportunity_action_tags opportunity_action_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_action_tags
    ADD CONSTRAINT opportunity_action_tags_pkey PRIMARY KEY (id);


--
-- Name: opportunity_areas opportunity_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_areas
    ADD CONSTRAINT opportunity_areas_pkey PRIMARY KEY (id);


--
-- Name: opportunity_configurations opportunity_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_configurations
    ADD CONSTRAINT opportunity_configurations_pkey PRIMARY KEY (id);


--
-- Name: opportunity_email_messages opportunity_email_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_email_messages
    ADD CONSTRAINT opportunity_email_messages_pkey PRIMARY KEY (id);


--
-- Name: opportunity_integration_statuses opportunity_integration_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_integration_statuses
    ADD CONSTRAINT opportunity_integration_statuses_pkey PRIMARY KEY (id);


--
-- Name: opportunity_opinion_types opportunity_opinion_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_opinion_types
    ADD CONSTRAINT opportunity_opinion_types_pkey PRIMARY KEY (id);


--
-- Name: opportunity_params opportunity_params_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_params
    ADD CONSTRAINT opportunity_params_pkey PRIMARY KEY (id);


--
-- Name: opportunity_recommendations opportunity_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_recommendations
    ADD CONSTRAINT opportunity_recommendations_pkey PRIMARY KEY (id);


--
-- Name: opportunity_statuses opportunity_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_statuses
    ADD CONSTRAINT opportunity_statuses_pkey PRIMARY KEY (id);


--
-- Name: opportunity_tests opportunity_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_tests
    ADD CONSTRAINT opportunity_tests_pkey PRIMARY KEY (id);


--
-- Name: opportunity_viewers opportunity_viewers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_viewers
    ADD CONSTRAINT opportunity_viewers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: origin_page_views origin_page_views_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.origin_page_views
    ADD CONSTRAINT origin_page_views_pkey PRIMARY KEY (id);


--
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- Name: partner_integrations partner_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_integrations
    ADD CONSTRAINT partner_integrations_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: permitted_domain_emails permitted_domain_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permitted_domain_emails
    ADD CONSTRAINT permitted_domain_emails_pkey PRIMARY KEY (id);


--
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- Name: plan_group_features plan_group_features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_group_features
    ADD CONSTRAINT plan_group_features_pkey PRIMARY KEY (id);


--
-- Name: plan_groups plan_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_groups
    ADD CONSTRAINT plan_groups_pkey PRIMARY KEY (id);


--
-- Name: plan_installments plan_installments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plan_installments
    ADD CONSTRAINT plan_installments_pkey PRIMARY KEY (id);


--
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: pre_subscriptions pre_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_subscriptions
    ADD CONSTRAINT pre_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: predispositions predispositions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predispositions
    ADD CONSTRAINT predispositions_pkey PRIMARY KEY (id);


--
-- Name: presential_event_addresses presential_event_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_addresses
    ADD CONSTRAINT presential_event_addresses_pkey PRIMARY KEY (id);


--
-- Name: presential_event_notifications presential_event_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_notifications
    ADD CONSTRAINT presential_event_notifications_pkey PRIMARY KEY (id);


--
-- Name: presential_event_rooms presential_event_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_rooms
    ADD CONSTRAINT presential_event_rooms_pkey PRIMARY KEY (id);


--
-- Name: presential_event_schedules presential_event_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_schedules
    ADD CONSTRAINT presential_event_schedules_pkey PRIMARY KEY (id);


--
-- Name: presential_event_users presential_event_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_users
    ADD CONSTRAINT presential_event_users_pkey PRIMARY KEY (id);


--
-- Name: presential_events presential_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_events
    ADD CONSTRAINT presential_events_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: profile_questions_to_updates profile_questions_to_updates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile_questions_to_updates
    ADD CONSTRAINT profile_questions_to_updates_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: programs_categories programs_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs_categories
    ADD CONSTRAINT programs_categories_pkey PRIMARY KEY (id);


--
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: recommendations recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (id);


--
-- Name: redactor_assets redactor_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redactor_assets
    ADD CONSTRAINT redactor_assets_pkey PRIMARY KEY (id);


--
-- Name: requirement_types requirement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirement_types
    ADD CONSTRAINT requirement_types_pkey PRIMARY KEY (id);


--
-- Name: requirements requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);


--
-- Name: requisition_area_approvers requisition_area_approvers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisition_area_approvers
    ADD CONSTRAINT requisition_area_approvers_pkey PRIMARY KEY (id);


--
-- Name: requisition_areas requisition_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisition_areas
    ADD CONSTRAINT requisition_areas_pkey PRIMARY KEY (id);


--
-- Name: requisition_fields requisition_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisition_fields
    ADD CONSTRAINT requisition_fields_pkey PRIMARY KEY (id);


--
-- Name: requisition_workflows requisition_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisition_workflows
    ADD CONSTRAINT requisition_workflows_pkey PRIMARY KEY (id);


--
-- Name: requisitions requisitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisitions
    ADD CONSTRAINT requisitions_pkey PRIMARY KEY (id);


--
-- Name: revenues revenues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenues
    ADD CONSTRAINT revenues_pkey PRIMARY KEY (id);


--
-- Name: satisfaction_survey_answers satisfaction_survey_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satisfaction_survey_answers
    ADD CONSTRAINT satisfaction_survey_answers_pkey PRIMARY KEY (id);


--
-- Name: satisfaction_surveys satisfaction_surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satisfaction_surveys
    ADD CONSTRAINT satisfaction_surveys_pkey PRIMARY KEY (id);


--
-- Name: saved_requirements saved_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_requirements
    ADD CONSTRAINT saved_requirements_pkey PRIMARY KEY (id);


--
-- Name: sectors sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sectors
    ADD CONSTRAINT sectors_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: source_tests source_tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_tests
    ADD CONSTRAINT source_tests_pkey PRIMARY KEY (id);


--
-- Name: stages stages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stages
    ADD CONSTRAINT stages_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: statistics statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistics
    ADD CONSTRAINT statistics_pkey PRIMARY KEY (id);


--
-- Name: steps steps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (id);


--
-- Name: subscription_questions subscription_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_questions
    ADD CONSTRAINT subscription_questions_pkey PRIMARY KEY (id);


--
-- Name: subscription_sources subscription_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_sources
    ADD CONSTRAINT subscription_sources_pkey PRIMARY KEY (id);


--
-- Name: suggestions suggestions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggestions
    ADD CONSTRAINT suggestions_pkey PRIMARY KEY (id);


--
-- Name: template_messages template_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_messages
    ADD CONSTRAINT template_messages_pkey PRIMARY KEY (id);


--
-- Name: terms_of_use_by_ninenine_jobs terms_of_use_by_ninenine_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_of_use_by_ninenine_jobs
    ADD CONSTRAINT terms_of_use_by_ninenine_jobs_pkey PRIMARY KEY (id);


--
-- Name: terms_of_use_by_sources terms_of_use_by_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_of_use_by_sources
    ADD CONSTRAINT terms_of_use_by_sources_pkey PRIMARY KEY (id);


--
-- Name: test_token_apis test_token_apis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test_token_apis
    ADD CONSTRAINT test_token_apis_pkey PRIMARY KEY (id);


--
-- Name: tracking_pixels tracking_pixels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_pixels
    ADD CONSTRAINT tracking_pixels_pkey PRIMARY KEY (id);


--
-- Name: tracking_providers tracking_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracking_providers
    ADD CONSTRAINT tracking_providers_pkey PRIMARY KEY (id);


--
-- Name: trend_attitudes trend_attitudes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trend_attitudes
    ADD CONSTRAINT trend_attitudes_pkey PRIMARY KEY (id);


--
-- Name: trigger_types trigger_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trigger_types
    ADD CONSTRAINT trigger_types_pkey PRIMARY KEY (id);


--
-- Name: triggers triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.triggers
    ADD CONSTRAINT triggers_pkey PRIMARY KEY (id);


--
-- Name: user_accesses user_accesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accesses
    ADD CONSTRAINT user_accesses_pkey PRIMARY KEY (id);


--
-- Name: user_group_question_permissions user_group_question_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_question_permissions
    ADD CONSTRAINT user_group_question_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_permissions user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_presential_event_permissions user_presential_event_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_presential_event_permissions
    ADD CONSTRAINT user_presential_event_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_question_permissions user_question_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_question_permissions
    ADD CONSTRAINT user_question_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_requisition_permissions user_requisition_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_requisition_permissions
    ADD CONSTRAINT user_requisition_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_template_permissions user_template_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_template_permissions
    ADD CONSTRAINT user_template_permissions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: work_environments work_environments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_environments
    ADD CONSTRAINT work_environments_pkey PRIMARY KEY (id);


--
-- Name: work_value_details work_value_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.work_value_details
    ADD CONSTRAINT work_value_details_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX delayed_jobs_priority ON public.delayed_jobs USING btree (priority, run_at);


--
-- Name: idx_redactor_assetable; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_redactor_assetable ON public.redactor_assets USING btree (assetable_type, assetable_id);


--
-- Name: idx_redactor_assetable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_redactor_assetable_type ON public.redactor_assets USING btree (assetable_type, type, assetable_id);


--
-- Name: index_abandonments_on_reason; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_abandonments_on_reason ON public.abandonments USING btree (reason);


--
-- Name: index_accept_terms_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_accept_terms_on_company_id ON public.accept_terms USING btree (company_id);


--
-- Name: index_accept_terms_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_accept_terms_on_user_id ON public.accept_terms USING btree (user_id);


--
-- Name: index_action_logs_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_action_logs_on_user_id ON public.action_logs USING btree (user_id);


--
-- Name: index_actions_on_feature_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_actions_on_feature_id ON public.actions USING btree (feature_id);


--
-- Name: index_actions_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_actions_on_id ON public.actions USING btree (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_addresses_on_city; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_addresses_on_city ON public.addresses USING btree (city);


--
-- Name: index_addresses_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_addresses_on_country_id ON public.addresses USING btree (country_id);


--
-- Name: index_addresses_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_addresses_on_id ON public.addresses USING btree (id);


--
-- Name: index_addresses_on_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_addresses_on_state_id ON public.addresses USING btree (state_id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_admins_on_email ON public.admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON public.admins USING btree (reset_password_token);


--
-- Name: index_areas_on_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_areas_on_program_id ON public.areas USING btree (program_id);


--
-- Name: index_awards_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_awards_on_company_id ON public.awards USING btree (company_id);


--
-- Name: index_beliefs_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_beliefs_on_company_id ON public.beliefs USING btree (company_id);


--
-- Name: index_benefits_opportunities_on_benefit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_benefits_opportunities_on_benefit_id ON public.benefits_opportunities USING btree (benefit_id);


--
-- Name: index_benefits_opportunities_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_benefits_opportunities_on_opportunity_id ON public.benefits_opportunities USING btree (opportunity_id);


--
-- Name: index_benefits_programs_on_benefit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_benefits_programs_on_benefit_id ON public.benefits_programs USING btree (benefit_id);


--
-- Name: index_benefits_programs_on_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_benefits_programs_on_program_id ON public.benefits_programs USING btree (program_id);


--
-- Name: index_broad_values_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_broad_values_on_name ON public.broad_values USING btree (name);


--
-- Name: index_businesses_on_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_businesses_on_program_id ON public.businesses USING btree (program_id);


--
-- Name: index_campus_on_institution_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_campus_on_institution_id ON public.campus USING btree (institution_id);


--
-- Name: index_categories_sectors_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_categories_sectors_on_category_id ON public.categories_sectors USING btree (category_id);


--
-- Name: index_categories_sectors_on_sector_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_categories_sectors_on_sector_id ON public.categories_sectors USING btree (sector_id);


--
-- Name: index_characteristics_on_benefits; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_characteristics_on_benefits ON public.characteristics USING btree (benefits);


--
-- Name: index_characteristics_on_leadership; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_characteristics_on_leadership ON public.characteristics USING btree (leadership);


--
-- Name: index_characteristics_on_opportunities; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_characteristics_on_opportunities ON public.characteristics USING btree (opportunities);


--
-- Name: index_characteristics_on_organization_values; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_characteristics_on_organization_values ON public.characteristics USING btree (organization_values);


--
-- Name: index_characteristics_on_work_life_balance; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_characteristics_on_work_life_balance ON public.characteristics USING btree (work_life_balance);


--
-- Name: index_collection_opportunities_on_collection_and_opportunity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_collection_opportunities_on_collection_and_opportunity ON public.collection_opportunities USING btree (company_collection_id, opportunity_id);


--
-- Name: index_collection_opportunities_on_company_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_collection_opportunities_on_company_collection_id ON public.collection_opportunities USING btree (company_collection_id);


--
-- Name: index_collection_opportunities_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_collection_opportunities_on_opportunity_id ON public.collection_opportunities USING btree (opportunity_id);


--
-- Name: index_collections_companies_on_collection_id_and_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_collections_companies_on_collection_id_and_company_id ON public.collections_companies USING btree (collection_id, company_id);


--
-- Name: index_collections_companies_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_collections_companies_on_company_id ON public.collections_companies USING btree (company_id);


--
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_author_id ON public.comments USING btree (author_id);


--
-- Name: index_comments_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_order_id ON public.comments USING btree (order_id);


--
-- Name: index_companies_on_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_address_id ON public.companies USING btree (address_id);


--
-- Name: index_companies_on_characteristic_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_characteristic_id ON public.companies USING btree (characteristic_id);


--
-- Name: index_companies_on_document; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_companies_on_document ON public.companies USING btree (document);


--
-- Name: index_companies_on_featured; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_featured ON public.companies USING btree (featured);


--
-- Name: index_companies_on_revenue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_revenue_id ON public.companies USING btree (revenue_id);


--
-- Name: index_companies_on_sector_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_sector_id ON public.companies USING btree (sector_id);


--
-- Name: index_companies_on_size_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_size_id ON public.companies USING btree (size_id);


--
-- Name: index_companies_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_slug ON public.companies USING btree (slug);


--
-- Name: index_companies_on_visit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_visit_id ON public.companies USING btree (visit_id);


--
-- Name: index_companies_on_work_environment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_on_work_environment_id ON public.companies USING btree (work_environment_id);


--
-- Name: index_companies_sectors_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_sectors_on_company_id ON public.companies_sectors USING btree (company_id);


--
-- Name: index_companies_sectors_on_sector_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_companies_sectors_on_sector_id ON public.companies_sectors USING btree (sector_id);


--
-- Name: index_company_action_tags_on_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_action_tags_on_action ON public.company_action_tags USING btree (action);


--
-- Name: index_company_action_tags_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_action_tags_on_company_id ON public.company_action_tags USING btree (company_id);


--
-- Name: index_company_addresses_on_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_addresses_on_address_id ON public.company_addresses USING btree (address_id);


--
-- Name: index_company_addresses_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_addresses_on_company_id ON public.company_addresses USING btree (company_id);


--
-- Name: index_company_api_integrations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_api_integrations_on_company_id ON public.company_api_integrations USING btree (company_id);


--
-- Name: index_company_api_integrations_on_company_slug_environment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_api_integrations_on_company_slug_environment ON public.company_api_integrations USING btree (company_id, slug, environment);


--
-- Name: index_company_api_integrations_on_environment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_api_integrations_on_environment ON public.company_api_integrations USING btree (environment);


--
-- Name: index_company_api_integrations_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_api_integrations_on_slug ON public.company_api_integrations USING btree (slug);


--
-- Name: index_company_collections_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_collections_on_company_id ON public.company_collections USING btree (company_id);


--
-- Name: index_company_collections_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_collections_on_slug ON public.company_collections USING btree (slug);


--
-- Name: index_company_fields_on_required_in_cand_status_api; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_fields_on_required_in_cand_status_api ON public.company_integration_fields USING btree (required_in_candidate_status_api);


--
-- Name: index_company_integration_field_columns_on_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_active ON public.company_integration_field_columns USING btree (active);


--
-- Name: index_company_integration_field_columns_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_company_id ON public.company_integration_field_columns USING btree (company_id);


--
-- Name: index_company_integration_field_columns_on_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_created_at ON public.company_integration_field_columns USING btree (created_at);


--
-- Name: index_company_integration_field_columns_on_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_created_by ON public.company_integration_field_columns USING btree (created_by);


--
-- Name: index_company_integration_field_columns_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_deleted_at ON public.company_integration_field_columns USING btree (deleted_at);


--
-- Name: index_company_integration_field_columns_on_deleted_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_deleted_by ON public.company_integration_field_columns USING btree (deleted_by);


--
-- Name: index_company_integration_field_columns_on_domain_reference_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_domain_reference_id ON public.company_integration_field_columns USING btree (domain_reference_id);


--
-- Name: index_company_integration_field_columns_on_label; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_label ON public.company_integration_field_columns USING btree (label);


--
-- Name: index_company_integration_field_columns_on_match_field; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_match_field ON public.company_integration_field_columns USING btree (match_field);


--
-- Name: index_company_integration_field_columns_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_slug ON public.company_integration_field_columns USING btree (slug);


--
-- Name: index_company_integration_field_columns_on_type_of_column; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_type_of_column ON public.company_integration_field_columns USING btree (type_of_column);


--
-- Name: index_company_integration_field_columns_on_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_updated_at ON public.company_integration_field_columns USING btree (updated_at);


--
-- Name: index_company_integration_field_columns_on_updated_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_field_columns_on_updated_by ON public.company_integration_field_columns USING btree (updated_by);


--
-- Name: index_company_integration_fields_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_fields_on_company_id ON public.company_integration_fields USING btree (company_id);


--
-- Name: index_company_integration_fields_on_field; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_fields_on_field ON public.company_integration_fields USING btree (field);


--
-- Name: index_company_integration_fields_on_required_in_publish_api; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_fields_on_required_in_publish_api ON public.company_integration_fields USING btree (required_in_publish_api);


--
-- Name: index_company_integration_statuses_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_statuses_on_company_id ON public.company_integration_statuses USING btree (company_id);


--
-- Name: index_company_integration_statuses_on_move_candidate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_statuses_on_move_candidate ON public.company_integration_statuses USING btree (move_candidate);


--
-- Name: index_company_integration_statuses_on_move_next_candidate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_statuses_on_move_next_candidate ON public.company_integration_statuses USING btree (move_next_candidate);


--
-- Name: index_company_integration_statuses_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_integration_statuses_on_slug ON public.company_integration_statuses USING btree (slug);


--
-- Name: index_company_internal_recruitment_fields_on_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_active ON public.company_internal_recruitment_fields USING btree (active);


--
-- Name: index_company_internal_recruitment_fields_on_can_edit; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_can_edit ON public.company_internal_recruitment_fields USING btree (can_edit);


--
-- Name: index_company_internal_recruitment_fields_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_company_id ON public.company_internal_recruitment_fields USING btree (company_id);


--
-- Name: index_company_internal_recruitment_fields_on_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_created_at ON public.company_internal_recruitment_fields USING btree (created_at);


--
-- Name: index_company_internal_recruitment_fields_on_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_created_by ON public.company_internal_recruitment_fields USING btree (created_by);


--
-- Name: index_company_internal_recruitment_fields_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_deleted_at ON public.company_internal_recruitment_fields USING btree (deleted_at);


--
-- Name: index_company_internal_recruitment_fields_on_deleted_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_deleted_by ON public.company_internal_recruitment_fields USING btree (deleted_by);


--
-- Name: index_company_internal_recruitment_fields_on_eligibility_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_eligibility_type ON public.company_internal_recruitment_fields USING btree (eligibility_type);


--
-- Name: index_company_internal_recruitment_fields_on_is_eligibility; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_is_eligibility ON public.company_internal_recruitment_fields USING btree (is_eligibility);


--
-- Name: index_company_internal_recruitment_fields_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_name ON public.company_internal_recruitment_fields USING btree (name);


--
-- Name: index_company_internal_recruitment_fields_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_slug ON public.company_internal_recruitment_fields USING btree (slug);


--
-- Name: index_company_internal_recruitment_fields_on_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_updated_at ON public.company_internal_recruitment_fields USING btree (updated_at);


--
-- Name: index_company_internal_recruitment_fields_on_updated_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitment_fields_on_updated_by ON public.company_internal_recruitment_fields USING btree (updated_by);


--
-- Name: index_company_internal_recruitments_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitments_on_company_id ON public.company_internal_recruitments USING btree (company_id);


--
-- Name: index_company_internal_recruitments_on_domains; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitments_on_domains ON public.company_internal_recruitments USING btree (domains);


--
-- Name: index_company_internal_recruitments_on_login_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitments_on_login_type ON public.company_internal_recruitments USING btree (login_type);


--
-- Name: index_company_internal_recruitments_on_specific_domains; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_internal_recruitments_on_specific_domains ON public.company_internal_recruitments USING btree (specific_domains);


--
-- Name: index_company_locations_on_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_locations_on_program_id ON public.company_locations USING btree (program_id);


--
-- Name: index_company_locations_on_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_locations_on_state_id ON public.company_locations USING btree (state_id);


--
-- Name: index_company_messages_configurations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_messages_configurations_on_company_id ON public.company_messages_configurations USING btree (company_id);


--
-- Name: index_company_messages_configurations_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_messages_configurations_on_status ON public.company_messages_configurations USING btree (status);


--
-- Name: index_company_messages_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_messages_on_company_id ON public.company_messages USING btree (company_id);


--
-- Name: index_company_messages_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_messages_on_slug ON public.company_messages USING btree (slug);


--
-- Name: index_company_notification_configurations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_notification_configurations_on_company_id ON public.company_notification_configurations USING btree (company_id);


--
-- Name: index_company_notification_configurations_on_days; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_notification_configurations_on_days ON public.company_notification_configurations USING btree (days);


--
-- Name: index_company_notification_configurations_on_schedule; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_notification_configurations_on_schedule ON public.company_notification_configurations USING btree (schedule);


--
-- Name: index_company_notification_configurations_on_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_notification_configurations_on_scope ON public.company_notification_configurations USING btree (scope);


--
-- Name: index_company_notification_configurations_on_source; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_notification_configurations_on_source ON public.company_notification_configurations USING btree (source);


--
-- Name: index_company_opportunity_areas_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_opportunity_areas_on_company_id ON public.company_opportunity_areas USING btree (company_id);


--
-- Name: index_company_opportunity_areas_on_opportunity_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_opportunity_areas_on_opportunity_area_id ON public.company_opportunity_areas USING btree (opportunity_area_id);


--
-- Name: index_company_opportunity_groups_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_opportunity_groups_on_company_id ON public.company_opportunity_groups USING btree (company_id);


--
-- Name: index_company_sizes_on_proportion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_sizes_on_proportion_id ON public.company_sizes USING btree (proportion_id);


--
-- Name: index_company_token_apis_on_company_id_and_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_token_apis_on_company_id_and_token ON public.company_token_apis USING btree (company_id, token);


--
-- Name: index_company_work_value_answers_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_work_value_answers_on_company_id ON public.company_work_value_answers USING btree (company_id);


--
-- Name: index_company_work_value_details_on_company_work_value_point_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_work_value_details_on_company_work_value_point_id ON public.company_work_value_details USING btree (company_work_value_point_id);


--
-- Name: index_company_work_value_details_on_persona_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_company_work_value_details_on_persona_id ON public.company_work_value_details USING btree (persona_id);


--
-- Name: index_compatible_relations_on_compatible_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_compatible_relations_on_compatible_id ON public.compatible_relations USING btree (compatible_id);


--
-- Name: index_compatible_relations_on_compatible_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_compatible_relations_on_compatible_type ON public.compatible_relations USING btree (compatible_type);


--
-- Name: index_compatible_relations_on_ecosystem_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_compatible_relations_on_ecosystem_id ON public.compatible_relations USING btree (ecosystem_id);


--
-- Name: index_conversations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_company_id ON public.conversations USING btree (company_id);


--
-- Name: index_conversations_on_manager_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_manager_id ON public.conversations USING btree (manager_id);


--
-- Name: index_conversations_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_opportunity_id ON public.conversations USING btree (opportunity_id);


--
-- Name: index_conversations_on_send_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_send_by ON public.conversations USING btree (send_by);


--
-- Name: index_conversations_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_slug ON public.conversations USING btree (slug);


--
-- Name: index_conversations_on_user_cellphone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_user_cellphone ON public.conversations USING btree (user_cellphone);


--
-- Name: index_conversations_on_user_cpf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_user_cpf ON public.conversations USING btree (user_cpf);


--
-- Name: index_conversations_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_user_id ON public.conversations USING btree (user_id);


--
-- Name: index_courses_on_level; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_courses_on_level ON public.courses USING btree (level);


--
-- Name: index_cp_work_value_answers_on_company_work_value_detail_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_cp_work_value_answers_on_company_work_value_detail_id ON public.company_work_value_answers USING btree (company_id);


--
-- Name: index_descriptions_on_describable_type_and_describable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_descriptions_on_describable_type_and_describable_id ON public.descriptions USING btree (describable_type, describable_id);


--
-- Name: index_details_on_detailable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_details_on_detailable_id ON public.details USING btree (detailable_id);


--
-- Name: index_documents_on_documentable_type_and_documentable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_documents_on_documentable_type_and_documentable_id ON public.documents USING btree (documentable_type, documentable_id);


--
-- Name: index_documents_on_secure_random; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_documents_on_secure_random ON public.documents USING btree (secure_random);


--
-- Name: index_domain_api_configurations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_domain_api_configurations_on_company_id ON public.domain_api_configurations USING btree (company_id);


--
-- Name: index_domain_api_configurations_on_company_integration_field_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_domain_api_configurations_on_company_integration_field_id ON public.domain_api_configurations USING btree (company_integration_field_id);


--
-- Name: index_domain_api_configurations_on_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_domain_api_configurations_on_created_at ON public.domain_api_configurations USING btree (created_at);


--
-- Name: index_domain_api_configurations_on_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_domain_api_configurations_on_created_by ON public.domain_api_configurations USING btree (created_by);


--
-- Name: index_domain_api_configurations_on_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_domain_api_configurations_on_updated_at ON public.domain_api_configurations USING btree (updated_at);


--
-- Name: index_domain_api_configurations_on_updated_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_domain_api_configurations_on_updated_by ON public.domain_api_configurations USING btree (updated_by);


--
-- Name: index_dream_jobs_on_city; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dream_jobs_on_city ON public.dream_jobs USING btree (city);


--
-- Name: index_dream_jobs_on_opportunity_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dream_jobs_on_opportunity_category_id ON public.dream_jobs USING btree (opportunity_category_id);


--
-- Name: index_dream_jobs_on_opportunity_level_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dream_jobs_on_opportunity_level_id ON public.dream_jobs USING btree (opportunity_level_id);


--
-- Name: index_dream_jobs_on_proportion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dream_jobs_on_proportion_id ON public.dream_jobs USING btree (proportion_id);


--
-- Name: index_dream_jobs_on_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dream_jobs_on_state_id ON public.dream_jobs USING btree (state_id);


--
-- Name: index_dream_jobs_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dream_jobs_on_user_id ON public.dream_jobs USING btree (user_id);


--
-- Name: index_dream_jobs_on_work_environment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_dream_jobs_on_work_environment_id ON public.dream_jobs USING btree (work_environment_id);


--
-- Name: index_ecosystems_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ecosystems_on_name ON public.ecosystems USING btree (name);


--
-- Name: index_evaluations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_evaluations_on_company_id ON public.evaluations USING btree (company_id);


--
-- Name: index_evaluations_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_evaluations_on_user_id ON public.evaluations USING btree (user_id);


--
-- Name: index_events_on_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_events_on_address_id ON public.events USING btree (address_id);


--
-- Name: index_events_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_events_on_company_id ON public.events USING btree (company_id);


--
-- Name: index_events_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_events_on_slug ON public.events USING btree (slug);


--
-- Name: index_events_on_visit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_events_on_visit_id ON public.events USING btree (visit_id);


--
-- Name: index_extra_jobs_on_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_extra_jobs_on_job_id ON public.extra_jobs USING btree (job_id);


--
-- Name: index_extra_jobs_orders_on_extra_job_id_and_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_extra_jobs_orders_on_extra_job_id_and_order_id ON public.extra_jobs_orders USING btree (extra_job_id, order_id);


--
-- Name: index_feature_action_user_vieweds_on_action_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_feature_action_user_vieweds_on_action_id ON public.feature_action_user_vieweds USING btree (action_id);


--
-- Name: index_feature_action_user_vieweds_on_feature_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_feature_action_user_vieweds_on_feature_id ON public.feature_action_user_vieweds USING btree (feature_id);


--
-- Name: index_feature_action_user_vieweds_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_feature_action_user_vieweds_on_user_id ON public.feature_action_user_vieweds USING btree (user_id);


--
-- Name: index_features_plans_on_feature_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_features_plans_on_feature_id ON public.features_plans USING btree (feature_id);


--
-- Name: index_features_plans_on_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_features_plans_on_plan_id ON public.features_plans USING btree (plan_id);


--
-- Name: index_file_integration_emails_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_file_integration_emails_on_company_id ON public.file_integration_emails USING btree (company_id);


--
-- Name: index_file_integration_emails_on_file; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_file_integration_emails_on_file ON public.file_integration_emails USING btree (file);


--
-- Name: index_file_integration_emails_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_file_integration_emails_on_opportunity_id ON public.file_integration_emails USING btree (opportunity_id);


--
-- Name: index_file_integration_emails_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_file_integration_emails_on_status ON public.file_integration_emails USING btree (status);


--
-- Name: index_file_integration_emails_on_type_of_file; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_file_integration_emails_on_type_of_file ON public.file_integration_emails USING btree (type_of_file);


--
-- Name: index_filters_on_group_filter_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_filters_on_group_filter_id ON public.filters USING btree (group_filter_id);


--
-- Name: index_filters_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_filters_on_name ON public.filters USING btree (name);


--
-- Name: index_filters_on_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_filters_on_order ON public.filters USING btree ("order");


--
-- Name: index_filters_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_filters_on_slug ON public.filters USING btree (slug);


--
-- Name: index_followers_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_followers_on_company_id ON public.followers USING btree (company_id);


--
-- Name: index_followers_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_followers_on_user_id ON public.followers USING btree (user_id);


--
-- Name: index_geolocations_on_complete_address; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_geolocations_on_complete_address ON public.geolocations USING btree (street, number, neighborhood, city, state);


--
-- Name: index_geolocations_on_zipcode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_geolocations_on_zipcode ON public.geolocations USING btree (zipcode);


--
-- Name: index_global_profile_statuses_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_global_profile_statuses_on_company_id ON public.global_profile_statuses USING btree (company_id);


--
-- Name: index_global_profile_statuses_on_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_global_profile_statuses_on_default ON public.global_profile_statuses USING btree ("default");


--
-- Name: index_global_profile_statuses_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_global_profile_statuses_on_name ON public.global_profile_statuses USING btree (name);


--
-- Name: index_global_profile_statuses_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_global_profile_statuses_on_slug ON public.global_profile_statuses USING btree (slug);


--
-- Name: index_group_collections_on_company_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_collections_on_company_collection_id ON public.group_collections USING btree (company_collection_id);


--
-- Name: index_group_collections_on_group_company_collection; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_collections_on_group_company_collection ON public.group_collections USING btree (group_id, company_collection_id);


--
-- Name: index_group_collections_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_collections_on_group_id ON public.group_collections USING btree (group_id);


--
-- Name: index_group_event_permissions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_event_permissions ON public.group_presential_event_permissions USING btree (group_id, presential_event_id);


--
-- Name: index_group_filters_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_filters_on_name ON public.group_filters USING btree (name);


--
-- Name: index_group_filters_on_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_filters_on_order ON public.group_filters USING btree ("order");


--
-- Name: index_group_filters_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_filters_on_slug ON public.group_filters USING btree (slug);


--
-- Name: index_group_group_question_permissions_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_group_question_permissions_on_group_id ON public.group_group_question_permissions USING btree (group_id);


--
-- Name: index_group_group_question_permissions_on_group_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_group_question_permissions_on_group_question_id ON public.group_group_question_permissions USING btree (group_question_id);


--
-- Name: index_group_integrations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_integrations_on_company_id ON public.group_integrations USING btree (company_id);


--
-- Name: index_group_integrations_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_integrations_on_group_id ON public.group_integrations USING btree (group_id);


--
-- Name: index_group_integrations_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_integrations_on_name ON public.group_integrations USING btree (name);


--
-- Name: index_group_integrations_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_integrations_on_slug ON public.group_integrations USING btree (slug);


--
-- Name: index_group_opportunities_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_opportunities_on_group_id ON public.group_opportunities USING btree (group_id);


--
-- Name: index_group_opportunities_on_group_opportunity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_opportunities_on_group_opportunity ON public.group_opportunities USING btree (group_id, opportunity_id);


--
-- Name: index_group_opportunities_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_opportunities_on_opportunity_id ON public.group_opportunities USING btree (opportunity_id);


--
-- Name: index_group_permissions_on_action_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_permissions_on_action_id ON public.group_permissions USING btree (action_id);


--
-- Name: index_group_permissions_on_feature_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_permissions_on_feature_id ON public.group_permissions USING btree (feature_id);


--
-- Name: index_group_permissions_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_permissions_on_group_id ON public.group_permissions USING btree (group_id);


--
-- Name: index_group_presential_event_permissions_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_presential_event_permissions_on_group_id ON public.group_presential_event_permissions USING btree (group_id);


--
-- Name: index_group_presential_event_permissions_on_presential_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_presential_event_permissions_on_presential_event_id ON public.group_presential_event_permissions USING btree (presential_event_id);


--
-- Name: index_group_question_on_group_group_question_permission; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_question_on_group_group_question_permission ON public.group_group_question_permissions USING btree (group_id, group_question_id);


--
-- Name: index_group_question_on_user_group_question_permission; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_question_on_user_group_question_permission ON public.user_question_permissions USING btree (user_id, question_id);


--
-- Name: index_group_question_permissions_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_question_permissions_on_group_id ON public.group_question_permissions USING btree (group_id);


--
-- Name: index_group_question_permissions_on_grup_question_permission; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_question_permissions_on_grup_question_permission ON public.group_question_permissions USING btree (group_id, question_id);


--
-- Name: index_group_question_permissions_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_question_permissions_on_question_id ON public.group_question_permissions USING btree (question_id);


--
-- Name: index_group_questions_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_questions_on_company_id ON public.group_questions USING btree (company_id);


--
-- Name: index_group_questions_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_questions_on_deleted_at ON public.group_questions USING btree (deleted_at);


--
-- Name: index_group_questions_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_questions_on_question_id ON public.group_questions USING btree (question_id);


--
-- Name: index_group_questions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_questions_on_user_id ON public.group_questions USING btree (user_id);


--
-- Name: index_group_requirements_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_requirements_on_company_id ON public.group_requirements USING btree (company_id);


--
-- Name: index_group_requirements_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_requirements_on_group_id ON public.group_requirements USING btree (group_id);


--
-- Name: index_group_requirements_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_requirements_on_name ON public.group_requirements USING btree (name);


--
-- Name: index_group_requirements_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_requirements_on_slug ON public.group_requirements USING btree (slug);


--
-- Name: index_group_requirements_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_requirements_on_user_id ON public.group_requirements USING btree (user_id);


--
-- Name: index_group_requisition_permissions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_requisition_permissions ON public.group_requisition_permissions USING btree (group_id, requisition_id);


--
-- Name: index_group_requisition_permissions_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_requisition_permissions_on_group_id ON public.group_requisition_permissions USING btree (group_id);


--
-- Name: index_group_requisition_permissions_on_requisition_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_requisition_permissions_on_requisition_id ON public.group_requisition_permissions USING btree (requisition_id);


--
-- Name: index_group_template_permissions_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_template_permissions_on_group_id ON public.group_template_permissions USING btree (group_id);


--
-- Name: index_group_template_permissions_on_group_template_permission; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_template_permissions_on_group_template_permission ON public.group_template_permissions USING btree (group_id, template_message_id);


--
-- Name: index_group_template_permissions_on_template_message_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_template_permissions_on_template_message_id ON public.group_template_permissions USING btree (template_message_id);


--
-- Name: index_group_templates_on_template_message_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_templates_on_template_message_id ON public.group_templates USING btree (template_message_id);


--
-- Name: index_group_users_on_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_users_on_group_id ON public.group_users USING btree (group_id);


--
-- Name: index_group_users_on_user_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_users_on_user_group ON public.group_users USING btree (user_id, group_id);


--
-- Name: index_group_users_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_group_users_on_user_id ON public.group_users USING btree (user_id);


--
-- Name: index_groups_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_groups_on_company_id ON public.groups USING btree (company_id);


--
-- Name: index_groups_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_groups_on_slug ON public.groups USING btree (slug);


--
-- Name: index_header_tests_on_details_person_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_header_tests_on_details_person_id ON public.header_tests USING btree (((details OPERATOR(public.->) 'person_id'::text))) WHERE public.exist(details, 'person_id'::text);


--
-- Name: index_header_tests_on_details_test_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_header_tests_on_details_test_id ON public.header_tests USING btree (((details OPERATOR(public.->) 'test_id'::text))) WHERE public.exist(details, 'test_id'::text);


--
-- Name: index_header_tests_on_filled_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_header_tests_on_filled_date ON public.header_tests USING btree (filled_date);


--
-- Name: index_header_tests_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_header_tests_on_opportunity_id ON public.header_tests USING btree (opportunity_id);


--
-- Name: index_header_tests_on_score; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_header_tests_on_score ON public.header_tests USING btree (score);


--
-- Name: index_header_tests_on_source_test_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_header_tests_on_source_test_id ON public.header_tests USING btree (source_test_id);


--
-- Name: index_header_tests_on_url_test; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_header_tests_on_url_test ON public.header_tests USING btree (url_test);


--
-- Name: index_header_tests_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_header_tests_on_user_id ON public.header_tests USING btree (user_id);


--
-- Name: index_health_checks_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_health_checks_on_status ON public.health_checks USING btree (status);


--
-- Name: index_identities_on_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_identities_on_uid ON public.identities USING btree (uid);


--
-- Name: index_identities_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_identities_on_user_id ON public.identities USING btree (user_id);


--
-- Name: index_images_on_imageable_id_and_imageable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_images_on_imageable_id_and_imageable_type ON public.images USING btree (imageable_id, imageable_type);


--
-- Name: index_incompleted_subscriptions_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_incompleted_subscriptions_on_opportunity_id ON public.incompleted_subscriptions USING btree (opportunity_id);


--
-- Name: index_incompleted_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_incompleted_subscriptions_on_user_id ON public.incompleted_subscriptions USING btree (user_id);


--
-- Name: index_indication_domains_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_indication_domains_on_company_id ON public.indication_domains USING btree (company_id);


--
-- Name: index_indication_domains_on_domain; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_indication_domains_on_domain ON public.indication_domains USING btree (domain);


--
-- Name: index_indication_domains_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_indication_domains_on_opportunity_id ON public.indication_domains USING btree (opportunity_id);


--
-- Name: index_installments_on_hidden; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_installments_on_hidden ON public.installments USING btree (hidden);


--
-- Name: index_installments_on_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_installments_on_plan_id ON public.installments USING btree (plan_id);


--
-- Name: index_institutions_on_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_institutions_on_state_id ON public.institutions USING btree (state_id);


--
-- Name: index_integration_field_columns_on_column_reference_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_integration_field_columns_on_column_reference_id ON public.company_integration_field_columns USING btree (domain_column_reference_id);


--
-- Name: index_integration_field_columns_on_company_integration_field_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_integration_field_columns_on_company_integration_field_id ON public.company_integration_field_columns USING btree (company_integration_field_id);


--
-- Name: index_interviewer_candidates_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_interviewer_candidates_on_company_id ON public.interviewer_candidates USING btree (company_id);


--
-- Name: index_interviewer_candidates_on_interviewer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_interviewer_candidates_on_interviewer_id ON public.interviewer_candidates USING btree (interviewer_id);


--
-- Name: index_interviewer_candidates_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_interviewer_candidates_on_opportunity_id ON public.interviewer_candidates USING btree (opportunity_id);


--
-- Name: index_interviewer_candidates_on_subscription_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_interviewer_candidates_on_subscription_id ON public.interviewer_candidates USING btree (subscription_id);


--
-- Name: index_interviewer_candidates_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_interviewer_candidates_on_user_id ON public.interviewer_candidates USING btree (user_id);


--
-- Name: index_interviewer_candidates_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_interviewer_candidates_unique ON public.interviewer_candidates USING btree (interviewer_id, subscription_id);


--
-- Name: index_interviewers_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_interviewers_on_company_id ON public.interviewers USING btree (company_id);


--
-- Name: index_interviewers_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_interviewers_on_email ON public.interviewers USING btree (email);


--
-- Name: index_interviewers_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_interviewers_on_name ON public.interviewers USING btree (name);


--
-- Name: index_interviewers_on_unique_identifier; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_interviewers_on_unique_identifier ON public.interviewers USING btree (unique_identifier);


--
-- Name: index_job_boards_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_job_boards_on_name ON public.job_boards USING btree (name);


--
-- Name: index_job_boards_on_sigla; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_job_boards_on_sigla ON public.job_boards USING btree (sigla);


--
-- Name: index_job_boards_opportunities_on_job_board_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_job_boards_opportunities_on_job_board_id ON public.job_boards_opportunities USING btree (job_board_id);


--
-- Name: index_job_boards_opportunities_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_job_boards_opportunities_on_opportunity_id ON public.job_boards_opportunities USING btree (opportunity_id);


--
-- Name: index_job_categories_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_job_categories_on_parent_id ON public.job_categories USING btree (parent_id);


--
-- Name: index_job_feedback_opportunities_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_job_feedback_opportunities_on_opportunity_id ON public.job_feedback_opportunities USING btree (opportunity_id);


--
-- Name: index_job_feedback_opportunities_on_pending; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_job_feedback_opportunities_on_pending ON public.job_feedback_opportunities USING btree (pending);


--
-- Name: index_jobs_on_job_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_jobs_on_job_category_id ON public.jobs USING btree (job_category_id);


--
-- Name: index_jobs_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_jobs_on_seller_id ON public.jobs USING btree (seller_id);


--
-- Name: index_leads_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_leads_on_email ON public.leads USING btree (email);


--
-- Name: index_log_integration_files_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_log_integration_files_on_company_id ON public.log_integration_files USING btree (company_id);


--
-- Name: index_log_integration_files_on_file_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_log_integration_files_on_file_name ON public.log_integration_files USING btree (file_name);


--
-- Name: index_log_integration_files_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_log_integration_files_on_opportunity_id ON public.log_integration_files USING btree (opportunity_id);


--
-- Name: index_log_integration_files_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_log_integration_files_on_status ON public.log_integration_files USING btree (status);


--
-- Name: index_log_integration_files_on_type_of_file; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_log_integration_files_on_type_of_file ON public.log_integration_files USING btree (type_of_file);


--
-- Name: index_log_opportunity_statuses_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_log_opportunity_statuses_on_company_id ON public.log_opportunity_statuses USING btree (company_id);


--
-- Name: index_log_update_profiles_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_log_update_profiles_on_company_id ON public.log_update_profiles USING btree (company_id);


--
-- Name: index_log_update_profiles_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_log_update_profiles_on_user_id ON public.log_update_profiles USING btree (user_id);


--
-- Name: index_log_update_profiles_on_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_log_update_profiles_on_uuid ON public.log_update_profiles USING btree (uuid);


--
-- Name: index_managers_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_managers_on_company_id ON public.managers USING btree (company_id);


--
-- Name: index_managers_on_responsible_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_managers_on_responsible_user_id ON public.managers USING btree (responsible_user_id);


--
-- Name: index_managers_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_managers_on_user_id ON public.managers USING btree (user_id);


--
-- Name: index_media_on_mediable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_media_on_mediable_id ON public.media USING btree (mediable_id);


--
-- Name: index_media_on_mediable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_media_on_mediable_type ON public.media USING btree (mediable_type);


--
-- Name: index_mentions_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mentions_on_company_id ON public.mentions USING btree (company_id);


--
-- Name: index_mentions_on_from_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mentions_on_from_user_id ON public.mentions USING btree (from_user_id);


--
-- Name: index_mentions_on_in_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mentions_on_in_user_id ON public.mentions USING btree (in_user_id);


--
-- Name: index_mentions_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mentions_on_opportunity_id ON public.mentions USING btree (opportunity_id);


--
-- Name: index_mentions_on_to_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mentions_on_to_user_id ON public.mentions USING btree (to_user_id);


--
-- Name: index_messages_on_conversation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_conversation_id ON public.messages USING btree (conversation_id);


--
-- Name: index_messages_on_from_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_from_user_id ON public.messages USING btree (from_user_id);


--
-- Name: index_messages_on_message_content_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_message_content_id ON public.messages USING btree (message_content_id);


--
-- Name: index_messages_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_parent_id ON public.messages USING btree (parent_id);


--
-- Name: index_messages_on_to_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_to_user_id ON public.messages USING btree (to_user_id);


--
-- Name: index_new_order_details_on_new_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_new_order_details_on_new_order_id ON public.new_order_details USING btree (new_order_id);


--
-- Name: index_new_orders_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_new_orders_on_company_id ON public.new_orders USING btree (company_id);


--
-- Name: index_new_orders_on_installment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_new_orders_on_installment_id ON public.new_orders USING btree (installment_id);


--
-- Name: index_new_orders_on_pagarme_subscription_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_new_orders_on_pagarme_subscription_id ON public.new_orders USING btree (pagarme_subscription_id);


--
-- Name: index_new_orders_on_payment_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_new_orders_on_payment_type ON public.new_orders USING btree (payment_type);


--
-- Name: index_new_orders_on_plan_installment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_new_orders_on_plan_installment_id ON public.new_orders USING btree (plan_installment_id);


--
-- Name: index_new_orders_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_new_orders_on_status ON public.new_orders USING btree (status);


--
-- Name: index_new_orders_on_transaction_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_new_orders_on_transaction_id ON public.new_orders USING btree (transaction_id);


--
-- Name: index_new_orders_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_new_orders_on_user_id ON public.new_orders USING btree (user_id);


--
-- Name: index_opportunities_on_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_address_id ON public.opportunities USING btree (address_id);


--
-- Name: index_opportunities_on_characteristic_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_characteristic_id ON public.opportunities USING btree (characteristic_id);


--
-- Name: index_opportunities_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_company_id ON public.opportunities USING btree (company_id);


--
-- Name: index_opportunities_on_company_opportunity_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_company_opportunity_area_id ON public.opportunities USING btree (company_opportunity_area_id);


--
-- Name: index_opportunities_on_company_opportunity_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_company_opportunity_group_id ON public.opportunities USING btree (company_opportunity_group_id);


--
-- Name: index_opportunities_on_highlighted; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_highlighted ON public.opportunities USING btree (highlighted);


--
-- Name: index_opportunities_on_opportunity_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_opportunity_category_id ON public.opportunities USING btree (opportunity_category_id);


--
-- Name: index_opportunities_on_opportunity_level_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_opportunity_level_id ON public.opportunities USING btree (opportunity_level_id);


--
-- Name: index_opportunities_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_status ON public.opportunities USING btree (status);


--
-- Name: index_opportunities_on_visit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_visit_id ON public.opportunities USING btree (visit_id);


--
-- Name: index_opportunities_on_work_environment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunities_on_work_environment_id ON public.opportunities USING btree (work_environment_id);


--
-- Name: index_opportunity_action_tags_on_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_action_tags_on_action ON public.opportunity_action_tags USING btree (action);


--
-- Name: index_opportunity_action_tags_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_action_tags_on_opportunity_id ON public.opportunity_action_tags USING btree (opportunity_id);


--
-- Name: index_opportunity_areas_on_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_areas_on_group ON public.opportunity_areas USING btree ("group");


--
-- Name: index_opportunity_configurations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_configurations_on_company_id ON public.opportunity_configurations USING btree (company_id);


--
-- Name: index_opportunity_configurations_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_configurations_on_opportunity_id ON public.opportunity_configurations USING btree (opportunity_id);


--
-- Name: index_opportunity_email_messages_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_email_messages_on_company_id ON public.opportunity_email_messages USING btree (company_id);


--
-- Name: index_opportunity_email_messages_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_email_messages_on_opportunity_id ON public.opportunity_email_messages USING btree (opportunity_id);


--
-- Name: index_opportunity_email_messages_on_opportunity_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_email_messages_on_opportunity_type ON public.opportunity_email_messages USING btree (opportunity_type);


--
-- Name: index_opportunity_integration_statuses_on_move_candidate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_integration_statuses_on_move_candidate ON public.opportunity_integration_statuses USING btree (move_candidate);


--
-- Name: index_opportunity_integration_statuses_on_move_next_candidate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_integration_statuses_on_move_next_candidate ON public.opportunity_integration_statuses USING btree (move_next_candidate);


--
-- Name: index_opportunity_integration_statuses_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_integration_statuses_on_opportunity_id ON public.opportunity_integration_statuses USING btree (opportunity_id);


--
-- Name: index_opportunity_integration_statuses_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_integration_statuses_on_slug ON public.opportunity_integration_statuses USING btree (slug);


--
-- Name: index_opportunity_levels_on_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_levels_on_order ON public.opportunity_levels USING btree ("order");


--
-- Name: index_opportunity_opinion_types_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_opinion_types_on_company_id ON public.opportunity_opinion_types USING btree (company_id);


--
-- Name: index_opportunity_opinion_types_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_opinion_types_on_opportunity_id ON public.opportunity_opinion_types USING btree (opportunity_id);


--
-- Name: index_opportunity_opinion_types_on_opportunity_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_opinion_types_on_opportunity_type ON public.opportunity_opinion_types USING btree (opportunity_type);


--
-- Name: index_opportunity_opinion_types_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_opinion_types_on_slug ON public.opportunity_opinion_types USING btree (slug);


--
-- Name: index_opportunity_params_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_params_on_opportunity_id ON public.opportunity_params USING btree (opportunity_id);


--
-- Name: index_opportunity_params_on_subsidiary; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_params_on_subsidiary ON public.opportunity_params USING btree (subsidiary);


--
-- Name: index_opportunity_recommendations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_recommendations_on_company_id ON public.opportunity_recommendations USING btree (company_id);


--
-- Name: index_opportunity_recommendations_on_interval; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_recommendations_on_interval ON public.opportunity_recommendations USING btree ("interval");


--
-- Name: index_opportunity_recommendations_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_recommendations_on_opportunity_id ON public.opportunity_recommendations USING btree (opportunity_id);


--
-- Name: index_opportunity_recommendations_on_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_recommendations_on_profile_id ON public.opportunity_recommendations USING btree (profile_id);


--
-- Name: index_opportunity_recommendations_on_sent_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_recommendations_on_sent_at ON public.opportunity_recommendations USING btree (sent_at);


--
-- Name: index_opportunity_recommendations_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_recommendations_on_status ON public.opportunity_recommendations USING btree (status);


--
-- Name: index_opportunity_recommendations_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_recommendations_on_user_id ON public.opportunity_recommendations USING btree (user_id);


--
-- Name: index_opportunity_statuses_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_statuses_on_company_id ON public.opportunity_statuses USING btree (company_id);


--
-- Name: index_opportunity_statuses_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_statuses_on_opportunity_id ON public.opportunity_statuses USING btree (opportunity_id);


--
-- Name: index_opportunity_tests_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_tests_on_company_id ON public.opportunity_tests USING btree (company_id);


--
-- Name: index_opportunity_tests_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_tests_on_opportunity_id ON public.opportunity_tests USING btree (opportunity_id);


--
-- Name: index_opportunity_tests_on_required_in; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_tests_on_required_in ON public.opportunity_tests USING btree (required_in);


--
-- Name: index_opportunity_tests_on_source_test_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_tests_on_source_test_id ON public.opportunity_tests USING btree (source_test_id);


--
-- Name: index_opportunity_viewers_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_viewers_on_opportunity_id ON public.opportunity_viewers USING btree (opportunity_id);


--
-- Name: index_opportunity_viewers_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_viewers_on_user_id ON public.opportunity_viewers USING btree (user_id);


--
-- Name: index_opportunity_viewers_on_user_id_and_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_opportunity_viewers_on_user_id_and_opportunity_id ON public.opportunity_viewers USING btree (user_id, opportunity_id);


--
-- Name: index_orders_on_buyer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_orders_on_buyer_id ON public.orders USING btree (buyer_id);


--
-- Name: index_orders_on_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_orders_on_job_id ON public.orders USING btree (job_id);


--
-- Name: index_orders_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_orders_on_seller_id ON public.orders USING btree (seller_id);


--
-- Name: index_origin_page_views_on_subscription_source_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_origin_page_views_on_subscription_source_id ON public.origin_page_views USING btree (subscription_source_id);


--
-- Name: index_origin_page_views_on_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_origin_page_views_on_type_id ON public.origin_page_views USING btree (type_id);


--
-- Name: index_origin_page_views_on_type_id_and_type_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_origin_page_views_on_type_id_and_type_name ON public.origin_page_views USING btree (type_id, type_name);


--
-- Name: index_origin_page_views_on_type_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_origin_page_views_on_type_name ON public.origin_page_views USING btree (type_name);


--
-- Name: index_origin_page_views_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_origin_page_views_on_user_id ON public.origin_page_views USING btree (user_id);


--
-- Name: index_packages_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_packages_on_user_id ON public.packages USING btree (user_id);


--
-- Name: index_partner_integrations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_partner_integrations_on_company_id ON public.partner_integrations USING btree (company_id);


--
-- Name: index_partner_integrations_on_integration_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_partner_integrations_on_integration_type ON public.partner_integrations USING btree (integration_type);


--
-- Name: index_partner_integrations_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_partner_integrations_on_slug ON public.partner_integrations USING btree (slug);


--
-- Name: index_partner_integrations_on_user_create_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_partner_integrations_on_user_create_id ON public.partner_integrations USING btree (user_create_id);


--
-- Name: index_partner_integrations_on_user_update_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_partner_integrations_on_user_update_id ON public.partner_integrations USING btree (user_update_id);


--
-- Name: index_payments_on_identifier; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_payments_on_identifier ON public.payments USING btree (identifier);


--
-- Name: index_payments_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payments_on_order_id ON public.payments USING btree (order_id);


--
-- Name: index_payments_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_payments_on_token ON public.payments USING btree (token);


--
-- Name: index_personas_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_personas_on_name ON public.personas USING btree (name);


--
-- Name: index_plan_group_features_on_feature_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_plan_group_features_on_feature_id ON public.plan_group_features USING btree (feature_id);


--
-- Name: index_plan_group_features_on_plan_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_plan_group_features_on_plan_group_id ON public.plan_group_features USING btree (plan_group_id);


--
-- Name: index_plan_installments_on_installment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_plan_installments_on_installment_id ON public.plan_installments USING btree (installment_id);


--
-- Name: index_plan_installments_on_pagarme_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_plan_installments_on_pagarme_plan_id ON public.plan_installments USING btree (pagarme_plan_id);


--
-- Name: index_plan_installments_on_paid_in; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_plan_installments_on_paid_in ON public.plan_installments USING btree (paid_in);


--
-- Name: index_plan_installments_on_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_plan_installments_on_plan_id ON public.plan_installments USING btree (plan_id);


--
-- Name: index_pre_subscriptions_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pre_subscriptions_on_company_id ON public.pre_subscriptions USING btree (company_id);


--
-- Name: index_pre_subscriptions_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pre_subscriptions_on_opportunity_id ON public.pre_subscriptions USING btree (opportunity_id);


--
-- Name: index_pre_subscriptions_on_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pre_subscriptions_on_profile_id ON public.pre_subscriptions USING btree (profile_id);


--
-- Name: index_pre_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_pre_subscriptions_on_user_id ON public.pre_subscriptions USING btree (user_id);


--
-- Name: index_presential_event_addresses_on_presential_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_addresses_on_presential_event_id ON public.presential_event_addresses USING btree (presential_event_id);


--
-- Name: index_presential_event_notifications_on_presential_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_notifications_on_presential_event_id ON public.presential_event_notifications USING btree (presential_event_id);


--
-- Name: index_presential_event_rooms_on_presential_event_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_rooms_on_presential_event_address_id ON public.presential_event_rooms USING btree (presential_event_address_id);


--
-- Name: index_presential_event_rooms_on_presential_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_rooms_on_presential_event_id ON public.presential_event_rooms USING btree (presential_event_id);


--
-- Name: index_presential_event_schedules_on_presential_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_schedules_on_presential_event_id ON public.presential_event_schedules USING btree (presential_event_id);


--
-- Name: index_presential_event_schedules_on_presential_event_room_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_schedules_on_presential_event_room_id ON public.presential_event_schedules USING btree (presential_event_room_id);


--
-- Name: index_presential_event_users_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_users_on_opportunity_id ON public.presential_event_users USING btree (opportunity_id);


--
-- Name: index_presential_event_users_on_presential_event_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_users_on_presential_event_address_id ON public.presential_event_users USING btree (presential_event_address_id);


--
-- Name: index_presential_event_users_on_presential_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_users_on_presential_event_id ON public.presential_event_users USING btree (presential_event_id);


--
-- Name: index_presential_event_users_on_presential_event_room_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_users_on_presential_event_room_id ON public.presential_event_users USING btree (presential_event_room_id);


--
-- Name: index_presential_event_users_on_presential_event_schedule_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_users_on_presential_event_schedule_id ON public.presential_event_users USING btree (presential_event_schedule_id);


--
-- Name: index_presential_event_users_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_event_users_on_user_id ON public.presential_event_users USING btree (user_id);


--
-- Name: index_presential_events_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_presential_events_on_company_id ON public.presential_events USING btree (company_id);


--
-- Name: index_products_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_company_id ON public.products USING btree (company_id);


--
-- Name: index_products_on_new_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_new_order_id ON public.products USING btree (new_order_id);


--
-- Name: index_products_on_package_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_package_id ON public.products USING btree (package_id);


--
-- Name: index_products_on_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_on_plan_id ON public.products USING btree (plan_id);


--
-- Name: index_profile_questions_to_updates_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_profile_questions_to_updates_on_company_id ON public.profile_questions_to_updates USING btree (company_id);


--
-- Name: index_profile_questions_to_updates_on_filled_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_profile_questions_to_updates_on_filled_date ON public.profile_questions_to_updates USING btree (filled_date);


--
-- Name: index_profile_questions_to_updates_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_profile_questions_to_updates_on_opportunity_id ON public.profile_questions_to_updates USING btree (opportunity_id);


--
-- Name: index_profile_questions_to_updates_on_recruiter_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_profile_questions_to_updates_on_recruiter_id ON public.profile_questions_to_updates USING btree (recruiter_id);


--
-- Name: index_profile_questions_to_updates_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_profile_questions_to_updates_on_status ON public.profile_questions_to_updates USING btree (status);


--
-- Name: index_profile_questions_to_updates_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_profile_questions_to_updates_on_user_id ON public.profile_questions_to_updates USING btree (user_id);


--
-- Name: index_profiles_on_birthday; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_profiles_on_birthday ON public.profiles USING btree (birthday);


--
-- Name: index_profiles_on_gender; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_profiles_on_gender ON public.profiles USING btree (gender);


--
-- Name: index_profiles_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_profiles_on_user_id ON public.profiles USING btree (user_id);


--
-- Name: index_programs_categories_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_programs_categories_on_category_id ON public.programs_categories USING btree (category_id);


--
-- Name: index_programs_categories_on_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_programs_categories_on_program_id ON public.programs_categories USING btree (program_id);


--
-- Name: index_programs_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_programs_on_company_id ON public.programs USING btree (company_id);


--
-- Name: index_programs_on_opportunity_level_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_programs_on_opportunity_level_id ON public.programs USING btree (opportunity_level_id);


--
-- Name: index_programs_on_visit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_programs_on_visit_id ON public.programs USING btree (visit_id);


--
-- Name: index_questions_on_group_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_questions_on_group_question_id ON public.questions USING btree (group_question_id);


--
-- Name: index_questions_on_hided_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_questions_on_hided_at ON public.questions USING btree (hided_at);


--
-- Name: index_questions_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_questions_on_slug ON public.questions USING btree (slug);


--
-- Name: index_recommendations_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_recommendations_on_opportunity_id ON public.recommendations USING btree (opportunity_id);


--
-- Name: index_recommendations_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_recommendations_on_user_id ON public.recommendations USING btree (user_id);


--
-- Name: index_requirements_on_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requirements_on_program_id ON public.requirements USING btree (program_id);


--
-- Name: index_requirements_on_requirement_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requirements_on_requirement_type_id ON public.requirements USING btree (requirement_type_id);


--
-- Name: index_requisition_area_approvers_on_priority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_area_approvers_on_priority ON public.requisition_area_approvers USING btree (priority);


--
-- Name: index_requisition_area_approvers_on_requisition_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_area_approvers_on_requisition_area_id ON public.requisition_area_approvers USING btree (requisition_area_id);


--
-- Name: index_requisition_area_approvers_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_area_approvers_on_user_id ON public.requisition_area_approvers USING btree (user_id);


--
-- Name: index_requisition_areas_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_areas_on_company_id ON public.requisition_areas USING btree (company_id);


--
-- Name: index_requisition_areas_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_areas_on_name ON public.requisition_areas USING btree (name);


--
-- Name: index_requisition_fields_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_fields_on_company_id ON public.requisition_fields USING btree (company_id);


--
-- Name: index_requisition_fields_on_description; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_fields_on_description ON public.requisition_fields USING btree (description);


--
-- Name: index_requisition_fields_on_field_label; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_fields_on_field_label ON public.requisition_fields USING btree (field_label);


--
-- Name: index_requisition_fields_on_field_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_fields_on_field_type ON public.requisition_fields USING btree (field_type);


--
-- Name: index_requisition_fields_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_fields_on_name ON public.requisition_fields USING btree (name);


--
-- Name: index_requisition_fields_on_requisition_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_fields_on_requisition_id ON public.requisition_fields USING btree (requisition_id);


--
-- Name: index_requisition_fields_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_fields_on_user_id ON public.requisition_fields USING btree (user_id);


--
-- Name: index_requisition_workflows_on_priority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_workflows_on_priority ON public.requisition_workflows USING btree (priority);


--
-- Name: index_requisition_workflows_on_requisition_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_workflows_on_requisition_id ON public.requisition_workflows USING btree (requisition_id);


--
-- Name: index_requisition_workflows_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_workflows_on_status ON public.requisition_workflows USING btree (status);


--
-- Name: index_requisition_workflows_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisition_workflows_on_user_id ON public.requisition_workflows USING btree (user_id);


--
-- Name: index_requisitions_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisitions_on_company_id ON public.requisitions USING btree (company_id);


--
-- Name: index_requisitions_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisitions_on_opportunity_id ON public.requisitions USING btree (opportunity_id);


--
-- Name: index_requisitions_on_requisition_area_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisitions_on_requisition_area_id ON public.requisitions USING btree (requisition_area_id);


--
-- Name: index_requisitions_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisitions_on_status ON public.requisitions USING btree (status);


--
-- Name: index_requisitions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_requisitions_on_user_id ON public.requisitions USING btree (user_id);


--
-- Name: index_satisfaction_survey_answers_on_satisfaction_survey_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_satisfaction_survey_answers_on_satisfaction_survey_id ON public.satisfaction_survey_answers USING btree (satisfaction_survey_id);


--
-- Name: index_satisfaction_survey_answers_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_satisfaction_survey_answers_on_user_id ON public.satisfaction_survey_answers USING btree (user_id);


--
-- Name: index_satisfaction_surveys_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_satisfaction_surveys_on_company_id ON public.satisfaction_surveys USING btree (company_id);


--
-- Name: index_saved_requirements_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_saved_requirements_on_company_id ON public.saved_requirements USING btree (company_id);


--
-- Name: index_saved_requirements_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_saved_requirements_on_name ON public.saved_requirements USING btree (name);


--
-- Name: index_saved_requirements_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_saved_requirements_on_opportunity_id ON public.saved_requirements USING btree (opportunity_id);


--
-- Name: index_saved_requirements_on_step_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_saved_requirements_on_step_id ON public.saved_requirements USING btree (step_id);


--
-- Name: index_saved_requirements_on_user_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_saved_requirements_on_user_company ON public.saved_requirements USING btree (user_id, company_id);


--
-- Name: index_saved_requirements_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_saved_requirements_on_user_id ON public.saved_requirements USING btree (user_id);


--
-- Name: index_saved_requirements_on_user_opportunity_company; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_saved_requirements_on_user_opportunity_company ON public.saved_requirements USING btree (user_id, opportunity_id, company_id);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_sessions_on_session_id ON public.sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_sessions_on_updated_at ON public.sessions USING btree (updated_at);


--
-- Name: index_source_tests_on_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_source_tests_on_code ON public.source_tests USING btree (code);


--
-- Name: index_source_tests_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_source_tests_on_name ON public.source_tests USING btree (name);


--
-- Name: index_source_tests_on_source; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_source_tests_on_source ON public.source_tests USING btree (source);


--
-- Name: index_stages_on_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_stages_on_program_id ON public.stages USING btree (program_id);


--
-- Name: index_states_on_is_first; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_states_on_is_first ON public.states USING btree (is_first);


--
-- Name: index_states_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_states_on_name ON public.states USING btree (name);


--
-- Name: index_statistics_on_model; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_statistics_on_model ON public.statistics USING btree (model);


--
-- Name: index_statistics_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_statistics_on_slug ON public.statistics USING btree (slug);


--
-- Name: index_steps_on_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_steps_on_program_id ON public.steps USING btree (program_id);


--
-- Name: index_subscription_questions_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subscription_questions_on_company_id ON public.subscription_questions USING btree (company_id);


--
-- Name: index_subscription_questions_on_subscriptive_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subscription_questions_on_subscriptive_id ON public.subscription_questions USING btree (subscriptive_id);


--
-- Name: index_subscription_questions_on_subscriptive_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subscription_questions_on_subscriptive_type ON public.subscription_questions USING btree (subscriptive_type);


--
-- Name: index_subscription_sources_on_description; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subscription_sources_on_description ON public.subscription_sources USING btree (description);


--
-- Name: index_subscription_sources_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subscription_sources_on_name ON public.subscription_sources USING btree (name);


--
-- Name: index_subscription_sources_on_picture; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subscription_sources_on_picture ON public.subscription_sources USING btree (picture);


--
-- Name: index_subscription_sources_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subscription_sources_on_slug ON public.subscription_sources USING btree (slug);


--
-- Name: index_suggestions_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_suggestions_on_category_id ON public.suggestions USING btree (category_id);


--
-- Name: index_suggestions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_suggestions_on_user_id ON public.suggestions USING btree (user_id);


--
-- Name: index_template_messages_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_template_messages_on_company_id ON public.template_messages USING btree (company_id);


--
-- Name: index_template_messages_on_group_template_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_template_messages_on_group_template_id ON public.template_messages USING btree (group_template_id);


--
-- Name: index_terms_of_use_by_ninenine_jobs_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_terms_of_use_by_ninenine_jobs_on_user_id ON public.terms_of_use_by_ninenine_jobs USING btree (user_id);


--
-- Name: index_terms_of_use_by_ninenine_jobs_on_version; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_terms_of_use_by_ninenine_jobs_on_version ON public.terms_of_use_by_ninenine_jobs USING btree (version);


--
-- Name: index_terms_of_use_by_sources_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_terms_of_use_by_sources_on_company_id ON public.terms_of_use_by_sources USING btree (company_id);


--
-- Name: index_terms_of_use_by_sources_on_source; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_terms_of_use_by_sources_on_source ON public.terms_of_use_by_sources USING btree (source);


--
-- Name: index_terms_of_use_by_sources_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_terms_of_use_by_sources_on_user_id ON public.terms_of_use_by_sources USING btree (user_id);


--
-- Name: index_tracking_pixels_on_provider_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tracking_pixels_on_provider_id ON public.tracking_pixels USING btree (provider_id);


--
-- Name: index_tracking_pixels_on_url; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tracking_pixels_on_url ON public.tracking_pixels USING btree (url);


--
-- Name: index_trend_attitudes_on_main_persona_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_trend_attitudes_on_main_persona_id ON public.trend_attitudes USING btree (main_persona_id);


--
-- Name: index_trend_attitudes_on_support_persona_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_trend_attitudes_on_support_persona_id ON public.trend_attitudes USING btree (support_persona_id);


--
-- Name: index_trigger_types_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_trigger_types_on_slug ON public.trigger_types USING btree (slug);


--
-- Name: index_triggers_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_triggers_on_company_id ON public.triggers USING btree (company_id);


--
-- Name: index_triggers_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_triggers_on_opportunity_id ON public.triggers USING btree (opportunity_id);


--
-- Name: index_triggers_on_trigger_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_triggers_on_trigger_type_id ON public.triggers USING btree (trigger_type_id);


--
-- Name: index_user_accesses_on_access_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_accesses_on_access_count ON public.user_accesses USING btree (access_count);


--
-- Name: index_user_accesses_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_accesses_on_company_id ON public.user_accesses USING btree (company_id);


--
-- Name: index_user_accesses_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_accesses_on_user_id ON public.user_accesses USING btree (user_id);


--
-- Name: index_user_event_permissions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_event_permissions ON public.user_presential_event_permissions USING btree (user_id, presential_event_id);


--
-- Name: index_user_group_permissions_on_user_group_permission; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_group_permissions_on_user_group_permission ON public.user_question_permissions USING btree (user_id, question_id);


--
-- Name: index_user_group_question_permissions_on_group_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_group_question_permissions_on_group_question_id ON public.user_group_question_permissions USING btree (group_question_id);


--
-- Name: index_user_group_question_permissions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_group_question_permissions_on_user_id ON public.user_group_question_permissions USING btree (user_id);


--
-- Name: index_user_permissions_on_opportunity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_permissions_on_opportunity_id ON public.user_permissions USING btree (opportunity_id);


--
-- Name: index_user_permissions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_permissions_on_user_id ON public.user_permissions USING btree (user_id);


--
-- Name: index_user_presential_event_permissions_on_presential_event_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_presential_event_permissions_on_presential_event_id ON public.user_presential_event_permissions USING btree (presential_event_id);


--
-- Name: index_user_presential_event_permissions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_presential_event_permissions_on_user_id ON public.user_presential_event_permissions USING btree (user_id);


--
-- Name: index_user_question_permissions_on_question_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_question_permissions_on_question_id ON public.user_question_permissions USING btree (question_id);


--
-- Name: index_user_question_permissions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_question_permissions_on_user_id ON public.user_question_permissions USING btree (user_id);


--
-- Name: index_user_requisition_permissions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_requisition_permissions ON public.user_requisition_permissions USING btree (user_id, requisition_id);


--
-- Name: index_user_requisition_permissions_on_requisition_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_requisition_permissions_on_requisition_id ON public.user_requisition_permissions USING btree (requisition_id);


--
-- Name: index_user_requisition_permissions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_requisition_permissions_on_user_id ON public.user_requisition_permissions USING btree (user_id);


--
-- Name: index_user_template_permissions_on_template_message_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_template_permissions_on_template_message_id ON public.user_template_permissions USING btree (template_message_id);


--
-- Name: index_user_template_permissions_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_template_permissions_on_user_id ON public.user_template_permissions USING btree (user_id);


--
-- Name: index_user_template_permissions_on_user_template_permission; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_template_permissions_on_user_template_permission ON public.user_template_permissions USING btree (user_id, template_message_id);


--
-- Name: index_users_on_api_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_api_token ON public.users USING btree (api_token);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_deleted_at ON public.users USING btree (deleted_at) WHERE (deleted_at IS NULL);


--
-- Name: index_users_on_document; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_document ON public.users USING btree (document);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_provider; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_provider ON public.users USING btree (provider);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_uid ON public.users USING btree (uid);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: index_users_on_user_ats_and_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_user_ats_and_email ON public.users USING btree (user_ats, email);


--
-- Name: index_videos_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_videos_on_company_id ON public.videos USING btree (company_id);


--
-- Name: index_visits_on_user_id_and_user_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_visits_on_user_id_and_user_type ON public.visits USING btree (user_id, user_type);


--
-- Name: index_visits_on_visit_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_visits_on_visit_token ON public.visits USING btree (visit_token);


--
-- Name: index_work_value_details_on_broad_value_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_work_value_details_on_broad_value_id ON public.work_value_details USING btree (broad_value_id);


--
-- Name: index_work_value_details_on_persona_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_work_value_details_on_persona_id ON public.work_value_details USING btree (persona_id);


--
-- Name: index_work_value_details_on_required; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_work_value_details_on_required ON public.work_value_details USING btree (required);


--
-- Name: login_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX login_index ON public.users USING btree (id, document, lower((email)::text)) WHERE (deleted_at IS NULL);


--
-- Name: skills_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX skills_status_index ON public.skills USING btree (status);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: user_question_permissions fk_rails_033343eef4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_question_permissions
    ADD CONSTRAINT fk_rails_033343eef4 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: log_integration_files fk_rails_0840fcaccb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_integration_files
    ADD CONSTRAINT fk_rails_0840fcaccb FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: saved_requirements fk_rails_08965e6641; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_requirements
    ADD CONSTRAINT fk_rails_08965e6641 FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: domain_api_configurations fk_rails_08a0901b95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain_api_configurations
    ADD CONSTRAINT fk_rails_08a0901b95 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: user_group_question_permissions fk_rails_0ccc0cbb1f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_question_permissions
    ADD CONSTRAINT fk_rails_0ccc0cbb1f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: company_integration_field_columns fk_rails_0d92fd96aa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_integration_field_columns
    ADD CONSTRAINT fk_rails_0d92fd96aa FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: interviewer_candidates fk_rails_0f3f0c98ae; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interviewer_candidates
    ADD CONSTRAINT fk_rails_0f3f0c98ae FOREIGN KEY (interviewer_id) REFERENCES public.interviewers(id);


--
-- Name: presential_event_schedules fk_rails_112c63c98c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_schedules
    ADD CONSTRAINT fk_rails_112c63c98c FOREIGN KEY (presential_event_room_id) REFERENCES public.presential_event_rooms(id);


--
-- Name: company_messages fk_rails_11570494f0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_messages
    ADD CONSTRAINT fk_rails_11570494f0 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: group_presential_event_permissions fk_rails_11f61bec33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_presential_event_permissions
    ADD CONSTRAINT fk_rails_11f61bec33 FOREIGN KEY (presential_event_id) REFERENCES public.presential_events(id);


--
-- Name: log_integration_files fk_rails_1325d9408d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_integration_files
    ADD CONSTRAINT fk_rails_1325d9408d FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: group_users fk_rails_1486913327; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_users
    ADD CONSTRAINT fk_rails_1486913327 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: file_integration_emails fk_rails_1704adb323; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_integration_emails
    ADD CONSTRAINT fk_rails_1704adb323 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: template_messages fk_rails_1725046140; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_messages
    ADD CONSTRAINT fk_rails_1725046140 FOREIGN KEY (group_template_id) REFERENCES public.group_templates(id);


--
-- Name: user_requisition_permissions fk_rails_175d46f59d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_requisition_permissions
    ADD CONSTRAINT fk_rails_175d46f59d FOREIGN KEY (requisition_id) REFERENCES public.requisitions(id);


--
-- Name: company_opportunity_areas fk_rails_17afff1e48; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_opportunity_areas
    ADD CONSTRAINT fk_rails_17afff1e48 FOREIGN KEY (opportunity_area_id) REFERENCES public.opportunity_areas(id);


--
-- Name: user_group_question_permissions fk_rails_2067384392; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_question_permissions
    ADD CONSTRAINT fk_rails_2067384392 FOREIGN KEY (group_question_id) REFERENCES public.group_questions(id);


--
-- Name: group_integrations fk_rails_21d0457027; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_integrations
    ADD CONSTRAINT fk_rails_21d0457027 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: companies_sectors fk_rails_260f8677ee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies_sectors
    ADD CONSTRAINT fk_rails_260f8677ee FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: triggers fk_rails_28919a216a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.triggers
    ADD CONSTRAINT fk_rails_28919a216a FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: company_integration_fields fk_rails_28b9c4ac95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_integration_fields
    ADD CONSTRAINT fk_rails_28b9c4ac95 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: global_profile_statuses fk_rails_2d8b8f8893; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_profile_statuses
    ADD CONSTRAINT fk_rails_2d8b8f8893 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: group_permissions fk_rails_2dd3238448; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_permissions
    ADD CONSTRAINT fk_rails_2dd3238448 FOREIGN KEY (action_id) REFERENCES public.actions(id);


--
-- Name: group_permissions fk_rails_2e8d39ecac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_permissions
    ADD CONSTRAINT fk_rails_2e8d39ecac FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: group_integrations fk_rails_2fa4a87001; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_integrations
    ADD CONSTRAINT fk_rails_2fa4a87001 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: satisfaction_survey_answers fk_rails_32019113ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satisfaction_survey_answers
    ADD CONSTRAINT fk_rails_32019113ad FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_question_permissions fk_rails_34902f2d02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_question_permissions
    ADD CONSTRAINT fk_rails_34902f2d02 FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: group_requirements fk_rails_34970b3060; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_requirements
    ADD CONSTRAINT fk_rails_34970b3060 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: opportunities fk_rails_35fc59b988; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunities
    ADD CONSTRAINT fk_rails_35fc59b988 FOREIGN KEY (company_opportunity_group_id) REFERENCES public.company_opportunity_groups(id);


--
-- Name: indication_domains fk_rails_377ddf8b8c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indication_domains
    ADD CONSTRAINT fk_rails_377ddf8b8c FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: user_template_permissions fk_rails_399094da0c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_template_permissions
    ADD CONSTRAINT fk_rails_399094da0c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: group_presential_event_permissions fk_rails_3bb62c6602; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_presential_event_permissions
    ADD CONSTRAINT fk_rails_3bb62c6602 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: presential_event_users fk_rails_3e8b79c167; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_users
    ADD CONSTRAINT fk_rails_3e8b79c167 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: opportunity_email_messages fk_rails_4007a19054; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_email_messages
    ADD CONSTRAINT fk_rails_4007a19054 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: company_addresses fk_rails_40f085ab84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_addresses
    ADD CONSTRAINT fk_rails_40f085ab84 FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: company_integration_field_columns fk_rails_42cc57dc31; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_integration_field_columns
    ADD CONSTRAINT fk_rails_42cc57dc31 FOREIGN KEY (company_integration_field_id) REFERENCES public.company_integration_fields(id);


--
-- Name: partner_integrations fk_rails_46832dabda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_integrations
    ADD CONSTRAINT fk_rails_46832dabda FOREIGN KEY (user_create_id) REFERENCES public.users(id);


--
-- Name: group_requisition_permissions fk_rails_47fab38587; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_requisition_permissions
    ADD CONSTRAINT fk_rails_47fab38587 FOREIGN KEY (requisition_id) REFERENCES public.requisitions(id);


--
-- Name: group_collections fk_rails_4d13d749d4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_collections
    ADD CONSTRAINT fk_rails_4d13d749d4 FOREIGN KEY (company_collection_id) REFERENCES public.company_collections(id);


--
-- Name: company_collections fk_rails_4e4e229809; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_collections
    ADD CONSTRAINT fk_rails_4e4e229809 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: presential_event_users fk_rails_5101925a53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_users
    ADD CONSTRAINT fk_rails_5101925a53 FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: group_template_permissions fk_rails_519d2df5f7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_template_permissions
    ADD CONSTRAINT fk_rails_519d2df5f7 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: log_opportunity_statuses fk_rails_51fb3562f3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_opportunity_statuses
    ADD CONSTRAINT fk_rails_51fb3562f3 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: collection_opportunities fk_rails_549424d96d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_opportunities
    ADD CONSTRAINT fk_rails_549424d96d FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: user_presential_event_permissions fk_rails_550ec82bfe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_presential_event_permissions
    ADD CONSTRAINT fk_rails_550ec82bfe FOREIGN KEY (presential_event_id) REFERENCES public.presential_events(id);


--
-- Name: file_integration_emails fk_rails_590e668b40; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.file_integration_emails
    ADD CONSTRAINT fk_rails_590e668b40 FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: predispositions fk_rails_59c4b24812; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predispositions
    ADD CONSTRAINT fk_rails_59c4b24812 FOREIGN KEY (persona_id) REFERENCES public.personas(id);


--
-- Name: saved_requirements fk_rails_5a6cc46b43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_requirements
    ADD CONSTRAINT fk_rails_5a6cc46b43 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_template_permissions fk_rails_5e2cd8ebf4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_template_permissions
    ADD CONSTRAINT fk_rails_5e2cd8ebf4 FOREIGN KEY (template_message_id) REFERENCES public.template_messages(id);


--
-- Name: pre_subscriptions fk_rails_5e7635f610; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_subscriptions
    ADD CONSTRAINT fk_rails_5e7635f610 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: collection_opportunities fk_rails_63983a8410; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_opportunities
    ADD CONSTRAINT fk_rails_63983a8410 FOREIGN KEY (company_collection_id) REFERENCES public.company_collections(id);


--
-- Name: group_opportunities fk_rails_6642e0d165; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_opportunities
    ADD CONSTRAINT fk_rails_6642e0d165 FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: opportunity_viewers fk_rails_671dc3f48c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_viewers
    ADD CONSTRAINT fk_rails_671dc3f48c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: group_requirements fk_rails_6941093dc2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_requirements
    ADD CONSTRAINT fk_rails_6941093dc2 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: opportunity_email_messages fk_rails_69a5fb7baf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_email_messages
    ADD CONSTRAINT fk_rails_69a5fb7baf FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: group_group_question_permissions fk_rails_6d6fb9a36d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_group_question_permissions
    ADD CONSTRAINT fk_rails_6d6fb9a36d FOREIGN KEY (group_question_id) REFERENCES public.group_questions(id);


--
-- Name: user_accesses fk_rails_70d59ad00f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accesses
    ADD CONSTRAINT fk_rails_70d59ad00f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: company_notification_configurations fk_rails_72afeddfc2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_notification_configurations
    ADD CONSTRAINT fk_rails_72afeddfc2 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: presential_event_users fk_rails_748c135a42; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_users
    ADD CONSTRAINT fk_rails_748c135a42 FOREIGN KEY (presential_event_schedule_id) REFERENCES public.presential_event_schedules(id);


--
-- Name: group_question_permissions fk_rails_78a99d5d05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_question_permissions
    ADD CONSTRAINT fk_rails_78a99d5d05 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: job_boards_opportunities fk_rails_79f9dcad20; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_boards_opportunities
    ADD CONSTRAINT fk_rails_79f9dcad20 FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: groups fk_rails_7d1e321398; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT fk_rails_7d1e321398 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: opportunity_recommendations fk_rails_7d45c4fec3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_recommendations
    ADD CONSTRAINT fk_rails_7d45c4fec3 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: presential_event_schedules fk_rails_7e33a86aea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_schedules
    ADD CONSTRAINT fk_rails_7e33a86aea FOREIGN KEY (presential_event_id) REFERENCES public.presential_events(id);


--
-- Name: origin_page_views fk_rails_7f681f3957; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.origin_page_views
    ADD CONSTRAINT fk_rails_7f681f3957 FOREIGN KEY (subscription_source_id) REFERENCES public.subscription_sources(id);


--
-- Name: opportunity_recommendations fk_rails_80393164d4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_recommendations
    ADD CONSTRAINT fk_rails_80393164d4 FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: origin_page_views fk_rails_80c1d209bf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.origin_page_views
    ADD CONSTRAINT fk_rails_80c1d209bf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: presential_event_addresses fk_rails_823738314b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_addresses
    ADD CONSTRAINT fk_rails_823738314b FOREIGN KEY (presential_event_id) REFERENCES public.presential_events(id);


--
-- Name: satisfaction_survey_answers fk_rails_825097f535; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satisfaction_survey_answers
    ADD CONSTRAINT fk_rails_825097f535 FOREIGN KEY (satisfaction_survey_id) REFERENCES public.satisfaction_surveys(id);


--
-- Name: domain_api_configurations fk_rails_8a97b3be9d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain_api_configurations
    ADD CONSTRAINT fk_rails_8a97b3be9d FOREIGN KEY (company_integration_field_id) REFERENCES public.company_integration_fields(id);


--
-- Name: group_requisition_permissions fk_rails_8a99828c36; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_requisition_permissions
    ADD CONSTRAINT fk_rails_8a99828c36 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: trend_attitudes fk_rails_8e46486e19; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trend_attitudes
    ADD CONSTRAINT fk_rails_8e46486e19 FOREIGN KEY (support_persona_id) REFERENCES public.personas(id);


--
-- Name: pre_subscriptions fk_rails_968532ad08; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_subscriptions
    ADD CONSTRAINT fk_rails_968532ad08 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: company_opportunity_areas fk_rails_9776ddc99a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_opportunity_areas
    ADD CONSTRAINT fk_rails_9776ddc99a FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: action_logs fk_rails_98eb6e1bf3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_logs
    ADD CONSTRAINT fk_rails_98eb6e1bf3 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: opportunity_params fk_rails_9cdf68784d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_params
    ADD CONSTRAINT fk_rails_9cdf68784d FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: company_opportunity_groups fk_rails_9ff10ea624; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_opportunity_groups
    ADD CONSTRAINT fk_rails_9ff10ea624 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: requisition_fields fk_rails_a2dc85bce3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requisition_fields
    ADD CONSTRAINT fk_rails_a2dc85bce3 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: group_questions fk_rails_a717161900; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_questions
    ADD CONSTRAINT fk_rails_a717161900 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: group_users fk_rails_a9d5f48449; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_users
    ADD CONSTRAINT fk_rails_a9d5f48449 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: presential_events fk_rails_aa1494001e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_events
    ADD CONSTRAINT fk_rails_aa1494001e FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: trend_attitudes fk_rails_aec62fccf9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trend_attitudes
    ADD CONSTRAINT fk_rails_aec62fccf9 FOREIGN KEY (main_persona_id) REFERENCES public.personas(id);


--
-- Name: presential_event_users fk_rails_b38984e4ec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_users
    ADD CONSTRAINT fk_rails_b38984e4ec FOREIGN KEY (presential_event_room_id) REFERENCES public.presential_event_rooms(id);


--
-- Name: user_presential_event_permissions fk_rails_b5f84ae3de; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_presential_event_permissions
    ADD CONSTRAINT fk_rails_b5f84ae3de FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: saved_requirements fk_rails_b63a46b8f7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_requirements
    ADD CONSTRAINT fk_rails_b63a46b8f7 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: user_requisition_permissions fk_rails_b72fed461c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_requisition_permissions
    ADD CONSTRAINT fk_rails_b72fed461c FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: companies_sectors fk_rails_c0b965e6bc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies_sectors
    ADD CONSTRAINT fk_rails_c0b965e6bc FOREIGN KEY (sector_id) REFERENCES public.sectors(id);


--
-- Name: company_addresses fk_rails_c430a27db5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_addresses
    ADD CONSTRAINT fk_rails_c430a27db5 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: group_permissions fk_rails_c4c8f55ac6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_permissions
    ADD CONSTRAINT fk_rails_c4c8f55ac6 FOREIGN KEY (feature_id) REFERENCES public.features(id);


--
-- Name: pre_subscriptions fk_rails_c5fae895de; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pre_subscriptions
    ADD CONSTRAINT fk_rails_c5fae895de FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: opportunity_statuses fk_rails_c902eb4dc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_statuses
    ADD CONSTRAINT fk_rails_c902eb4dc1 FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: opportunity_configurations fk_rails_cb77f3bcc8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_configurations
    ADD CONSTRAINT fk_rails_cb77f3bcc8 FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: group_template_permissions fk_rails_cbad9d3168; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_template_permissions
    ADD CONSTRAINT fk_rails_cbad9d3168 FOREIGN KEY (template_message_id) REFERENCES public.template_messages(id);


--
-- Name: opportunity_viewers fk_rails_cf135aa4ad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_viewers
    ADD CONSTRAINT fk_rails_cf135aa4ad FOREIGN KEY (opportunity_id) REFERENCES public.opportunities(id);


--
-- Name: group_collections fk_rails_d025e4bb2f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_collections
    ADD CONSTRAINT fk_rails_d025e4bb2f FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: presential_event_notifications fk_rails_d673148151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_notifications
    ADD CONSTRAINT fk_rails_d673148151 FOREIGN KEY (presential_event_id) REFERENCES public.presential_events(id);


--
-- Name: opportunity_recommendations fk_rails_d9863b9f2f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunity_recommendations
    ADD CONSTRAINT fk_rails_d9863b9f2f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: satisfaction_surveys fk_rails_da87c6b67f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satisfaction_surveys
    ADD CONSTRAINT fk_rails_da87c6b67f FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: group_opportunities fk_rails_e19df16036; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_opportunities
    ADD CONSTRAINT fk_rails_e19df16036 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: user_accesses fk_rails_e42f8a3dd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accesses
    ADD CONSTRAINT fk_rails_e42f8a3dd5 FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: presential_event_rooms fk_rails_e44d82eb8c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_rooms
    ADD CONSTRAINT fk_rails_e44d82eb8c FOREIGN KEY (presential_event_id) REFERENCES public.presential_events(id);


--
-- Name: job_boards_opportunities fk_rails_e534bbac04; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_boards_opportunities
    ADD CONSTRAINT fk_rails_e534bbac04 FOREIGN KEY (job_board_id) REFERENCES public.job_boards(id);


--
-- Name: company_messages_configurations fk_rails_e68ba3914f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_messages_configurations
    ADD CONSTRAINT fk_rails_e68ba3914f FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: group_group_question_permissions fk_rails_ea43abb9a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_group_question_permissions
    ADD CONSTRAINT fk_rails_ea43abb9a6 FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: group_question_permissions fk_rails_ea60d90f98; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_question_permissions
    ADD CONSTRAINT fk_rails_ea60d90f98 FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: presential_event_users fk_rails_ec793beaa8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presential_event_users
    ADD CONSTRAINT fk_rails_ec793beaa8 FOREIGN KEY (presential_event_id) REFERENCES public.presential_events(id);


--
-- Name: partner_integrations fk_rails_ee7963c28f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partner_integrations
    ADD CONSTRAINT fk_rails_ee7963c28f FOREIGN KEY (user_update_id) REFERENCES public.users(id);


--
-- Name: questions fk_rails_ee79de8fe5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT fk_rails_ee79de8fe5 FOREIGN KEY (group_question_id) REFERENCES public.group_questions(id);


--
-- Name: group_requirements fk_rails_ef2602646f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_requirements
    ADD CONSTRAINT fk_rails_ef2602646f FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- Name: opportunities fk_rails_f4d8d5d98e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opportunities
    ADD CONSTRAINT fk_rails_f4d8d5d98e FOREIGN KEY (company_opportunity_area_id) REFERENCES public.company_opportunity_areas(id);


--
-- Name: triggers fk_rails_f8010ad9ef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.triggers
    ADD CONSTRAINT fk_rails_f8010ad9ef FOREIGN KEY (trigger_type_id) REFERENCES public.trigger_types(id);


--
-- Name: company_api_integrations fk_rails_fd3e73a44b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_api_integrations
    ADD CONSTRAINT fk_rails_fd3e73a44b FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- PostgreSQL database dump complete
--

