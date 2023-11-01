--PostgreSQL Maestro 23.9.0.1
------------------------------------------
--Host     : localhost
--Database : zenali_db


\connect - postgres
CREATE DATABASE zenali_db WITH TEMPLATE = template0 ENCODING = 6 TABLESPACE = pg_default;
\connect zenali_db postgres
-- Structure for table django_migrations (OID = 16400):
SET search_path = public, pg_catalog;
CREATE TABLE django_migrations (
    id bigint NOT NULL,
    app varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    applied timestamp with time zone NOT NULL
) WITHOUT OIDS;
-- Structure for table django_content_type (OID = 16408):
CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label varchar(100) NOT NULL,
    model varchar(100) NOT NULL
) WITHOUT OIDS;
-- Structure for table auth_permission (OID = 16416):
CREATE TABLE auth_permission (
    id integer NOT NULL,
    name varchar(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename varchar(100) NOT NULL
) WITHOUT OIDS;
-- Structure for table auth_group (OID = 16422):
CREATE TABLE auth_group (
    id integer NOT NULL,
    name varchar(150) NOT NULL
) WITHOUT OIDS;
-- Structure for table auth_group_permissions (OID = 16430):
CREATE TABLE auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
) WITHOUT OIDS;
-- Structure for table auth_user (OID = 16436):
CREATE TABLE auth_user (
    id integer NOT NULL,
    "password" varchar(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username varchar(150) NOT NULL,
    first_name varchar(150) NOT NULL,
    last_name varchar(150) NOT NULL,
    email varchar(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
) WITHOUT OIDS;
-- Structure for table auth_user_groups (OID = 16444):
CREATE TABLE auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
) WITHOUT OIDS;
-- Structure for table auth_user_user_permissions (OID = 16450):
CREATE TABLE auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
) WITHOUT OIDS;
-- Structure for table django_admin_log (OID = 16508):
CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr varchar(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
) WITHOUT OIDS;
-- Structure for table buy_applybuy (OID = 16537):
CREATE TABLE buy_applybuy (
    id bigint NOT NULL,
    name varchar(100),
    scale varchar(50),
    amount double precision,
    applicant varchar(50) NOT NULL,
    description varchar(150) NOT NULL,
    is_supplied boolean,
    date date NOT NULL
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_consumingmaterial (OID = 16543):
CREATE TABLE industrial_warehouse_consumingmaterial (
    code integer NOT NULL,
    name varchar(100),
    scale varchar(50)
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_consumingmaterialcheck (OID = 16549):
CREATE TABLE industrial_warehouse_consumingmaterialcheck (
    code integer NOT NULL,
    date date NOT NULL,
    checks text,
    "jsonData" jsonb
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_consumingmaterialfactor (OID = 16557):
CREATE TABLE industrial_warehouse_consumingmaterialfactor (
    code integer NOT NULL,
    date date NOT NULL,
    factor text,
    "jsonData" jsonb
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_productioncheck (OID = 16565):
CREATE TABLE industrial_warehouse_productioncheck (
    code integer NOT NULL,
    date date NOT NULL,
    checks text,
    "jsonData" jsonb
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_rawmaterial (OID = 16573):
CREATE TABLE industrial_warehouse_rawmaterial (
    code integer NOT NULL,
    name varchar(100),
    scale varchar(50)
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_rawmaterialcheck (OID = 16579):
CREATE TABLE industrial_warehouse_rawmaterialcheck (
    code integer NOT NULL,
    checks text,
    "jsonData" jsonb,
    date date NOT NULL
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_rawmaterialfactor (OID = 16587):
CREATE TABLE industrial_warehouse_rawmaterialfactor (
    code integer NOT NULL,
    factor text,
    "jsonData" jsonb,
    date date NOT NULL
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_requestsupply (OID = 16595):
CREATE TABLE industrial_warehouse_requestsupply (
    id bigint NOT NULL,
    "raw_material_jsonData" jsonb,
    "consuming_material_jsonData" jsonb,
    applicant varchar(50) NOT NULL,
    purpose varchar(150) NOT NULL,
    date date NOT NULL,
    is_delivered boolean,
    supplement boolean,
    which_request bigint
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_wastecheck (OID = 16603):
CREATE TABLE industrial_warehouse_wastecheck (
    code integer NOT NULL,
    date date NOT NULL,
    checks text,
    "jsonData" jsonb
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_waste (OID = 16611):
CREATE TABLE industrial_warehouse_waste (
    id bigint NOT NULL,
    date date,
    "checkCode_id" integer,
    product_id bigint NOT NULL
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_rawmaterialdetailed (OID = 16617):
CREATE TABLE industrial_warehouse_rawmaterialdetailed (
    id bigint NOT NULL,
    consumable varchar(50),
    "input" double precision,
    carton integer,
    rate double precision,
    average_rate double precision,
    amount double precision,
    output double precision,
    "afterOperator" double precision,
    "operator" varchar(50),
    date date,
    buyer varchar(50),
    seller varchar(50),
    receiver varchar(50),
    document_type varchar(50),
    document_code varchar(150),
    amendment text,
    "systemID" bigint,
    "checkCode_id" integer,
    "factorCode_id" integer,
    product_id integer NOT NULL
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_production (OID = 16625):
CREATE TABLE industrial_warehouse_production (
    code integer NOT NULL,
    name varchar(100),
    amount double precision,
    cost double precision,
    "checkCode_id" integer
) WITHOUT OIDS;
-- Structure for table industrial_warehouse_consumingmaterialdetailed (OID = 16631):
CREATE TABLE industrial_warehouse_consumingmaterialdetailed (
    id bigint NOT NULL,
    consumable varchar(50),
    "input" double precision,
    carton integer,
    rate double precision,
    amount double precision,
    output double precision,
    "afterOperator" double precision,
    "operator" varchar(50),
    date date,
    buyer varchar(50),
    seller varchar(50),
    receiver varchar(50),
    document_type varchar(50),
    document_code varchar(150),
    amendment text,
    "systemID" bigint,
    "checkCode_id" integer,
    "factorCode_id" integer,
    product_id integer NOT NULL,
    average_rate double precision
) WITHOUT OIDS;
-- Structure for table production_pendingproduce (OID = 16693):
CREATE TABLE production_pendingproduce (
    id bigint NOT NULL,
    "raw_material_jsonData" jsonb,
    "consuming_material_jsonData" jsonb,
    purpose varchar(150) NOT NULL,
    status varchar(150) NOT NULL,
    date date NOT NULL,
    request_id bigint
) WITHOUT OIDS;
-- Structure for table sale_salefactor (OID = 16707):
CREATE TABLE sale_salefactor (
    code bigint NOT NULL,
    "jsonData" jsonb,
    date date NOT NULL,
    total double precision,
    tax double precision,
    discount double precision,
    extra double precision,
    paid double precision
) WITHOUT OIDS;
-- Structure for table sale_sale (OID = 16715):
CREATE TABLE sale_sale (
    id bigint NOT NULL,
    date date,
    "factorCode_id" bigint
) WITHOUT OIDS;
-- Structure for table sale_autoincrementsalefactor (OID = 16727):
CREATE TABLE sale_autoincrementsalefactor (
    id bigint NOT NULL,
    "increment" bigint
) WITHOUT OIDS;
-- Structure for table django_session (OID = 16751):
CREATE TABLE django_session (
    session_key varchar(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
) WITHOUT OIDS;
-- Structure for table token_blacklist_blacklistedtoken (OID = 16761):
CREATE TABLE token_blacklist_blacklistedtoken (
    id bigint NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    token_id bigint NOT NULL
) WITHOUT OIDS;
-- Structure for table token_blacklist_outstandingtoken (OID = 16767):
CREATE TABLE token_blacklist_outstandingtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    user_id integer,
    jti varchar(255) NOT NULL
) WITHOUT OIDS;
-- Structure for table user_employee (OID = 16857):
CREATE TABLE user_employee (
    id bigint NOT NULL,
    department varchar(50),
    user_id integer NOT NULL
) WITHOUT OIDS;
--
-- Data for blobs (OID = 16400) (LIMIT 0,39)
--
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2023-11-01 11:11:42.865939+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2023-11-01 11:11:42.944272+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2023-11-01 11:11:42.964548+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-11-01 11:11:42.971629+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-01 11:11:42.978742+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-11-01 11:11:42.990832+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-11-01 11:11:42.99783+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-11-01 11:11:43.005001+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-11-01 11:11:43.009961+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-11-01 11:11:43.018134+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-11-01 11:11:43.020132+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-01 11:11:43.026305+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-11-01 11:11:43.037595+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-01 11:11:43.043511+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-11-01 11:11:43.051136+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-11-01 11:11:43.058325+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-01 11:11:43.065+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'buy', '0001_initial', '2023-11-01 11:11:43.070514+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'industrial_warehouse', '0001_initial', '2023-11-01 11:11:43.195782+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'industrial_warehouse', '0002_alter_waste_checkcode_alter_waste_product', '2023-11-01 11:11:43.201942+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'industrial_warehouse', '0003_consumingmaterialdetailed_average_rate_and_more', '2023-11-01 11:11:43.211016+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'production', '0001_initial', '2023-11-01 11:11:43.228132+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'sale', '0001_initial', '2023-11-01 11:11:43.247871+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'sale', '0002_autoincrementsalefactor_alter_salefactor_code', '2023-11-01 11:11:43.280573+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (25, 'sessions', '0001_initial', '2023-11-01 11:11:43.299028+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (26, 'token_blacklist', '0001_initial', '2023-11-01 11:11:43.333017+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (27, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2023-11-01 11:11:43.342219+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (28, 'token_blacklist', '0003_auto_20171017_2007', '2023-11-01 11:11:43.358378+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (29, 'token_blacklist', '0004_auto_20171017_2013', '2023-11-01 11:11:43.371688+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (30, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2023-11-01 11:11:43.379237+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (31, 'token_blacklist', '0006_auto_20171017_2113', '2023-11-01 11:11:43.389399+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (32, 'token_blacklist', '0007_auto_20171017_2214', '2023-11-01 11:11:43.408814+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (33, 'token_blacklist', '0008_migrate_to_bigautofield', '2023-11-01 11:11:43.455776+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (34, 'token_blacklist', '0010_fix_migrate_to_bigautofield', '2023-11-01 11:11:43.475747+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (35, 'token_blacklist', '0011_linearizes_history', '2023-11-01 11:11:43.478861+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (36, 'token_blacklist', '0012_alter_outstandingtoken_user', '2023-11-01 11:11:43.486013+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (37, 'user', '0001_initial', '2023-11-01 11:11:43.503253+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (38, 'user', '0002_customuser_delete_employee', '2023-11-01 11:11:43.523095+03:30');
INSERT INTO django_migrations (id, app, name, applied) VALUES (39, 'user', '0003_employee_delete_customuser', '2023-11-01 11:11:43.54545+03:30');
COMMIT;
--
-- Data for blobs (OID = 16408) (LIMIT 0,27)
--
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'user', 'employee');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'industrial_warehouse', 'consumingmaterial');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'industrial_warehouse', 'consumingmaterialcheck');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'industrial_warehouse', 'consumingmaterialfactor');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'industrial_warehouse', 'productioncheck');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'industrial_warehouse', 'rawmaterial');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'industrial_warehouse', 'rawmaterialcheck');
INSERT INTO django_content_type (id, app_label, model) VALUES (14, 'industrial_warehouse', 'rawmaterialfactor');
INSERT INTO django_content_type (id, app_label, model) VALUES (15, 'industrial_warehouse', 'requestsupply');
INSERT INTO django_content_type (id, app_label, model) VALUES (16, 'industrial_warehouse', 'wastecheck');
INSERT INTO django_content_type (id, app_label, model) VALUES (17, 'industrial_warehouse', 'waste');
INSERT INTO django_content_type (id, app_label, model) VALUES (18, 'industrial_warehouse', 'rawmaterialdetailed');
INSERT INTO django_content_type (id, app_label, model) VALUES (19, 'industrial_warehouse', 'production');
INSERT INTO django_content_type (id, app_label, model) VALUES (20, 'industrial_warehouse', 'consumingmaterialdetailed');
INSERT INTO django_content_type (id, app_label, model) VALUES (21, 'production', 'pendingproduce');
INSERT INTO django_content_type (id, app_label, model) VALUES (22, 'sale', 'salefactor');
INSERT INTO django_content_type (id, app_label, model) VALUES (23, 'sale', 'sale');
INSERT INTO django_content_type (id, app_label, model) VALUES (24, 'sale', 'autoincrementsalefactor');
INSERT INTO django_content_type (id, app_label, model) VALUES (25, 'buy', 'applybuy');
INSERT INTO django_content_type (id, app_label, model) VALUES (26, 'token_blacklist', 'blacklistedtoken');
INSERT INTO django_content_type (id, app_label, model) VALUES (27, 'token_blacklist', 'outstandingtoken');
COMMIT;
--
-- Data for blobs (OID = 16416) (LIMIT 0,108)
--
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add employee', 7, 'add_employee');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change employee', 7, 'change_employee');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete employee', 7, 'delete_employee');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view employee', 7, 'view_employee');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add consuming material', 8, 'add_consumingmaterial');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change consuming material', 8, 'change_consumingmaterial');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete consuming material', 8, 'delete_consumingmaterial');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view consuming material', 8, 'view_consumingmaterial');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add consuming material check', 9, 'add_consumingmaterialcheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change consuming material check', 9, 'change_consumingmaterialcheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete consuming material check', 9, 'delete_consumingmaterialcheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view consuming material check', 9, 'view_consumingmaterialcheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add consuming material factor', 10, 'add_consumingmaterialfactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change consuming material factor', 10, 'change_consumingmaterialfactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete consuming material factor', 10, 'delete_consumingmaterialfactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view consuming material factor', 10, 'view_consumingmaterialfactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add production check', 11, 'add_productioncheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change production check', 11, 'change_productioncheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete production check', 11, 'delete_productioncheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view production check', 11, 'view_productioncheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add raw material', 12, 'add_rawmaterial');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change raw material', 12, 'change_rawmaterial');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete raw material', 12, 'delete_rawmaterial');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view raw material', 12, 'view_rawmaterial');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add raw material check', 13, 'add_rawmaterialcheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change raw material check', 13, 'change_rawmaterialcheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete raw material check', 13, 'delete_rawmaterialcheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view raw material check', 13, 'view_rawmaterialcheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can add raw material factor', 14, 'add_rawmaterialfactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can change raw material factor', 14, 'change_rawmaterialfactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can delete raw material factor', 14, 'delete_rawmaterialfactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can view raw material factor', 14, 'view_rawmaterialfactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can add request supply', 15, 'add_requestsupply');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can change request supply', 15, 'change_requestsupply');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can delete request supply', 15, 'delete_requestsupply');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can view request supply', 15, 'view_requestsupply');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add waste check', 16, 'add_wastecheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change waste check', 16, 'change_wastecheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete waste check', 16, 'delete_wastecheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can view waste check', 16, 'view_wastecheck');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can add waste', 17, 'add_waste');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can change waste', 17, 'change_waste');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (67, 'Can delete waste', 17, 'delete_waste');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (68, 'Can view waste', 17, 'view_waste');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (69, 'Can add raw material detailed', 18, 'add_rawmaterialdetailed');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (70, 'Can change raw material detailed', 18, 'change_rawmaterialdetailed');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (71, 'Can delete raw material detailed', 18, 'delete_rawmaterialdetailed');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (72, 'Can view raw material detailed', 18, 'view_rawmaterialdetailed');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (73, 'Can add production', 19, 'add_production');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (74, 'Can change production', 19, 'change_production');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (75, 'Can delete production', 19, 'delete_production');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (76, 'Can view production', 19, 'view_production');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (77, 'Can add consuming material detailed', 20, 'add_consumingmaterialdetailed');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (78, 'Can change consuming material detailed', 20, 'change_consumingmaterialdetailed');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (79, 'Can delete consuming material detailed', 20, 'delete_consumingmaterialdetailed');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (80, 'Can view consuming material detailed', 20, 'view_consumingmaterialdetailed');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (81, 'Can add pending produce', 21, 'add_pendingproduce');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (82, 'Can change pending produce', 21, 'change_pendingproduce');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (83, 'Can delete pending produce', 21, 'delete_pendingproduce');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (84, 'Can view pending produce', 21, 'view_pendingproduce');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (85, 'Can add sale factor', 22, 'add_salefactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (86, 'Can change sale factor', 22, 'change_salefactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (87, 'Can delete sale factor', 22, 'delete_salefactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (88, 'Can view sale factor', 22, 'view_salefactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (89, 'Can add sale', 23, 'add_sale');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (90, 'Can change sale', 23, 'change_sale');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (91, 'Can delete sale', 23, 'delete_sale');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (92, 'Can view sale', 23, 'view_sale');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (93, 'Can add auto increment sale factor', 24, 'add_autoincrementsalefactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (94, 'Can change auto increment sale factor', 24, 'change_autoincrementsalefactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (95, 'Can delete auto increment sale factor', 24, 'delete_autoincrementsalefactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (96, 'Can view auto increment sale factor', 24, 'view_autoincrementsalefactor');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (97, 'Can add apply buy', 25, 'add_applybuy');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (98, 'Can change apply buy', 25, 'change_applybuy');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (99, 'Can delete apply buy', 25, 'delete_applybuy');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (100, 'Can view apply buy', 25, 'view_applybuy');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (101, 'Can add blacklisted token', 26, 'add_blacklistedtoken');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (102, 'Can change blacklisted token', 26, 'change_blacklistedtoken');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (103, 'Can delete blacklisted token', 26, 'delete_blacklistedtoken');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (104, 'Can view blacklisted token', 26, 'view_blacklistedtoken');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (105, 'Can add outstanding token', 27, 'add_outstandingtoken');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (106, 'Can change outstanding token', 27, 'change_outstandingtoken');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (107, 'Can delete outstanding token', 27, 'delete_outstandingtoken');
INSERT INTO auth_permission (id, name, content_type_id, codename) VALUES (108, 'Can view outstanding token', 27, 'view_outstandingtoken');
COMMIT;
--
-- Data for blobs (OID = 16422) (LIMIT 0,5)
--
INSERT INTO auth_group (id, name) VALUES (1, '????');
INSERT INTO auth_group (id, name) VALUES (3, '?????');
INSERT INTO auth_group (id, name) VALUES (4, '?????');
INSERT INTO auth_group (id, name) VALUES (5, '????');
INSERT INTO auth_group (id, name) VALUES (6, '????');
COMMIT;
--
-- Data for blobs (OID = 16430) (LIMIT 0,154)
--
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (1, 1, 97);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (2, 1, 98);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (3, 1, 99);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (4, 1, 100);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (113, 3, 32);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (114, 3, 41);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (115, 3, 42);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (116, 3, 43);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (117, 3, 44);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (118, 3, 48);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (119, 3, 61);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (120, 3, 65);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (121, 3, 72);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (122, 3, 73);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (123, 3, 74);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (124, 3, 75);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (125, 3, 76);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (126, 3, 80);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (127, 3, 81);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (128, 3, 82);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (129, 3, 83);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (130, 3, 84);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (131, 3, 97);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (132, 3, 98);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (133, 3, 99);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (134, 3, 100);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (135, 4, 29);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (136, 4, 30);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (137, 4, 31);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (138, 4, 32);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (139, 4, 33);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (140, 4, 34);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (141, 4, 35);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (142, 4, 36);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (143, 4, 37);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (144, 4, 38);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (145, 4, 39);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (146, 4, 40);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (147, 4, 41);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (148, 4, 42);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (149, 4, 43);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (150, 4, 44);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (151, 4, 45);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (152, 4, 46);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (153, 4, 47);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (154, 4, 48);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (155, 4, 49);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (156, 4, 50);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (157, 4, 51);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (158, 4, 52);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (159, 4, 53);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (160, 4, 54);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (161, 4, 55);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (162, 4, 56);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (163, 4, 57);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (164, 4, 58);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (165, 4, 59);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (166, 4, 60);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (167, 4, 61);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (168, 4, 62);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (169, 4, 63);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (170, 4, 64);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (171, 4, 65);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (172, 4, 66);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (173, 4, 67);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (174, 4, 68);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (175, 4, 69);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (176, 4, 70);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (177, 4, 71);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (178, 4, 72);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (179, 4, 73);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (180, 4, 74);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (181, 4, 75);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (182, 4, 76);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (183, 4, 77);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (184, 4, 78);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (185, 4, 79);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (186, 4, 80);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (187, 5, 96);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (188, 5, 85);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (189, 5, 86);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (190, 5, 87);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (191, 5, 88);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (192, 5, 89);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (193, 5, 90);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (194, 5, 91);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (195, 5, 92);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (196, 5, 93);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (197, 5, 94);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (198, 5, 95);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (199, 6, 29);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (200, 6, 30);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (201, 6, 31);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (202, 6, 32);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (203, 6, 33);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (204, 6, 34);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (205, 6, 35);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (206, 6, 36);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (207, 6, 37);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (208, 6, 38);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (209, 6, 39);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (210, 6, 40);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (211, 6, 41);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (212, 6, 42);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (213, 6, 43);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (214, 6, 44);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (215, 6, 45);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (216, 6, 46);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (217, 6, 47);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (218, 6, 48);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (219, 6, 49);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (220, 6, 50);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (221, 6, 51);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (222, 6, 52);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (223, 6, 53);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (224, 6, 54);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (225, 6, 55);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (226, 6, 56);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (227, 6, 57);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (228, 6, 58);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (229, 6, 59);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (230, 6, 60);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (231, 6, 61);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (232, 6, 62);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (233, 6, 63);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (234, 6, 64);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (235, 6, 65);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (236, 6, 66);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (237, 6, 67);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (238, 6, 68);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (239, 6, 69);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (240, 6, 70);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (241, 6, 71);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (242, 6, 72);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (243, 6, 73);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (244, 6, 74);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (245, 6, 75);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (246, 6, 76);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (247, 6, 77);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (248, 6, 78);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (249, 6, 79);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (250, 6, 80);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (251, 6, 85);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (252, 6, 86);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (253, 6, 87);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (254, 6, 88);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (255, 6, 89);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (256, 6, 90);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (257, 6, 91);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (258, 6, 92);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (259, 6, 93);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (260, 6, 94);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (261, 6, 95);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (262, 6, 96);
COMMIT;
--
-- Data for blobs (OID = 16436) (LIMIT 0,6)
--
INSERT INTO auth_user (id, "password", last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$600000$uAGv0LXXtjtaZ4y1MBd3TP$rzhGfk6Gos5bzFnWJ1GbC0wZvmr76JxerJ+eICuwAm4=', '2023-11-01 11:12:31+03:30', true, 'admin', '???', '?????', '', true, true, '2023-11-01 11:12:26+03:30');
INSERT INTO auth_user (id, "password", last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (6, 'pbkdf2_sha256$600000$HvyYGSDzdfxV9yWNFBH5pK$U6N7QZD0P4n0Itj+XGK2ef417Yk4d5CVGVLqrwnokWs=', NULL, false, 'keeper', '???', '?????', '', false, true, '2023-11-01 11:21:15+03:30');
INSERT INTO auth_user (id, "password", last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (4, 'pbkdf2_sha256$600000$yehgClRKiMVGrwvM4tCNGq$vC9YHHJmX+UFYWZBLoca5d5sFCcxMd5jLCahU5QNMfw=', NULL, false, 'buyer', '???', '?????', '', false, true, '2023-11-01 11:20:37+03:30');
INSERT INTO auth_user (id, "password", last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (5, 'pbkdf2_sha256$600000$xGr1TMSnUVtpC7dtgEhJRs$gNzGkczGCPr4NtZbrSig+FeFVHEclfldjQsmPLUGcEU=', NULL, false, 'production', '???', '?????', '', false, true, '2023-11-01 11:20:52+03:30');
INSERT INTO auth_user (id, "password", last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (3, 'pbkdf2_sha256$600000$Xpq9T8zZ3D6KviUFRXTrKn$/Y1Kl87ZOFcSV2D9NkuBRdmw9FoZzIoxhA437U7AE5k=', NULL, false, 'sale', '???', '?????', '', false, true, '2023-11-01 11:20:16+03:30');
INSERT INTO auth_user (id, "password", last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$600000$y4bvdpvKMXMqwjp39Si5yG$nh6WhA6yGJ1xrOgSflCEdiBuwq9z9MyMub2OO8aJNeY=', NULL, false, 'finance', '???', '?????', '', false, true, '2023-11-01 11:19:49+03:30');
COMMIT;
--
-- Data for blobs (OID = 16444) (LIMIT 0,5)
--
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (1, 6, 4);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (2, 4, 1);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (3, 5, 3);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (4, 3, 5);
INSERT INTO auth_user_groups (id, user_id, group_id) VALUES (5, 2, 6);
COMMIT;
--
-- Data for blobs (OID = 16508) (LIMIT 0,22)
--
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2023-11-01 11:14:37.947337+03:30', '1', '????', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2023-11-01 11:14:48.131518+03:30', '2', '?????? ????', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2023-11-01 11:14:57.733164+03:30', '2', '?????? ????', 3, '', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2023-11-01 11:17:42.874107+03:30', '3', '?????', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2023-11-01 11:18:08.351578+03:30', '4', '?????', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2023-11-01 11:18:24.955114+03:30', '5', '????', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2023-11-01 11:19:35.043076+03:30', '1', 'admin', 2, '[{"changed": {"fields": ["First name", "Last name"]}}, {"added": {"name": "employee", "object": "Employee object (1)"}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2023-11-01 11:19:50.116189+03:30', '2', 'finance', 1, '[{"added": {}}, {"added": {"name": "employee", "object": "Employee object (2)"}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2023-11-01 11:19:56.664946+03:30', '2', 'finance', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2023-11-01 11:20:16.494477+03:30', '3', 'sale', 1, '[{"added": {}}, {"added": {"name": "employee", "object": "Employee object (3)"}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2023-11-01 11:20:23.3115+03:30', '3', 'sale', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2023-11-01 11:20:38.398791+03:30', '4', 'buyer', 1, '[{"added": {}}, {"added": {"name": "employee", "object": "Employee object (4)"}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2023-11-01 11:20:44.043102+03:30', '4', 'buyer', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2023-11-01 11:20:52.867021+03:30', '5', 'production', 1, '[{"added": {}}, {"added": {"name": "employee", "object": "Employee object (5)"}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2023-11-01 11:20:59.140514+03:30', '5', 'production', 2, '[{"changed": {"fields": ["First name", "Last name"]}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2023-11-01 11:21:16.155312+03:30', '6', 'keeper', 1, '[{"added": {}}, {"added": {"name": "employee", "object": "Employee object (6)"}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2023-11-01 11:21:29.553543+03:30', '6', 'keeper', 2, '[{"changed": {"fields": ["First name", "Last name", "Groups"]}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2023-11-01 11:21:37.189693+03:30', '4', 'buyer', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2023-11-01 11:21:44.235929+03:30', '5', 'production', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (20, '2023-11-01 11:21:49.296155+03:30', '3', 'sale', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (21, '2023-11-01 11:22:34.43351+03:30', '6', '????', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (22, '2023-11-01 11:22:44.96596+03:30', '2', 'finance', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1);
COMMIT;
--
-- Data for blobs (OID = 16751) (LIMIT 0,1)
--
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('2dpi839ds68cpbmodreme8zmqtrfatal', '.eJxVjDsOwyAQBe9CHSEWMOCU6X0GtMvi4CQCyZ8qyt0jJBdJ-2bmvUXEYy_x2PIaFxZXAeLyuxGmZ64d8APrvcnU6r4uJLsiT7rJqXF-3U7376DgVnqtiDUZT8mAV94AKJxHtOjSEIIyFn0GMGy1caAhc9Czp6CJxyE4O4jPF88HNvw:1qy5rz:PxESPF50eSx4kEA2FvhdK1Roeq6_SVKfyi0XAQo7i6U', '2023-11-15 11:12:31.622339+03:30');
COMMIT;
--
-- Data for blobs (OID = 16857) (LIMIT 0,6)
--
INSERT INTO user_employee (id, department, user_id) VALUES (1, '???? ???????', 1);
INSERT INTO user_employee (id, department, user_id) VALUES (2, '?????? ????', 2);
INSERT INTO user_employee (id, department, user_id) VALUES (3, '?????? ????', 3);
INSERT INTO user_employee (id, department, user_id) VALUES (4, '????? ????', 4);
INSERT INTO user_employee (id, department, user_id) VALUES (5, '?????? ?????', 5);
INSERT INTO user_employee (id, department, user_id) VALUES (6, '?????? ?????', 6);
COMMIT;
-- Definition for index auth_permission_content_type_id_2f476e4b (OID = 16462):
CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
-- Definition for index auth_group_permissions_group_id_b120cbf9 (OID = 16476):
CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
-- Definition for index auth_group_permissions_permission_id_84c5c92e (OID = 16477):
CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
-- Definition for index auth_user_groups_user_id_6a12ed8b (OID = 16491):
CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
-- Definition for index auth_user_groups_group_id_97559544 (OID = 16492):
CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
-- Definition for index auth_user_user_permissions_user_id_a95ead1b (OID = 16505):
CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
-- Definition for index auth_user_user_permissions_permission_id_1fbb5f2c (OID = 16506):
CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
-- Definition for index django_admin_log_content_type_id_c4bce8eb (OID = 16526):
CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
-- Definition for index django_admin_log_user_id_c564eba6 (OID = 16527):
CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
-- Definition for index auth_user_username_6821ab7c_like (OID = 16530):
CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
-- Definition for index auth_group_name_a6ea08ec_like (OID = 16535):
CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
-- Definition for index industrial_warehouse_waste_checkCode_id_dfa6b536 (OID = 16648):
CREATE INDEX "industrial_warehouse_waste_checkCode_id_dfa6b536" ON public.industrial_warehouse_waste USING btree ("checkCode_id");
-- Definition for index industrial_warehouse_waste_product_id_de4a2edc (OID = 16649):
CREATE INDEX industrial_warehouse_waste_product_id_de4a2edc ON public.industrial_warehouse_waste USING btree (product_id);
-- Definition for index industrial_warehouse_rawmaterialdetailed_checkCode_id_bd074960 (OID = 16665):
CREATE INDEX "industrial_warehouse_rawmaterialdetailed_checkCode_id_bd074960" ON public.industrial_warehouse_rawmaterialdetailed USING btree ("checkCode_id");
-- Definition for index industrial_warehouse_rawmaterialdetailed_factorCode_id_1ac7e34a (OID = 16666):
CREATE INDEX "industrial_warehouse_rawmaterialdetailed_factorCode_id_1ac7e34a" ON public.industrial_warehouse_rawmaterialdetailed USING btree ("factorCode_id");
-- Definition for index industrial_warehouse_rawmaterialdetailed_product_id_6b826d83 (OID = 16667):
CREATE INDEX industrial_warehouse_rawmaterialdetailed_product_id_6b826d83 ON public.industrial_warehouse_rawmaterialdetailed USING btree (product_id);
-- Definition for index industrial_warehouse_production_checkCode_id_8f3bac2e (OID = 16673):
CREATE INDEX "industrial_warehouse_production_checkCode_id_8f3bac2e" ON public.industrial_warehouse_production USING btree ("checkCode_id");
-- Definition for index industrial_warehouse_consu_checkCode_id_7c4a6f47 (OID = 16689):
CREATE INDEX "industrial_warehouse_consu_checkCode_id_7c4a6f47" ON public.industrial_warehouse_consumingmaterialdetailed USING btree ("checkCode_id");
-- Definition for index industrial_warehouse_consu_factorCode_id_e181218d (OID = 16690):
CREATE INDEX "industrial_warehouse_consu_factorCode_id_e181218d" ON public.industrial_warehouse_consumingmaterialdetailed USING btree ("factorCode_id");
-- Definition for index industrial_warehouse_consu_product_id_ec549155 (OID = 16691):
CREATE INDEX industrial_warehouse_consu_product_id_ec549155 ON public.industrial_warehouse_consumingmaterialdetailed USING btree (product_id);
-- Definition for index production_pendingproduce_request_id_2e3669aa (OID = 16705):
CREATE INDEX production_pendingproduce_request_id_2e3669aa ON public.production_pendingproduce USING btree (request_id);
-- Definition for index sale_sale_factorCode_id_fcf6a9bb (OID = 16740):
CREATE INDEX "sale_sale_factorCode_id_fcf6a9bb" ON public.sale_sale USING btree ("factorCode_id");
-- Definition for index django_session_session_key_c0390e0f_like (OID = 16758):
CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
-- Definition for index django_session_expire_date_a5c62663 (OID = 16759):
CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
-- Definition for index token_blacklist_outstandingtoken_user_id_83bc629a (OID = 16788):
CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);
-- Definition for index token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like (OID = 16791):
CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);
-- Definition for index django_migrations_pkey (OID = 16405):
ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
-- Definition for index django_content_type_pkey (OID = 16411):
ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
-- Definition for index django_content_type_app_label_model_76bd3d3b_uniq (OID = 16413):
ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
-- Definition for index auth_permission_pkey (OID = 16419):
ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
-- Definition for index auth_group_pkey (OID = 16425):
ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
-- Definition for index auth_group_permissions_pkey (OID = 16433):
ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
-- Definition for index auth_user_pkey (OID = 16439):
ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
-- Definition for index auth_user_groups_pkey (OID = 16447):
ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
-- Definition for index auth_user_user_permissions_pkey (OID = 16453):
ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
-- Definition for index auth_permission_content_type_id_codename_01ab375a_uniq (OID = 16455):
ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
-- Definition for index auth_permission_content_type_id_2f476e4b_fk_django_co (OID = 16457):
ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index auth_group_permissions_group_id_permission_id_0cd325b0_uniq (OID = 16464):
ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
-- Definition for index auth_group_permissions_group_id_b120cbf9_fk_auth_group_id (OID = 16466):
ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index auth_group_permissio_permission_id_84c5c92e_fk_auth_perm (OID = 16471):
ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index auth_user_groups_user_id_group_id_94350c0c_uniq (OID = 16479):
ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
-- Definition for index auth_user_groups_user_id_6a12ed8b_fk_auth_user_id (OID = 16481):
ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index auth_user_groups_group_id_97559544_fk_auth_group_id (OID = 16486):
ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index auth_user_user_permissions_user_id_permission_id_14a6b632_uniq (OID = 16493):
ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
-- Definition for index auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id (OID = 16495):
ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm (OID = 16500):
ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index django_admin_log_pkey (OID = 16514):
ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
-- Definition for index django_admin_log_content_type_id_c4bce8eb_fk_django_co (OID = 16516):
ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index django_admin_log_user_id_c564eba6_fk_auth_user_id (OID = 16521):
ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index auth_user_username_key (OID = 16528):
ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
-- Definition for index auth_group_name_key (OID = 16533):
ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
-- Definition for index buy_applybuy_pkey (OID = 16540):
ALTER TABLE ONLY buy_applybuy
    ADD CONSTRAINT buy_applybuy_pkey PRIMARY KEY (id);
-- Definition for index industrial_warehouse_consumingmaterial_pkey (OID = 16546):
ALTER TABLE ONLY industrial_warehouse_consumingmaterial
    ADD CONSTRAINT industrial_warehouse_consumingmaterial_pkey PRIMARY KEY (code);
-- Definition for index industrial_warehouse_consumingmaterialcheck_pkey (OID = 16554):
ALTER TABLE ONLY industrial_warehouse_consumingmaterialcheck
    ADD CONSTRAINT industrial_warehouse_consumingmaterialcheck_pkey PRIMARY KEY (code);
-- Definition for index industrial_warehouse_consumingmaterialfactor_pkey (OID = 16562):
ALTER TABLE ONLY industrial_warehouse_consumingmaterialfactor
    ADD CONSTRAINT industrial_warehouse_consumingmaterialfactor_pkey PRIMARY KEY (code);
-- Definition for index industrial_warehouse_productioncheck_pkey (OID = 16570):
ALTER TABLE ONLY industrial_warehouse_productioncheck
    ADD CONSTRAINT industrial_warehouse_productioncheck_pkey PRIMARY KEY (code);
-- Definition for index industrial_warehouse_rawmaterial_pkey (OID = 16576):
ALTER TABLE ONLY industrial_warehouse_rawmaterial
    ADD CONSTRAINT industrial_warehouse_rawmaterial_pkey PRIMARY KEY (code);
-- Definition for index industrial_warehouse_rawmaterialcheck_pkey (OID = 16584):
ALTER TABLE ONLY industrial_warehouse_rawmaterialcheck
    ADD CONSTRAINT industrial_warehouse_rawmaterialcheck_pkey PRIMARY KEY (code);
-- Definition for index industrial_warehouse_rawmaterialfactor_pkey (OID = 16592):
ALTER TABLE ONLY industrial_warehouse_rawmaterialfactor
    ADD CONSTRAINT industrial_warehouse_rawmaterialfactor_pkey PRIMARY KEY (code);
-- Definition for index industrial_warehouse_requestsupply_pkey (OID = 16600):
ALTER TABLE ONLY industrial_warehouse_requestsupply
    ADD CONSTRAINT industrial_warehouse_requestsupply_pkey PRIMARY KEY (id);
-- Definition for index industrial_warehouse_wastecheck_pkey (OID = 16608):
ALTER TABLE ONLY industrial_warehouse_wastecheck
    ADD CONSTRAINT industrial_warehouse_wastecheck_pkey PRIMARY KEY (code);
-- Definition for index industrial_warehouse_waste_pkey (OID = 16614):
ALTER TABLE ONLY industrial_warehouse_waste
    ADD CONSTRAINT industrial_warehouse_waste_pkey PRIMARY KEY (id);
-- Definition for index industrial_warehouse_rawmaterialdetailed_pkey (OID = 16622):
ALTER TABLE ONLY industrial_warehouse_rawmaterialdetailed
    ADD CONSTRAINT industrial_warehouse_rawmaterialdetailed_pkey PRIMARY KEY (id);
-- Definition for index industrial_warehouse_production_pkey (OID = 16628):
ALTER TABLE ONLY industrial_warehouse_production
    ADD CONSTRAINT industrial_warehouse_production_pkey PRIMARY KEY (code);
-- Definition for index industrial_warehouse_consumingmaterialdetailed_pkey (OID = 16636):
ALTER TABLE ONLY industrial_warehouse_consumingmaterialdetailed
    ADD CONSTRAINT industrial_warehouse_consumingmaterialdetailed_pkey PRIMARY KEY (id);
-- Definition for index industrial_warehouse_checkCode_id_dfa6b536_fk_industria (OID = 16638):
ALTER TABLE ONLY industrial_warehouse_waste
    ADD CONSTRAINT "industrial_warehouse_checkCode_id_dfa6b536_fk_industria" FOREIGN KEY ("checkCode_id") REFERENCES industrial_warehouse_wastecheck(code) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index industrial_warehouse_product_id_de4a2edc_fk_industria (OID = 16643):
ALTER TABLE ONLY industrial_warehouse_waste
    ADD CONSTRAINT industrial_warehouse_product_id_de4a2edc_fk_industria FOREIGN KEY (product_id) REFERENCES industrial_warehouse_requestsupply(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index industrial_warehouse_checkCode_id_bd074960_fk_industria (OID = 16650):
ALTER TABLE ONLY industrial_warehouse_rawmaterialdetailed
    ADD CONSTRAINT "industrial_warehouse_checkCode_id_bd074960_fk_industria" FOREIGN KEY ("checkCode_id") REFERENCES industrial_warehouse_rawmaterialcheck(code) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index industrial_warehouse_factorCode_id_1ac7e34a_fk_industria (OID = 16655):
ALTER TABLE ONLY industrial_warehouse_rawmaterialdetailed
    ADD CONSTRAINT "industrial_warehouse_factorCode_id_1ac7e34a_fk_industria" FOREIGN KEY ("factorCode_id") REFERENCES industrial_warehouse_rawmaterialfactor(code) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index industrial_warehouse_product_id_6b826d83_fk_industria (OID = 16660):
ALTER TABLE ONLY industrial_warehouse_rawmaterialdetailed
    ADD CONSTRAINT industrial_warehouse_product_id_6b826d83_fk_industria FOREIGN KEY (product_id) REFERENCES industrial_warehouse_rawmaterial(code) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index industrial_warehouse_checkCode_id_8f3bac2e_fk_industria (OID = 16668):
ALTER TABLE ONLY industrial_warehouse_production
    ADD CONSTRAINT "industrial_warehouse_checkCode_id_8f3bac2e_fk_industria" FOREIGN KEY ("checkCode_id") REFERENCES industrial_warehouse_productioncheck(code) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index industrial_warehouse_checkCode_id_7c4a6f47_fk_industria (OID = 16674):
ALTER TABLE ONLY industrial_warehouse_consumingmaterialdetailed
    ADD CONSTRAINT "industrial_warehouse_checkCode_id_7c4a6f47_fk_industria" FOREIGN KEY ("checkCode_id") REFERENCES industrial_warehouse_consumingmaterialcheck(code) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index industrial_warehouse_factorCode_id_e181218d_fk_industria (OID = 16679):
ALTER TABLE ONLY industrial_warehouse_consumingmaterialdetailed
    ADD CONSTRAINT "industrial_warehouse_factorCode_id_e181218d_fk_industria" FOREIGN KEY ("factorCode_id") REFERENCES industrial_warehouse_consumingmaterialfactor(code) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index industrial_warehouse_product_id_ec549155_fk_industria (OID = 16684):
ALTER TABLE ONLY industrial_warehouse_consumingmaterialdetailed
    ADD CONSTRAINT industrial_warehouse_product_id_ec549155_fk_industria FOREIGN KEY (product_id) REFERENCES industrial_warehouse_consumingmaterial(code) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index production_pendingproduce_pkey (OID = 16698):
ALTER TABLE ONLY production_pendingproduce
    ADD CONSTRAINT production_pendingproduce_pkey PRIMARY KEY (id);
-- Definition for index production_pendingpr_request_id_2e3669aa_fk_industria (OID = 16700):
ALTER TABLE ONLY production_pendingproduce
    ADD CONSTRAINT production_pendingpr_request_id_2e3669aa_fk_industria FOREIGN KEY (request_id) REFERENCES industrial_warehouse_requestsupply(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index sale_sale_pkey (OID = 16718):
ALTER TABLE ONLY sale_sale
    ADD CONSTRAINT sale_sale_pkey PRIMARY KEY (id);
-- Definition for index sale_autoincrementsalefactor_pkey (OID = 16730):
ALTER TABLE ONLY sale_autoincrementsalefactor
    ADD CONSTRAINT sale_autoincrementsalefactor_pkey PRIMARY KEY (id);
-- Definition for index sale_salefactor_pkey (OID = 16732):
ALTER TABLE ONLY sale_salefactor
    ADD CONSTRAINT sale_salefactor_pkey PRIMARY KEY (code);
-- Definition for index sale_sale_factorCode_id_fcf6a9bb_fk (OID = 16746):
ALTER TABLE ONLY sale_sale
    ADD CONSTRAINT "sale_sale_factorCode_id_fcf6a9bb_fk" FOREIGN KEY ("factorCode_id") REFERENCES sale_salefactor(code) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index django_session_pkey (OID = 16756):
ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
-- Definition for index token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq (OID = 16789):
ALTER TABLE ONLY token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq UNIQUE (jti);
-- Definition for index token_blacklist_outs_user_id_83bc629a_fk_auth_user (OID = 16792):
ALTER TABLE ONLY token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outs_user_id_83bc629a_fk_auth_user FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index token_blacklist_blacklistedtoken_pkey (OID = 16798):
ALTER TABLE ONLY token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (id);
-- Definition for index token_blacklist_outstandingtoken_pkey (OID = 16807):
ALTER TABLE ONLY token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (id);
-- Definition for index token_blacklist_blacklistedtoken_token_id_key (OID = 16819):
ALTER TABLE ONLY token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_key UNIQUE (token_id);
-- Definition for index token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk (OID = 16826):
ALTER TABLE ONLY token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk FOREIGN KEY (token_id) REFERENCES token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;
-- Definition for index user_employee_pkey (OID = 16860):
ALTER TABLE ONLY user_employee
    ADD CONSTRAINT user_employee_pkey PRIMARY KEY (id);
-- Definition for index user_employee_user_id_key (OID = 16862):
ALTER TABLE ONLY user_employee
    ADD CONSTRAINT user_employee_user_id_key UNIQUE (user_id);
-- Definition for index user_employee_user_id_9b2edd10_fk_auth_user_id (OID = 16864):
ALTER TABLE ONLY user_employee
    ADD CONSTRAINT user_employee_user_id_9b2edd10_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
SET search_path = pg_catalog, pg_catalog;
COMMENT ON SCHEMA public IS 'standard public schema';
