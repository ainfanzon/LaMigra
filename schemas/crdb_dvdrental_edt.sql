-- Note: this file has the target DDL annotated.
-- If there are any errors, do not run it against the target,
-- run convert again using the "--format original" option, and address
-- all the errors.
-- Review the warnings and confirm the statement conversion.
-- Tip:
--   to find all the errors search for "-- error: "
--   to find all the warnings search for "-- warning: "


-- Summary:
--  Total Statements: 122
--  Successful Statements: 83
--  Failed Statements: 24
--  Deleted Statements: 15
--  Warnings: 0
--  Suggestions: 26
--  Other Errors: 0
--  SQL Errors: 24
--  Not Implemented: 0


--  Notes:
--  Deleted: 15
--  SQL error: 24

DROP DATABASE IF EXISTS dvdrental;
CREATE DATABASE IF NOT EXISTS dvdrental;

USE dvdrental;

-- statement: 1
-- status: ok
-- original: 
-- SET statement_timeout = 0;
-- target:
SET statement_timeout = 0;

    
-- statement: 2
-- status: ok
-- original: 
-- SET lock_timeout = 0;
-- target:
SET lock_timeout = 0;

    
-- statement: 3
-- status: ok
-- original: 
-- SET idle_in_transaction_session_timeout = 0;
-- target:
SET idle_in_transaction_session_timeout = 0;

    
-- statement: 4
-- status: ok
-- original: 
-- SET client_encoding = 'UTF8';
-- target:
SET client_encoding = 'UTF8';

    
-- statement: 5
-- status: ok
-- original: 
-- SET standard_conforming_strings = on;
-- target:
SET standard_conforming_strings = "on";

    
-- statement: 6
-- status: ok
-- original: 
-- SELECT pg_catalog.set_config('search_path', '', false);
-- target:
SELECT pg_catalog.set_config('search_path', '', false);

    
-- statement: 7
-- status: ok
-- original: 
-- SET check_function_bodies = false;
-- target:
SET check_function_bodies = false;

    
-- statement: 8
-- status: ok
-- original: 
-- SET xmloption = content;
-- target:
SET xmloption = content;

    
-- statement: 9
-- status: ok
-- original: 
-- SET client_min_messages = warning;
-- target:
SET client_min_messages = warning;

    
-- statement: 10
-- status: ok
-- original: 
-- SET row_security = off;
-- target:
SET row_security = off;

    
-- statement: 11
-- status: ok
-- original: 
-- CREATE TYPE public.mpaa_rating AS ENUM (
--     'G',
--     'PG',
--     'PG-13',
--     'R',
--     'NC-17'
-- );
-- target:
CREATE TYPE public.mpaa_rating AS ENUM ('G', 'PG', 'PG-13', 'R', 'NC-17');

    
-- statement: 12
-- status: sql error
-- error: SQL error
-- detail: ERROR: at or near "as": syntax error: unimplemented: this syntax (SQLSTATE 0A000)
-- original: 
-- CREATE DOMAIN public.year AS integer
-- 	CONSTRAINT year_check CHECK (((VALUE >= 1901) AND (VALUE <= 2155)));
-- target:
-- CREATE DOMAIN public.year AS integer
--	CONSTRAINT year_check CHECK (((VALUE >= 1901) AND (VALUE <= 2155)));

    
-- statement: 13
-- status: ok
-- original: 
-- CREATE FUNCTION public._group_concat(text, text) RETURNS text
--     LANGUAGE sql IMMUTABLE
--     AS $_$
-- SELECT CASE
--   WHEN $2 IS NULL THEN $1
--   WHEN $1 IS NULL THEN $2
--   ELSE $1 || ', ' || $2
-- END
-- $_$;
-- target:
CREATE OR REPLACE FUNCTION public.group_concat(a STRING, b STRING)
RETURNS STRING
LANGUAGE SQL
IMMUTABLE
AS $$
  SELECT CASE
    WHEN b IS NULL THEN a
    WHEN a IS NULL THEN b
    ELSE a || ', ' || b
  END
$$;

    
-- AIM NEEDS FIXINg
-- statement: 19
-- status: sql error
-- error: SQL error
-- detail: ERROR: stable statement not allowed in immutable function: SELECT CASE WHEN extract('month', $1) = 12 THEN (((extract('year', $1) + 1) OPERATOR(||) '-01-01')::DATE - '1 day'::INTERVAL)::DATE ELSE ((extract('year', $1) OPERATOR(||) ('-' OPERATOR(||) ((extract('month', $1) + 1) OPERATOR(||) '-01')))::DATE - '1 day'::INTERVAL)::DATE END (SQLSTATE 22023)
-- original: 
-- CREATE FUNCTION public.last_day(timestamp without time zone) RETURNS date
--     LANGUAGE sql IMMUTABLE STRICT
--     AS $_$
--   SELECT CASE
--     WHEN EXTRACT(MONTH FROM $1) = 12 THEN
--       (((EXTRACT(YEAR FROM $1) + 1) operator(pg_catalog.||) '-01-01')::date - INTERVAL '1 day')::date
--     ELSE
--       ((EXTRACT(YEAR FROM $1) operator(pg_catalog.||) '-' operator(pg_catalog.||) (EXTRACT(MONTH FROM $1) + 1) operator(pg_catalog.||) '-01')::date - INTERVAL '1 day')::date
--     END
-- $_$;
-- target:
-- CREATE FUNCTION public.last_day(IN TIMESTAMP)
-- 	RETURNS DATE
-- 	LANGUAGE SQL
-- 	IMMUTABLE
-- 	STRICT
-- 	AS $$
--   SELECT CASE
--     WHEN EXTRACT(MONTH FROM $1) = 12 THEN
--       (((EXTRACT(YEAR FROM $1) + 1) operator(pg_catalog.||) '-01-01')::date - INTERVAL '1 day')::date
--     ELSE
--       ((EXTRACT(YEAR FROM $1) operator(pg_catalog.||) '-' operator(pg_catalog.||) (EXTRACT(MONTH FROM $1) + 1) operator(pg_catalog.||) '-01')::date - INTERVAL '1 day')::date
--     END
-- $$;

    
-- statement: 20
-- status: ok
-- original: 
-- CREATE FUNCTION public.last_updated() RETURNS trigger
--     LANGUAGE plpgsql
--     AS $$
-- BEGIN
--     NEW.last_update = CURRENT_TIMESTAMP;
--     RETURN NEW;
-- END $$;
-- target:
CREATE FUNCTION public.last_updated()
	RETURNS trigger
	LANGUAGE plpgsql
	AS $$
BEGIN
    NEW.last_update = CURRENT_TIMESTAMP;
    RETURN NEW;
