--
-- PostgreSQL database dump
--

\restrict 9GTMgJezCG3vYKwhGCxjhC3BCR6u5CfGNECHfsj6j2kLOCjdF5REt08qpseq1dK

-- Dumped from database version 13.23
-- Dumped by pg_dump version 13.23

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
-- Name: cart; Type: TABLE; Schema: public; Owner: tapu
--

CREATE TABLE public.cart (
    cart_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.cart OWNER TO tapu;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: tapu
--

CREATE SEQUENCE public.cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_cart_id_seq OWNER TO tapu;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tapu
--

ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;


--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: tapu
--

CREATE TABLE public.cart_items (
    cart_item_id integer NOT NULL,
    cart_id integer,
    product_id integer,
    quantity integer DEFAULT 1
);


ALTER TABLE public.cart_items OWNER TO tapu;

--
-- Name: cart_items_cart_item_id_seq; Type: SEQUENCE; Schema: public; Owner: tapu
--

CREATE SEQUENCE public.cart_items_cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_items_cart_item_id_seq OWNER TO tapu;

--
-- Name: cart_items_cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tapu
--

ALTER SEQUENCE public.cart_items_cart_item_id_seq OWNED BY public.cart_items.cart_item_id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: tapu
--

CREATE TABLE public.category (
    c_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    picture text
);


ALTER TABLE public.category OWNER TO tapu;

--
-- Name: category_c_id_seq; Type: SEQUENCE; Schema: public; Owner: tapu
--

CREATE SEQUENCE public.category_c_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_c_id_seq OWNER TO tapu;

--
-- Name: category_c_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tapu
--

ALTER SEQUENCE public.category_c_id_seq OWNED BY public.category.c_id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: tapu
--

CREATE TABLE public.customer (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.customer OWNER TO tapu;

--
-- Name: customer_user_id_seq; Type: SEQUENCE; Schema: public; Owner: tapu
--

CREATE SEQUENCE public.customer_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_user_id_seq OWNER TO tapu;

--
-- Name: customer_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tapu
--

ALTER SEQUENCE public.customer_user_id_seq OWNED BY public.customer.user_id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: tapu
--

CREATE TABLE public.order_items (
    order_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    price numeric(10,2)
);


ALTER TABLE public.order_items OWNER TO tapu;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: tapu
--

CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_order_item_id_seq OWNER TO tapu;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tapu
--

ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: tapu
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_amount numeric(10,2)
);


ALTER TABLE public.orders OWNER TO tapu;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: tapu
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO tapu;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tapu
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: tapu
--

CREATE TABLE public.payment (
    pay_id integer NOT NULL,
    order_id integer,
    payment_type character varying(50),
    amount numeric(10,2)
);


ALTER TABLE public.payment OWNER TO tapu;

--
-- Name: payment_pay_id_seq; Type: SEQUENCE; Schema: public; Owner: tapu
--

CREATE SEQUENCE public.payment_pay_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_pay_id_seq OWNER TO tapu;

--
-- Name: payment_pay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tapu
--

ALTER SEQUENCE public.payment_pay_id_seq OWNED BY public.payment.pay_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: tapu
--

CREATE TABLE public.product (
    p_id integer NOT NULL,
    name character varying(150) NOT NULL,
    price numeric(10,2) NOT NULL,
    description text,
    c_id integer
);


ALTER TABLE public.product OWNER TO tapu;

--
-- Name: product_p_id_seq; Type: SEQUENCE; Schema: public; Owner: tapu
--

CREATE SEQUENCE public.product_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_p_id_seq OWNER TO tapu;

--
-- Name: product_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tapu
--

ALTER SEQUENCE public.product_p_id_seq OWNED BY public.product.p_id;


--
-- Name: cart cart_id; Type: DEFAULT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);


--
-- Name: cart_items cart_item_id; Type: DEFAULT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN cart_item_id SET DEFAULT nextval('public.cart_items_cart_item_id_seq'::regclass);


--
-- Name: category c_id; Type: DEFAULT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.category ALTER COLUMN c_id SET DEFAULT nextval('public.category_c_id_seq'::regclass);


--
-- Name: customer user_id; Type: DEFAULT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.customer ALTER COLUMN user_id SET DEFAULT nextval('public.customer_user_id_seq'::regclass);


--
-- Name: order_items order_item_id; Type: DEFAULT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: payment pay_id; Type: DEFAULT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.payment ALTER COLUMN pay_id SET DEFAULT nextval('public.payment_pay_id_seq'::regclass);


--
-- Name: product p_id; Type: DEFAULT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.product ALTER COLUMN p_id SET DEFAULT nextval('public.product_p_id_seq'::regclass);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (cart_item_id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- Name: cart cart_user_id_key; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_key UNIQUE (user_id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (c_id);


--
-- Name: customer customer_email_key; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (user_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: payment payment_order_id_key; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_key UNIQUE (order_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (pay_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (p_id);


--
-- Name: cart_items cart_items_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id);


--
-- Name: cart_items cart_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(p_id);


--
-- Name: cart cart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.customer(user_id);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(p_id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.customer(user_id);


--
-- Name: payment payment_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: product product_c_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tapu
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_c_id_fkey FOREIGN KEY (c_id) REFERENCES public.category(c_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 9GTMgJezCG3vYKwhGCxjhC3BCR6u5CfGNECHfsj6j2kLOCjdF5REt08qpseq1dK

