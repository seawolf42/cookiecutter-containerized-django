--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: hammer
--

COPY public.accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	$	\N	t	root			root@nodomain.com	t	t	2021-03-11 15:56:22.01094+00
2	pbkdf2_sha256$216000$Z1Ch8HYOptxP$eRKg4vEBxzGydBu8BHw9HA42GmidYs93B6bCampG9mE=	\N	t	dev			dev@nodomain.com	t	t	2021-03-21 00:47:24.593361+00
3	pbkdf2_sha256$216000$phb76xlrbojx$KOcWQR7NAe8nSQ49yh+eeyudz8n+yOnkhGFUiWKknjo=	\N	f	alice			alice@nodomain.com	t	t	2021-03-21 00:47:37.963578+00
4	pbkdf2_sha256$216000$vjEx3YEnICpi$3MkZfUjpeWFm8nyCOIB+sFHXf9UD1e0ZZj2t4donKP4=	\N	f	bob			bob@nodomain.com	f	t	2021-03-21 00:47:52.55217+00
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: hammer
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: hammer
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: hammer
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	user
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: hammer
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
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: hammer
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: hammer
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: hammer
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-04-02 16:12:02.801013+00
2	contenttypes	0002_remove_content_type_name	2021-04-02 16:12:02.811297+00
3	auth	0001_initial	2021-04-02 16:12:02.840084+00
4	auth	0002_alter_permission_name_max_length	2021-04-02 16:12:02.8658+00
5	auth	0003_alter_user_email_max_length	2021-04-02 16:12:02.875222+00
6	auth	0004_alter_user_username_opts	2021-04-02 16:12:02.882382+00
7	auth	0005_alter_user_last_login_null	2021-04-02 16:12:02.889853+00
8	auth	0006_require_contenttypes_0002	2021-04-02 16:12:02.893085+00
9	auth	0007_alter_validators_add_error_messages	2021-04-02 16:12:02.899718+00
10	auth	0008_alter_user_username_max_length	2021-04-02 16:12:02.907246+00
11	auth	0009_alter_user_last_name_max_length	2021-04-02 16:12:02.915594+00
12	auth	0010_alter_group_name_max_length	2021-04-02 16:12:02.925739+00
13	auth	0011_update_proxy_permissions	2021-04-02 16:12:02.934117+00
14	auth	0012_alter_user_first_name_max_length	2021-04-02 16:12:02.940263+00
15	accounts	0001_initial	2021-04-02 16:12:02.964015+00
16	admin	0001_initial	2021-04-02 16:12:02.997876+00
17	admin	0002_logentry_remove_auto_add	2021-04-02 16:12:03.017846+00
18	admin	0003_logentry_add_action_flag_choices	2021-04-02 16:12:03.02827+00
19	sessions	0001_initial	2021-04-02 16:12:03.039225+00
\.


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hammer
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hammer
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 4, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hammer
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hammer
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hammer
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hammer
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 24, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hammer
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hammer
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 6, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hammer
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- PostgreSQL database dump complete
--