END $$;

    
-- statement: 21
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.customer_customer_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.customer_customer_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 22
-- status: ok
-- original: 
-- SET default_tablespace = '';
-- target:
SET default_tablespace = '';

    
-- statement: 23
-- status: ok
-- original: 
-- SET default_table_access_method = heap;
-- target:
SET default_table_access_method = heap;

    
-- statement: 24
-- status: ok
-- suggestion: Column customer_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.customer (
--     customer_id integer DEFAULT nextval('public.customer_customer_id_seq'::regclass) NOT NULL,
--     store_id smallint NOT NULL,
--     first_name character varying(45) NOT NULL,
--     last_name character varying(45) NOT NULL,
--     email character varying(50),
--     address_id smallint NOT NULL,
--     activebool boolean DEFAULT true NOT NULL,
--     create_date date DEFAULT ('now'::text)::date NOT NULL,
--     last_update timestamp without time zone DEFAULT now(),
--     active integer
-- );
-- target:
CREATE TABLE public.customer (
	customer_id INT4
	DEFAULT nextval(
		'public.customer_customer_id_seq'::REGCLASS
	)
	NOT NULL,
	store_id INT2 NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	email VARCHAR(50),
	address_id INT2 NOT NULL,
	activebool BOOL DEFAULT true NOT NULL,
	create_date DATE DEFAULT ('now'::STRING)::DATE NOT NULL,
	last_update TIMESTAMP DEFAULT now(),
	active INT4,
	CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
);

-- AIM NEEDS FIXING    
-- statement: 25
-- status: sql error
-- error: SQL error
-- detail: ERROR: unimplemented: set-returning PL/pgSQL functions are not yet supported (SQLSTATE 0A000)
-- original: 
-- CREATE FUNCTION public.rewards_report(min_monthly_purchases integer, min_dollar_amount_purchased numeric) RETURNS SETOF public.customer
--     LANGUAGE plpgsql SECURITY DEFINER
--     AS $_$
-- DECLARE
--     last_month_start DATE;
--     last_month_end DATE;
-- rr RECORD;
-- tmpSQL TEXT;
-- BEGIN
-- 
--     /* Some sanity checks... */
--     IF min_monthly_purchases = 0 THEN
--         RAISE EXCEPTION 'Minimum monthly purchases parameter must be > 0';
--     END IF;
--     IF min_dollar_amount_purchased = 0.00 THEN
--         RAISE EXCEPTION 'Minimum monthly dollar amount purchased parameter must be > $0.00';
--     END IF;
-- 
--     last_month_start := CURRENT_DATE - '3 month'::interval;
--     last_month_start := to_date((extract(YEAR FROM last_month_start) || '-' || extract(MONTH FROM last_month_start) || '-01'),'YYYY-MM-DD');
--     last_month_end := LAST_DAY(last_month_start);
-- 
--     /*
--     Create a temporary storage area for Customer IDs.
--     */
--     CREATE TEMPORARY TABLE tmpCustomer (customer_id INTEGER NOT NULL PRIMARY KEY);
-- 
--     /*
--     Find all customers meeting the monthly purchase requirements
--     */
-- 
--     tmpSQL := 'INSERT INTO tmpCustomer (customer_id)
--         SELECT p.customer_id
--         FROM payment AS p
--         WHERE DATE(p.payment_date) BETWEEN '||quote_literal(last_month_start) ||' AND '|| quote_literal(last_month_end) || '
--         GROUP BY customer_id
--         HAVING SUM(p.amount) > '|| min_dollar_amount_purchased || '
--         AND COUNT(customer_id) > ' ||min_monthly_purchases ;
-- 
--     EXECUTE tmpSQL;
-- 
--     /*
--     Output ALL customer information of matching rewardees.
--     Customize output as needed.
--     */
--     FOR rr IN EXECUTE 'SELECT c.* FROM tmpCustomer AS t INNER JOIN customer AS c ON t.customer_id = c.customer_id' LOOP
--         RETURN NEXT rr;
--     END LOOP;
-- 
--     /* Clean up */
--     tmpSQL := 'DROP TABLE tmpCustomer';
--     EXECUTE tmpSQL;
-- 
-- RETURN;
-- END
-- $_$;
-- target:
-- CREATE FUNCTION public.rewards_report(min_monthly_purchases integer, min_dollar_amount_purchased numeric) RETURNS SETOF public.customer
--     LANGUAGE plpgsql SECURITY DEFINER
--     AS $_$
-- DECLARE
--     last_month_start DATE;
--     last_month_end DATE;
-- rr RECORD;
-- tmpSQL TEXT;
-- BEGIN
-- 
--     /* Some sanity checks... */
--     IF min_monthly_purchases = 0 THEN
--         RAISE EXCEPTION 'Minimum monthly purchases parameter must be > 0';
--     END IF;
--     IF min_dollar_amount_purchased = 0.00 THEN
--         RAISE EXCEPTION 'Minimum monthly dollar amount purchased parameter must be > $0.00';
--     END IF;
-- 
--     last_month_start := CURRENT_DATE - '3 month'::interval;
--     last_month_start := to_date((extract(YEAR FROM last_month_start) || '-' || extract(MONTH FROM last_month_start) || '-01'),'YYYY-MM-DD');
--     last_month_end := LAST_DAY(last_month_start);
-- 
--     /*
--     Create a temporary storage area for Customer IDs.
--     */
--     CREATE TEMPORARY TABLE tmpCustomer (customer_id INTEGER NOT NULL PRIMARY KEY);
-- 
--     /*
--     Find all customers meeting the monthly purchase requirements
--     */
-- 
--     tmpSQL := 'INSERT INTO tmpCustomer (customer_id)
--         SELECT p.customer_id
--         FROM payment AS p
--         WHERE DATE(p.payment_date) BETWEEN '||quote_literal(last_month_start) ||' AND '|| quote_literal(last_month_end) || '
--         GROUP BY customer_id
--         HAVING SUM(p.amount) > '|| min_dollar_amount_purchased || '
--         AND COUNT(customer_id) > ' ||min_monthly_purchases ;
-- 
--     EXECUTE tmpSQL;
-- 
--     /*
--     Output ALL customer information of matching rewardees.
--     Customize output as needed.
--     */
--     FOR rr IN EXECUTE 'SELECT c.* FROM tmpCustomer AS t INNER JOIN customer AS c ON t.customer_id = c.customer_id' LOOP
--         RETURN NEXT rr;
--     END LOOP;
-- 
--     /* Clean up */
--     tmpSQL := 'DROP TABLE tmpCustomer';
--     EXECUTE tmpSQL;
-- 
-- RETURN;
-- END
-- $_$;

