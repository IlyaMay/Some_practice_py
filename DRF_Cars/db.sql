--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin_car;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin_car;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin_car;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin_car;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin_car;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin_car;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin_car;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin_car;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin_car;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin_car;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin_car;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin_car;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO admin_car;

--
-- Name: cars_carlist; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.cars_carlist (
    id bigint NOT NULL,
    time_create timestamp with time zone NOT NULL,
    car_name character varying(30) NOT NULL,
    review text NOT NULL,
    image character varying(100),
    category_id bigint,
    owner_id integer NOT NULL,
    year integer NOT NULL,
    CONSTRAINT cars_carlist_year_check CHECK ((year >= 0))
);


ALTER TABLE public.cars_carlist OWNER TO admin_car;

--
-- Name: cars_carlist_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.cars_carlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_carlist_id_seq OWNER TO admin_car;

--
-- Name: cars_carlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.cars_carlist_id_seq OWNED BY public.cars_carlist.id;


--
-- Name: cars_category; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.cars_category (
    id bigint NOT NULL,
    cat_name character varying(20) NOT NULL
);


ALTER TABLE public.cars_category OWNER TO admin_car;

--
-- Name: cars_category_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.cars_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_category_id_seq OWNER TO admin_car;

--
-- Name: cars_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.cars_category_id_seq OWNED BY public.cars_category.id;


--
-- Name: cars_comment; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.cars_comment (
    id bigint NOT NULL,
    time_create timestamp with time zone NOT NULL,
    comment text NOT NULL,
    owner_id integer NOT NULL,
    post_id bigint NOT NULL
);


ALTER TABLE public.cars_comment OWNER TO admin_car;

--
-- Name: cars_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.cars_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_comment_id_seq OWNER TO admin_car;

--
-- Name: cars_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.cars_comment_id_seq OWNED BY public.cars_comment.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin_car;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin_car;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin_car;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin_car;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin_car;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_car
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin_car;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin_car
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin_car
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin_car;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: cars_carlist id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_carlist ALTER COLUMN id SET DEFAULT nextval('public.cars_carlist_id_seq'::regclass);


--
-- Name: cars_category id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_category ALTER COLUMN id SET DEFAULT nextval('public.cars_category_id_seq'::regclass);