-- AIM NEEDS FIXING    
-- statement: 26
-- status: sql error
-- error: SQL error
-- detail: ERROR: at or near "public": syntax error: unimplemented: this syntax (SQLSTATE 0A000)
-- original: 
-- CREATE AGGREGATE public.group_concat(text) (
--     SFUNC = public._group_concat,
--     STYPE = text
-- );
-- target:
-- CREATE AGGREGATE public.group_concat(text) (
--     SFUNC = public._group_concat,
--     STYPE = text
-- );

    
-- statement: 27
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.actor_actor_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.actor_actor_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 28
-- status: ok
-- suggestion: Column actor_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.actor (
--     actor_id integer DEFAULT nextval('public.actor_actor_id_seq'::regclass) NOT NULL,
--     first_name character varying(45) NOT NULL,
--     last_name character varying(45) NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.actor (
	actor_id INT4
	DEFAULT nextval('public.actor_actor_id_seq'::REGCLASS)
	NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT actor_pkey PRIMARY KEY (actor_id)
);

    
-- statement: 29
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.category_category_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.category_category_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 30
-- status: ok
-- suggestion: Column category_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.category (
--     category_id integer DEFAULT nextval('public.category_category_id_seq'::regclass) NOT NULL,
--     name character varying(25) NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.category (
	category_id INT4
	DEFAULT nextval(
		'public.category_category_id_seq'::REGCLASS
	)
	NOT NULL,
	name VARCHAR(25) NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT category_pkey PRIMARY KEY (category_id)
);

    
-- statement: 31
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.film_film_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.film_film_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 32
-- status: sql error
-- error: SQL error
-- detail: ERROR: type "public.year" does not exist (SQLSTATE 42704)
-- suggestion: Column film_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.film (
--     film_id integer DEFAULT nextval('public.film_film_id_seq'::regclass) NOT NULL,
--     title character varying(255) NOT NULL,
--     description text,
--     release_year public.year,
--     language_id smallint NOT NULL,
--     rental_duration smallint DEFAULT 3 NOT NULL,
--     rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
--     length smallint,
--     replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
--     rating public.mpaa_rating DEFAULT 'G'::public.mpaa_rating,
--     last_update timestamp without time zone DEFAULT now() NOT NULL,
--     special_features text[],
--     fulltext tsvector NOT NULL
-- );
-- target:
CREATE TABLE public.film (
	film_id INT4
	DEFAULT nextval('public.film_film_id_seq'::REGCLASS)
	NOT NULL,
	title VARCHAR(255) NOT NULL,
	description STRING,
	-- release_year INT CHECK (year >= 1901 AND year <= 2155),
	release_year INT,
	language_id INT2 NOT NULL,
	rental_duration INT2 DEFAULT 3 NOT NULL,
	rental_rate DECIMAL(4,2) DEFAULT 4.99 NOT NULL,
	length INT2,
	replacement_cost DECIMAL(5,2) DEFAULT 19.99 NOT NULL,
	rating public.mpaa_rating
	DEFAULT 'G'::public.mpaa_rating,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	special_features STRING[],
	fulltext text NOT NULL,
	-- AIM REPLACED THIS
	-- fulltext TSVECTOR NOT NULL,
	CONSTRAINT film_pkey PRIMARY KEY (film_id)
);

    
-- statement: 33
-- status: ok
-- original: 
-- CREATE TABLE public.film_actor (
--     actor_id smallint NOT NULL,
--     film_id smallint NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.film_actor (
	actor_id INT2 NOT NULL,
	film_id INT2 NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT film_actor_pkey
		PRIMARY KEY (actor_id, film_id)
);

    
-- statement: 34
-- status: ok
-- original: 
-- CREATE TABLE public.film_category (
--     film_id smallint NOT NULL,
--     category_id smallint NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.film_category (
	film_id INT2 NOT NULL,
	category_id INT2 NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT film_category_pkey
		PRIMARY KEY (film_id, category_id)
);

    
-- AIM NEEDS FIXING
-- statement: 35
-- status: sql error
-- error: SQL error
-- detail: ERROR: unknown function: public.group_concat() (SQLSTATE 42883)
-- original: 
-- CREATE VIEW public.actor_info AS
--  SELECT a.actor_id,
--     a.first_name,
--     a.last_name,
--     public.group_concat(DISTINCT (((c.name)::text || ': '::text) || ( SELECT public.group_concat((f.title)::text) AS group_concat
--            FROM ((public.film f
--              JOIN public.film_category fc_1 ON ((f.film_id = fc_1.film_id)))
--              JOIN public.film_actor fa_1 ON ((f.film_id = fa_1.film_id)))
--           WHERE ((fc_1.category_id = c.category_id) AND (fa_1.actor_id = a.actor_id))
--           GROUP BY fa_1.actor_id))) AS film_info
--    FROM (((public.actor a
--      LEFT JOIN public.film_actor fa ON ((a.actor_id = fa.actor_id)))
--      LEFT JOIN public.film_category fc ON ((fa.film_id = fc.film_id)))
--      LEFT JOIN public.category c ON ((fc.category_id = c.category_id)))
--   GROUP BY a.actor_id, a.first_name, a.last_name;
-- target:
-- CREATE VIEW public.actor_info AS
-- 	SELECT a.actor_id,
-- 	a.first_name,
-- 	a.last_name,
-- 	public.group_concat(
-- 		DISTINCT
-- 		(c.name)::STRING
-- 		|| ': '::STRING
-- 		|| (
-- 				SELECT public.group_concat(
-- 					(f.title)::STRING
-- 				)
-- 					AS group_concat
-- 				FROM (
-- 					public.film AS f
-- 					JOIN public.film_category AS fc_1 ON
-- 							f.film_id = fc_1.film_id
-- 				)
-- 				JOIN public.film_actor AS fa_1 ON
-- 						f.film_id = fa_1.film_id
-- 				WHERE fc_1.category_id = c.category_id
-- 				AND fa_1.actor_id = a.actor_id
-- 				GROUP BY fa_1.actor_id
-- 			)
-- 	)
-- 		AS film_info
-- 	FROM (
-- 		(
-- 			public.actor AS a
-- 			LEFT JOIN public.film_actor AS fa ON
-- 					a.actor_id = fa.actor_id
-- 		)
-- 		LEFT JOIN public.film_category AS fc ON
-- 				fa.film_id = fc.film_id
-- 	)
-- 	LEFT JOIN public.category AS c ON
-- 			fc.category_id = c.category_id
-- 	GROUP BY a.actor_id,
-- 	a.first_name,
-- 	a.last_name;

    
-- statement: 36
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.address_address_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.address_address_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 37
-- status: ok
-- suggestion: Column address_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.address (
--     address_id integer DEFAULT nextval('public.address_address_id_seq'::regclass) NOT NULL,
--     address character varying(50) NOT NULL,
--     address2 character varying(50),
--     district character varying(20) NOT NULL,
--     city_id smallint NOT NULL,
--     postal_code character varying(10),
--     phone character varying(20) NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.address (
	address_id INT4
	DEFAULT nextval(
		'public.address_address_id_seq'::REGCLASS
	)
	NOT NULL,
	address VARCHAR(50) NOT NULL,
	address2 VARCHAR(50),
	district VARCHAR(20) NOT NULL,
	city_id INT2 NOT NULL,
	postal_code VARCHAR(10),
	phone VARCHAR(20) NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT address_pkey PRIMARY KEY (address_id)
);

    
-- statement: 38
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.city_city_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.city_city_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 39
-- status: ok
-- suggestion: Column city_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.city (
--     city_id integer DEFAULT nextval('public.city_city_id_seq'::regclass) NOT NULL,
--     city character varying(50) NOT NULL,
--     country_id smallint NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.city (
	city_id INT4
	DEFAULT nextval('public.city_city_id_seq'::REGCLASS)
	NOT NULL,
	city VARCHAR(50) NOT NULL,
	country_id INT2 NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT city_pkey PRIMARY KEY (city_id)
);

    
-- statement: 40
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.country_country_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.country_country_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 41
-- status: ok
-- suggestion: Column country_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.country (
--     country_id integer DEFAULT nextval('public.country_country_id_seq'::regclass) NOT NULL,
--     country character varying(50) NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.country (
	country_id INT4
	DEFAULT nextval(
		'public.country_country_id_seq'::REGCLASS
	)
	NOT NULL,
	country VARCHAR(50) NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT country_pkey PRIMARY KEY (country_id)
);

    
-- statement: 42
-- status: ok
-- original: 
-- CREATE VIEW public.customer_list AS
--  SELECT cu.customer_id AS id,
--     (((cu.first_name)::text || ' '::text) || (cu.last_name)::text) AS name,
--     a.address,
--     a.postal_code AS "zip code",
--     a.phone,
--     city.city,
--     country.country,
--         CASE
--             WHEN cu.activebool THEN 'active'::text
--             ELSE ''::text
--         END AS notes,
--     cu.store_id AS sid
--    FROM (((public.customer cu
--      JOIN public.address a ON ((cu.address_id = a.address_id)))
--      JOIN public.city ON ((a.city_id = city.city_id)))
--      JOIN public.country ON ((city.country_id = country.country_id)));
-- target:
CREATE VIEW public.customer_list AS
	SELECT cu.customer_id AS id,
	(cu.first_name)::STRING
	|| ' '::STRING
	|| (cu.last_name)::STRING
		AS name,
	a.address,
	a.postal_code AS "zip code",
	a.phone,
	city.city,
	country.country,
	CASE
	WHEN cu.activebool THEN 'active'::STRING
	ELSE ''::STRING
	END
		AS notes,
	cu.store_id AS sid
	FROM (
		(
			public.customer AS cu
			JOIN public.address AS a ON
					cu.address_id = a.address_id
		)
		JOIN public.city ON a.city_id = city.city_id
	)
	JOIN public.country ON
			city.country_id = country.country_id;

    
-- statement: 43
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE VIEW public.film_list AS
--  SELECT film.film_id AS fid,
--     film.title,
--     film.description,
--     category.name AS category,
--     film.rental_rate AS price,
--     film.length,
--     film.rating,
--     public.group_concat((((actor.first_name)::text || ' '::text) || (actor.last_name)::text)) AS actors
--    FROM ((((public.category
--      LEFT JOIN public.film_category ON ((category.category_id = film_category.category_id)))
--      LEFT JOIN public.film ON ((film_category.film_id = film.film_id)))
--      JOIN public.film_actor ON ((film.film_id = film_actor.film_id)))
--      JOIN public.actor ON ((film_actor.actor_id = actor.actor_id)))
--   GROUP BY film.film_id, film.title, film.description, category.name, film.rental_rate, film.length, film.rating;
-- target:
-- CREATE VIEW public.film_list AS
-- 	SELECT film.film_id AS fid,
-- 	film.title,
-- 	film.description,
-- 	category.name AS category,
-- 	film.rental_rate AS price,
-- 	film.length,
-- 	film.rating,
-- 	public.group_concat(
-- 		(actor.first_name)::STRING
-- 		|| ' '::STRING
-- 		|| (actor.last_name)::STRING
-- 	)
-- 		AS actors
-- 	FROM (
-- 		(
-- 			(
-- 				public.category
-- 				LEFT JOIN public.film_category ON
-- 						category.category_id
-- 						= film_category.category_id
-- 			)
-- 			LEFT JOIN public.film ON
-- 					film_category.film_id = film.film_id
-- 		)
-- 		JOIN public.film_actor ON
-- 				film.film_id = film_actor.film_id
-- 	)
-- 	JOIN public.actor ON
-- 			film_actor.actor_id = actor.actor_id
-- 	GROUP BY film.film_id,
-- 	film.title,
-- 	film.description,
-- 	category.name,
-- 	film.rental_rate,
-- 	film.length,
-- 	film.rating;

    
-- statement: 16
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "film" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE FUNCTION public.get_customer_balance(p_customer_id integer, p_effective_date timestamp without time zone) RETURNS numeric
--     LANGUAGE plpgsql
--     AS $$
--        --#OK, WE NEED TO CALCULATE THE CURRENT BALANCE GIVEN A CUSTOMER_ID AND A DATE
--        --#THAT WE WANT THE BALANCE TO BE EFFECTIVE FOR. THE BALANCE IS:
--        --#   1) RENTAL FEES FOR ALL PREVIOUS RENTALS
--        --#   2) ONE DOLLAR FOR EVERY DAY THE PREVIOUS RENTALS ARE OVERDUE
--        --#   3) IF A FILM IS MORE THAN RENTAL_DURATION * 2 OVERDUE, CHARGE THE REPLACEMENT_COST
--        --#   4) SUBTRACT ALL PAYMENTS MADE BEFORE THE DATE SPECIFIED
-- DECLARE
--     v_rentfees DECIMAL(5,2); --#FEES PAID TO RENT THE VIDEOS INITIALLY
--     v_overfees INTEGER;      --#LATE FEES FOR PRIOR RENTALS
--     v_payments DECIMAL(5,2); --#SUM OF PAYMENTS MADE PREVIOUSLY
-- BEGIN
--     SELECT COALESCE(SUM(film.rental_rate),0) INTO v_rentfees
--     FROM film, inventory, rental
--     WHERE film.film_id = inventory.film_id
--       AND inventory.inventory_id = rental.inventory_id
--       AND rental.rental_date <= p_effective_date
--       AND rental.customer_id = p_customer_id;
-- 
--     SELECT COALESCE(SUM(IF((rental.return_date - rental.rental_date) > (film.rental_duration * '1 day'::interval),
--         ((rental.return_date - rental.rental_date) - (film.rental_duration * '1 day'::interval)),0)),0) INTO v_overfees
--     FROM rental, inventory, film
--     WHERE film.film_id = inventory.film_id
--       AND inventory.inventory_id = rental.inventory_id
--       AND rental.rental_date <= p_effective_date
--       AND rental.customer_id = p_customer_id;
-- 
--     SELECT COALESCE(SUM(payment.amount),0) INTO v_payments
--     FROM payment
--     WHERE payment.payment_date <= p_effective_date
--     AND payment.customer_id = p_customer_id;
-- 
--     RETURN v_rentfees + v_overfees - v_payments;
-- END
-- $$;
-- target:
-- CREATE FUNCTION public.get_customer_balance(IN p_customer_id INT4, IN p_effective_date TIMESTAMP)
-- 	RETURNS DECIMAL
-- 	LANGUAGE plpgsql
-- 	AS $$
--        --#OK, WE NEED TO CALCULATE THE CURRENT BALANCE GIVEN A CUSTOMER_ID AND A DATE
--        --#THAT WE WANT THE BALANCE TO BE EFFECTIVE FOR. THE BALANCE IS:
--        --#   1) RENTAL FEES FOR ALL PREVIOUS RENTALS
--        --#   2) ONE DOLLAR FOR EVERY DAY THE PREVIOUS RENTALS ARE OVERDUE
--        --#   3) IF A FILM IS MORE THAN RENTAL_DURATION * 2 OVERDUE, CHARGE THE REPLACEMENT_COST
--        --#   4) SUBTRACT ALL PAYMENTS MADE BEFORE THE DATE SPECIFIED
-- DECLARE
--     v_rentfees DECIMAL(5,2); --#FEES PAID TO RENT THE VIDEOS INITIALLY
--     v_overfees INTEGER;      --#LATE FEES FOR PRIOR RENTALS
--     v_payments DECIMAL(5,2); --#SUM OF PAYMENTS MADE PREVIOUSLY
-- BEGIN
--     SELECT COALESCE(SUM(film.rental_rate),0) INTO v_rentfees
--     FROM film, inventory, rental
--     WHERE film.film_id = inventory.film_id
--       AND inventory.inventory_id = rental.inventory_id
--       AND rental.rental_date <= p_effective_date
--       AND rental.customer_id = p_customer_id;
-- 
--     SELECT COALESCE(SUM(IF((rental.return_date - rental.rental_date) > (film.rental_duration * '1 day'::interval),
--         ((rental.return_date - rental.rental_date) - (film.rental_duration * '1 day'::interval)),0)),0) INTO v_overfees
--     FROM rental, inventory, film
--     WHERE film.film_id = inventory.film_id
--       AND inventory.inventory_id = rental.inventory_id
--       AND rental.rental_date <= p_effective_date
--       AND rental.customer_id = p_customer_id;
-- 
--     SELECT COALESCE(SUM(payment.amount),0) INTO v_payments
--     FROM payment
--     WHERE payment.payment_date <= p_effective_date
--     AND payment.customer_id = p_customer_id;
-- 
--     RETURN v_rentfees + v_overfees - v_payments;
-- END
-- $$;


-- statement: 44
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.inventory_inventory_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.inventory_inventory_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 45
-- status: ok
-- suggestion: Column inventory_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.inventory (
--     inventory_id integer DEFAULT nextval('public.inventory_inventory_id_seq'::regclass) NOT NULL,
--     film_id smallint NOT NULL,
--     store_id smallint NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.inventory (
	inventory_id INT4
	DEFAULT nextval(
		'public.inventory_inventory_id_seq'::REGCLASS
	)
	NOT NULL,
	film_id INT2 NOT NULL,
	store_id INT2 NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id)
);

    
-- statement: 51
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.rental_rental_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.rental_rental_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 52
-- status: ok
-- suggestion: Column rental_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.rental (
--     rental_id integer DEFAULT nextval('public.rental_rental_id_seq'::regclass) NOT NULL,
--     rental_date timestamp without time zone NOT NULL,
--     inventory_id integer NOT NULL,
--     customer_id smallint NOT NULL,
--     return_date timestamp without time zone,
--     staff_id smallint NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.rental (
	rental_id INT4
	DEFAULT nextval('public.rental_rental_id_seq'::REGCLASS)
	NOT NULL,
	rental_date TIMESTAMP NOT NULL,
	inventory_id INT4 NOT NULL,
	customer_id INT2 NOT NULL,
	return_date TIMESTAMP,
	staff_id INT2 NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT rental_pkey PRIMARY KEY (rental_id)
);


-- statement: 18
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "rental" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE FUNCTION public.inventory_in_stock(p_inventory_id integer) RETURNS boolean
--     LANGUAGE plpgsql
--     AS $$
-- DECLARE
--     v_rentals INTEGER;
--     v_out     INTEGER;
-- BEGIN
--     -- AN ITEM IS IN-STOCK IF THERE ARE EITHER NO ROWS IN THE rental TABLE
--     -- FOR THE ITEM OR ALL ROWS HAVE return_date POPULATED
-- 
--     SELECT count(*) INTO v_rentals
--     FROM rental
--     WHERE inventory_id = p_inventory_id;
-- 
--     IF v_rentals = 0 THEN
--       RETURN TRUE;
--     END IF;
-- 
--     SELECT COUNT(rental_id) INTO v_out
--     FROM inventory LEFT JOIN rental USING(inventory_id)
--     WHERE inventory.inventory_id = p_inventory_id
--     AND rental.return_date IS NULL;
-- 
--     IF v_out > 0 THEN
--       RETURN FALSE;
--     ELSE
--       RETURN TRUE;
--     END IF;
-- END $$;
-- target:
CREATE FUNCTION public.inventory_in_stock(IN p_inventory_id INT4)
	RETURNS BOOL
	LANGUAGE plpgsql
	AS $$
DECLARE
    v_rentals INTEGER;
    v_out     INTEGER;
BEGIN
    -- AN ITEM IS IN-STOCK IF THERE ARE EITHER NO ROWS IN THE rental TABLE
    -- FOR THE ITEM OR ALL ROWS HAVE return_date POPULATED

    SELECT count(*) INTO v_rentals
    FROM public.rental
    WHERE inventory_id = p_inventory_id;

    IF v_rentals = 0 THEN
      RETURN TRUE;
    END IF;

    SELECT COUNT(rental_id) INTO v_out
    FROM public.inventory LEFT JOIN public.rental USING(inventory_id)
    WHERE inventory.inventory_id = p_inventory_id
    AND rental.return_date IS NULL;

    IF v_out > 0 THEN
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
END $$;

-- statement: 15
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "inventory" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE FUNCTION public.film_not_in_stock(p_film_id integer, p_store_id integer, OUT p_film_count integer) RETURNS SETOF integer
--     LANGUAGE sql
--     AS $_$
--     SELECT inventory_id
--     FROM inventory
--     WHERE film_id = $1
--     AND store_id = $2
--     AND NOT inventory_in_stock(inventory_id);
-- $_$;
-- target:
CREATE FUNCTION public.film_not_in_stock(p_film_id integer, p_store_id integer, OUT p_film_count integer) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$
    SELECT inventory_id
    FROM public.inventory
    WHERE film_id = $1
    AND store_id = $2
    AND NOT public.inventory_in_stock(inventory_id);
$_$;

    
-- statement: 14
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "inventory" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE FUNCTION public.film_in_stock(p_film_id integer, p_store_id integer, OUT p_film_count integer) RETURNS SETOF integer
--     LANGUAGE sql
--     AS $_$
--      SELECT inventory_id
--      FROM inventory
--      WHERE film_id = $1
--      AND store_id = $2
--      AND inventory_in_stock(inventory_id);
-- $_$;
-- target:
CREATE FUNCTION public.film_in_stock(p_film_id integer, p_store_id integer, OUT p_film_count integer) RETURNS SETOF integer
    LANGUAGE sql
    AS $_$
     SELECT inventory_id
     FROM public.inventory
     WHERE film_id = $1
     AND store_id = $2
     AND public.inventory_in_stock(inventory_id);
    
$_$;


-- statement: 46
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.language_language_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.language_language_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 47
-- status: ok
-- suggestion: Column language_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.language (
--     language_id integer DEFAULT nextval('public.language_language_id_seq'::regclass) NOT NULL,
--     name character(20) NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.language (
	language_id INT4
	DEFAULT nextval(
		'public.language_language_id_seq'::REGCLASS
	)
	NOT NULL,
	name CHAR(20) NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT language_pkey PRIMARY KEY (language_id)
);

    
-- statement: 48
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE VIEW public.nicer_but_slower_film_list AS
--  SELECT film.film_id AS fid,
--     film.title,
--     film.description,
--     category.name AS category,
--     film.rental_rate AS price,
--     film.length,
--     film.rating,
--     public.group_concat((((upper("substring"((actor.first_name)::text, 1, 1)) || lower("substring"((actor.first_name)::text, 2))) || upper("substring"((actor.last_name)::text, 1, 1))) || lower("substring"((actor.last_name)::text, 2)))) AS actors
--    FROM ((((public.category
--      LEFT JOIN public.film_category ON ((category.category_id = film_category.category_id)))
--      LEFT JOIN public.film ON ((film_category.film_id = film.film_id)))
--      JOIN public.film_actor ON ((film.film_id = film_actor.film_id)))
--      JOIN public.actor ON ((film_actor.actor_id = actor.actor_id)))
--   GROUP BY film.film_id, film.title, film.description, category.name, film.rental_rate, film.length, film.rating;
-- target:
-- CREATE VIEW public.nicer_but_slower_film_list AS
-- 	SELECT film.film_id AS fid,
-- 	film.title,
-- 	film.description,
-- 	category.name AS category,
-- 	film.rental_rate AS price,
-- 	film.length,
-- 	film.rating,
-- 	public.group_concat(
-- 		upper("substring"((actor.first_name)::STRING, 1, 1))
-- 		|| lower("substring"((actor.first_name)::STRING, 2))
-- 		|| upper(
-- 				"substring"((actor.last_name)::STRING, 1, 1)
-- 			)
-- 		|| lower("substring"((actor.last_name)::STRING, 2))
-- 	)
-- 		AS actors
-- 	FROM (
-- 		(
-- 			(
-- 				public.category
-- 				LEFT JOIN public.film_category ON
-- 						category.category_id
-- 						= film_category.category_id
-- 			)
-- 			LEFT JOIN public.film ON
-- 					film_category.film_id = film.film_id
-- 		)
-- 		JOIN public.film_actor ON
-- 				film.film_id = film_actor.film_id
-- 	)
-- 	JOIN public.actor ON
-- 			film_actor.actor_id = actor.actor_id
-- 	GROUP BY film.film_id,
-- 	film.title,
-- 	film.description,
-- 	category.name,
-- 	film.rental_rate,
-- 	film.length,
-- 	film.rating;

    
-- statement: 49
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.payment_payment_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.payment_payment_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 50
-- status: ok
-- suggestion: Column payment_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.payment (
--     payment_id integer DEFAULT nextval('public.payment_payment_id_seq'::regclass) NOT NULL,
--     customer_id smallint NOT NULL,
--     staff_id smallint NOT NULL,
--     rental_id integer NOT NULL,
--     amount numeric(5,2) NOT NULL,
--     payment_date timestamp without time zone NOT NULL
-- );
-- target:
CREATE TABLE public.payment (
	payment_id INT4
	DEFAULT nextval(
		'public.payment_payment_id_seq'::REGCLASS
	)
	NOT NULL,
	customer_id INT2 NOT NULL,
	staff_id INT2 NOT NULL,
	rental_id INT4 NOT NULL,
	amount DECIMAL(5,2) NOT NULL,
	payment_date TIMESTAMP NOT NULL,
	CONSTRAINT payment_pkey PRIMARY KEY (payment_id)
);


-- statement: 17
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "rental" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE FUNCTION public.inventory_held_by_customer(p_inventory_id integer) RETURNS integer
--     LANGUAGE plpgsql
--     AS $$
-- DECLARE
--     v_customer_id INTEGER;
-- BEGIN
-- 
--   SELECT customer_id INTO v_customer_id
--   FROM rental
--   WHERE return_date IS NULL
--   AND inventory_id = p_inventory_id;
-- 
--   RETURN v_customer_id;
-- END $$;
-- target:
CREATE FUNCTION public.inventory_held_by_customer(IN p_inventory_id INT4)
	RETURNS INT4
	LANGUAGE plpgsql
	AS $$
DECLARE
    v_customer_id INTEGER;
BEGIN

  SELECT customer_id INTO v_customer_id
  FROM public.rental
  WHERE return_date IS NULL
  AND inventory_id = p_inventory_id;

  RETURN v_customer_id;
END $$;
    

-- statement: 53
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE VIEW public.sales_by_film_category AS
--  SELECT c.name AS category,
--     sum(p.amount) AS total_sales
--    FROM (((((public.payment p
--      JOIN public.rental r ON ((p.rental_id = r.rental_id)))
--      JOIN public.inventory i ON ((r.inventory_id = i.inventory_id)))
--      JOIN public.film f ON ((i.film_id = f.film_id)))
--      JOIN public.film_category fc ON ((f.film_id = fc.film_id)))
--      JOIN public.category c ON ((fc.category_id = c.category_id)))
--   GROUP BY c.name
--   ORDER BY (sum(p.amount)) DESC;
-- target:
CREATE VIEW public.sales_by_film_category AS
	SELECT c.name AS category,
	sum(p.amount) AS total_sales
	FROM (
		(
			(
				(
					public.payment AS p
					JOIN public.rental AS r ON
							p.rental_id = r.rental_id
				)
				JOIN public.inventory AS i ON
						r.inventory_id = i.inventory_id
			)
			JOIN public.film AS f ON i.film_id = f.film_id
		)
		JOIN public.film_category AS fc ON
				f.film_id = fc.film_id
	)
	JOIN public.category AS c ON
			fc.category_id = c.category_id
	GROUP BY c.name
	ORDER BY (sum(p.amount)) DESC;

    
-- statement: 54
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.staff_staff_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.staff_staff_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 55
-- status: ok
-- suggestion: Column staff_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.staff (
--     staff_id integer DEFAULT nextval('public.staff_staff_id_seq'::regclass) NOT NULL,
--     first_name character varying(45) NOT NULL,
--     last_name character varying(45) NOT NULL,
--     address_id smallint NOT NULL,
--     email character varying(50),
--     store_id smallint NOT NULL,
--     active boolean DEFAULT true NOT NULL,
--     username character varying(16) NOT NULL,
--     password character varying(40),
--     last_update timestamp without time zone DEFAULT now() NOT NULL,
--     picture bytea
-- );
-- target:
CREATE TABLE public.staff (
	staff_id INT4
	DEFAULT nextval('public.staff_staff_id_seq'::REGCLASS)
	NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	address_id INT2 NOT NULL,
	email VARCHAR(50),
	store_id INT2 NOT NULL,
	active BOOL DEFAULT true NOT NULL,
	username VARCHAR(16) NOT NULL,
	password VARCHAR(40),
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	picture BYTES,
	CONSTRAINT staff_pkey PRIMARY KEY (staff_id)
);

    
-- statement: 56
-- status: ok
-- suggestion: We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations

-- original: 
-- CREATE SEQUENCE public.store_store_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- target:
CREATE SEQUENCE public.store_store_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

    
-- statement: 57
-- status: ok
-- suggestion: Column store_id utilizes a sequence. We recommend auto-generating unique IDs instead of using a sequence. For more details, see: https://www.cockroachlabs.com/docs/stable/create-sequence.html#considerations
-- original: 
-- CREATE TABLE public.store (
--     store_id integer DEFAULT nextval('public.store_store_id_seq'::regclass) NOT NULL,
--     manager_staff_id smallint NOT NULL,
--     address_id smallint NOT NULL,
--     last_update timestamp without time zone DEFAULT now() NOT NULL
-- );
-- target:
CREATE TABLE public.store (
	store_id INT4
	DEFAULT nextval('public.store_store_id_seq'::REGCLASS)
	NOT NULL,
	manager_staff_id INT2 NOT NULL,
	address_id INT2 NOT NULL,
	last_update TIMESTAMP DEFAULT now() NOT NULL,
	CONSTRAINT store_pkey PRIMARY KEY (store_id)
);

    
-- statement: 58
-- status: ok
-- original: 
-- CREATE VIEW public.sales_by_store AS
--  SELECT (((c.city)::text || ','::text) || (cy.country)::text) AS store,
--     (((m.first_name)::text || ' '::text) || (m.last_name)::text) AS manager,
--     sum(p.amount) AS total_sales
--    FROM (((((((public.payment p
--      JOIN public.rental r ON ((p.rental_id = r.rental_id)))
--      JOIN public.inventory i ON ((r.inventory_id = i.inventory_id)))
--      JOIN public.store s ON ((i.store_id = s.store_id)))
--      JOIN public.address a ON ((s.address_id = a.address_id)))
--      JOIN public.city c ON ((a.city_id = c.city_id)))
--      JOIN public.country cy ON ((c.country_id = cy.country_id)))
--      JOIN public.staff m ON ((s.manager_staff_id = m.staff_id)))
--   GROUP BY cy.country, c.city, s.store_id, m.first_name, m.last_name
--   ORDER BY cy.country, c.city;
-- target:
CREATE VIEW public.sales_by_store AS
	SELECT (c.city)::STRING
	|| ','::STRING
	|| (cy.country)::STRING
		AS store,
	(m.first_name)::STRING
	|| ' '::STRING
	|| (m.last_name)::STRING
		AS manager,
	sum(p.amount) AS total_sales
	FROM (
		(
			(
				(
					(
						(
							public.payment AS p
							JOIN public.rental AS r ON
									p.rental_id
									= r.rental_id
						)
						JOIN public.inventory AS i ON
								r.inventory_id
								= i.inventory_id
					)
					JOIN public.store AS s ON
							i.store_id = s.store_id
				)
				JOIN public.address AS a ON
						s.address_id = a.address_id
			)
			JOIN public.city AS c ON a.city_id = c.city_id
		)
		JOIN public.country AS cy ON
				c.country_id = cy.country_id
	)
	JOIN public.staff AS m ON
			s.manager_staff_id = m.staff_id
	GROUP BY cy.country,
	c.city,
	s.store_id,
	m.first_name,
	m.last_name
	ORDER BY cy.country,
	c.city;

    
-- statement: 59
-- status: ok
-- original: 
-- CREATE VIEW public.staff_list AS
--  SELECT s.staff_id AS id,
--     (((s.first_name)::text || ' '::text) || (s.last_name)::text) AS name,
--     a.address,
--     a.postal_code AS "zip code",
--     a.phone,
--     city.city,
--     country.country,
--     s.store_id AS sid
--    FROM (((public.staff s
--      JOIN public.address a ON ((s.address_id = a.address_id)))
--      JOIN public.city ON ((a.city_id = city.city_id)))
--      JOIN public.country ON ((city.country_id = country.country_id)));
-- target:
CREATE VIEW public.staff_list AS
	SELECT s.staff_id AS id,
	(s.first_name)::STRING
	|| ' '::STRING
	|| (s.last_name)::STRING
		AS name,
	a.address,
	a.postal_code AS "zip code",
	a.phone,
	city.city,
	country.country,
	s.store_id AS sid
	FROM (
		(
			public.staff AS s
			JOIN public.address AS a ON
					s.address_id = a.address_id
		)
		JOIN public.city ON a.city_id = city.city_id
	)
	JOIN public.country ON
			city.country_id = country.country_id;

    
-- statement: 60
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.actor
--     ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);
-- target:


    
-- statement: 61
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.address
--     ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);
-- target:


    
-- statement: 62
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.category
--     ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);
-- target:


    
-- statement: 63
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.city
--     ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
-- target:


    
-- statement: 64
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.country
--     ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);
-- target:


    
-- statement: 65
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.customer
--     ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
-- target:


    
-- statement: 66
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.film_actor
--     ADD CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id, film_id);
-- target:


    
-- statement: 67
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.film_category
--     ADD CONSTRAINT film_category_pkey PRIMARY KEY (film_id, category_id);
-- target:


    
-- statement: 68
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.film
--     ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);
-- target:


    
-- statement: 69
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.inventory
--     ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);
-- target:


    
-- statement: 70
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.language
--     ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);
-- target:


    
-- statement: 71
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.payment
--     ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);
-- target:


    
-- statement: 72
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.rental
--     ADD CONSTRAINT rental_pkey PRIMARY KEY (rental_id);
-- target:


    
-- statement: 73
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.staff
--     ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);
-- target:


    
-- statement: 74
-- status: deleted
-- warning: Deleted
-- detail: Statement was deleted
-- original: 
-- ALTER TABLE ONLY public.store
--     ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);
-- target:


    
-- statement: 75
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE INDEX film_fulltext_idx ON public.film USING gist (fulltext);
-- target:
-- CREATE INVERTED INDEX film_fulltext_idx
--	ON public.film (fulltext);

    
-- statement: 76
-- status: ok
-- original: 
-- CREATE INDEX idx_actor_last_name ON public.actor USING btree (last_name);
-- target:
CREATE INDEX idx_actor_last_name ON public.actor (last_name);

    
-- statement: 77
-- status: ok
-- original: 
-- CREATE INDEX idx_fk_address_id ON public.customer USING btree (address_id);
-- target:
CREATE INDEX idx_fk_address_id
	ON public.customer (address_id);

    
-- statement: 78
-- status: ok
-- original: 
-- CREATE INDEX idx_fk_city_id ON public.address USING btree (city_id);
-- target:
CREATE INDEX idx_fk_city_id ON public.address (city_id);

    
-- statement: 79
-- status: ok
-- original: 
-- CREATE INDEX idx_fk_country_id ON public.city USING btree (country_id);
-- target:
CREATE INDEX idx_fk_country_id ON public.city (country_id);

    
-- statement: 80
-- status: ok
-- original: 
-- CREATE INDEX idx_fk_customer_id ON public.payment USING btree (customer_id);
-- target:
CREATE INDEX idx_fk_customer_id
	ON public.payment (customer_id);

    
-- statement: 81
-- status: ok
-- original: 
-- CREATE INDEX idx_fk_film_id ON public.film_actor USING btree (film_id);
-- target:
CREATE INDEX idx_fk_film_id ON public.film_actor (film_id);

    
-- statement: 82
-- status: ok
-- original: 
-- CREATE INDEX idx_fk_inventory_id ON public.rental USING btree (inventory_id);
-- target:
CREATE INDEX idx_fk_inventory_id
	ON public.rental (inventory_id);

    
-- statement: 83
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE INDEX idx_fk_language_id ON public.film USING btree (language_id);
-- target:
CREATE INDEX idx_fk_language_id ON public.film (language_id);

    
-- statement: 84
-- status: ok
-- original: 
-- CREATE INDEX idx_fk_rental_id ON public.payment USING btree (rental_id);
-- target:
CREATE INDEX idx_fk_rental_id ON public.payment (rental_id);

    
-- statement: 85
-- status: ok
-- original: 
-- CREATE INDEX idx_fk_staff_id ON public.payment USING btree (staff_id);
-- target:
CREATE INDEX idx_fk_staff_id ON public.payment (staff_id);

    
-- statement: 86
-- status: ok
-- original: 
-- CREATE INDEX idx_fk_store_id ON public.customer USING btree (store_id);
-- target:
CREATE INDEX idx_fk_store_id ON public.customer (store_id);

    
-- statement: 87
-- status: ok
-- original: 
-- CREATE INDEX idx_last_name ON public.customer USING btree (last_name);
-- target:
CREATE INDEX idx_last_name ON public.customer (last_name);

    
-- statement: 88
-- status: ok
-- original: 
-- CREATE INDEX idx_store_id_film_id ON public.inventory USING btree (store_id, film_id);
-- target:
CREATE INDEX idx_store_id_film_id
	ON public.inventory (store_id, film_id);

    