--
-- Name: cars_comment id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_comment ALTER COLUMN id SET DEFAULT nextval('public.cars_comment_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add comment	7	add_comment
26	Can change comment	7	change_comment
27	Can delete comment	7	delete_comment
28	Can view comment	7	view_comment
29	Can add Объявления	8	add_carlist
30	Can change Объявления	8	change_carlist
31	Can delete Объявления	8	delete_carlist
32	Can view Объявления	8	view_carlist
33	Can add Категории	9	add_category
34	Can change Категории	9	change_category
35	Can delete Категории	9	delete_category
36	Can view Категории	9	view_category
37	Can add Token	10	add_token
38	Can change Token	10	change_token
39	Can delete Token	10	delete_token
40	Can view Token	10	view_token
41	Can add token	11	add_tokenproxy
42	Can change token	11	change_tokenproxy
43	Can delete token	11	delete_tokenproxy
44	Can view token	11	view_tokenproxy
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$4mvlf6ho37Lra3MUflG5fq$nifShkqnFCxCz47MruwQULAlBsx18pqYIphwGpZjaVc=	2022-02-15 16:32:03.244243+03	t	red123			red@mail.ru	t	t	2022-02-15 16:31:40.84925+03
2	pbkdf2_sha256$320000$15P0EtVMBPjfBuBAua9Ehc$AIrPnU3LZL6XifpngmHk4xvOOpQQdZZ1W6wr1AsjhBA=	\N	f	qwerty				f	t	2022-02-15 21:47:17+03
3	pbkdf2_sha256$320000$nrUAsCuxhpOFDzzbIk5VMo$vAQKB3X0BpGcA0nfeql8B8xdgIiVF7KhcCx4v7EfIhs=	\N	f	karl3008				f	t	2022-02-15 21:47:52+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: cars_carlist; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.cars_carlist (id, time_create, car_name, review, image, category_id, owner_id, year) FROM stdin;
1	2022-02-15 20:26:46.245431+03	LADA (ВАЗ) 2101	Отличнoе Aвтo, ходовая в идеале - пeрeдние тоpмoзa пeредeлaны, мoжнo cтaвить максимум 14-е диски. Перeдниe крылья пластик! Тopпеда от шeстерки. He кипит! Днищe в идeaле. Kpaска нa двеpях тpeбует внимaния, но на езду не влияeт. Cекрeтка на бензобакe - нe слить бензин. Делaть ничeго не нужнo, вce pабочее. Руль под спорт заменён. Помыта, просмотры в удобное время. Резина свежая, шипы. Полноразмерная	images/car.jpg	2	1	1955
2	2022-02-15 21:52:14.59443+03	BMW X4	BMW X4 привлекает к себе внимание, всегда и везде. Его экстравертный дизайн соединяет в себе изысканный стиль и мощь. Он совмещает то, чего еще никогда не было в этом сегменте: типичную для X-серии мощь с эстетикой классического купе. Благодаря мощным двигателям BMW TwinPower Turbo и такому серийному оснащению, как спортивное рулевое управление с переменным усилением и система Performance Control,	images/2022/02/15/x4-g02-front-550x309.jpg	6	3	2019
3	2022-02-15 21:53:26.835428+03	Mercedes-Benz GLC-класс	Mercedes-Benz GLC-класс (G — сокр. от нем. Geländewagen — ɡəˈlɛːndəvaːɡn, «внедорожник»; L — буква, выполняющая роль связывающего элемента с последующим символом; C — сокр. от нем. C-klasse — «C-класс»]) — серия люксовых компактных кроссоверов от немецкой компании Mercedes-Benz, пришедшая на смену GLK-классу в 2015 году	images/2022/02/15/2018_Mercedes-Benz_GLC_250_Urban_Edition_4MATIC_2.0_Front.jpg	6	2	2015
5	2022-02-15 21:56:35.536947+03	Bugatti Veyron	Европейские Bugatti  отзывы владельцев В октябре 2005 года состоялось знаменательное событие в истории автомобильной индустрии – на международном Токийском автосалоне в буквальном смысле «прогремела» премьера серийного гиперкара Bugatti Veyron, ставшего на момент своего появления «самым» по всем параметрам: самый мощный, самый скоростной, самый дорогой.		7	3	2005
4	2022-02-15 21:55:15.355945+03	Ford Ranger Источ	Ford Ranger – задне- или полноприводный пикап среднеразмерного класса и, по совместительству, «глобальный продукт» американского автопроизводителя, доступный с тремя вариантами кабины: одинарная, полуторная и двойная… Его основная целевая аудитория – фермеры, работники различных монтажных и строительных компаний, туристы, любители активного отдыха или простые люди, нуждающиеся в «многофункциональн		5	2	2018
6	2022-02-15 21:58:25.707945+03	Dodge Caravan	На международном автошоу в Детройте, прошедшем в январе 2000 года, компания Dodge провела демонстрацию минивэна Caravan очередного, четвертого поколения, официальные продажи которого стартовали в августе того же года. В 2005-м автомобиль пережил легкий рестайлинг, получив косметические изменения внешности и салонного убранства, после чего в таком виде существовал до 2007 года (в Китае – до 2011-го	images/2022/02/15/Dodge-Caravan-4-550x302.jpg	8	3	2000
\.


--
-- Data for Name: cars_category; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.cars_category (id, cat_name) FROM stdin;
1	Coupe
2	Sedan
3	Hatchback
5	Pickup
6	SUV
7	Hupercar
8	minivan
\.


--
-- Data for Name: cars_comment; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.cars_comment (id, time_create, comment, owner_id, post_id) FROM stdin;
1	2022-02-15 21:58:38.682946+03	okay	2	1
4	2022-02-15 22:00:15.138946+03	oh my godd	2	5
6	2022-02-15 22:01:55.742945+03	WOOW	1	2
7	2022-02-15 22:02:11.531944+03	OWOWO	3	5
8	2022-02-15 22:03:55.359946+03	def __str__(self):\r\n        return self.cat_name	2	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-02-15 20:21:20.377432+03	1	Coupe	1	[{"added": {}}]	9	1
2	2022-02-15 20:26:36.639429+03	2	Sedan	1	[{"added": {}}]	9	1
3	2022-02-15 20:26:46.249429+03	1	LADA (ВАЗ) 2101	1	[{"added": {}}]	8	1
4	2022-02-15 21:38:13.79343+03	1	LADA (ВАЗ) 2101	2	[]	8	1
5	2022-02-15 21:43:00.239427+03	3	Hatchback	1	[{"added": {}}]	9	1
6	2022-02-15 21:43:17.161436+03	4	Universalis	1	[{"added": {}}]	9	1
7	2022-02-15 21:44:15.934431+03	5	Pickup	1	[{"added": {}}]	9	1
8	2022-02-15 21:45:43.714428+03	4	Universalis	3		9	1
9	2022-02-15 21:47:17.874432+03	2	qwerty	1	[{"added": {}}]	4	1
10	2022-02-15 21:47:32.66743+03	2	qwerty	2	[]	4	1
11	2022-02-15 21:47:52.773431+03	3	karl3008	1	[{"added": {}}]	4	1
12	2022-02-15 21:47:56.929434+03	3	karl3008	2	[]	4	1
13	2022-02-15 21:52:10.80343+03	6	SUV	1	[{"added": {}}]	9	1
14	2022-02-15 21:52:14.597429+03	2	BMW X4	1	[{"added": {}}]	8	1
15	2022-02-15 21:53:26.83743+03	3	Mercedes-Benz GLC-класс	1	[{"added": {}}]	8	1
16	2022-02-15 21:54:01.062945+03	3	Mercedes-Benz GLC-класс	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	8	1
17	2022-02-15 21:55:15.356945+03	4	Ford Ranger Источ	1	[{"added": {}}]	8	1
18	2022-02-15 21:56:24.671945+03	7	Hupercar	1	[{"added": {}}]	9	1
19	2022-02-15 21:56:35.538946+03	5	Bugatti Veyron Источник	1	[{"added": {}}]	8	1
20	2022-02-15 21:56:43.573946+03	5	Bugatti Veyron	2	[{"changed": {"fields": ["Car name"]}}]	8	1
21	2022-02-15 21:57:29.428946+03	4	Ford Ranger Источ	2	[]	8	1
22	2022-02-15 21:58:24.449945+03	8	minivan	1	[{"added": {}}]	9	1
23	2022-02-15 21:58:25.711946+03	6	Dodge Caravan	1	[{"added": {}}]	8	1
24	2022-02-15 21:58:38.702945+03	1	Comment object (1)	1	[{"added": {}}]	7	1
25	2022-02-15 22:00:15.140953+03	4	Comment object (4)	1	[{"added": {}}]	7	1
26	2022-02-15 22:01:55.744944+03	6	Comment object (6)	1	[{"added": {}}]	7	1
27	2022-02-15 22:02:11.532948+03	7	Comment object (7)	1	[{"added": {}}]	7	1
28	2022-02-15 22:03:55.360947+03	8	qwerty	1	[{"added": {}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	cars	comment
8	cars	carlist
9	cars	category
10	authtoken	token
11	authtoken	tokenproxy
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-02-15 16:21:07.010249+03
2	auth	0001_initial	2022-02-15 16:21:07.728244+03
3	admin	0001_initial	2022-02-15 16:21:07.893243+03
4	admin	0002_logentry_remove_auto_add	2022-02-15 16:21:07.903247+03
5	admin	0003_logentry_add_action_flag_choices	2022-02-15 16:21:07.918246+03
6	contenttypes	0002_remove_content_type_name	2022-02-15 16:21:07.976244+03
7	auth	0002_alter_permission_name_max_length	2022-02-15 16:21:07.985246+03
8	auth	0003_alter_user_email_max_length	2022-02-15 16:21:08.000244+03
9	auth	0004_alter_user_username_opts	2022-02-15 16:21:08.007246+03
10	auth	0005_alter_user_last_login_null	2022-02-15 16:21:08.016246+03
11	auth	0006_require_contenttypes_0002	2022-02-15 16:21:08.019246+03
12	auth	0007_alter_validators_add_error_messages	2022-02-15 16:21:08.026245+03
13	auth	0008_alter_user_username_max_length	2022-02-15 16:21:08.087263+03
14	auth	0009_alter_user_last_name_max_length	2022-02-15 16:21:08.095263+03
15	auth	0010_alter_group_name_max_length	2022-02-15 16:21:08.111245+03
16	auth	0011_update_proxy_permissions	2022-02-15 16:21:08.120265+03
17	auth	0012_alter_user_first_name_max_length	2022-02-15 16:21:08.127245+03
18	sessions	0001_initial	2022-02-15 16:21:08.227265+03
19	cars	0001_initial	2022-02-15 20:01:13.659428+03
20	cars	0002_rename_text_comment_comment_carlist_price	2022-02-15 20:15:36.350429+03
21	cars	0003_alter_carlist_car_name_alter_carlist_review	2022-02-15 20:22:28.34945+03
22	cars	0004_alter_carlist_options_remove_carlist_price_and_more	2022-02-15 21:36:43.79243+03
23	authtoken	0001_initial	2022-02-15 22:50:53.404043+03
24	authtoken	0002_auto_20160226_1747	2022-02-15 22:50:53.483164+03
25	authtoken	0003_tokenproxy	2022-02-15 22:50:53.486162+03
26	cars	0005_alter_carlist_options_alter_category_options_and_more	2022-02-15 22:50:53.506162+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin_car
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
scsykn7c0lau0dxuuw0aswaejcm2vf6k	.eJxVjMEOwiAQBf-FsyHAAgWP3v0GssAiVUOT0p6M_64kPej1zcx7sYD7VsPeaQ1zZmcm2el3i5ge1AbId2y3haelbesc-VD4QTu_Lpmel8P9O6jY67fG7JPQvlgBShF4KGCsm5yWJABkjtqVrCiimMj7QSxpYyB5USwmzd4fxiE3Kw:1nJxw3:IaGqxgw97nxGNDnL_4SBKiLiJPogmLgEU5oI4QgGNt0	2022-03-01 16:32:03.318245+03
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cars_carlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.cars_carlist_id_seq', 6, true);


--
-- Name: cars_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.cars_category_id_seq', 8, true);


--
-- Name: cars_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.cars_comment_id_seq', 8, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 28, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_car
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: cars_carlist cars_carlist_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_carlist
    ADD CONSTRAINT cars_carlist_pkey PRIMARY KEY (id);


--
-- Name: cars_category cars_category_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_category
    ADD CONSTRAINT cars_category_pkey PRIMARY KEY (id);


--
-- Name: cars_comment cars_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_comment
    ADD CONSTRAINT cars_comment_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: cars_carlist_category_id_9f380a37; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX cars_carlist_category_id_9f380a37 ON public.cars_carlist USING btree (category_id);


--
-- Name: cars_carlist_owner_id_48b8b8bc; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX cars_carlist_owner_id_48b8b8bc ON public.cars_carlist USING btree (owner_id);


--
-- Name: cars_comment_owner_id_b8145f99; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX cars_comment_owner_id_b8145f99 ON public.cars_comment USING btree (owner_id);


--
-- Name: cars_comment_post_id_f2535a4d; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX cars_comment_post_id_f2535a4d ON public.cars_comment USING btree (post_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin_car
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cars_carlist cars_carlist_category_id_9f380a37_fk_cars_category_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_carlist
    ADD CONSTRAINT cars_carlist_category_id_9f380a37_fk_cars_category_id FOREIGN KEY (category_id) REFERENCES public.cars_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cars_carlist cars_carlist_owner_id_48b8b8bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_carlist
    ADD CONSTRAINT cars_carlist_owner_id_48b8b8bc_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cars_comment cars_comment_owner_id_b8145f99_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_comment
    ADD CONSTRAINT cars_comment_owner_id_b8145f99_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cars_comment cars_comment_post_id_f2535a4d_fk_cars_carlist_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.cars_comment
    ADD CONSTRAINT cars_comment_post_id_f2535a4d_fk_cars_carlist_id FOREIGN KEY (post_id) REFERENCES public.cars_carlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_car
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