-- statement: 89
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE INDEX idx_title ON public.film USING btree (title);
-- target:
CREATE INDEX idx_title ON public.film (title);

    
-- statement: 90
-- status: ok
-- original: 
-- CREATE UNIQUE INDEX idx_unq_manager_staff_id ON public.store USING btree (manager_staff_id);
-- target:
CREATE UNIQUE INDEX idx_unq_manager_staff_id
	ON public.store (manager_staff_id);

    
-- statement: 91
-- status: ok
-- original: 
-- CREATE UNIQUE INDEX idx_unq_rental_rental_date_inventory_id_customer_id ON public.rental USING btree (rental_date, inventory_id, customer_id);
-- target:
CREATE UNIQUE INDEX idx_unq_rental_rental_date_inventory_id_customer_id
	ON public.rental (
		rental_date,
		inventory_id,
		customer_id
	);

    
-- statement: 92
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE TRIGGER film_fulltext_trigger BEFORE INSERT OR UPDATE ON public.film FOR EACH ROW EXECUTE FUNCTION tsvector_update_trigger('fulltext', 'pg_catalog.english', 'title', 'description');
-- target:
--CREATE TRIGGER film_fulltext_trigger BEFORE INSERT OR UPDATE ON public.film FOR EACH ROW EXECUTE FUNCTION tsvector_update_trigger('fulltext', 'pg_catalog.english', 'title', 'description');

    
-- statement: 93
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.actor FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.actor FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 94
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.address FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.address FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 95
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.category FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.category FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 96
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.city FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.city FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 97
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.country FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.country FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 98
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.customer FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.customer FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 99
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.film FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.film FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 100
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.film_actor FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.film_actor FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 101
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.film_category FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.film_category FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 102
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.inventory FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.inventory FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 103
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.language FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.language FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 104
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.rental FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.rental FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 105
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.staff FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.staff FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 106
-- status: ok
-- original: 
-- CREATE TRIGGER last_updated BEFORE UPDATE ON public.store FOR EACH ROW EXECUTE FUNCTION public.last_updated();
-- target:
CREATE TRIGGER last_updated BEFORE UPDATE ON public.store FOR EACH ROW EXECUTE FUNCTION public.last_updated();

    
-- statement: 107
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.customer
--     ADD CONSTRAINT customer_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.customer
--	ADD CONSTRAINT customer_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 108
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.film_actor
--     ADD CONSTRAINT film_actor_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actor(actor_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.film_actor
--	ADD CONSTRAINT film_actor_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actor (actor_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 109
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- ALTER TABLE ONLY public.film_actor
--     ADD CONSTRAINT film_actor_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.film_actor
--	ADD CONSTRAINT film_actor_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film (film_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 110
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.film_category
--     ADD CONSTRAINT film_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.film_category
--	ADD CONSTRAINT film_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category (category_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 111
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- ALTER TABLE ONLY public.film_category
--     ADD CONSTRAINT film_category_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.film_category
--	ADD CONSTRAINT film_category_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film (film_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 112
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- ALTER TABLE ONLY public.film
--     ADD CONSTRAINT film_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(language_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.film
--	ADD CONSTRAINT film_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 113
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.address
--     ADD CONSTRAINT fk_address_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);
-- target:
-- ALTER TABLE public.address
--	ADD CONSTRAINT fk_address_city FOREIGN KEY (city_id) REFERENCES public.city (city_id);

    
-- statement: 114
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.city
--     ADD CONSTRAINT fk_city FOREIGN KEY (country_id) REFERENCES public.country(country_id);
-- target:
-- ALTER TABLE public.city
--	ADD CONSTRAINT fk_city FOREIGN KEY (country_id) REFERENCES public.country (country_id);

    
-- statement: 115
-- status: sql error
-- error: SQL error
-- detail: ERROR: relation "public.film" does not exist (SQLSTATE 42P01)
-- original: 
-- ALTER TABLE ONLY public.inventory
--     ADD CONSTRAINT inventory_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.inventory
--	ADD CONSTRAINT inventory_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film (film_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 116
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.payment
--     ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.payment
--	ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 117
-- status: sql error
-- error: SQL error
-- detail: ERROR: cannot add a SET NULL cascading action on column "dvdrental.public.payment.rental_id" which has a NOT NULL constraint (SQLSTATE 42830)
-- original: 
-- ALTER TABLE ONLY public.payment
--     ADD CONSTRAINT payment_rental_id_fkey FOREIGN KEY (rental_id) REFERENCES public.rental(rental_id) ON UPDATE CASCADE ON DELETE SET NULL;
-- target:
--ALTER TABLE public.payment
--	ADD CONSTRAINT payment_rental_id_fkey FOREIGN KEY (rental_id) REFERENCES public.rental (rental_id) ON DELETE SET NULL ON UPDATE CASCADE;

    
-- statement: 118
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.rental
--     ADD CONSTRAINT rental_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.rental
--	ADD CONSTRAINT rental_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer (customer_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 119
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.rental
--     ADD CONSTRAINT rental_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.inventory(inventory_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.rental
--	ADD CONSTRAINT rental_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.inventory (inventory_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 120
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.staff
--     ADD CONSTRAINT staff_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.staff
-- 	ADD CONSTRAINT staff_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 121
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.store
--     ADD CONSTRAINT store_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.store
--	ADD CONSTRAINT store_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
-- statement: 122
-- status: ok
-- original: 
-- ALTER TABLE ONLY public.store
--     ADD CONSTRAINT store_manager_staff_id_fkey FOREIGN KEY (manager_staff_id) REFERENCES public.staff(staff_id) ON UPDATE CASCADE ON DELETE RESTRICT;
-- target:
-- ALTER TABLE public.store
--	ADD CONSTRAINT store_manager_staff_id_fkey FOREIGN KEY (manager_staff_id) REFERENCES public.staff (staff_id) ON DELETE RESTRICT ON UPDATE CASCADE;

    
