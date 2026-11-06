--
-- PostgreSQL database dump
--

\restrict 60SV49FSh8fRT8C2kVHqIYFVwMBbgtgeh4jwQEg5M2w1TopuW8IDeCXt6TcVYdt

-- Dumped from database version 16.15
-- Dumped by pg_dump version 16.15

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: banks_bank_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.banks_bank_type_enum AS ENUM (
    'PUBLIC_SECTOR',
    'PRIVATE_SECTOR',
    'SMALL_FINANCE',
    'PAYMENTS',
    'COOPERATIVE',
    'REGIONAL_RURAL',
    'FOREIGN'
);


--
-- Name: expense_request_events_action_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.expense_request_events_action_enum AS ENUM (
    'SUBMITTED',
    'APPROVED',
    'REJECTED',
    'WITHDRAWN'
);


--
-- Name: expense_requests_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.expense_requests_status_enum AS ENUM (
    'DRAFT',
    'PENDING',
    'APPROVED',
    'REJECTED',
    'WITHDRAWN'
);


--
-- Name: leave_request_events_action_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.leave_request_events_action_enum AS ENUM (
    'SUBMITTED',
    'APPROVED',
    'REJECTED',
    'WITHDRAWN',
    'CANCELLED'
);


--
-- Name: leave_requests_document_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.leave_requests_document_status_enum AS ENUM (
    'NOT_REQUIRED',
    'PENDING',
    'SUBMITTED'
);


--
-- Name: leave_requests_half_day_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.leave_requests_half_day_enum AS ENUM (
    'FIRST_HALF',
    'SECOND_HALF'
);


--
-- Name: leave_requests_reason_category_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.leave_requests_reason_category_enum AS ENUM (
    'PERSONAL_WORK',
    'MEDICAL_CHECKUP',
    'FAMILY_FUNCTION',
    'EMERGENCY',
    'OUT_OF_TOWN'
);


--
-- Name: leave_requests_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.leave_requests_status_enum AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED',
    'WITHDRAWN',
    'CANCELLED'
);


--
-- Name: leave_type_policies_quota_period_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.leave_type_policies_quota_period_enum AS ENUM (
    'YEARLY',
    'STATUS_PERIOD'
);


--
-- Name: leave_types_credit_frequency_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.leave_types_credit_frequency_enum AS ENUM (
    'UPFRONT',
    'MONTHLY'
);


--
-- Name: leave_types_sandwich_rule_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.leave_types_sandwich_rule_enum AS ENUM (
    'NONE',
    'WEEKEND',
    'HOLIDAY',
    'BOTH'
);


--
-- Name: master_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.master_status_enum AS ENUM (
    'active',
    'inactive'
);


--
-- Name: organizations_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.organizations_status_enum AS ENUM (
    'active',
    'suspended'
);


--
-- Name: otp_logs_purpose_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.otp_logs_purpose_enum AS ENUM (
    'LOGIN',
    'REGISTRATION',
    'FORGOT_PASSWORD'
);


--
-- Name: permissions_action_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.permissions_action_enum AS ENUM (
    'read',
    'create',
    'update',
    'delete',
    'status',
    'approve',
    'reject'
);


--
-- Name: profile_change_requests_section_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.profile_change_requests_section_enum AS ENUM (
    'personal_details',
    'work_details',
    'bank_details'
);


--
-- Name: profile_change_requests_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.profile_change_requests_status_enum AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED'
);


--
-- Name: user_addresses_city_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_addresses_city_type_enum AS ENUM (
    'metro',
    'non_metro'
);


--
-- Name: user_module_access_label_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_module_access_label_enum AS ENUM (
    'admin',
    'sub_admin',
    'interviewer',
    'user'
);


--
-- Name: user_personal_details_blood_group_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_personal_details_blood_group_enum AS ENUM (
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
);


--
-- Name: user_personal_details_gender_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_personal_details_gender_enum AS ENUM (
    'male',
    'female',
    'other',
    'prefer_not_to_say'
);


--
-- Name: user_personal_details_marital_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_personal_details_marital_status_enum AS ENUM (
    'married',
    'single',
    'divorced',
    'widowed',
    'separated'
);


--
-- Name: user_work_details_employee_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_work_details_employee_status_enum AS ENUM (
    'probation',
    'confirmed',
    'notice_period',
    'resigned',
    'terminated',
    'retired'
);


--
-- Name: user_work_details_location_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_work_details_location_type_enum AS ENUM (
    'head_office',
    'regional_office',
    'branch',
    'warehouse',
    'site'
);


--
-- Name: user_work_details_payroll_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_work_details_payroll_type_enum AS ENUM (
    'monthly',
    'bi_weekly',
    'weekly',
    'daily',
    'hourly'
);


--
-- Name: user_work_details_work_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_work_details_work_type_enum AS ENUM (
    'onsite',
    'remote',
    'hybrid'
);


--
-- Name: users_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.users_status_enum AS ENUM (
    'ACTIVE',
    'INACTIVE'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access_audit_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.access_audit_logs (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    actor_id uuid,
    action character varying(50) NOT NULL,
    target_user_id uuid,
    app_id smallint,
    data_permission_group_id uuid,
    before jsonb,
    after jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: app_menus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_menus (
    menu_id integer NOT NULL,
    app_id smallint NOT NULL,
    parent_id integer,
    code character varying(100) NOT NULL,
    name character varying(150) NOT NULL,
    sort_order smallint NOT NULL,
    CONSTRAINT "CK_app_menus_parent_not_self" CHECK (((parent_id IS NULL) OR (parent_id <> menu_id)))
);


--
-- Name: app_modules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_modules (
    app_id smallint NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    is_self_service boolean DEFAULT false NOT NULL,
    sort_order smallint NOT NULL,
    tab_name character varying(100) NOT NULL
);


--
-- Name: banks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.banks (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(150) NOT NULL,
    short_name character varying(30),
    ifsc_prefix character varying(4) NOT NULL,
    bank_type public.banks_bank_type_enum NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: branches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.branches (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    name character varying(150) NOT NULL,
    code character varying(50),
    address_line1 character varying(255) NOT NULL,
    address_line2 character varying(255),
    city character varying(100) NOT NULL,
    pincode character varying(10) NOT NULL,
    country_id uuid NOT NULL,
    state_id uuid NOT NULL,
    timezone character varying(64),
    phone character varying(20),
    email character varying(255),
    is_head_office boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: candidate_portal_links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.candidate_portal_links (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    candidate_id uuid NOT NULL,
    stage_id uuid NOT NULL,
    purpose character varying(40) NOT NULL,
    token_hash character(64) NOT NULL,
    sent_to character varying(255) NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    revoked_at timestamp with time zone,
    last_opened_at timestamp with time zone,
    open_count integer DEFAULT 0 NOT NULL,
    created_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    submitted_at timestamp with time zone,
    CONSTRAINT "CHK_candidate_portal_links_purpose" CHECK (((purpose)::text = 'joinee_form'::text))
);


--
-- Name: candidates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.candidates (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    name character varying(150) NOT NULL,
    email character varying(255) NOT NULL,
    mobile_number character varying(20),
    address text,
    reporting_manager_id uuid,
    designation_id uuid NOT NULL,
    department_id uuid NOT NULL,
    branch_id uuid NOT NULL,
    entity_id uuid NOT NULL,
    gender_id uuid,
    age smallint NOT NULL,
    joining_date date NOT NULL,
    annual_salary numeric(14,2) NOT NULL,
    salary_structure_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_by character varying(255),
    deleted_at timestamp with time zone,
    workflow_id uuid,
    current_stage_id uuid,
    stage_status character varying(30) DEFAULT 'pending'::character varying NOT NULL,
    stage_entered_at timestamp with time zone,
    status character varying(20) DEFAULT 'active'::character varying NOT NULL,
    status_reason text,
    status_changed_by character varying(255),
    status_changed_at timestamp with time zone,
    version integer DEFAULT 1 NOT NULL,
    user_id uuid,
    joinee_form_draft jsonb,
    joinee_form_draft_saved_at timestamp with time zone,
    CONSTRAINT "CHK_candidates_stage_status" CHECK (((stage_status)::text = ANY ((ARRAY['pending'::character varying, 'in_progress'::character varying, 'submitted'::character varying, 'failed'::character varying])::text[]))),
    CONSTRAINT "CK_candidates_age" CHECK (((age >= 1) AND (age <= 150))),
    CONSTRAINT "CK_candidates_annual_salary" CHECK ((annual_salary > (0)::numeric)),
    CONSTRAINT "CK_candidates_status" CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'onboarded'::character varying, 'withdrawn'::character varying, 'blacklisted'::character varying])::text[])))
);


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    state_id uuid NOT NULL,
    name character varying(100) NOT NULL,
    is_metro boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    iso_code_2 character varying(2) NOT NULL,
    iso_code_3 character varying(3) NOT NULL,
    phone_code character varying(10),
    currency_code character varying(3),
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.currencies (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(3) NOT NULL,
    name character varying(100) NOT NULL,
    symbol character varying(10) NOT NULL,
    decimal_places smallint NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    exchange_rate numeric(18,6) NOT NULL,
    CONSTRAINT "CK_currencies_code" CHECK (((code)::text ~ '^[A-Z]{3}$'::text)),
    CONSTRAINT "CK_currencies_decimal_places" CHECK (((decimal_places >= 0) AND (decimal_places <= 3))),
    CONSTRAINT "CK_currencies_exchange_rate" CHECK ((exchange_rate > (0)::numeric)),
    CONSTRAINT "CK_currencies_inr_fixed" CHECK ((((code)::text <> 'INR'::text) OR ((exchange_rate = (1)::numeric) AND is_active AND (deleted_at IS NULL))))
);


--
-- Name: data_permission_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.data_permission_groups (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description character varying(500),
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    rules jsonb DEFAULT '[]'::jsonb NOT NULL,
    is_system boolean DEFAULT false NOT NULL,
    CONSTRAINT "CK_data_permission_groups_rules_array" CHECK ((jsonb_typeof(rules) = 'array'::text))
);


--
-- Name: departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.departments (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    name character varying(150) NOT NULL,
    code character varying(50),
    description character varying(500),
    head_employee_id uuid,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    parent_department_id uuid,
    CONSTRAINT "CK_departments_parent_department_not_self" CHECK (((parent_department_id IS NULL) OR (parent_department_id <> id)))
);


--
-- Name: designations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.designations (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    name character varying(150) NOT NULL,
    code character varying(50),
    description character varying(500),
    level integer,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: entities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entities (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    name character varying(150) NOT NULL,
    code character varying(50),
    description character varying(500),
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: expense_policy_documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expense_policy_documents (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    title character varying(150) NOT NULL,
    file_id uuid NOT NULL,
    category_id uuid,
    sort_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_by character varying(255),
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_expense_policy_documents_sort_order" CHECK ((sort_order >= 0)),
    CONSTRAINT "CK_expense_policy_documents_version" CHECK ((version >= 1))
);


--
-- Name: expense_request_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expense_request_events (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    request_id uuid NOT NULL,
    action public.expense_request_events_action_enum NOT NULL,
    actor_id uuid,
    remarks text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: expense_request_item_receipts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expense_request_item_receipts (
    item_id uuid NOT NULL,
    file_id uuid NOT NULL,
    organization_id uuid NOT NULL,
    sort_order smallint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: expense_request_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expense_request_items (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    request_id uuid NOT NULL,
    category_id uuid,
    from_date date,
    to_date date,
    amount numeric(12,3),
    remarks character varying(500),
    sort_order smallint NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_expense_request_items_amount" CHECK (((amount IS NULL) OR (amount > (0)::numeric))),
    CONSTRAINT "CK_expense_request_items_dates" CHECK (((from_date IS NULL) OR (to_date IS NULL) OR (from_date <= to_date)))
);


--
-- Name: expense_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.expense_requests (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    user_id uuid NOT NULL,
    title character varying(150) NOT NULL,
    currency_id uuid NOT NULL,
    exchange_rate numeric(18,6),
    base_currency_id uuid,
    status public.expense_requests_status_enum DEFAULT 'DRAFT'::public.expense_requests_status_enum NOT NULL,
    submitted_on timestamp with time zone,
    approver_id uuid,
    decided_by uuid,
    decided_on timestamp with time zone,
    remarks text,
    withdraw_reason text,
    withdrawn_on timestamp with time zone,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_expense_requests_exchange_rate" CHECK (((exchange_rate IS NULL) OR (exchange_rate > (0)::numeric))),
    CONSTRAINT "CK_expense_requests_submitted" CHECK ((((status = 'DRAFT'::public.expense_requests_status_enum) AND (submitted_on IS NULL) AND (exchange_rate IS NULL) AND (base_currency_id IS NULL)) OR ((status <> 'DRAFT'::public.expense_requests_status_enum) AND (submitted_on IS NOT NULL) AND (exchange_rate IS NOT NULL) AND (base_currency_id IS NOT NULL))))
);


--
-- Name: files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.files (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    storage_key character varying(500) NOT NULL,
    original_name character varying(255),
    mime_type character varying(100) NOT NULL,
    size_bytes integer NOT NULL,
    uploaded_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_files_size_bytes" CHECK ((size_bytes >= 0))
);


--
-- Name: holidays; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.holidays (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    date date NOT NULL,
    name character varying(150) NOT NULL,
    location character varying(100) DEFAULT 'ALL'::character varying NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    organization_id uuid NOT NULL
);


--
-- Name: leave_balances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leave_balances (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    leave_type_id uuid NOT NULL,
    cycle_year integer,
    opening numeric(6,2) DEFAULT 0 NOT NULL,
    accrued numeric(6,2) DEFAULT 0 NOT NULL,
    used numeric(6,2) DEFAULT 0 NOT NULL,
    pending numeric(6,2) DEFAULT 0 NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    organization_id uuid NOT NULL,
    quota_period public.leave_type_policies_quota_period_enum DEFAULT 'YEARLY'::public.leave_type_policies_quota_period_enum NOT NULL,
    employment_status public.user_work_details_employee_status_enum,
    CONSTRAINT "CK_leave_balances_period" CHECK ((((quota_period = 'YEARLY'::public.leave_type_policies_quota_period_enum) AND (cycle_year IS NOT NULL) AND (employment_status IS NULL)) OR ((quota_period = 'STATUS_PERIOD'::public.leave_type_policies_quota_period_enum) AND (cycle_year IS NULL))))
);


--
-- Name: leave_guidelines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leave_guidelines (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    title character varying(150) NOT NULL,
    description text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    organization_id uuid NOT NULL
);


--
-- Name: leave_request_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leave_request_events (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    request_id uuid NOT NULL,
    action public.leave_request_events_action_enum NOT NULL,
    actor_id uuid,
    remarks text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: leave_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leave_requests (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    leave_type_id uuid NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    day_count numeric(5,1) NOT NULL,
    half_day public.leave_requests_half_day_enum,
    reason text,
    attachment_id uuid,
    status public.leave_requests_status_enum DEFAULT 'PENDING'::public.leave_requests_status_enum NOT NULL,
    applied_on timestamp with time zone DEFAULT now() NOT NULL,
    approver_id uuid,
    decided_on timestamp with time zone,
    remarks text,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    organization_id uuid NOT NULL,
    reason_category public.leave_requests_reason_category_enum,
    emergency_contact character varying(20),
    handover_to character varying(100),
    document_status public.leave_requests_document_status_enum DEFAULT 'NOT_REQUIRED'::public.leave_requests_document_status_enum NOT NULL,
    cancel_reason text,
    cancelled_on timestamp with time zone,
    decided_by uuid,
    balance_id uuid,
    CONSTRAINT "CHK_leave_requests_date_range" CHECK ((to_date >= from_date)),
    CONSTRAINT "CHK_leave_requests_day_count" CHECK ((day_count > (0)::numeric))
);


--
-- Name: leave_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leave_settings (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    week_off jsonb DEFAULT '{"sunday": "ALL"}'::jsonb NOT NULL,
    approval_note text NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_leave_settings_week_off_object" CHECK ((jsonb_typeof(week_off) = 'object'::text))
);


--
-- Name: leave_type_policies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leave_type_policies (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    leave_type_id uuid NOT NULL,
    employee_type character varying(50),
    employment_status public.user_work_details_employee_status_enum,
    is_allowed boolean DEFAULT true NOT NULL,
    quota numeric(5,1),
    quota_period public.leave_type_policies_quota_period_enum DEFAULT 'YEARLY'::public.leave_type_policies_quota_period_enum NOT NULL,
    min_notice_days integer,
    max_consecutive_days integer,
    carry_forward_limit numeric(5,1),
    max_retroactive_days integer,
    allow_half_day boolean,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    credit_frequency public.leave_types_credit_frequency_enum,
    CONSTRAINT "CK_leave_type_policies_carry_forward_limit" CHECK (((carry_forward_limit IS NULL) OR (carry_forward_limit >= (0)::numeric))),
    CONSTRAINT "CK_leave_type_policies_employment_status" CHECK (((employment_status IS NULL) OR (employment_status = ANY (ARRAY['probation'::public.user_work_details_employee_status_enum, 'confirmed'::public.user_work_details_employee_status_enum, 'notice_period'::public.user_work_details_employee_status_enum])))),
    CONSTRAINT "CK_leave_type_policies_max_consecutive_days" CHECK (((max_consecutive_days IS NULL) OR (max_consecutive_days >= 1))),
    CONSTRAINT "CK_leave_type_policies_max_retroactive_days" CHECK (((max_retroactive_days IS NULL) OR (max_retroactive_days >= 0))),
    CONSTRAINT "CK_leave_type_policies_min_notice_days" CHECK (((min_notice_days IS NULL) OR (min_notice_days >= 0))),
    CONSTRAINT "CK_leave_type_policies_quota" CHECK (((quota IS NULL) OR (quota >= (0)::numeric))),
    CONSTRAINT "CK_leave_type_policies_target" CHECK (((employee_type IS NOT NULL) OR (employment_status IS NOT NULL)))
);


--
-- Name: leave_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leave_types (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(100) NOT NULL,
    color character varying(7) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    organization_id uuid NOT NULL,
    is_paid boolean DEFAULT true NOT NULL,
    sandwich_rule public.leave_types_sandwich_rule_enum DEFAULT 'NONE'::public.leave_types_sandwich_rule_enum NOT NULL,
    yearly_quota numeric(5,1) DEFAULT 0 NOT NULL,
    min_notice_days integer DEFAULT 0 NOT NULL,
    max_consecutive_days integer,
    allow_half_day boolean DEFAULT false NOT NULL,
    carry_forward_limit numeric(5,1) DEFAULT 0 NOT NULL,
    max_retroactive_days integer DEFAULT 0 NOT NULL,
    hint character varying(255),
    sort_order integer DEFAULT 0 NOT NULL,
    credit_frequency public.leave_types_credit_frequency_enum DEFAULT 'UPFRONT'::public.leave_types_credit_frequency_enum NOT NULL,
    CONSTRAINT "CK_leave_types_carry_forward_limit" CHECK (((carry_forward_limit >= (0)::numeric) AND (carry_forward_limit <= yearly_quota))),
    CONSTRAINT "CK_leave_types_color" CHECK (((color)::text ~ '^#[0-9A-Fa-f]{6}$'::text)),
    CONSTRAINT "CK_leave_types_max_consecutive_days" CHECK (((max_consecutive_days IS NULL) OR (max_consecutive_days >= 1))),
    CONSTRAINT "CK_leave_types_max_retroactive_days" CHECK ((max_retroactive_days >= 0)),
    CONSTRAINT "CK_leave_types_min_notice_days" CHECK ((min_notice_days >= 0)),
    CONSTRAINT "CK_leave_types_yearly_quota" CHECK ((yearly_quota >= (0)::numeric))
);


--
-- Name: master_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.master_items (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    master_type_code character varying(50) NOT NULL,
    name character varying(150) NOT NULL,
    code character varying(50),
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    master_type_id uuid NOT NULL,
    sort_order integer
);


--
-- Name: master_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.master_types (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    is_system boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: offer_letter_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offer_letter_attachments (
    offer_letter_id uuid NOT NULL,
    file_id uuid NOT NULL,
    organization_id uuid NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL
);


--
-- Name: offer_letter_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offer_letter_templates (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    name character varying(150) NOT NULL,
    code character varying(50),
    header_html text DEFAULT ''::text NOT NULL,
    body_html text NOT NULL,
    footer_html text DEFAULT ''::text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: offer_letters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.offer_letters (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    candidate_id uuid NOT NULL,
    stage_id uuid NOT NULL,
    template_id uuid,
    template_name character varying(150) NOT NULL,
    subject character varying(150) NOT NULL,
    to_email character varying(255) NOT NULL,
    cc_emails character varying(255)[] DEFAULT '{}'::character varying[] NOT NULL,
    external_email character varying(255),
    header_html text NOT NULL,
    body_html text NOT NULL,
    footer_html text NOT NULL,
    pdf_file_id uuid NOT NULL,
    sent_by_user_id uuid,
    sent_by character varying(255),
    sent_at timestamp with time zone DEFAULT now() NOT NULL,
    response_token_hash character(64),
    response_expires_at timestamp with time zone,
    revoked_at timestamp with time zone,
    accepted_at timestamp with time zone,
    rejected_at timestamp with time zone,
    rejection_reason character varying(500),
    response_ip character varying(64),
    response_user_agent character varying(255),
    CONSTRAINT "CHK_offer_letters_one_response" CHECK (((accepted_at IS NULL) OR (rejected_at IS NULL)))
);


--
-- Name: onboarding_candidate_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.onboarding_candidate_events (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    candidate_id uuid NOT NULL,
    event_type character varying(40) NOT NULL,
    method character varying(20) NOT NULL,
    from_stage_id uuid,
    to_stage_id uuid,
    actor_id uuid,
    actor_name character varying(255),
    remark text,
    payload jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: onboarding_candidate_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.onboarding_candidate_stages (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    candidate_id uuid NOT NULL,
    stage_id uuid NOT NULL,
    entered_at timestamp with time zone DEFAULT now() NOT NULL,
    entered_by character varying(255),
    entered_method character varying(20) NOT NULL,
    completed_at timestamp with time zone,
    completed_by character varying(255),
    completion character varying(20)
);


--
-- Name: onboarding_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.onboarding_stages (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    workflow_id uuid NOT NULL,
    stage_type character varying(40) NOT NULL,
    name character varying(100) NOT NULL,
    sort_order smallint NOT NULL,
    supports_automation boolean DEFAULT false NOT NULL,
    automation_enabled boolean DEFAULT false NOT NULL,
    automation_config jsonb,
    is_terminal boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_by character varying(255),
    deleted_at timestamp with time zone,
    kind character varying(20) DEFAULT 'process'::character varying NOT NULL,
    CONSTRAINT "CHK_onboarding_stages_kind" CHECK ((((kind)::text = 'process'::text) OR (((kind)::text = 'status'::text) AND ((stage_type)::text = ANY ((ARRAY['withdrawn'::character varying, 'blacklisted'::character varying, 'deleted'::character varying])::text[])) AND (NOT is_terminal) AND (NOT supports_automation))))
);


--
-- Name: onboarding_workflows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.onboarding_workflows (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    name character varying(100) NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(255),
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_by character varying(255),
    deleted_at timestamp with time zone
);


--
-- Name: organization_currencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_currencies (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    currency_id uuid NOT NULL,
    exchange_rate numeric(18,6),
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_organization_currencies_exchange_rate" CHECK (((exchange_rate IS NULL) OR (exchange_rate > (0)::numeric)))
);


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizations (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(120) NOT NULL,
    status public.organizations_status_enum DEFAULT 'active'::public.organizations_status_enum NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: otp_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.otp_logs (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    mobile_number character varying(20) NOT NULL,
    otp_code character varying(255) NOT NULL,
    purpose public.otp_logs_purpose_enum DEFAULT 'LOGIN'::public.otp_logs_purpose_enum NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    is_verified boolean DEFAULT false NOT NULL,
    verified_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_tokens (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    token_hash character varying(64) NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    used_at timestamp with time zone,
    requested_ip character varying(45),
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permissions (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    code character varying(120) NOT NULL,
    name character varying(255) NOT NULL,
    module character varying(100) NOT NULL,
    action public.permissions_action_enum NOT NULL,
    description text,
    status public.master_status_enum DEFAULT 'active'::public.master_status_enum NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: policy_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.policy_info (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    code character varying(50) NOT NULL,
    title character varying(150) NOT NULL,
    subtitle character varying(255),
    sections jsonb NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_policy_info_code" CHECK (((code)::text ~ '^[A-Z][A-Z0-9_]{1,49}$'::text)),
    CONSTRAINT "CK_policy_info_sections" CHECK ((jsonb_typeof(sections) = 'array'::text)),
    CONSTRAINT "CK_policy_info_version" CHECK ((version >= 1))
);


--
-- Name: profile_change_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profile_change_requests (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    employee_id uuid NOT NULL,
    section public.profile_change_requests_section_enum NOT NULL,
    request text NOT NULL,
    reason text,
    status public.profile_change_requests_status_enum DEFAULT 'PENDING'::public.profile_change_requests_status_enum NOT NULL,
    reviewed_by uuid,
    reviewed_at timestamp with time zone,
    review_remark text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_permissions (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(120) NOT NULL,
    description text,
    status public.master_status_enum DEFAULT 'active'::public.master_status_enum NOT NULL,
    is_system boolean DEFAULT false NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    organization_id uuid NOT NULL
);


--
-- Name: salary_structures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.salary_structures (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    name character varying(150) NOT NULL,
    code character varying(50),
    description character varying(500),
    sort_order integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    country_id uuid NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10),
    is_active boolean DEFAULT true NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


--
-- Name: user_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_addresses (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    city_type public.user_addresses_city_type_enum,
    current_address_line1 character varying(255),
    current_address_line2 character varying(255),
    current_country character varying(100),
    current_state character varying(100),
    current_city character varying(100),
    current_zip character varying(10),
    same_as_current_address boolean DEFAULT false NOT NULL,
    permanent_address_line1 character varying(255),
    permanent_address_line2 character varying(255),
    permanent_country character varying(100),
    permanent_state character varying(100),
    permanent_city character varying(100),
    permanent_zip character varying(10),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    current_country_id uuid,
    current_state_id uuid,
    permanent_country_id uuid,
    permanent_state_id uuid,
    city_type_id uuid,
    current_city_id uuid,
    permanent_city_id uuid
);


--
-- Name: user_bank_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_bank_details (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    bank_name character varying(150),
    account_no character varying(34),
    ifsc_code character varying(11),
    account_holder_name character varying(150),
    pan character varying(10),
    pf_uan character varying(12),
    pf_no character varying(30),
    esi_number character varying(20),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    company_esic_code character varying(30)
);


--
-- Name: user_emergency_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_emergency_contacts (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    name character varying(150),
    relationship character varying(50),
    contact_number character varying(20),
    address text,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    secondary_name character varying(150),
    secondary_phone character varying(20),
    secondary_relationship character varying(50),
    relationship_id uuid,
    secondary_relationship_id uuid
);


--
-- Name: user_family_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_family_details (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    father_name character varying(150),
    mother_name character varying(150),
    spouse_name character varying(150),
    primary_nominee character varying(150),
    nominee_relationship character varying(50),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    nominee_relationship_id uuid,
    name character varying(150),
    mobile_no character varying(20),
    aadhar_number character varying(12),
    date_of_birth date,
    relationship_id uuid
);


--
-- Name: user_module_access; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_module_access (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    user_id uuid NOT NULL,
    app_id smallint NOT NULL,
    label public.user_module_access_label_enum NOT NULL,
    data_permission_group_id uuid,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    menu_ids integer[] DEFAULT '{}'::integer[] NOT NULL,
    CONSTRAINT "CK_user_module_access_group" CHECK (((data_permission_group_id IS NOT NULL) OR ((label)::text = 'user'::text)))
);


--
-- Name: user_personal_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_personal_details (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    full_name character varying(150) NOT NULL,
    father_name character varying(150),
    mother_name character varying(150),
    gender public.user_personal_details_gender_enum,
    date_of_birth date,
    marital_status public.user_personal_details_marital_status_enum,
    date_of_marriage date,
    nationality character varying(100),
    religion character varying(100),
    blood_group public.user_personal_details_blood_group_enum,
    personal_email_id character varying(255),
    aadhar_card character varying(12),
    passport_no character varying(20),
    date_of_gratuity date,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    nationality_country_id uuid,
    gender_id uuid,
    marital_status_id uuid,
    blood_group_id uuid,
    religion_id uuid
);


--
-- Name: user_previous_experiences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_previous_experiences (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    previous_company_name character varying(255),
    from_date date,
    to_date date,
    job_title character varying(150),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT "CK_user_previous_experiences_dates" CHECK ((from_date <= to_date))
);


--
-- Name: user_qualifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_qualifications (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    diploma_degree_name character varying(150),
    institution_name character varying(255),
    passing_year smallint,
    percentage numeric(5,2),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    qualification_id uuid,
    diploma_degree_id uuid,
    CONSTRAINT "CK_user_qualifications_percentage" CHECK (((percentage >= (0)::numeric) AND (percentage <= (100)::numeric)))
);


--
-- Name: user_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_sessions (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    refresh_token_hash character varying(64) NOT NULL,
    device_id character varying(64) NOT NULL,
    device_name character varying(120),
    browser character varying(80),
    os character varying(80),
    ip_address character varying(45),
    last_activity timestamp with time zone NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    is_revoked boolean DEFAULT false NOT NULL,
    revoked_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: user_work_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_work_details (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    employee_code character varying(50),
    biometric_id character varying(50),
    company character varying(150),
    location character varying(150),
    location_type public.user_work_details_location_type_enum,
    office_address text,
    zone_id character varying(50),
    department character varying(100),
    sub_department character varying(100),
    designation character varying(100),
    grade character varying(50),
    employee_type character varying(150),
    work_type public.user_work_details_work_type_enum,
    employee_status public.user_work_details_employee_status_enum,
    cost_center character varying(100),
    shift character varying(150),
    leave_rule character varying(100),
    payroll_type public.user_work_details_payroll_type_enum,
    hiring_source character varying(100),
    source_of_verification character varying(150),
    reporting_manager_id uuid,
    functional_head_id uuid,
    hrbp_id uuid,
    official_email_id character varying(255),
    official_mobile_number character varying(20),
    joining_date date,
    notice_days integer,
    probation_days integer,
    probation_date date,
    probation_confirmation_date date,
    contract_end_date date,
    date_of_retirement date,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    grade_id uuid,
    cost_center_id uuid,
    zone_item_id uuid,
    hiring_source_id uuid,
    verification_source_id uuid,
    department_id uuid,
    sub_department_id uuid,
    designation_id uuid,
    branch_id uuid,
    location_type_id uuid,
    employment_type_id uuid,
    employee_status_id uuid,
    notice_start_date date,
    entity_id uuid,
    employee_type_id uuid,
    last_working_date date,
    payroll_type_id uuid,
    CONSTRAINT "CK_user_work_details_notice_days" CHECK ((notice_days >= 0)),
    CONSTRAINT "CK_user_work_details_probation_days" CHECK ((probation_days >= 0))
);


--
-- Name: user_work_details_employee_code_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_work_details_employee_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying(255) NOT NULL,
    mobile_number character varying(20),
    password_hash character varying(255),
    status public.users_status_enum DEFAULT 'ACTIVE'::public.users_status_enum NOT NULL,
    role_id uuid,
    last_login_at timestamp with time zone,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    organization_id uuid,
    is_super_admin boolean DEFAULT false NOT NULL,
    profile_picture_id uuid,
    ip_address character varying(45),
    device_name character varying(120),
    is_tablet boolean,
    device_unique_id character varying(255),
    CONSTRAINT "CK_users_tenant_scope" CHECK (((is_super_admin AND (organization_id IS NULL) AND (role_id IS NULL)) OR ((NOT is_super_admin) AND (organization_id IS NOT NULL))))
);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Data for Name: access_audit_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.access_audit_logs (id, organization_id, actor_id, action, target_user_id, app_id, data_permission_group_id, before, after, created_at) FROM stdin;
2f52a047-0c52-4c21-9ceb-b2002377ff99	9edca853-7860-4925-b81b-1206dc4298cb	\N	module_access.granted	f80816b4-1585-4a4b-9cf2-d284a81c8458	1	\N	\N	{"label": "admin", "menuIds": [], "dataPermissionGroupId": null}	2026-10-26 12:37:09.308116+00
f755cac5-239d-4691-afdf-fe15cbf21ffa	9edca853-7860-4925-b81b-1206dc4298cb	\N	module_access.granted	f80816b4-1585-4a4b-9cf2-d284a81c8458	3	\N	\N	{"label": "admin", "menuIds": [], "dataPermissionGroupId": null}	2026-10-26 12:37:09.308116+00
9399efc1-f0bf-4800-91e1-43cb1e311097	9edca853-7860-4925-b81b-1206dc4298cb	\N	module_access.granted	f80816b4-1585-4a4b-9cf2-d284a81c8458	5	\N	\N	{"label": "admin", "menuIds": [], "dataPermissionGroupId": null}	2026-10-26 12:37:09.308116+00
6a3147b3-ccf0-4c26-afa2-05597a4c48c5	9edca853-7860-4925-b81b-1206dc4298cb	\N	module_access.granted	f80816b4-1585-4a4b-9cf2-d284a81c8458	6	\N	\N	{"label": "admin", "menuIds": [], "dataPermissionGroupId": null}	2026-10-26 12:37:09.308116+00
d5fe124f-4643-4b99-8087-4797cc5bdb32	9edca853-7860-4925-b81b-1206dc4298cb	\N	module_access.granted	f80816b4-1585-4a4b-9cf2-d284a81c8458	7	\N	\N	{"label": "admin", "menuIds": [], "dataPermissionGroupId": null}	2026-10-26 12:37:09.308116+00
f98cccc8-ca55-4d84-b97d-2eebc2bddac3	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.created	\N	\N	dbc7746b-234f-4cd4-8d77-f3b08cde754e	\N	{"name": "Shree Maruti - Technology", "rules": [{"level": "entity", "values": ["5f7a65ab-f28a-474f-8bf3-caa56056e7ea"]}, {"level": "department", "values": ["bae28813-0127-4076-9b5b-8d1fe4f0fa7f"]}], "isActive": true}	2026-10-27 11:36:37.880535+00
94277526-b60b-41fa-81cd-3dc0da69b739	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.created	\N	\N	b67eb300-1cf0-4092-acdd-00fca2c0f64f	\N	{"name": "Smile - HR Reporting", "rules": [{"level": "entity", "values": ["3ec637ef-5f74-4c64-933a-9411644db07f"]}, {"level": "department", "values": ["c96c2707-dd48-4d61-bf49-6870918d7e5e"]}], "isActive": true}	2026-10-27 11:39:00.081832+00
e069f83c-a0f9-41f0-a552-3f65d3f92de1	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.created	\N	\N	b2ec3165-0292-4691-aab0-7644089060eb	\N	{"name": "Smile - Finance", "rules": [{"level": "entity", "values": ["3ec637ef-5f74-4c64-933a-9411644db07f"]}, {"level": "department", "values": ["4d7195c5-dd4e-492b-ac78-a989ab30fdab"]}], "isActive": true}	2026-10-27 11:40:50.695149+00
9c62f2cc-3ae4-430a-a852-ba654b810cf7	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.created	\N	\N	f4b50ece-0e44-4b9f-94c4-8f70f70a322f	\N	{"name": "Test", "rules": [{"level": "entity", "values": ["3ec637ef-5f74-4c64-933a-9411644db07f"]}, {"level": "department", "values": ["bae28813-0127-4076-9b5b-8d1fe4f0fa7f"]}], "isActive": true}	2026-10-27 11:56:39.592488+00
e390ca69-813c-4c3b-9d6a-0a3a1879a620	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.created	\N	\N	1bf12b3a-b8e7-496a-94c5-35147ad5f70f	\N	{"name": "Hr Management", "rules": [{"level": "department", "values": ["c96c2707-dd48-4d61-bf49-6870918d7e5e", "cf59bdc6-9902-4bea-98af-d86a639976c8", "bae28813-0127-4076-9b5b-8d1fe4f0fa7f"]}], "isActive": true}	2026-10-27 11:58:20.443299+00
fade9b12-2026-4b33-b739-154083d7ecd8	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "1bf12b3a-b8e7-496a-94c5-35147ad5f70f"}	2026-10-27 17:41:35.074149+00
2eb66473-ed59-4bbc-b399-05fe89f6f4a5	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	0e9621c5-c42a-47de-9520-4f3da89600d7	5	\N	\N	{"label": "sub_admin", "menuIds": [211, 212, 214, 215, 216, 217, 218, 219, 221, 222, 223, 224, 225, 231, 232, 233, 234], "dataPermissionGroupId": "1bf12b3a-b8e7-496a-94c5-35147ad5f70f"}	2026-10-28 05:16:00.853824+00
750a2f54-22e7-4dd6-94ed-f672417837fb	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	2026-10-28 05:16:19.151137+00
68ed9480-3811-46b9-9f73-e689bbc8de30	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "b2ec3165-0292-4691-aab0-7644089060eb"}	2026-10-28 05:27:40.999208+00
07c4208c-e48d-474b-b325-1892d9d45f65	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "1bf12b3a-b8e7-496a-94c5-35147ad5f70f"}	\N	2026-10-28 06:10:19.435783+00
7f545e84-ecc4-4b75-bcac-4775d0705247	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 12, "groups": 8, "search": null}	2026-10-30 04:36:02.607064+00
879add1a-fdad-42f6-818d-75edfa9044cb	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 2, "groups": 1, "search": "Smile - HR Reporting"}	2026-10-30 05:07:16.256746+00
bde046c9-e7c1-420c-aa11-d0c4d2f32449	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	audit_log.exported	\N	\N	\N	\N	{"to": "2026-10-30", "from": "2026-09-30", "rows": 58}	2026-10-30 07:33:42.161029+00
b0272b90-dc94-4b6d-ab1b-bbad4a0bde8b	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	\N	2026-10-28 06:19:24.671711+00
ed7524ef-ca33-45aa-b531-96622a03f2b0	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	0e9621c5-c42a-47de-9520-4f3da89600d7	5	\N	{"label": "sub_admin", "menuIds": [211, 212, 214, 215, 216, 217, 218, 219, 221, 222, 223, 224, 225, 231, 232, 233, 234], "dataPermissionGroupId": "1bf12b3a-b8e7-496a-94c5-35147ad5f70f"}	\N	2026-10-28 06:19:29.143123+00
e4170da1-5a2d-4805-9fa0-14576b45b941	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "b2ec3165-0292-4691-aab0-7644089060eb"}	\N	2026-10-28 06:19:33.58633+00
8ee09298-c0e1-49ad-b2fd-503c772721d4	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	2026-10-28 06:19:44.194921+00
96713e48-3252-41f4-9d2c-71094713d2fc	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "b67eb300-1cf0-4092-acdd-00fca2c0f64f"}	2026-10-28 06:34:19.174354+00
0dd69f53-3518-41ee-85e3-756026bed915	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "b67eb300-1cf0-4092-acdd-00fca2c0f64f"}	\N	2026-10-28 06:34:27.64814+00
29dce034-00ea-4921-b353-537c53991058	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "c8142d68-8ef6-410d-ba7f-8078ac2b8696"}	2026-10-28 06:34:38.366759+00
e9c5ecde-accf-4b4a-96f8-118ac4313dd3	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "c8142d68-8ef6-410d-ba7f-8078ac2b8696"}	\N	2026-10-28 06:34:44.070732+00
2d0f776d-fcf1-4daa-8b50-41aa986126a4	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 12, "groups": 8, "search": null}	2026-10-30 04:43:03.106783+00
5d3031ca-9e84-42ee-a0ce-79680cf529a5	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 2, "groups": 1, "search": "Smile - HR Reporting"}	2026-10-30 05:21:49.564381+00
4b4a163f-8ca8-4e22-8bf6-13fbea8dbf50	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	audit_log.exported	\N	\N	\N	\N	{"to": "2026-10-30", "from": "2026-09-30", "rows": 58}	2026-10-30 07:42:35.296213+00
1f0b0700-0abd-446d-810f-e7394933d8b5	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	{"label": "sub_admin", "menuIds": [8, 9, 10, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	2026-10-28 07:01:51.078958+00
451637d0-daa4-446f-906b-bf0a12078f8e	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	2026-10-28 07:02:33.510603+00
350538f8-c0aa-4603-8bad-9e842d39517d	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.created	\N	\N	4605e41e-1121-456d-bb1c-38b26b509874	\N	{"name": "All Entities", "rules": [{"level": "entity", "values": ["3ec637ef-5f74-4c64-933a-9411644db07f", "5f7a65ab-f28a-474f-8bf3-caa56056e7ea"]}], "isActive": true}	2026-10-28 07:02:53.803921+00
08242bf7-77d6-41de-80e3-58f592e5982b	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	{"label": "sub_admin", "menuIds": [8, 9, 10, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	2026-10-28 07:03:58.81566+00
5e068310-2c09-4a56-9ca2-2f4d113d04f1	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "dbc7746b-234f-4cd4-8d77-f3b08cde754e"}	\N	2026-10-28 09:04:37.307509+00
370a8cd4-5c4f-4724-9927-77da43f84028	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 09:08:55.018821+00
a4ae4215-389c-47cf-b8d3-9d29654ae371	9edca853-7860-4925-b81b-1206dc4298cb	24f04f5b-9007-4480-94cd-0556d4aef097	module_access.revoked	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [1, 3, 4, 5, 6, 7, 8, 9, 10, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	\N	2026-10-28 12:40:11.178673+00
30a803fc-223a-473d-acd2-defe7f48d474	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [8, 9, 10, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 09:09:18.160483+00
c6094999-1882-4a03-a8f6-4d0a3848a563	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 09:09:54.859345+00
e4d516c4-c811-467f-b8f7-504a21b20a70	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [8, 9, 10, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 09:37:06.51474+00
245bfd6e-0ad9-4efa-bc39-10404e686873	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 10:22:49.177749+00
7d0cc135-4537-4f0c-8b69-50424d6a9fd9	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	{"label": "sub_admin", "menuIds": [2, 3, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [2, 3, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 55, 56, 57, 58, 59, 60, 61, 64, 65, 66], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 11:31:26.203263+00
5ee63d83-7ef8-4b8f-98a0-d16d2a87df3c	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 2, "groups": 1, "search": "Smile - HR Reporting"}	2026-10-30 04:43:31.42387+00
f58a593b-9f29-45bc-ae97-5ab1e5b708d2	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 11:07:01.559401+00
b5d7af1a-ddb8-42ac-9377-fd9dc983625e	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	0e9621c5-c42a-47de-9520-4f3da89600d7	1	\N	{"label": "sub_admin", "menuIds": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [1, 3, 4, 5, 6, 7, 8, 9, 10, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 62, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 11:09:54.693636+00
e5ffc647-c0c0-4733-925f-a730d8bb5714	9edca853-7860-4925-b81b-1206dc4298cb	0e9621c5-c42a-47de-9520-4f3da89600d7	module_access.granted	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 11:10:27.17005+00
0cdb805a-4be5-4c31-8b7c-8c8434b788c2	9edca853-7860-4925-b81b-1206dc4298cb	0e9621c5-c42a-47de-9520-4f3da89600d7	module_access.updated	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [2, 3, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 11:10:51.365545+00
e18b2996-d58a-46cb-9e95-4f25f90e8b19	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	0e9621c5-c42a-47de-9520-4f3da89600d7	3	\N	\N	{"label": "sub_admin", "menuIds": [111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 131, 132, 133, 134, 135], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 11:14:27.334689+00
84a6be9f-396d-4b52-818a-93b45eeab518	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	0e9621c5-c42a-47de-9520-4f3da89600d7	3	\N	{"label": "sub_admin", "menuIds": [111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 131, 132, 133, 134, 135], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	\N	2026-10-28 11:14:48.181534+00
f935139f-52a5-407a-a1d7-52e4622cf9fe	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	24f04f5b-9007-4480-94cd-0556d4aef097	3	\N	\N	{"label": "sub_admin", "menuIds": [111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 131, 132, 133, 134, 135], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 11:14:54.515092+00
d37274c2-29b5-401c-989d-d877eabb3932	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 12, "groups": 8, "search": null}	2026-10-30 04:46:00.231447+00
eee5a20f-b773-40c9-85a7-a3991897b60e	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 2, "groups": 1, "search": "Smile - HR Reporting"}	2026-10-30 05:35:28.147597+00
b9e0bcfe-ab54-41d4-97ed-dda55a04c8c3	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	{"label": "sub_admin", "menuIds": [2, 3, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 55, 56, 57, 58, 59, 60, 61, 64, 65, 66], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [2, 3, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 11:31:54.147825+00
29d70f2c-2c08-4069-a891-f67a093f09fd	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	24f04f5b-9007-4480-94cd-0556d4aef097	3	\N	{"label": "sub_admin", "menuIds": [111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 131, 132, 133, 134, 135], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	\N	2026-10-28 12:14:21.919979+00
79279144-6fb2-40b3-abde-75ddf367b027	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	{"label": "sub_admin", "menuIds": [2, 3, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	\N	2026-10-28 12:14:26.650014+00
d72a0ac0-bf36-4645-9726-d3b7af9c3495	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 12:22:11.385679+00
d0b1f3d6-9f22-42f9-8538-00c762a04832	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "b67eb300-1cf0-4092-acdd-00fca2c0f64f"}	2026-10-28 12:23:58.960554+00
d455b1b2-9de5-42f3-b722-0671bc6a0c01	9edca853-7860-4925-b81b-1206dc4298cb	24f04f5b-9007-4480-94cd-0556d4aef097	data_group.created	\N	\N	53888bda-9e25-4a97-9ca5-62e188192178	\N	{"name": "off-role entity", "rules": [{"level": "entity", "values": ["5f7a65ab-f28a-474f-8bf3-caa56056e7ea"]}], "isActive": true}	2026-10-28 12:28:14.524008+00
6ec80c0b-07d3-4de1-98f5-6fa3564fc891	9edca853-7860-4925-b81b-1206dc4298cb	24f04f5b-9007-4480-94cd-0556d4aef097	module_access.granted	3f4e5e52-6d48-4266-86c5-03f57e2947e6	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "53888bda-9e25-4a97-9ca5-62e188192178"}	2026-10-28 12:28:50.208502+00
96fb4b67-4c73-4f6e-b738-1ed8aeb57ba9	9edca853-7860-4925-b81b-1206dc4298cb	24f04f5b-9007-4480-94cd-0556d4aef097	module_access.updated	3f4e5e52-6d48-4266-86c5-03f57e2947e6	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "53888bda-9e25-4a97-9ca5-62e188192178"}	{"label": "sub_admin", "menuIds": [1, 2, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 55, 56, 57, 58, 59, 60, 61, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "53888bda-9e25-4a97-9ca5-62e188192178"}	2026-10-28 12:30:11.054389+00
23e02c8b-6789-4f5d-bb6f-cb297532f93a	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 12, "groups": 8, "search": null}	2026-10-30 05:05:57.523552+00
23ccdfad-9fb3-4516-b29e-c6fd756051ef	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	audit_log.exported	\N	\N	\N	\N	{"to": "2026-10-30", "from": "2026-09-30", "rows": 58}	2026-10-30 07:20:19.35434+00
85cacb93-64fd-4809-8f0f-a0dcb405dca5	9edca853-7860-4925-b81b-1206dc4298cb	24f04f5b-9007-4480-94cd-0556d4aef097	module_access.revoked	3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "b67eb300-1cf0-4092-acdd-00fca2c0f64f"}	\N	2026-10-28 12:40:23.071895+00
3e84cbf4-18ed-4448-a816-097d0d9093b3	9edca853-7860-4925-b81b-1206dc4298cb	24f04f5b-9007-4480-94cd-0556d4aef097	module_access.granted	470ed31a-9262-4c40-81c9-a03f0ebcd840	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 12:40:48.468016+00
ca757b0d-9516-4a3f-a204-fae2fa08ddde	9edca853-7860-4925-b81b-1206dc4298cb	24f04f5b-9007-4480-94cd-0556d4aef097	module_access.granted	4f855c59-60da-487a-b8ad-0330af959bb5	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 12:41:11.075132+00
699a24ea-0b43-491d-8831-a6321d4847c2	9edca853-7860-4925-b81b-1206dc4298cb	24f04f5b-9007-4480-94cd-0556d4aef097	module_access.granted	3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	1	\N	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 12:44:46.9262+00
699b90fe-07e4-49e8-9642-53e86801cc2b	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	24f04f5b-9007-4480-94cd-0556d4aef097	3	\N	\N	{"label": "sub_admin", "menuIds": [111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 131, 132, 133, 134, 135], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 12:59:57.715961+00
18d0e2d8-d3ed-44ef-a231-93fbb7c46803	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.revoked	24f04f5b-9007-4480-94cd-0556d4aef097	3	\N	{"label": "sub_admin", "menuIds": [111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 131, 132, 133, 134, 135], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	\N	2026-10-28 13:06:43.583289+00
207483cb-5965-42a2-b023-9a85704310cd	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.updated	24f04f5b-9007-4480-94cd-0556d4aef097	1	\N	{"label": "sub_admin", "menuIds": [8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 28, 29, 30, 31, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	{"label": "sub_admin", "menuIds": [1, 2, 3, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66], "dataPermissionGroupId": "4605e41e-1121-456d-bb1c-38b26b509874"}	2026-10-28 13:06:53.52575+00
a6418b68-4cd5-499f-8516-2e75a89e3711	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	module_access.granted	5c3245b2-f884-4d4f-98b4-23fb0a156853	3	\N	\N	{"label": "sub_admin", "menuIds": [111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 131, 132, 133, 134, 135], "dataPermissionGroupId": "c8142d68-8ef6-410d-ba7f-8078ac2b8696"}	2026-10-29 05:21:44.184519+00
62b3df9f-8105-4f48-b55a-166664cfc745	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 12, "groups": 8, "search": null}	2026-10-29 12:23:03.923294+00
1fb99220-137e-4ca9-ba82-fb7954bd8ee3	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 12, "groups": 8, "search": null}	2026-10-30 04:32:55.721851+00
f4bbc7d3-16d4-46ad-b514-4c48a0a993d0	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 12, "groups": 8, "search": null}	2026-10-30 04:33:51.637824+00
d8bf9fb1-c66c-43d8-ab21-1b3c1f0b31f4	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 12, "groups": 8, "search": null}	2026-10-30 04:34:05.67961+00
034427d1-3150-417f-9108-784dcc043c8c	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	data_group.exported	\N	\N	\N	\N	{"rows": 12, "groups": 8, "search": null}	2026-10-30 04:35:54.07274+00
fb65bfac-2207-49ff-b29e-5c43016f7446	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	audit_log.exported	\N	\N	\N	\N	{"to": "2026-10-30", "from": "2026-09-30", "rows": 58}	2026-10-30 08:55:47.55275+00
06d0964b-913a-49a2-91bf-49a6320828ff	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	audit_log.exported	\N	\N	\N	\N	{"to": "2026-10-30", "from": "2026-09-30", "rows": 59}	2026-10-30 09:09:22.409259+00
\.


--
-- Data for Name: app_menus; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_menus (menu_id, app_id, parent_id, code, name, sort_order) FROM stdin;
101	3	\N	dashboard	Dashboard	1
102	3	\N	payroll_run	Payroll Run	2
103	3	\N	salary	Salary	3
104	3	\N	statutory	Statutory	4
105	3	\N	reports	Reports	5
106	3	\N	configuration	Configuration	6
111	3	101	dashboard.payroll_summary	Payroll Summary	1
112	3	101	dashboard.statutory_summary	Statutory Summary	2
113	3	102	payroll_run.monthly_payroll	Monthly Payroll	1
114	3	102	payroll_run.off_cycle_payroll	Off-cycle Payroll	2
115	3	102	payroll_run.arrears	Arrears	3
116	3	103	salary.salary_structure	Salary Structure	1
117	3	103	salary.salary_revision	Salary Revision	2
118	3	103	salary.payslips	Payslips	3
119	3	104	statutory.pf	Provident Fund (PF)	1
120	3	104	statutory.esi	ESI	2
1	1	\N	dashboard	Dashboard	1
2	1	\N	inbox	Inbox	2
3	1	\N	core_hr	Core HR	3
4	1	\N	advance_hr	Advance HR	4
5	1	\N	finance	Finance	5
6	1	\N	engage	Engage	6
7	1	\N	reports	Reports	7
8	1	1	dashboard.standard_dashboard	Standard Dashboard	1
9	1	1	dashboard.custom_dashboard	Custom Dashboard	2
10	1	1	dashboard.configuration	Configuration	3
11	1	2	inbox.employee	Employee	1
12	1	2	inbox.leave_attendance	Leave & Attendance	2
13	1	2	inbox.document	Document	3
14	1	2	inbox.onboarding	Onboarding	4
15	1	2	inbox.offboarding	Offboarding	5
16	1	2	inbox.requisition	Requisition	6
17	1	2	inbox.asset	Asset	7
18	1	2	inbox.expense	Expense	8
19	1	2	inbox.travel_desk	Travel Desk	9
20	1	2	inbox.vendor	Vendor	10
21	1	2	inbox.petty_cash	Petty Cash	11
22	1	2	inbox.benefits_loan_advance	Benefits (Loan & Advance)	12
23	1	3	core_hr.employee	Employee	1
24	1	3	core_hr.leave_attendance	Leave & Attendance	2
25	1	3	core_hr.org_structure	Org Structure	3
26	1	3	core_hr.masters	Masters	4
27	1	4	advance_hr.onboarding	Onboarding	1
28	1	4	advance_hr.offboarding	Offboarding	2
29	1	4	advance_hr.help_desk	Help Desk	3
30	1	4	advance_hr.asset	Asset	4
31	1	4	advance_hr.task	Task	5
32	1	5	finance.expense	Expense	1
33	1	5	finance.travel_desk	Travel Desk	2
34	1	5	finance.vendor	Vendor	3
35	1	5	finance.petty_cash	Petty Cash	4
36	1	5	finance.planning_budgeting	Planning & Budgeting	5
37	1	6	engage.announcement	Announcement	1
38	1	6	engage.chat	Chat	2
39	1	6	engage.feed	Feed	3
40	1	6	engage.survey	Survey	4
41	1	6	engage.one_to_one	One To One	5
42	1	6	engage.rewards_recognition	Rewards & Recognition	6
43	1	6	engage.meeting	Meeting	7
44	1	6	engage.continuous_feedback	Continuous Feedback	8
45	1	6	engage.reports	Reports	9
46	1	6	engage.configuration	Configuration	10
47	1	7	reports.attendance	Attendance	1
48	1	7	reports.leave	Leave	2
49	1	7	reports.employee	Employee	3
50	1	7	reports.custom	Custom	4
51	1	7	reports.report_engine	Report Engine	5
52	1	7	reports.upload_logs	Upload Logs	6
53	1	7	reports.configuration	Configuration	7
54	1	7	reports.report_download_logs	Report Download Logs	8
55	1	11	inbox.employee.probation_confirmation	Probation Confirmation	1
56	1	11	inbox.employee.probation_feedback	Probation Feedback	2
57	1	11	inbox.employee.probation_feedback_survey	Probation Feedback Survey	3
58	1	11	inbox.employee.profile_updates	Profile Updates	4
59	1	11	inbox.employee.transfer	Transfer	5
60	1	11	inbox.employee.performance_improvement_plan_pip	Performance Improvement Plan (PIP)	6
61	1	11	inbox.employee.rejoining_confirmation	Rejoining Confirmation	7
62	1	23	core_hr.employee.dashboard	Dashboard	1
63	1	23	core_hr.employee.employee_master	Employee Master	2
64	1	23	core_hr.employee.organization_chart	Organization Chart	3
65	1	23	core_hr.employee.roles_and_permission	Roles And Permission	4
66	1	23	core_hr.employee.data_permission	Data Permission	5
67	1	27	advance_hr.onboarding.dashboard	Dashboard	1
68	1	27	advance_hr.onboarding.candidate	Candidate	2
69	1	27	advance_hr.onboarding.reports	Reports	3
70	1	27	advance_hr.onboarding.configuration	Configuration	4
71	1	32	finance.expense.dashboard	Dashboard	1
72	1	32	finance.expense.reports	Reports	2
73	1	32	finance.expense.configuration	Configuration	3
74	1	37	engage.announcement.dashboard	Dashboard	1
75	1	37	engage.announcement.announcement_list	Announcement List	2
76	1	37	engage.announcement.configuration	Configuration	3
121	3	104	statutory.professional_tax	Professional Tax	3
122	3	104	statutory.tds	TDS	4
123	3	105	reports.salary_register	Salary Register	1
124	3	105	reports.bank_transfer	Bank Transfer	2
125	3	105	reports.statutory_reports	Statutory Reports	3
126	3	106	configuration.pay_groups	Pay Groups	1
127	3	106	configuration.payroll_settings	Payroll Settings	2
131	3	113	payroll_run.monthly_payroll.process_payroll	Process Payroll	1
132	3	113	payroll_run.monthly_payroll.payroll_review	Payroll Review	2
133	3	113	payroll_run.monthly_payroll.lock_publish	Lock & Publish	3
134	3	116	salary.salary_structure.components	Salary Components	1
135	3	116	salary.salary_structure.templates	Structure Templates	2
201	5	\N	dashboard	Dashboard	1
202	5	\N	jobs	Jobs	2
203	5	\N	candidates	Candidates	3
204	5	\N	interviews	Interviews	4
205	5	\N	offers	Offers	5
206	5	\N	configuration	Configuration	6
211	5	201	dashboard.hiring_overview	Hiring Overview	1
212	5	201	dashboard.pipeline_analytics	Pipeline Analytics	2
213	5	202	jobs.job_requisitions	Job Requisitions	1
214	5	202	jobs.job_openings	Job Openings	2
215	5	202	jobs.job_board	Job Board	3
216	5	203	candidates.candidate_list	Candidate List	1
217	5	203	candidates.talent_pool	Talent Pool	2
218	5	203	candidates.referrals	Referrals	3
219	5	204	interviews.interview_schedule	Interview Schedule	1
220	5	204	interviews.feedback	Feedback	2
221	5	205	offers.offer_letters	Offer Letters	1
222	5	205	offers.offer_approvals	Offer Approvals	2
223	5	206	configuration.hiring_stages	Hiring Stages	1
224	5	206	configuration.email_templates	Email Templates	2
225	5	206	configuration.interview_panels	Interview Panels	3
231	5	213	jobs.job_requisitions.requisition_list	Requisition List	1
232	5	213	jobs.job_requisitions.approvals	Approvals	2
233	5	220	interviews.feedback.scorecards	Scorecards	1
234	5	220	interviews.feedback.panel_feedback	Panel Feedback	2
301	6	\N	dashboard	Dashboard	1
302	6	\N	goals	Goals	2
303	6	\N	reviews	Reviews	3
304	6	\N	feedback	Feedback	4
305	6	\N	reports	Reports	5
306	6	\N	configuration	Configuration	6
311	6	301	dashboard.team_performance	Team Performance	1
312	6	301	dashboard.review_status	Review Status	2
313	6	302	goals.goal_setting	Goal Setting	1
314	6	302	goals.goal_tracking	Goal Tracking	2
315	6	302	goals.okrs	OKRs	3
316	6	303	reviews.review_cycles	Review Cycles	1
317	6	303	reviews.self_review	Self Review	2
318	6	303	reviews.manager_review	Manager Review	3
319	6	303	reviews.360_feedback	360° Feedback	4
320	6	304	feedback.continuous_feedback	Continuous Feedback	1
321	6	304	feedback.one_on_ones	One-on-Ones	2
322	6	305	reports.ratings_distribution	Ratings Distribution	1
323	6	305	reports.goal_achievement	Goal Achievement	2
324	6	306	configuration.rating_scales	Rating Scales	1
325	6	306	configuration.competencies	Competencies	2
326	6	306	configuration.review_templates	Review Templates	3
331	6	313	goals.goal_setting.individual_goals	Individual Goals	1
332	6	313	goals.goal_setting.team_goals	Team Goals	2
333	6	316	reviews.review_cycles.active_cycles	Active Cycles	1
334	6	316	reviews.review_cycles.past_cycles	Past Cycles	2
\.


--
-- Data for Name: app_modules; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_modules (app_id, code, name, is_self_service, sort_order, tab_name) FROM stdin;
4	mobile	Mobile	t	4	Mobile
6	performance	Performance	f	6	Performance
7	trip	Trip	f	7	Trip
1	hr	HR	f	1	Admin
2	employee	Employee	t	2	ESS
3	payroll	Payroll	f	3	Payroll
5	recruit	Recruit	f	5	ATS
\.


--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.banks (id, name, short_name, ifsc_prefix, bank_type, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
9d2431fb-4b1c-473b-ac7f-b74961697ad7	State Bank of India	SBI	SBIN	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
74781e9d-7c75-40e0-acde-4247cbc7bf2b	Punjab National Bank	PNB	PUNB	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
57f606ab-dade-4a4f-aada-48662d6b99ec	Bank of Baroda	BoB	BARB	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
257a6431-126b-48ad-a95d-a2727591e01e	Canara Bank	Canara	CNRB	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
2c6067ab-731f-49fb-92d5-38006bdd5616	Union Bank of India	UBI	UBIN	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
33ee7800-81fb-4065-a8e9-5f32ba8c6cc0	Bank of India	BOI	BKID	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
365ff1ee-c608-4b58-8a96-fa80928a9d9c	Indian Bank	\N	IDIB	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
387dba40-4500-492c-bef5-aec53d6f2fe0	Indian Overseas Bank	IOB	IOBA	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
7c916d2a-04e6-4a87-99fe-1a675fe5a7d0	UCO Bank	UCO	UCBA	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
fa491e79-65d1-4c52-af8d-e093686f6913	Bank of Maharashtra	BoM	MAHB	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
5e1b7f11-21a3-403d-8705-4d9507eb6fe1	Punjab & Sind Bank	PSB	PSIB	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
dabc74b4-00da-497e-a62b-5b788e2cc9a0	Central Bank of India	CBI	CBIN	PUBLIC_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
ddfed198-9969-4bc1-8cdc-527c006d1469	HDFC Bank	HDFC	HDFC	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
0235d86d-6b38-4adc-be50-6f490b70e8cd	ICICI Bank	ICICI	ICIC	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
962c5733-4ec7-4995-9927-5909636ad87f	Axis Bank	Axis	UTIB	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
91a6aaef-91d6-47aa-86e2-2633b1cb9786	Kotak Mahindra Bank	Kotak	KKBK	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
cbe56699-b2a5-48fe-b0cd-6ca23500ec1a	IndusInd Bank	IndusInd	INDB	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
47d53a83-93da-4031-b77f-bb137d1d3a14	Yes Bank	Yes	YESB	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
822ed3c3-de52-4605-b93a-2690b0389608	IDFC FIRST Bank	IDFC First	IDFB	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
f0dfac34-2c60-428d-a94c-bab3461ec48a	IDBI Bank	IDBI	IBKL	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
3e2af077-e501-49e2-b6c8-986ea660fd92	Federal Bank	Federal	FDRL	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
24cf3f9f-16c6-4098-b3c9-8e64e723b3ff	Bandhan Bank	Bandhan	BDBL	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
8a451bae-eb74-4a4e-abc9-6a1ce0384c08	RBL Bank	RBL	RATN	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
86dcf1ed-8f7a-4033-a690-fda6edb84b69	Karnataka Bank	KBL	KARB	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
ce81f36c-df24-42da-a53f-35cb117cfbda	South Indian Bank	SIB	SIBL	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
495cd892-cde9-494d-aa7d-6256d67dc6c4	Karur Vysya Bank	KVB	KVBL	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
7f11191e-455d-438b-8625-353575188abc	City Union Bank	CUB	CIUB	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
ce34fbe5-ea01-4e55-98e5-3f923ef10656	Tamilnad Mercantile Bank	TMB	TMBL	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
aed22054-fa42-436c-9e37-0333a496ba26	Jammu & Kashmir Bank	J&K Bank	JAKA	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
157857e0-2af8-41c5-b027-012ae59c36d5	DCB Bank	DCB	DCBL	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
4b65bb79-cedb-4cec-bc73-c8d1b3e634d6	CSB Bank	CSB	CSBK	PRIVATE_SECTOR	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
c2dde804-4a41-4ab8-ad71-6e07e5ebfa4c	AU Small Finance Bank	AU SFB	AUBL	SMALL_FINANCE	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
2acdb9bd-b78d-4ea6-9902-018dc47ef75f	Equitas Small Finance Bank	Equitas	ESFB	SMALL_FINANCE	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
6c56f978-871c-4706-8291-f4d5c364c60b	Ujjivan Small Finance Bank	Ujjivan	UJVN	SMALL_FINANCE	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
cb4e55bb-0633-44c2-b885-585a1d3b5620	Airtel Payments Bank	Airtel PB	AIRP	PAYMENTS	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
16429073-5003-45c1-84c7-b10899a2be40	India Post Payments Bank	IPPB	IPOS	PAYMENTS	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
7cacd5fe-e56a-4bb2-b17c-66b9befd881a	Citibank	Citi	CITI	FOREIGN	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
68dc57a2-5d6f-4aa8-b2c8-1889ae19aecd	HSBC Bank	HSBC	HSBC	FOREIGN	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
05515b5e-b5ae-4cc3-a5d5-e849a883ead4	Standard Chartered Bank	StanChart	SCBL	FOREIGN	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
57836f8c-1463-49ac-9d02-dc7b7d682e1a	DBS Bank India	DBS	DBSS	FOREIGN	t	system	\N	2026-10-16 12:40:58.46043+00	2026-10-16 12:40:58.46043+00	\N
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.branches (id, organization_id, name, code, address_line1, address_line2, city, pincode, country_id, state_id, timezone, phone, email, is_head_office, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
e7c39302-304c-45da-8776-a79a3e34fd52	9edca853-7860-4925-b81b-1206dc4298cb	Ahmedabad Head Office	AMD-HO	Replace with the head office address	\N	Ahmedabad	380001	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	Asia/Kolkata	\N	\N	t	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
0a457316-1ba0-4600-98d3-4cbdc40e6633	9edca853-7860-4925-b81b-1206dc4298cb	Mumbai Branch	MUM	Replace with the branch address	\N	Mumbai	400001	36f48ce3-7186-41e6-8ce3-3955ca089920	558d4843-16cd-4090-ad3f-dd40e586f527	Asia/Kolkata	\N	\N	f	f	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
8f68ae54-f9f5-4a39-9c0a-48dfa4f19cd0	9edca853-7860-4925-b81b-1206dc4298cb	Ahmedabad	AMD	Replace with the branch address	\N	Ahmedabad	380001	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	Asia/Kolkata	\N	\N	f	t	system	\N	2026-11-02 12:00:35.302611+00	2026-11-02 12:00:35.302611+00	\N
7f0f640a-601b-4bdc-bdb9-113f8ddaf07d	9edca853-7860-4925-b81b-1206dc4298cb	Ahmedabad Corporate Office	AMD-CO	Replace with the branch address	\N	Ahmedabad	380001	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	Asia/Kolkata	\N	\N	f	t	system	\N	2026-11-02 12:00:35.302611+00	2026-11-02 12:00:35.302611+00	\N
d9836386-244b-44d1-86dc-a3cfc41df881	9edca853-7860-4925-b81b-1206dc4298cb	Ahmedabad Iskcon Hub	AMD-ISKCON	Replace with the branch address	\N	Ahmedabad	380015	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	Asia/Kolkata	\N	\N	f	t	system	\N	2026-11-02 12:00:35.302611+00	2026-11-02 12:00:35.302611+00	\N
36a10564-f687-4a33-b887-95d12dea53ad	9edca853-7860-4925-b81b-1206dc4298cb	Surat SMF Hub	SUR-SMF	Replace with the branch address	\N	Surat	395003	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	Asia/Kolkata	\N	\N	f	t	system	\N	2026-11-02 12:00:35.302611+00	2026-11-02 12:00:35.302611+00	\N
2248f66d-78a4-4cf1-88e2-360dea115908	9edca853-7860-4925-b81b-1206dc4298cb	Gurgaon	GGN	Replace with the branch address	\N	Gurgaon	122001	36f48ce3-7186-41e6-8ce3-3955ca089920	0a5f8a69-5635-4dae-9c26-b02703536483	Asia/Kolkata	\N	\N	f	t	system	\N	2026-11-02 12:00:35.302611+00	2026-11-02 12:00:35.302611+00	\N
5fcce0b6-6bce-496d-a21c-4c1477d89407	9edca853-7860-4925-b81b-1206dc4298cb	Hyderabad	HYD	Replace with the branch address	\N	Hyderabad	500001	36f48ce3-7186-41e6-8ce3-3955ca089920	3b3c6785-7dae-4d34-a617-9a088201c402	Asia/Kolkata	\N	\N	f	t	system	\N	2026-11-02 12:00:35.302611+00	2026-11-02 12:00:35.302611+00	\N
eed659f6-16b8-4e06-af30-22e7b73ad788	9edca853-7860-4925-b81b-1206dc4298cb	Mehsana Hub	MSN-HUB	Replace with the branch address	\N	Mehsana	384001	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	Asia/Kolkata	\N	\N	f	t	system	\N	2026-11-02 12:00:35.302611+00	2026-11-02 12:00:35.302611+00	\N
d03409a9-e719-4d0e-a2ca-47c789312c17	9edca853-7860-4925-b81b-1206dc4298cb	Pune	PUN	Replace with the branch address	\N	Pune	411001	36f48ce3-7186-41e6-8ce3-3955ca089920	558d4843-16cd-4090-ad3f-dd40e586f527	Asia/Kolkata	\N	\N	f	t	system	\N	2026-11-02 12:00:35.302611+00	2026-11-02 12:00:35.302611+00	\N
d43c35fc-560f-4c0a-af84-9c9529c74990	9edca853-7860-4925-b81b-1206dc4298cb	Panipat Mini Hub	PNP-MINI	Replace with the branch address	\N	Panipat	132103	36f48ce3-7186-41e6-8ce3-3955ca089920	0a5f8a69-5635-4dae-9c26-b02703536483	Asia/Kolkata	\N	\N	f	t	system	\N	2026-11-02 12:00:35.302611+00	2026-11-02 12:00:35.302611+00	\N
\.


--
-- Data for Name: candidate_portal_links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.candidate_portal_links (id, organization_id, candidate_id, stage_id, purpose, token_hash, sent_to, expires_at, revoked_at, last_opened_at, open_count, created_by, created_at, submitted_at) FROM stdin;
\.


--
-- Data for Name: candidates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.candidates (id, organization_id, name, email, mobile_number, address, reporting_manager_id, designation_id, department_id, branch_id, entity_id, gender_id, age, joining_date, annual_salary, salary_structure_id, created_at, created_by, updated_at, updated_by, deleted_at, workflow_id, current_stage_id, stage_status, stage_entered_at, status, status_reason, status_changed_by, status_changed_at, version, user_id, joinee_form_draft, joinee_form_draft_saved_at) FROM stdin;
0e9e6a42-33e2-4b9f-b738-14d3d37454a8	9edca853-7860-4925-b81b-1206dc4298cb	Aarav Mehta	aarav.mehta@example.com	9812300001	12, Shivalik Residency, Satellite, Ahmedabad, Gujarat 380015	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	62d8b051-021e-4001-b9bd-bbe7a776c9b0	cf59bdc6-9902-4bea-98af-d86a639976c8	e7c39302-304c-45da-8776-a79a3e34fd52	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	5de2012f-ee4a-4e38-81ba-2843c416a897	24	2026-12-01	650000.00	953427d5-aa2d-4041-aa3b-f4b9bfaec234	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
58548d3b-dc38-4c83-938f-db38ccd0a7ed	9edca853-7860-4925-b81b-1206dc4298cb	Roshni Thakor	roshni.thakor@shreemaruti.com	9800000001	27, Baner Road, Pune, Maharashtra 411045	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	4e3ea68b-7ad4-4035-847a-a9e91270c01b	cf59bdc6-9902-4bea-98af-d86a639976c8	d03409a9-e719-4d0e-a2ca-47c789312c17	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	32debd63-4a95-4f42-911c-1e134b78c3bb	28	2027-03-01	1200000.00	\N	2026-11-04 10:33:20.121364+00	roshni.thakor@shreemaruti.com	2026-11-04 10:36:17.98032+00	roshni.thakor@shreemaruti.com	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	b4567999-d1de-406c-aacc-b5ec6bec41da	pending	2026-11-04 10:36:17.993+00	active	\N	\N	\N	3	\N	\N	\N
d0996a72-0660-44db-89c1-718af0cac1f4	9edca853-7860-4925-b81b-1206dc4298cb	Diya Shah	diya.shah@example.com	9812300002	7B, Navrangpura Society, Ahmedabad, Gujarat 380009	99415aeb-b341-414a-8828-67eea46d98d1	80b0d847-a568-41d1-88db-1e5833a4a918	c96c2707-dd48-4d61-bf49-6870918d7e5e	7f0f640a-601b-4bdc-bdb9-113f8ddaf07d	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	26	2026-12-07	420000.00	116085a5-f43f-486b-aef6-b08ff2cebf9f	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
7a1477cb-3221-4208-9251-8f4638504988	9edca853-7860-4925-b81b-1206dc4298cb	Kabir Singh	kabir.singh@example.com	9812300003	Flat 304, Sector 45, Gurgaon, Haryana 122003	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	d84599a4-fc16-4c0d-a767-93e665a478f2	dcd9c3a4-3575-4be3-be30-37084c95c27e	2248f66d-78a4-4cf1-88e2-360dea115908	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	5de2012f-ee4a-4e38-81ba-2843c416a897	35	2026-12-15	1350000.00	d8ad10f1-426f-4233-b066-4fa60fd38650	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
4f9c9d40-e6c6-445f-911b-87397807eca9	9edca853-7860-4925-b81b-1206dc4298cb	Neel Trivedi	neel.trivedi@example.com	\N	\N	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	368db79c-da4f-4c34-8cb9-327f7e66ed0f	82fc603e-d02f-46d1-9089-d14e68ee5c21	8f68ae54-f9f5-4a39-9c0a-48dfa4f19cd0	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	d99c0d14-128f-4466-ac0b-09342149bc5e	45	2027-02-15	2800000.00	399ce63b-14f8-46ee-9777-1b0af68f9cfb	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
9741dc32-1481-450c-a7b2-a2988f77bb33	9edca853-7860-4925-b81b-1206dc4298cb	Ananya Reddy	ananya.reddy@example.com	9812300004	Plot 22, Jubilee Hills, Hyderabad, Telangana 500033	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	c8257aea-e14e-415f-9f4e-6f7181dc376c	cf59bdc6-9902-4bea-98af-d86a639976c8	5fcce0b6-6bce-496d-a21c-4c1477d89407	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	29	2027-01-04	1600000.00	8516194d-0bc6-4fdf-9ac0-fd46fccc8d59	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
7fe2bbe8-55d3-40ab-8177-92b04e616ab0	9edca853-7860-4925-b81b-1206dc4298cb	Rohan Desai	rohan.desai@example.com	9812300005	18, Adajan Patiya, Surat, Gujarat 395009	\N	e192830a-64f3-42ca-9ada-e827329e2a9a	dcd9c3a4-3575-4be3-be30-37084c95c27e	36a10564-f687-4a33-b887-95d12dea53ad	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	5de2012f-ee4a-4e38-81ba-2843c416a897	22	2026-12-10	300000.00	106a0663-e20b-4fab-a07f-a80c20fc8c48	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
caf58d25-9d52-4ca1-9f2b-7e53b8e02633	9edca853-7860-4925-b81b-1206dc4298cb	Ishita Joshi	ishita.joshi@example.com	9812300006	B-502, Kothrud, Pune, Maharashtra 411038	da8f6a78-2d00-42f7-b08e-c0c149678c0d	c775d5b8-b354-4d2e-b4d5-942e4b30fcbb	4d7195c5-dd4e-492b-ac78-a989ab30fdab	d03409a9-e719-4d0e-a2ca-47c789312c17	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	27	2027-01-11	540000.00	fe6ccf3c-250b-4fbb-81cb-4bde1c369300	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
3b4e1a5a-ba84-4f08-87be-6bb2cf29d1e8	9edca853-7860-4925-b81b-1206dc4298cb	Vivaan Patel	vivaan.patel@example.com	9812300007	3, Radhe Bungalows, Mehsana, Gujarat 384002	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	230567b2-e408-4cce-82b8-3c62c46216f6	1a68db86-2ab5-4d44-806b-810ac4315d88	eed659f6-16b8-4e06-af30-22e7b73ad788	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	5de2012f-ee4a-4e38-81ba-2843c416a897	25	2026-12-21	380000.00	116085a5-f43f-486b-aef6-b08ff2cebf9f	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
14aba31d-01a9-4892-b733-21bfb634b1e2	9edca853-7860-4925-b81b-1206dc4298cb	Meera Nair	meera.nair@example.com	9812300008	9th Floor, Prahlad Nagar, Ahmedabad, Gujarat 380015	99415aeb-b341-414a-8828-67eea46d98d1	5e6e4c98-cf19-4d79-8c17-049156292f9d	c96c2707-dd48-4d61-bf49-6870918d7e5e	e7c39302-304c-45da-8776-a79a3e34fd52	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	34	2027-01-18	1250000.00	1a85676e-1832-4870-b804-6415b0184374	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
1e96b728-17d0-4942-82f6-aa5c50efb202	9edca853-7860-4925-b81b-1206dc4298cb	Arjun Malik	arjun.malik@example.com	9812300009	House 41, Model Town, Panipat, Haryana 132103	\N	85a54d26-df1c-45d8-9ef4-5509ea8dbaf9	1a68db86-2ab5-4d44-806b-810ac4315d88	d43c35fc-560f-4c0a-af84-9c9529c74990	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	5de2012f-ee4a-4e38-81ba-2843c416a897	31	2027-02-01	560000.00	953427d5-aa2d-4041-aa3b-f4b9bfaec234	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
06464fa3-e16d-4a77-b3f1-d6c371052bc0	9edca853-7860-4925-b81b-1206dc4298cb	Tara Iyer	tara.iyer@example.com	9812300012	27, Baner Road, Pune, Maharashtra 411045	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	4e3ea68b-7ad4-4035-847a-a9e91270c01b	cf59bdc6-9902-4bea-98af-d86a639976c8	d03409a9-e719-4d0e-a2ca-47c789312c17	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	32debd63-4a95-4f42-911c-1e134b78c3bb	32	2027-03-01	1450000.00	\N	2026-11-03 04:35:07.252227+00	seed	2026-11-04 07:43:10.085916+00	harsh.shah@shreemaruti.com	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	0817a8f7-5c4d-4989-b065-6335a0a024d7	submitted	2026-11-03 11:38:51.329+00	active	\N	harsh.shah@shreemaruti.com	2026-11-03 09:51:42.691+00	11	\N	\N	\N
fc5ad563-eac6-41ec-b622-40453e808e06	9edca853-7860-4925-b81b-1206dc4298cb	Sara Khan	sara.khan@example.com	9812300010	15, Iskcon Cross Road, Ahmedabad, Gujarat 380015	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	a9ca7089-2883-4a56-9388-2927a3b5ca73	cf59bdc6-9902-4bea-98af-d86a639976c8	d9836386-244b-44d1-86dc-a3cfc41df881	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	21	2026-12-02	180000.00	106a0663-e20b-4fab-a07f-a80c20fc8c48	2026-11-03 04:35:07.252227+00	seed	2026-11-03 04:35:07.252227+00	seed	\N	ee54ba04-ecd4-4bfa-8837-57a3168de77a	24f41013-0ce3-412d-8d05-05f71664e8d7	pending	2026-11-03 04:35:07.252227+00	active	\N	\N	\N	1	\N	\N	\N
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cities (id, state_id, name, is_metro, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
4c2af144-c117-4f10-bbe1-d59bbb26957b	0ca399ec-c575-4493-a2e3-d0be7028f79a	Delhi	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
c6840d17-b5f7-45a8-badc-4ce135fc96a3	0ca399ec-c575-4493-a2e3-d0be7028f79a	New Delhi	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
e2928f5a-f869-446c-8287-0b01b8e4f2a8	558d4843-16cd-4090-ad3f-dd40e586f527	Mumbai	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
bc1f5713-ae33-4d18-9a93-bac6c63067f1	558d4843-16cd-4090-ad3f-dd40e586f527	Pune	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
74d5bf6c-de4f-44d9-8d8c-92f9eaf7b5c6	558d4843-16cd-4090-ad3f-dd40e586f527	Nagpur	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
a9891f83-85f8-447a-890e-118c4db67ddd	558d4843-16cd-4090-ad3f-dd40e586f527	Nashik	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
8099ac13-0630-4dab-94ec-46f64a4a36c0	9a457391-9668-4be2-b650-be63b35a9df5	Bengaluru	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
b401b466-56af-4aba-8839-23092ab364b5	9a457391-9668-4be2-b650-be63b35a9df5	Mysuru	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
9a4c5c4a-5c45-40a4-8bb3-79982e4fbd85	553a840e-989a-4324-832b-156c77b28785	Chennai	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
a8b5a60f-32a5-496a-a94b-ba0d0000442f	553a840e-989a-4324-832b-156c77b28785	Coimbatore	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
ea014812-77f2-48c2-8d64-6081a71bbe1d	3b3c6785-7dae-4d34-a617-9a088201c402	Hyderabad	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
602aa26b-7b15-4d08-93f7-481eb2e604dc	379dc055-d9a8-4a02-b87b-c8e80685d42f	Kolkata	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e	29666eaf-98f5-4308-b219-99661b7a903a	Ahmedabad	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
0d7146bd-926d-4315-894f-3288d318a695	29666eaf-98f5-4308-b219-99661b7a903a	Surat	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
d4453faa-eb40-4976-acfc-df99c92857dd	29666eaf-98f5-4308-b219-99661b7a903a	Vadodara	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
4f1d09c4-5b43-473f-b9b0-5ff4d8a79d7c	29666eaf-98f5-4308-b219-99661b7a903a	Rajkot	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
5772e8b7-2ed0-42b7-970d-8409df918a30	29666eaf-98f5-4308-b219-99661b7a903a	Gandhinagar	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
710a59fc-6ebd-4161-ba1b-784e8a6b96a7	14ab5880-5857-498b-93d3-4e79c653c096	Jaipur	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
82503f53-8ba5-4f07-971c-60db9b0a0b33	14ab5880-5857-498b-93d3-4e79c653c096	Jodhpur	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
f82c7c84-d6dd-4805-b986-a13b5f1c417c	14ab5880-5857-498b-93d3-4e79c653c096	Bikaner	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
47ca55c8-67e9-4657-8014-08a889caeb01	14ab5880-5857-498b-93d3-4e79c653c096	Udaipur	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
203b600a-9c26-48fb-890e-9a62a059ae09	14ab5880-5857-498b-93d3-4e79c653c096	Kota	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
6de98f02-03a5-4671-af0e-930d3110bbac	14ab5880-5857-498b-93d3-4e79c653c096	Ajmer	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
a6e4b809-cbd6-4760-99bb-7da81b216788	d16fc974-0bfd-47fa-93c7-d5b564665192	Lucknow	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
2743e2aa-a32f-4345-a3ab-45fe206a796a	d16fc974-0bfd-47fa-93c7-d5b564665192	Kanpur	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
7e10e6b4-dd49-412f-8869-da8010ffb096	d16fc974-0bfd-47fa-93c7-d5b564665192	Noida	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
e97c4dad-9763-4ad1-bedf-8379d6d87a5e	d16fc974-0bfd-47fa-93c7-d5b564665192	Varanasi	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
18781fe5-01a0-4a98-ba41-d1856b479c39	d16fc974-0bfd-47fa-93c7-d5b564665192	Agra	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
78a577ee-96a9-426c-be18-80e5604dac98	eae5166b-f0fc-4f74-b885-93a264240bea	Bhopal	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
198cbd75-7700-44a9-8858-b2183a8ded8b	eae5166b-f0fc-4f74-b885-93a264240bea	Indore	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
592e5f84-e754-4934-b5a1-df1f50719f27	bda891bc-fd92-4e1d-98be-ed334dc833d2	Patna	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
799e5a41-3a9d-4546-a07c-1a6607e270bf	cebfb24e-3b2d-499b-b150-b5aab2350dfc	Bhubaneswar	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
99114a7c-ba8c-4e52-9d93-dfca3299dc6b	8bb38587-5e9e-4ab8-a2d2-43277ddd7b72	Ludhiana	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
1a1af088-ab5e-4799-a721-6ef9e03487d9	8bb38587-5e9e-4ab8-a2d2-43277ddd7b72	Amritsar	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
d65b152e-b82c-4bff-928c-4e40184f7d68	1b74a652-5d5f-4cfa-a82f-a9bb03048ace	Chandigarh	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
bdf27f79-26f1-4514-a781-ed3132946be5	0a5f8a69-5635-4dae-9c26-b02703536483	Gurugram	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
b6da4f79-71b7-4b8a-9c24-01d41ede8377	0a5f8a69-5635-4dae-9c26-b02703536483	Faridabad	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
f7abc7ea-4d09-4089-bc8d-afbbc87cd500	2fcccd3a-7af1-4791-82e7-2530527c2eff	Kochi	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
27c1d848-a524-42fc-8210-3789539e21da	2fcccd3a-7af1-4791-82e7-2530527c2eff	Thiruvananthapuram	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
dff7905a-d296-4282-a4f3-52c44bde1f72	a016ef78-f7e2-401c-af38-5dbce51af908	Visakhapatnam	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
ab55a699-8d73-4305-9be5-3f37d2c6a1de	a016ef78-f7e2-401c-af38-5dbce51af908	Vijayawada	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
4e70780d-9b3c-45ae-a712-dc64ad26cee8	8689ada1-dc55-41ba-9018-2670fbbcc264	Guwahati	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
62b9e910-8e66-49b4-bfd5-70e8d0bff9a8	63ee4638-1c08-4612-98c7-18afd544e18a	Ranchi	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
a1a37eae-7c85-4cad-975c-f809f318154e	620d503d-d0bc-4c15-95a0-42a2564ec600	Raipur	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
663022f2-3b3e-4a14-97c2-e6bf48dfbc0a	22a6495e-44c0-4481-af34-ab0bcf905e54	Dehradun	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
fa90d925-9954-44f7-bd92-f0cbadee5df2	a319e2d9-f599-4d36-a596-dc98937de90c	Shimla	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
e426aabe-b045-4d45-bf7d-c4dd0d887a08	c67f05c2-a9a4-475d-886c-3d9ddd28b79e	Panaji	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
fe2221bb-cd3d-4f78-b0fb-624817dd694d	5889aca9-0544-4381-9131-5169c75b4125	Srinagar	f	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.countries (id, name, iso_code_2, iso_code_3, phone_code, currency_code, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
fc095272-dd27-4f60-9658-1fc5ce2b036c	Bangladesh	BD	BGD	+880	BDT	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
4a5ff83f-3a5e-4f8a-ab09-af34ed50c5a2	Barbados	BB	BRB	+1	BBD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
644fb21c-8a56-4e0a-b9fd-16b9ad5f63e7	Belarus	BY	BLR	+375	BYN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
83045442-3317-4f01-85e8-30b8e4bf4db7	Belgium	BE	BEL	+32	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f65b6c76-e57c-496b-b29d-a8f63e2d48be	Belize	BZ	BLZ	+501	BZD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
fc448de3-7fc8-47b0-bebd-b202778cbfa9	Benin	BJ	BEN	+229	XOF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d66fa241-e022-4d33-96e9-5327261fd407	Bermuda	BM	BMU	+1	BMD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
3be7c312-b7e6-4fff-b314-9f28b6e5abc8	Bhutan	BT	BTN	+975	BTN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
840966fd-3efd-4565-b5c2-bf7c799897ef	Afghanistan	AF	AFG	+93	AFN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
8d8406f6-bddc-4292-8b92-6da8e8244830	Åland Islands	AX	ALA	+358	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
00abbd83-d30a-4492-83a9-50e70c298b3c	Albania	AL	ALB	+355	ALL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e8702b7c-29a3-4748-b1f0-c2f7efb94dc4	Algeria	DZ	DZA	+213	DZD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
948d4d6c-8a35-4536-9d9c-2efcf940bb18	American Samoa	AS	ASM	+1	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
5e1c77bd-b2b5-4c29-862b-60777eed43d9	Andorra	AD	AND	+376	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d1eaace0-2fe0-4911-b991-eee03b88220d	Angola	AO	AGO	+244	AOA	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e949d12e-e9ca-449b-8d68-5b3670880f8b	Anguilla	AI	AIA	+1	XCD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
521a5c24-7c97-4369-af27-603e69dc5d9f	Antarctica	AQ	ATA	+672	\N	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
245c2c19-dc8b-49d6-a51a-f098282080f9	Antigua and Barbuda	AG	ATG	+1	XCD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
8ca1c170-5c9b-4f90-be9c-e33d7a51262e	Argentina	AR	ARG	+54	ARS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
eaa33a69-1b08-4c05-9c1a-5b6549cee005	Armenia	AM	ARM	+374	AMD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
61dc85a0-2d43-453f-98a0-6150d71318d2	Aruba	AW	ABW	+297	AWG	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
76a05103-04f7-40da-986c-7fd8de56bb26	Australia	AU	AUS	+61	AUD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
850c70f2-1531-40e4-8573-13c9b8d8dbda	Austria	AT	AUT	+43	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
07e8e8c7-34ee-4216-9a4e-1c298228bbb5	Azerbaijan	AZ	AZE	+994	AZN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
19b01178-5cb8-4c80-bc38-a9a3673558bd	Bahamas	BS	BHS	+1	BSD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
97b6043c-5d4b-40f7-b13a-0c9dc5bd29e3	Bahrain	BH	BHR	+973	BHD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d289d2ca-b749-474c-afff-bc35fac3f5d1	Bolivia	BO	BOL	+591	BOB	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
bda4ac7a-59dc-45b0-99c5-53c0fce11542	Bonaire, Sint Eustatius and Saba	BQ	BES	+599	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f78be81e-e057-4e2c-a556-91ca00655fe1	Bosnia and Herzegovina	BA	BIH	+387	BAM	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7ee080ae-2ecd-4aef-bea8-2e12eddeeec1	Botswana	BW	BWA	+267	BWP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
5670a76e-169f-40aa-876d-58dce165a7eb	Bouvet Island	BV	BVT	\N	NOK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f45d23ae-622a-42dd-8379-a43369c4cf4e	Brazil	BR	BRA	+55	BRL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
aaace0ed-f017-4fc3-88e1-bf23cfe3849e	British Indian Ocean Territory	IO	IOT	+246	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b1e89fee-b8ab-4224-b05a-eb736dfab163	British Virgin Islands	VG	VGB	+1	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
c7450b7c-3368-48c7-97eb-a698070eb803	Brunei	BN	BRN	+673	BND	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
bb32aee7-5e7a-4648-b7de-fa06b917f805	Bulgaria	BG	BGR	+359	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
89a48138-1d32-4f40-a3cd-119bf1f1ac28	Burkina Faso	BF	BFA	+226	XOF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
35d0ab8f-5608-46f1-a09d-527d4fbe58fb	Burundi	BI	BDI	+257	BIF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
2b312a23-b8a9-4e50-9f45-13d57571a458	Cabo Verde	CV	CPV	+238	CVE	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
17eeee05-c0cf-4252-a722-903013b55aa8	Cambodia	KH	KHM	+855	KHR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
da6b74a2-63ac-4629-8dca-aad2b911d5bc	Cameroon	CM	CMR	+237	XAF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e85988a7-cc0b-4d96-8e07-8c13666d2aea	Canada	CA	CAN	+1	CAD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
8924b21f-db56-44c4-b8f3-04ab4b4a2376	Cayman Islands	KY	CYM	+1	KYD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7e2fa8dc-213a-4979-a915-1eaa05a7b6d2	Central African Republic	CF	CAF	+236	XAF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
c7f35fc3-c633-4e81-b844-2a65a1fa2f5d	Chad	TD	TCD	+235	XAF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d6d51ac1-381e-42ca-b3c0-15728a78095d	Chile	CL	CHL	+56	CLP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
267af1c6-66b7-4e40-bd37-ea55b7db8d0f	China	CN	CHN	+86	CNY	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e25b0b4f-bbf2-48fd-873b-9ef6fc04f34d	Christmas Island	CX	CXR	+61	AUD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b2e217df-df50-4eeb-baad-300e4914efe3	Cocos (Keeling) Islands	CC	CCK	+61	AUD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
a323fb32-781b-4417-90d8-9490dd4ded92	Colombia	CO	COL	+57	COP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
013946cb-e839-4dac-a2a0-ddfa0d6906f3	Comoros	KM	COM	+269	KMF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f9261744-38bf-4fbf-b1f8-9a0e79394989	Congo	CG	COG	+242	XAF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f42407c8-bc34-4d04-8685-a11060910a05	Cook Islands	CK	COK	+682	NZD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
6c98815d-7d93-4737-b97c-ab4d11091c41	Costa Rica	CR	CRI	+506	CRC	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e26ceb1f-b894-4484-a504-90d6e195f9b4	Côte d'Ivoire	CI	CIV	+225	XOF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
ac356bd3-9cb2-40f3-9f82-0f50ca64450a	Croatia	HR	HRV	+385	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9e3d919c-fcd6-44f7-bfbf-494cf8a9a272	Cuba	CU	CUB	+53	CUP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d460c835-0757-43d9-9dbd-72e035e760d1	Curaçao	CW	CUW	+599	XCG	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
90f5443c-4b80-49d3-aeda-7e6b6088ca79	Cyprus	CY	CYP	+357	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e65b3322-2a9c-4fa4-90be-558a70397640	Czechia	CZ	CZE	+420	CZK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7384e340-cab2-4ae6-a4eb-77ab53a116b8	Democratic Republic of the Congo	CD	COD	+243	CDF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
0c8f56c1-359c-412f-b836-98682aca7816	Denmark	DK	DNK	+45	DKK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
07f1e844-8739-434d-8c1f-22ae14ad1066	Djibouti	DJ	DJI	+253	DJF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
1ce52617-f434-4c75-8019-529eda604da9	Dominica	DM	DMA	+1	XCD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
a52fdf67-a599-4ec8-b8df-6bfec3eee74a	Dominican Republic	DO	DOM	+1	DOP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
c79f7cc5-1fcd-455c-b0a5-c9589a8e2fbd	Ecuador	EC	ECU	+593	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
034eb453-67ea-48bf-9a9e-d79d79bb8863	Egypt	EG	EGY	+20	EGP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7dbcec76-eb19-4184-9f5a-34e1157ea5f0	El Salvador	SV	SLV	+503	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
63b3a179-4d09-4cf7-9433-eb1d4326fcb7	Equatorial Guinea	GQ	GNQ	+240	XAF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7c0e201e-1d85-4a4f-bcc8-2d9f7af1f25b	Eritrea	ER	ERI	+291	ERN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
18712a41-1845-4f30-9cf8-70ae0bfafebe	Estonia	EE	EST	+372	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
da3492e0-f7f3-4b2d-86ae-919afa580b54	Eswatini	SZ	SWZ	+268	SZL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
26e56054-7fd9-4a3b-b6b3-d89e5962728f	Ethiopia	ET	ETH	+251	ETB	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
2fddb741-96f4-4f67-89bc-975cb7e9e5af	Falkland Islands	FK	FLK	+500	FKP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
5893c46d-4b35-4bd4-8e98-d88b0003b384	Faroe Islands	FO	FRO	+298	DKK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
eb5ddf65-294f-4f60-8268-a98b9b26d857	Fiji	FJ	FJI	+679	FJD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
a6454d07-91e6-4841-b139-e9adc388ef4c	Finland	FI	FIN	+358	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e3574dc5-810a-4aaf-8b30-92527f738a1c	France	FR	FRA	+33	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
3815ddfd-8897-4a78-8873-b6e7b4f87519	French Guiana	GF	GUF	+594	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
80e5c0a9-f366-4749-84ac-635409e81131	French Polynesia	PF	PYF	+689	XPF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b89b2590-778d-4f18-84ae-86aa7efb647d	French Southern Territories	TF	ATF	\N	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f5c335fc-0959-45cf-a7a5-8869b9e0944c	Gabon	GA	GAB	+241	XAF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
47b98d93-6056-4f23-8aac-6c492e4512a9	Gambia	GM	GMB	+220	GMD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
ebcb7733-f978-4f31-8b52-a2f1ac85f097	Georgia	GE	GEO	+995	GEL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
5d384338-6004-41f0-a8e4-99002d28e6cc	Germany	DE	DEU	+49	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
1346f722-7b5d-4fce-9686-d9bca28d38f7	Ghana	GH	GHA	+233	GHS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
1b546914-3b59-417a-9c6c-1fa24936a1b5	Gibraltar	GI	GIB	+350	GIP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
c622e9b5-5739-4c69-94bd-1345afa47a7f	Greece	GR	GRC	+30	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
12da81c9-e10a-4fd9-a3a6-71392b6996cb	Greenland	GL	GRL	+299	DKK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
de54b74a-a8b0-4cf0-b890-7077cac2b1df	Grenada	GD	GRD	+1	XCD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
8a22bc12-5c11-405e-9557-99f1650c27a5	Guadeloupe	GP	GLP	+590	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
01ea6bda-0c76-4cda-878d-1c63d0b1d2e5	Guam	GU	GUM	+1	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
78a041a8-6364-4d86-88a5-6d231f98e1dc	Guatemala	GT	GTM	+502	GTQ	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b4d21257-0c4e-4819-97ef-8746404c5247	Guernsey	GG	GGY	+44	GBP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
edb21371-71d4-4f9d-9253-1145b6db276a	Guinea	GN	GIN	+224	GNF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b6ae22ad-fac7-4bfd-86f9-9e7f34a2fdcc	Guinea-Bissau	GW	GNB	+245	XOF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
30428991-4e14-4c5a-8f16-a1d0d7560b84	Guyana	GY	GUY	+592	GYD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f491f85e-c48c-40ce-b21f-de8b055ccbbe	Haiti	HT	HTI	+509	HTG	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
87383a36-a389-4a20-95b4-10b0b4301034	Heard Island and McDonald Islands	HM	HMD	\N	AUD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b436d991-41b9-4d2a-a3c1-5e58e373079d	Honduras	HN	HND	+504	HNL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b6350d31-1911-4e2b-ab86-64ae07948008	Hong Kong	HK	HKG	+852	HKD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
75474a34-c292-411f-9d9b-197e60201ca3	Hungary	HU	HUN	+36	HUF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d0736564-f96c-4ccf-a596-2d198c8f3f07	Iceland	IS	ISL	+354	ISK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
36f48ce3-7186-41e6-8ce3-3955ca089920	India	IN	IND	+91	INR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
22302558-c14b-4494-a526-cb45482b53a8	Indonesia	ID	IDN	+62	IDR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
15078f81-5314-4c5b-8dbc-1b183dd09727	Iran	IR	IRN	+98	IRR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f1e4fbee-2ef6-435d-aad4-d46cc8a58e55	Iraq	IQ	IRQ	+964	IQD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f4d4d381-c4e3-459b-811e-2079bd71a513	Ireland	IE	IRL	+353	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
0e339eeb-0de5-4b81-98a4-0e54d0743709	Isle of Man	IM	IMN	+44	GBP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7bbc2a7f-59d8-44ac-b8ee-869c0fdbecf4	Israel	IL	ISR	+972	ILS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
327da9c3-fd6d-45f9-9505-1796e2573199	Italy	IT	ITA	+39	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e261f96b-955f-4d50-b065-593780c78bba	Jamaica	JM	JAM	+1	JMD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
01db97cf-31df-44e7-9a08-69fd12e57665	Japan	JP	JPN	+81	JPY	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
20027f6f-19c0-40f0-ab50-a30910c8351d	Jersey	JE	JEY	+44	GBP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
bf09d0c2-fcbb-437c-a3cd-d37d8b79b454	Jordan	JO	JOR	+962	JOD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
67cffa54-dac8-41fc-b39c-eb664086576d	Kazakhstan	KZ	KAZ	+7	KZT	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
3c2cba0c-08d9-4522-86d2-e99fe664e2b9	Kenya	KE	KEN	+254	KES	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
bca865f1-550f-4981-b518-07899dd37dca	Kiribati	KI	KIR	+686	AUD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
03a6048f-abb0-4ef1-a479-0ccf6b9b567a	Kuwait	KW	KWT	+965	KWD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
6de34db6-42bd-47ca-bdf0-88df0237d723	Kyrgyzstan	KG	KGZ	+996	KGS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f4603954-a75d-4cfe-8cd4-54fe53254ee5	Laos	LA	LAO	+856	LAK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
3b45b145-c43d-4290-98a6-e78994b43280	Latvia	LV	LVA	+371	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7082927e-549c-463f-9f7f-401060ddbf26	Lebanon	LB	LBN	+961	LBP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
2fd61799-f6ab-467e-8e16-87a76c955209	Lesotho	LS	LSO	+266	LSL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
6374bac9-687a-4561-8fb4-8a552c587fb1	Liberia	LR	LBR	+231	LRD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
dc86cea9-a76e-42cf-8bbe-15e321ca9407	Libya	LY	LBY	+218	LYD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
536a50b1-8fa0-4ad0-94b4-8d564faa3869	Liechtenstein	LI	LIE	+423	CHF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
fc8ac195-3da2-48e8-be6e-027dd525f4c5	Lithuania	LT	LTU	+370	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b93057e2-eecb-4d44-a9a0-527391da9f61	Luxembourg	LU	LUX	+352	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f18531a0-d002-4adf-8ee8-7497198f4c67	Macao	MO	MAC	+853	MOP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d31fbea7-1159-4999-94f2-e1ef79525845	Madagascar	MG	MDG	+261	MGA	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
460494f2-f578-4230-9acd-27dba2e1c7b6	Malawi	MW	MWI	+265	MWK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
44a30c7a-e985-4668-bb3b-ab326452ce7f	Malaysia	MY	MYS	+60	MYR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
95cb7297-889b-40b2-a010-7faa589b7b20	Maldives	MV	MDV	+960	MVR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b7165c2a-2822-4f07-9737-f50f6ddb3866	Mali	ML	MLI	+223	XOF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f3c23db4-e734-4560-96ad-09ac4188eae3	Malta	MT	MLT	+356	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e1db5211-08b4-4d23-844c-ddc7415c1178	Marshall Islands	MH	MHL	+692	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b6601006-b17f-4ee2-aefb-0015bd259d35	Martinique	MQ	MTQ	+596	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
fc0f32a6-8bfa-4af5-9a37-5b2fd3c7afef	Mauritania	MR	MRT	+222	MRU	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
a9209e43-652c-4da6-957b-c7f12960ff09	Mauritius	MU	MUS	+230	MUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
01c4883f-2d59-4ad3-86bf-93221c57a17b	Mayotte	YT	MYT	+262	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e1e72c3b-8ec7-4efa-8719-16a6a7338dd3	Mexico	MX	MEX	+52	MXN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
2693a6ed-6989-4e44-9caf-ad52e8b4dc57	Micronesia	FM	FSM	+691	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
dd9b0e75-7538-4ce1-ae8e-45422ff100c2	Moldova	MD	MDA	+373	MDL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
facd3c6d-2e8a-41ed-b589-e7a6e88a979b	Monaco	MC	MCO	+377	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
ce06116a-89c1-40b8-b644-122f9ea7b1c5	Mongolia	MN	MNG	+976	MNT	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
c63fafed-b359-4da2-8789-ea8e1679727b	Montenegro	ME	MNE	+382	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9f88c905-544f-4dd5-939c-75a231a7915d	Montserrat	MS	MSR	+1	XCD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
579045c4-67b9-4329-8154-d35c669b340e	Morocco	MA	MAR	+212	MAD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
2e60b7d2-c358-46c0-befe-30a8d95ae963	Mozambique	MZ	MOZ	+258	MZN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9228331a-a3d6-43bd-be91-540590a2cc39	Myanmar	MM	MMR	+95	MMK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9ccd50b6-740a-48c9-a10a-0fd5be837a1d	Namibia	NA	NAM	+264	NAD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d202c097-a4b7-4e0c-9351-5b1c23c2f7f0	Nauru	NR	NRU	+674	AUD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
cb78ba2b-1e24-4e76-a378-ef6cd2b4aadc	Nepal	NP	NPL	+977	NPR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
fce7881d-a898-44ef-a0dd-43757beb2f54	Netherlands	NL	NLD	+31	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9a2aabac-8b96-40cc-874d-9859a5d4975c	New Caledonia	NC	NCL	+687	XPF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
339252ce-70a7-414e-8437-b9fb4e4f96d5	New Zealand	NZ	NZL	+64	NZD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
3a0f8d84-e7a5-45ab-b09c-f0ea575addc4	Nicaragua	NI	NIC	+505	NIO	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
ef4cdc54-14cf-4ee4-8ab5-0ab18f678e03	Niger	NE	NER	+227	XOF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
c1fd924e-902d-489f-8ea8-e816a0b15913	Nigeria	NG	NGA	+234	NGN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
8e4ae697-e18a-4ada-a4b2-8c46495241cb	Niue	NU	NIU	+683	NZD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
20c4ba1f-cf8c-4ae6-9c70-90720831a4be	Norfolk Island	NF	NFK	+672	AUD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e0228d32-4a06-4434-ad37-05fcb3236063	North Korea	KP	PRK	+850	KPW	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d002e902-f8ff-44c3-baf2-29193acfab1e	Saint Helena, Ascension and Tristan da Cunha	SH	SHN	+290	SHP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
8a504c87-a4d5-4a1c-990f-2b4e4881949e	Saint Kitts and Nevis	KN	KNA	+1	XCD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7e5e5048-fba0-46a1-b9af-6c2e092c9899	Saint Lucia	LC	LCA	+1	XCD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
cb87f0d4-5403-4d09-adb3-7597845082e4	Saint Martin (French part)	MF	MAF	+590	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f680a5ee-e3bf-473f-b182-f22703476f12	Saint Pierre and Miquelon	PM	SPM	+508	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
527aedbc-4797-4d3b-a650-151b9f76a17e	Saint Vincent and the Grenadines	VC	VCT	+1	XCD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
64dc3bbd-e718-4c67-94ce-2f32a38bc87a	Samoa	WS	WSM	+685	WST	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
409eb482-83fb-4115-9201-611a5f175d7e	San Marino	SM	SMR	+378	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
3b6db758-03d2-446e-baf0-1a4db62c669c	São Tomé and Príncipe	ST	STP	+239	STN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
192623c8-7499-40e4-b1b0-f9871838a0ef	Saudi Arabia	SA	SAU	+966	SAR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
1ed6068e-47d9-43ef-a631-430c950a83e6	Senegal	SN	SEN	+221	XOF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
ccf1cfdc-b53c-4804-877e-dd88d76e77d7	Serbia	RS	SRB	+381	RSD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f1699ede-0430-4dfe-8235-506ccb8a576c	Seychelles	SC	SYC	+248	SCR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
0cb7e5bb-ec48-499d-a0d6-d5ab28fd36f7	Sierra Leone	SL	SLE	+232	SLE	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
382134ff-ab7e-4dff-af8b-4a3b53c4deb5	Singapore	SG	SGP	+65	SGD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
1f810a27-719d-4fe2-a5a6-e0c9616464fd	Slovakia	SK	SVK	+421	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
ca84a39f-b84f-4ddf-939b-97933603ba1b	Slovenia	SI	SVN	+386	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
a84d73e2-94a8-4863-952e-5d0989c2a037	Solomon Islands	SB	SLB	+677	SBD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
8c9b5684-b108-4e03-967d-e47208a61464	Somalia	SO	SOM	+252	SOS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e5ac8057-0e60-4c5f-a7bb-0e6bd98dde31	South Africa	ZA	ZAF	+27	ZAR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
ae14ad81-2109-4e46-bcfe-988e508bfa56	South Georgia and the South Sandwich Islands	GS	SGS	+500	GBP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
83e672ee-08c3-46d9-845e-673f6bbed5f9	South Korea	KR	KOR	+82	KRW	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
6695255b-3b3c-46f4-9d76-ac9dfe208e03	South Sudan	SS	SSD	+211	SSP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
2ca4ec8a-1277-4f3b-83b2-ef167db74c15	Spain	ES	ESP	+34	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b32fbcf1-9bda-4f95-bb94-41cec622665e	Sri Lanka	LK	LKA	+94	LKR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
15521862-c19c-4559-88b4-fb24860b9d87	Sudan	SD	SDN	+249	SDG	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
694bcee6-f728-47df-9c89-94abfbfc81fd	Suriname	SR	SUR	+597	SRD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
985f6edd-882f-4b80-90b1-158d71e69954	Svalbard and Jan Mayen	SJ	SJM	+47	NOK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
a3787c72-f1cd-44d1-80dc-752d7925ed74	Sweden	SE	SWE	+46	SEK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
66b7efc1-5f0c-4f7f-900c-0620da3df577	Switzerland	CH	CHE	+41	CHF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
301a476d-e739-46c2-97e5-014248d49f60	Syria	SY	SYR	+963	SYP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
5b5611be-2d8a-49e6-b07a-aa2c25433424	Taiwan	TW	TWN	+886	TWD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
efb6b3b8-5c27-4bf1-a1c0-f11401bce973	Tajikistan	TJ	TJK	+992	TJS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f7561f2e-49f8-40b6-bbfa-472993272a5b	Tanzania	TZ	TZA	+255	TZS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
827b7161-256d-4029-bd02-386763fb9310	Thailand	TH	THA	+66	THB	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
14b54bfe-8aa7-42fa-804b-9e6120465cfa	Timor-Leste	TL	TLS	+670	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
1cde75e5-f5cc-4a28-8f9c-df2bebeea47e	Togo	TG	TGO	+228	XOF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
add6dc82-197d-4d44-809a-62746e8d2bbb	Tokelau	TK	TKL	+690	NZD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
12932dcc-4ea7-4377-a4db-1ad5cc9d145c	Tonga	TO	TON	+676	TOP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
49fcb2e3-3d1b-4a30-bc51-14c65a69363c	Trinidad and Tobago	TT	TTO	+1	TTD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d2a14ea4-081c-4334-a864-0c9303e7167b	Tunisia	TN	TUN	+216	TND	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
4613af2d-f5a1-4dc2-ad00-ed41cae54cb4	North Macedonia	MK	MKD	+389	MKD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9cfb4faf-8223-41b7-9a4a-bae3b98d264d	Northern Mariana Islands	MP	MNP	+1	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
4f434a3f-5dbc-4176-9f17-ebc2d31f30e3	Norway	NO	NOR	+47	NOK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
06d76cb9-5643-4933-aac5-93cea5593ef4	Oman	OM	OMN	+968	OMR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7d26b937-7098-4d2d-bf23-8e52112b92f9	Pakistan	PK	PAK	+92	PKR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9fb8afd2-e26e-4ce5-a9ac-c90c1d0466b8	Palau	PW	PLW	+680	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
2b405492-cc3b-4045-a351-677828deef67	Palestine	PS	PSE	+970	ILS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
a02474ef-d2c8-4367-8295-9e537bf8e5b8	Panama	PA	PAN	+507	PAB	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b96e5591-d6e2-4e69-ac62-adc12dd07411	Papua New Guinea	PG	PNG	+675	PGK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
2af73b31-d50e-4dec-9a6d-3f8efff67893	Paraguay	PY	PRY	+595	PYG	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
61a18fb8-a2db-407b-b994-16055ada85ba	Peru	PE	PER	+51	PEN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
13a2b74e-4430-4871-81ec-8a15b35766d5	Philippines	PH	PHL	+63	PHP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
32caa439-be1e-4e51-bb87-9ece3ae604a1	Pitcairn Islands	PN	PCN	+64	NZD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
eb1f8930-5f68-4a46-8ef4-daa1991561a8	Poland	PL	POL	+48	PLN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f1a58766-ffd2-46ab-819a-a9a017413aae	Portugal	PT	PRT	+351	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
db5da74e-c0dc-4ca2-9f6d-09d9a28e6c85	Puerto Rico	PR	PRI	+1	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
245d6690-3e64-4a7f-86a8-1e45ba0cb539	Qatar	QA	QAT	+974	QAR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
6b3bd449-c2ee-44e7-97ad-567151010636	Réunion	RE	REU	+262	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
cd3bef5e-b725-4e4a-a577-152de805a505	Romania	RO	ROU	+40	RON	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
53cc71de-76ad-4f2c-ab80-2c4968ef9ef2	Russia	RU	RUS	+7	RUB	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
559d7a85-e25a-49b4-80c5-141a4ddb5fd1	Rwanda	RW	RWA	+250	RWF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
0baa7a96-69ad-4d3c-bb65-c9c454ce3f8a	Saint Barthélemy	BL	BLM	+590	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e992d057-bb5e-4d5e-8671-e0ec504144ee	Sint Maarten (Dutch part)	SX	SXM	+1	XCG	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7797256e-e841-4db4-9777-b137372727bc	Türkiye	TR	TUR	+90	TRY	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
408dfcdb-c2b2-4004-a891-619871bd900d	Turkmenistan	TM	TKM	+993	TMT	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
a47ae467-5486-4aca-bafd-dfdaaed8ab70	Turks and Caicos Islands	TC	TCA	+1	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
371ab4c9-5173-4bb8-8ec5-c5e726347552	Tuvalu	TV	TUV	+688	AUD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
aa87dd5a-2ea8-44a8-8772-bae350b68e17	Uganda	UG	UGA	+256	UGX	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
ca808ace-c50f-4650-92cd-3b50b3daa96d	Ukraine	UA	UKR	+380	UAH	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d2bb4da9-9127-418a-b214-7e04a3d205f5	United Arab Emirates	AE	ARE	+971	AED	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
e1297f98-a606-4e91-9c8c-2294d8fe3326	United Kingdom	GB	GBR	+44	GBP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
88481392-c4b0-4d5b-842f-8131be7cbb4b	United States	US	USA	+1	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
eb58b326-0566-4cd5-9c70-831b7c8d61bc	United States Minor Outlying Islands	UM	UMI	\N	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f22bb6ec-edf2-42f2-8020-e88954df3ff8	United States Virgin Islands	VI	VIR	+1	USD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7311b7b8-4d36-4e8c-b16f-351f46a8ce7d	Uruguay	UY	URY	+598	UYU	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
349794a6-8742-40d4-aee2-3d82fbd5d033	Uzbekistan	UZ	UZB	+998	UZS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
eef6850d-ab0c-42b4-a886-5462fbdc486f	Vanuatu	VU	VUT	+678	VUV	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
464863f0-3467-4cfc-8265-8b4a2d41a0a3	Vatican City	VA	VAT	+39	EUR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
5133475d-032c-4cc7-a39d-bbf2d1acb5cd	Venezuela	VE	VEN	+58	VES	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
bdf189ae-8d46-447c-98ed-31398e639ad6	Vietnam	VN	VNM	+84	VND	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b0d5c315-5520-476d-80fd-833dfb95b323	Wallis and Futuna	WF	WLF	+681	XPF	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
488a089e-c8a1-430b-8d87-be16a5968e30	Western Sahara	EH	ESH	+212	MAD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
35e9f9b9-33ec-46db-b24c-918a01c02db2	Yemen	YE	YEM	+967	YER	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
4d2e0a8a-09ff-46b2-aedf-ecdcdce5a506	Zambia	ZM	ZMB	+260	ZMW	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
b4a2ea09-d6c3-485b-902a-9f4282eee45a	Zimbabwe	ZW	ZWE	+263	ZWG	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
\.


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.currencies (id, code, name, symbol, decimal_places, is_active, created_by, updated_by, created_at, updated_at, deleted_at, exchange_rate) FROM stdin;
f7fdfeb9-2b34-4ffc-bdae-4177e8956a86	AED	UAE Dirham	د.إ	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	25.865191
c07f1779-b2c7-4c04-bd68-7374e5f9afc0	AUD	Australian Dollar	A$	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	66.476102
fc8e5553-81ce-48b2-85e4-435cc2df571a	BDT	Bangladeshi Taka	৳	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	0.767162
7201a0fb-aaa7-448d-9b51-6edfd51ae8c7	BHD	Bahraini Dinar	د.ب	3	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	252.652855
5e432b08-107c-470d-be77-9d05ec06e97b	CAD	Canadian Dollar	C$	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	67.503713
e0dfc9fc-67db-4097-b68c-e3f0e6e4a109	CHF	Swiss Franc	CHF	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	115.035086
20d63456-ad28-4283-bcb7-84f7bb480245	CNY	Chinese Yuan	CN¥	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	14.205958
d9982b57-2d1e-46ba-832c-b9d73d947246	EUR	Euro	€	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	106.507615
6abc011c-7ad0-4f3f-8b88-e2a97a802655	GBP	British Pound	£	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	126.790922
b1482305-326f-4a55-affc-cd0cae4e6ae4	HKD	Hong Kong Dollar	HK$	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	12.091898
46313bc4-a801-47d7-af4b-bb97e277afdb	INR	Indian Rupee	₹	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	1.000000
3bcc9f0d-87b7-4df2-b0a2-e5bfb76d803f	JPY	Japanese Yen	¥	0	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	0.599955
c65f6eb3-dfbb-4518-a6f3-4415ad09c399	KWD	Kuwaiti Dinar	د.ك	3	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	306.748466
a15db6b1-eae8-47b4-95ee-948b192da4c6	LKR	Sri Lankan Rupee	₨	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	0.286008
3cb9a090-329f-4c73-99a2-f7baa675781c	NPR	Nepalese Rupee	Rs.	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	0.625000
3ee5f8d7-9d50-4f55-b0fd-68e0ad8a51ba	OMR	Omani Rial	ر.ع.	3	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	247.035573
6e3c4e13-ccc6-4ad5-a794-920202fe9bbe	QAR	Qatari Riyal	ر.ق	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	26.096033
7a56cb8a-1dd7-4249-a560-43a4a618ff63	SAR	Saudi Riyal	ر.س	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	25.330564
097f1fce-86c0-406d-8d90-ac69dc20a74a	SGD	Singapore Dollar	S$	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	74.250074
b35ae38f-0463-4a3a-9c29-d7c82bc73a7e	USD	US Dollar	$	2	t	system	system	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	94.993825
\.


--
-- Data for Name: data_permission_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.data_permission_groups (id, organization_id, name, description, is_active, created_by, updated_by, created_at, updated_at, deleted_at, rules, is_system) FROM stdin;
c8142d68-8ef6-410d-ba7f-8078ac2b8696	9edca853-7860-4925-b81b-1206dc4298cb	All Access	Every employee of every entity	t	system	\N	2026-10-27 03:21:59.506055+00	2026-10-27 03:21:59.506055+00	\N	[]	t
dbc7746b-234f-4cd4-8d77-f3b08cde754e	9edca853-7860-4925-b81b-1206dc4298cb	Shree Maruti - Technology	string	t	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-27 11:36:37.880535+00	2026-10-27 11:36:37.880535+00	\N	[{"level": "entity", "values": ["5f7a65ab-f28a-474f-8bf3-caa56056e7ea"]}, {"level": "department", "values": ["bae28813-0127-4076-9b5b-8d1fe4f0fa7f"]}]	f
b67eb300-1cf0-4092-acdd-00fca2c0f64f	9edca853-7860-4925-b81b-1206dc4298cb	Smile - HR Reporting	string	t	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-27 11:39:00.081832+00	2026-10-27 11:39:00.081832+00	\N	[{"level": "entity", "values": ["3ec637ef-5f74-4c64-933a-9411644db07f"]}, {"level": "department", "values": ["c96c2707-dd48-4d61-bf49-6870918d7e5e"]}]	f
b2ec3165-0292-4691-aab0-7644089060eb	9edca853-7860-4925-b81b-1206dc4298cb	Smile - Finance	string	t	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-27 11:40:50.695149+00	2026-10-27 11:40:50.695149+00	\N	[{"level": "entity", "values": ["3ec637ef-5f74-4c64-933a-9411644db07f"]}, {"level": "department", "values": ["4d7195c5-dd4e-492b-ac78-a989ab30fdab"]}]	f
f4b50ece-0e44-4b9f-94c4-8f70f70a322f	9edca853-7860-4925-b81b-1206dc4298cb	Test	Test data permission group	t	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-27 11:56:39.592488+00	2026-10-27 11:56:39.592488+00	\N	[{"level": "entity", "values": ["3ec637ef-5f74-4c64-933a-9411644db07f"]}, {"level": "department", "values": ["bae28813-0127-4076-9b5b-8d1fe4f0fa7f"]}]	f
1bf12b3a-b8e7-496a-94c5-35147ad5f70f	9edca853-7860-4925-b81b-1206dc4298cb	Hr Management	Hr Management data permission group	t	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-27 11:58:20.443299+00	2026-10-27 11:58:20.443299+00	\N	[{"level": "department", "values": ["c96c2707-dd48-4d61-bf49-6870918d7e5e", "cf59bdc6-9902-4bea-98af-d86a639976c8", "bae28813-0127-4076-9b5b-8d1fe4f0fa7f"]}]	f
4605e41e-1121-456d-bb1c-38b26b509874	9edca853-7860-4925-b81b-1206dc4298cb	All Entities	access on all entities	t	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-28 07:02:53.803921+00	2026-10-28 07:02:53.803921+00	\N	[{"level": "entity", "values": ["3ec637ef-5f74-4c64-933a-9411644db07f", "5f7a65ab-f28a-474f-8bf3-caa56056e7ea"]}]	f
53888bda-9e25-4a97-9ca5-62e188192178	9edca853-7860-4925-b81b-1206dc4298cb	off-role entity	off-role entity data permission group	t	24f04f5b-9007-4480-94cd-0556d4aef097	\N	2026-10-28 12:28:14.524008+00	2026-10-28 12:28:14.524008+00	\N	[{"level": "entity", "values": ["5f7a65ab-f28a-474f-8bf3-caa56056e7ea"]}]	f
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.departments (id, organization_id, name, code, description, head_employee_id, is_active, created_by, updated_by, created_at, updated_at, deleted_at, parent_department_id) FROM stdin;
ea5ac625-8157-4d2d-8ece-f2206f010ec8	9edca853-7860-4925-b81b-1206dc4298cb	Software Engineering	SOFTWARE_ENGINEERING	string	\N	t	devyansh.solanki@shreemaruti.com	\N	2026-10-16 06:26:49.842126+00	2026-10-16 06:26:49.842126+00	\N	c96c2707-dd48-4d61-bf49-6870918d7e5e
82fc603e-d02f-46d1-9089-d14e68ee5c21	9edca853-7860-4925-b81b-1206dc4298cb	Management	MGMT	Leadership and administration	\N	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N	\N
c96c2707-dd48-4d61-bf49-6870918d7e5e	9edca853-7860-4925-b81b-1206dc4298cb	Human Resources	HR	People and culture	\N	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N	\N
4d7195c5-dd4e-492b-ac78-a989ab30fdab	9edca853-7860-4925-b81b-1206dc4298cb	Finance	FIN	Accounts and payroll	\N	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N	\N
dcd9c3a4-3575-4be3-be30-37084c95c27e	9edca853-7860-4925-b81b-1206dc4298cb	Operations	OPS	Day-to-day operations	\N	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N	\N
1a68db86-2ab5-4d44-806b-810ac4315d88	9edca853-7860-4925-b81b-1206dc4298cb	Sales	SALES	Sales and business development	\N	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N	\N
cf59bdc6-9902-4bea-98af-d86a639976c8	9edca853-7860-4925-b81b-1206dc4298cb	Information Technology	IT	Technology	\N	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N	\N
f3f1ca9e-88ed-4fcb-a987-44b1c7658b75	9edca853-7860-4925-b81b-1206dc4298cb	Software Development	IT-DEV	Application development	\N	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N	cf59bdc6-9902-4bea-98af-d86a639976c8
bae28813-0127-4076-9b5b-8d1fe4f0fa7f	9edca853-7860-4925-b81b-1206dc4298cb	IT Support	IT-SUP	Infrastructure and helpdesk	\N	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N	cf59bdc6-9902-4bea-98af-d86a639976c8
a396101d-84a2-4e27-b83f-d1294b74e714	9edca853-7860-4925-b81b-1206dc4298cb	Recruitment	HR-REC	Hiring and onboarding	\N	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N	c96c2707-dd48-4d61-bf49-6870918d7e5e
\.


--
-- Data for Name: designations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.designations (id, organization_id, name, code, description, level, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
d5cdec8e-c058-4d3e-8043-f60caa376a07	9edca853-7860-4925-b81b-1206dc4298cb	AA	AB	A	2	t	prince.h@shreemaruti.com	prince.h@shreemaruti.com	2026-10-16 12:40:01.788963+00	2026-10-16 12:40:34.929803+00	\N
a9ca7089-2883-4a56-9388-2927a3b5ca73	9edca853-7860-4925-b81b-1206dc4298cb	Intern	INT	\N	1	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
e192830a-64f3-42ca-9ada-e827329e2a9a	9edca853-7860-4925-b81b-1206dc4298cb	Executive	EXE	\N	2	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
85a54d26-df1c-45d8-9ef4-5509ea8dbaf9	9edca853-7860-4925-b81b-1206dc4298cb	Senior Executive	SR-EXE	\N	3	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
d84599a4-fc16-4c0d-a767-93e665a478f2	9edca853-7860-4925-b81b-1206dc4298cb	Manager	MGR	\N	5	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
368db79c-da4f-4c34-8cb9-327f7e66ed0f	9edca853-7860-4925-b81b-1206dc4298cb	General Manager	GM	\N	7	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
80b0d847-a568-41d1-88db-1e5833a4a918	9edca853-7860-4925-b81b-1206dc4298cb	HR Executive	HR-EXE	\N	2	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
5e6e4c98-cf19-4d79-8c17-049156292f9d	9edca853-7860-4925-b81b-1206dc4298cb	HR Manager	HR-MGR	\N	5	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
c775d5b8-b354-4d2e-b4d5-942e4b30fcbb	9edca853-7860-4925-b81b-1206dc4298cb	Accountant	ACC	\N	2	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
62d8b051-021e-4001-b9bd-bbe7a776c9b0	9edca853-7860-4925-b81b-1206dc4298cb	Software Engineer	SE	\N	2	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
c8257aea-e14e-415f-9f4e-6f7181dc376c	9edca853-7860-4925-b81b-1206dc4298cb	Senior Software Engineer	SSE	\N	3	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
4e3ea68b-7ad4-4035-847a-a9e91270c01b	9edca853-7860-4925-b81b-1206dc4298cb	Team Lead	TL	\N	4	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
230567b2-e408-4cce-82b8-3c62c46216f6	9edca853-7860-4925-b81b-1206dc4298cb	Sales Executive	SALES-EXE	\N	2	t	system	system	2026-10-15 05:14:26.427221+00	2026-10-27 11:52:03.167102+00	\N
\.


--
-- Data for Name: entities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.entities (id, organization_id, name, code, description, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
3ec637ef-5f74-4c64-933a-9411644db07f	9edca853-7860-4925-b81b-1206dc4298cb	Shree Maruti Integrated Logistics	SMIL	\N	t	system	\N	2026-10-26 12:37:09.308116+00	2026-10-26 12:37:09.308116+00	\N
5f7a65ab-f28a-474f-8bf3-caa56056e7ea	9edca853-7860-4925-b81b-1206dc4298cb	Smile Off-Role	SMILE_OFF_ROLE	\N	t	system	\N	2026-10-26 12:37:09.308116+00	2026-10-26 12:37:09.308116+00	\N
\.


--
-- Data for Name: expense_policy_documents; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expense_policy_documents (id, organization_id, title, file_id, category_id, sort_order, is_active, version, created_at, created_by, updated_at, updated_by, deleted_at) FROM stdin;
\.


--
-- Data for Name: expense_request_events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expense_request_events (id, organization_id, request_id, action, actor_id, remarks, created_at) FROM stdin;
4e4b8add-509b-4207-a18a-0f79517907bd	9edca853-7860-4925-b81b-1206dc4298cb	7c371a42-6f3c-49c7-9439-170e65be0635	SUBMITTED	50a74013-21fd-4641-8c73-369507b8b7c2	\N	2026-10-23 11:44:40.828756+00
28ffffad-e445-4288-add9-edf02a397d0c	9edca853-7860-4925-b81b-1206dc4298cb	1901f294-780c-4c7f-8d0e-4b5187c3dc5b	SUBMITTED	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-23 12:42:49.757539+00
a8e656f1-3080-42a6-9a1e-960b1953dfad	9edca853-7860-4925-b81b-1206dc4298cb	b9b8b8f9-8229-495c-89f4-128d2dfc45dd	SUBMITTED	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-24 05:20:39.212829+00
\.


--
-- Data for Name: expense_request_item_receipts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expense_request_item_receipts (item_id, file_id, organization_id, sort_order, created_at) FROM stdin;
54053f2a-b3df-48c8-9b13-68a44df20ba8	6067e527-4a40-4b2a-900d-4a5c8da38dd1	9edca853-7860-4925-b81b-1206dc4298cb	0	2026-10-23 11:28:13.804871+00
\.


--
-- Data for Name: expense_request_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expense_request_items (id, organization_id, request_id, category_id, from_date, to_date, amount, remarks, sort_order, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
54053f2a-b3df-48c8-9b13-68a44df20ba8	9edca853-7860-4925-b81b-1206dc4298cb	80164d2d-e037-41e2-af3f-3d3e37afbf65	9915c48c-fd64-4a2a-a3e9-9eadcd5efee0	2026-10-14	2026-10-15	1250.500	Client visit, Pune	0	devyansh.solanki@shreemaruti.com	\N	2026-10-23 11:28:13.804871+00	2026-10-23 11:28:13.804871+00	\N
22154116-4f7c-4c2e-b384-b36e60b57128	9edca853-7860-4925-b81b-1206dc4298cb	7c371a42-6f3c-49c7-9439-170e65be0635	9915c48c-fd64-4a2a-a3e9-9eadcd5efee0	2026-10-14	2026-10-15	1250.500	Client visit, Pune	0	devyansh.solanki@shreemaruti.com	\N	2026-10-23 11:44:40.828756+00	2026-10-23 11:44:40.828756+00	\N
3586636b-9723-4553-8c46-9809d83bb729	9edca853-7860-4925-b81b-1206dc4298cb	1901f294-780c-4c7f-8d0e-4b5187c3dc5b	9915c48c-fd64-4a2a-a3e9-9eadcd5efee0	2026-10-23	2026-10-23	345.000	sfg sdf sdf sdf sdf sdf sdf sdf sdf	0	harsh.shah@shreemaruti.com	\N	2026-10-23 12:42:49.757539+00	2026-10-23 12:42:49.757539+00	\N
289fd5da-0f3d-4442-9138-e7fb7645032a	9edca853-7860-4925-b81b-1206dc4298cb	b9b8b8f9-8229-495c-89f4-128d2dfc45dd	9915c48c-fd64-4a2a-a3e9-9eadcd5efee0	2026-10-16	2026-10-16	15000.000	boom	0	harsh.shah@shreemaruti.com	\N	2026-10-24 05:20:39.212829+00	2026-10-24 05:20:39.212829+00	\N
6503cc9e-d99d-4809-aa2a-0aae6f8c2f7b	9edca853-7860-4925-b81b-1206dc4298cb	b9b8b8f9-8229-495c-89f4-128d2dfc45dd	95c0f3e0-b21f-478a-a1ee-7a7c8033578f	2026-10-16	2026-10-16	1250.000	food	1	harsh.shah@shreemaruti.com	\N	2026-10-24 05:20:39.212829+00	2026-10-24 05:20:39.212829+00	\N
3446bdd0-b26b-461f-a9b2-dae2cd8aa622	9edca853-7860-4925-b81b-1206dc4298cb	b9b8b8f9-8229-495c-89f4-128d2dfc45dd	7db775cc-e9a8-4d39-8cd1-01c813611843	2026-10-16	2026-10-16	3000.000	5 star	2	harsh.shah@shreemaruti.com	\N	2026-10-24 05:20:39.212829+00	2026-10-24 05:20:39.212829+00	\N
44c52911-5963-48d9-ae9e-4b458662016e	9edca853-7860-4925-b81b-1206dc4298cb	52e2f029-a12f-4cd5-a0cb-75b54f3eefbc	95c0f3e0-b21f-478a-a1ee-7a7c8033578f	2026-10-23	2026-10-23	666.000	डीजी डीएफ़जी डीएफ़जी\nडीएफ़जी\nडीएफ़जी डीएफ़जी\nडीएफ़जी dfgdfgdfgdfg	0	harsh.shah@shreemaruti.com	\N	2026-10-24 07:17:15.173058+00	2026-10-24 07:17:15.173058+00	\N
dfa574f6-b354-4fb8-92f6-e280bb47eea0	9edca853-7860-4925-b81b-1206dc4298cb	52e2f029-a12f-4cd5-a0cb-75b54f3eefbc	b26e2aea-ae41-4e38-ae90-136c60783a02	2026-10-23	2026-10-23	100.000	fffffff	1	harsh.shah@shreemaruti.com	\N	2026-10-24 07:17:15.173058+00	2026-10-24 07:17:15.173058+00	\N
\.


--
-- Data for Name: expense_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.expense_requests (id, organization_id, user_id, title, currency_id, exchange_rate, base_currency_id, status, submitted_on, approver_id, decided_by, decided_on, remarks, withdraw_reason, withdrawn_on, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
80164d2d-e037-41e2-af3f-3d3e37afbf65	9edca853-7860-4925-b81b-1206dc4298cb	50a74013-21fd-4641-8c73-369507b8b7c2	Pune client visit	46313bc4-a801-47d7-af4b-bb97e277afdb	\N	\N	DRAFT	\N	\N	\N	\N	\N	\N	\N	devyansh.solanki@shreemaruti.com	\N	2026-10-23 11:28:13.804871+00	2026-10-23 11:28:13.804871+00	\N
7c371a42-6f3c-49c7-9439-170e65be0635	9edca853-7860-4925-b81b-1206dc4298cb	50a74013-21fd-4641-8c73-369507b8b7c2	Pune client visit	46313bc4-a801-47d7-af4b-bb97e277afdb	1.000000	46313bc4-a801-47d7-af4b-bb97e277afdb	PENDING	2026-10-23 11:44:41.176+00	\N	\N	\N	\N	\N	\N	devyansh.solanki@shreemaruti.com	devyansh.solanki@shreemaruti.com	2026-10-23 11:44:40.828756+00	2026-10-23 11:44:40.828756+00	\N
aebc6b16-9701-44a3-8a3c-a2e2a8f86641	9edca853-7860-4925-b81b-1206dc4298cb	50a74013-21fd-4641-8c73-369507b8b7c2	Mumbai client visit	46313bc4-a801-47d7-af4b-bb97e277afdb	\N	\N	DRAFT	\N	\N	\N	\N	\N	\N	\N	devyansh.solanki@shreemaruti.com	\N	2026-10-23 11:45:31.518901+00	2026-10-23 11:45:31.518901+00	\N
1901f294-780c-4c7f-8d0e-4b5187c3dc5b	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	Test	46313bc4-a801-47d7-af4b-bb97e277afdb	1.000000	46313bc4-a801-47d7-af4b-bb97e277afdb	PENDING	2026-10-23 12:42:49.902+00	50a74013-21fd-4641-8c73-369507b8b7c2	\N	\N	\N	\N	\N	harsh.shah@shreemaruti.com	harsh.shah@shreemaruti.com	2026-10-23 12:42:49.757539+00	2026-10-23 12:42:49.757539+00	\N
b9b8b8f9-8229-495c-89f4-128d2dfc45dd	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	Testing asd asd	46313bc4-a801-47d7-af4b-bb97e277afdb	1.000000	46313bc4-a801-47d7-af4b-bb97e277afdb	PENDING	2026-10-24 05:20:39.354+00	50a74013-21fd-4641-8c73-369507b8b7c2	\N	\N	\N	\N	\N	harsh.shah@shreemaruti.com	harsh.shah@shreemaruti.com	2026-10-24 05:20:39.212829+00	2026-10-24 05:20:39.212829+00	\N
733cee12-9a8a-4246-b5b4-7daf93a408f8	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	यूह्युसीड्यूआई यूसीडीएफ़यू सिडफ़ू सिडफ़्यूएसडफ़ी सड्फ़ी यूएसडीफ़ू सिडफ़ू सिडफ़ू सिडफ़ू सीडफ़ सिडफ़ स	46313bc4-a801-47d7-af4b-bb97e277afdb	\N	\N	DRAFT	\N	\N	\N	\N	\N	\N	\N	harsh.shah@shreemaruti.com	harsh.shah@shreemaruti.com	2026-10-24 05:57:21.438059+00	2026-10-24 05:58:34.471217+00	2026-10-24 05:58:34.487+00
52e2f029-a12f-4cd5-a0cb-75b54f3eefbc	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	Draft test update २	46313bc4-a801-47d7-af4b-bb97e277afdb	\N	\N	DRAFT	\N	\N	\N	\N	\N	\N	\N	harsh.shah@shreemaruti.com	harsh.shah@shreemaruti.com	2026-10-24 05:50:07.602601+00	2026-10-24 07:17:15.173058+00	\N
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.files (id, organization_id, storage_key, original_name, mime_type, size_bytes, uploaded_by, created_at, deleted_at) FROM stdin;
abde00d9-40a3-463b-a12d-079ee0a8f3d9	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/50a74013-21fd-4641-8c73-369507b8b7c2/profile/a193e6f3-0e76-408d-bb53-614ea3e5cfed.webp	devyansh_nature.jpg	image/webp	29800	50a74013-21fd-4641-8c73-369507b8b7c2	2026-10-13 06:51:21.383888+00	\N
62ae4013-abd5-42a4-b5fd-d8324747f162	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/1d77bd9a-eafa-446b-81ea-6c480da0b597.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-13 12:48:08.794916+00	2026-10-13 13:06:42.069309+00
6f1fac54-aaad-4095-8a3f-c8c4f6969fc5	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/3d69b875-b33a-4254-aca1-7ef57bf19902.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-13 13:06:42.069309+00	2026-10-14 04:45:49.65861+00
f6b23c79-5e20-4b15-8de7-7851ef9d5755	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/8329d142-56cd-400f-a850-3fd22513cd21.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 04:45:49.65861+00	2026-10-14 04:59:24.016347+00
4d71c818-d80a-4028-8ac5-9222e265eca5	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/73b66224-3e90-4f9f-9dad-78447bf919e4.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 04:59:24.016347+00	2026-10-14 05:06:29.588746+00
066188ec-1e2c-4893-84fa-202e3c64b723	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/69c66723-aae4-48c0-be57-be0625f829ea.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 05:06:29.588746+00	2026-10-14 05:07:34.40981+00
b7484bd2-6fb9-4a62-8619-158501e1adcd	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/75f7b008-eeee-4925-83cc-2cfabd923897.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 05:07:34.40981+00	2026-10-14 05:08:34.368581+00
33b0053c-ca50-49e8-b7ed-4a55a9e6710f	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/4072cd0c-3879-4a8f-bd3a-d05ecc0cfc85.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 05:08:34.368581+00	2026-10-14 05:09:33.47579+00
d8b9effa-b3e6-4e63-86a6-4128837c8673	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/6ad7a20e-4f96-49da-bc8c-df81d8eb9a1f.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 05:09:33.47579+00	2026-10-14 05:09:41.12572+00
61b6c4a7-0bec-4369-9302-20f7b61f9dbf	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/319c95b4-903e-459b-8015-3791179182f2.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 05:09:41.12572+00	2026-10-14 05:27:17.617958+00
62a04cb5-f52f-433f-b290-e88e9540ae76	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/de161125-9138-43ee-b393-2b4e6bacc443.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 05:27:17.617958+00	2026-10-14 05:28:37.005972+00
7838101e-ed29-41d6-a02c-0f459ced39fb	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/89dee1f9-f126-4474-a7a8-faeb8b85a8ea.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 05:28:37.005972+00	2026-10-14 05:28:46.878757+00
072b139a-a843-4c36-b759-4e0a77178175	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/6235cfed-2f1f-4ca5-85a2-a8fbc9862aa3.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 05:28:46.878757+00	2026-10-14 06:04:55.692619+00
89f27c10-53a6-41aa-b84a-4d16bdfaa807	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/0ce6d08b-0378-4449-9ad5-cc4268300dc4.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 06:04:55.692619+00	2026-10-14 06:05:28.747877+00
52246ece-09f0-4481-8321-3a13db7a8652	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/72ecf16f-0f6b-460d-a76b-47c807bdc65f.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 06:05:28.747877+00	2026-10-14 06:19:18.315127+00
3dcb2243-57f5-4388-9291-e98339c6e80c	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/d70dade6-ebe5-493a-b3aa-54ef6ffbaf88.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 06:19:18.315127+00	2026-10-14 07:18:32.627352+00
5dddbfe6-f7a4-43ce-97d1-0832762cee58	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/98da7211-765a-4b13-a188-8db4eb045086.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 07:18:32.627352+00	2026-10-14 07:41:09.620548+00
6b7fe1f2-dc2a-4d52-b6b8-ee8d426adcff	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/571c446a-cb0e-4fa4-90b0-875bf352f2a9.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 07:41:09.620548+00	2026-10-14 09:17:23.08495+00
db7b61fb-f8d2-4b2f-9b1d-de712e1d8f91	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/ef8e36c3-5833-4bf0-9076-e7224a85e9dd.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 09:17:23.08495+00	2026-10-14 10:32:24.671257+00
8d39dbd2-ced7-4db6-8c59-fd5db2ca81f3	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/14f3bb4b-84c4-4efd-9751-14b3c42eb582.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 10:32:24.671257+00	2026-10-14 10:44:19.939331+00
ba8971e3-da31-4be8-8616-d23d519a2668	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/03dfdd8a-b6ce-4dcf-98d5-8b9bde717e32.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 11:41:00.777446+00	2026-10-14 11:41:05.906778+00
88d6a4e3-62da-4c71-a0f1-1ab2c2b5cf08	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/3e9937fc-06ae-448d-966f-af5fefb70f8a.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 11:49:19.010027+00	2026-10-14 11:49:23.198084+00
24f48a54-243b-41e8-88f5-bcea8b41f9e2	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/990612a7-6f3c-475a-ba27-dcf51625e627.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-14 11:51:19.842277+00	2026-10-14 11:51:29.645598+00
7bc685f4-d9c3-4d46-913d-29ee831348a3	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/0c9ae578-7328-450a-a873-f492ca50264b.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 05:09:48.1028+00	2026-10-15 07:08:55.594655+00
03e187aa-90c1-4115-ac83-b79992906213	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/3a77a62c-363f-41e5-b446-8a7aad3d7b9f/profile/c9be8509-6c65-4477-bbd3-70116ebbea4a.webp	DD87B167-E793-4E8A-9036-53A7E23F7098.jpg	image/webp	18798	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	2026-10-14 12:08:22.544074+00	2026-10-15 07:36:09.315819+00
d4ce21ef-28bd-4e03-9eb3-a6a450bb37a7	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/3a77a62c-363f-41e5-b446-8a7aad3d7b9f/profile/dc948e5a-fa0e-4338-9f31-f91b972f0ff0.webp	9EB65953-4A03-4595-B306-959AB497FC4B.jpg	image/webp	18798	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	2026-10-15 07:39:06.599832+00	2026-10-15 07:45:29.129169+00
a91c9d99-43cf-441a-818e-0559823efb65	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/3a77a62c-363f-41e5-b446-8a7aad3d7b9f/profile/12c4cb3e-3618-4329-8425-2103b62e7d30.webp	BCC39483-2E41-456D-951A-4896AF80D6FA.jpg	image/webp	25142	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	2026-10-15 07:45:29.36167+00	2026-10-15 07:45:55.991162+00
9767be30-266c-4bb5-846f-482de1df644c	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/7d5a40e0-8e43-4467-adb4-db683df15b06.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 07:08:55.594655+00	2026-10-15 09:00:27.273974+00
362e1696-e248-4e8d-a1fe-887fd7ff1714	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/3a77a62c-363f-41e5-b446-8a7aad3d7b9f/profile/c7fd72b8-ce73-48e4-9276-c1003773cc75.webp	7891FF88-E24B-4E7F-A02D-4C52DA0183C9.jpg	image/webp	18798	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	2026-10-15 07:45:56.23751+00	\N
63010208-a92c-45cb-b36e-72ff54801200	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/b8644934-e9ff-4630-b561-7afb8d3932b1.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 09:00:27.273974+00	2026-10-15 09:02:10.70175+00
32d2ca2d-d5f9-460f-8da4-256fb5c74ede	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/f1d6281a-f625-4174-a426-f7c8639cd6da.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 09:02:18.193815+00	2026-10-15 09:02:28.997162+00
12212464-74d7-482f-b0eb-5d993a270cbc	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/aecc31f9-8ae6-4f4c-a2a5-2c5b0aa30f49.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 09:02:28.997162+00	2026-10-15 09:02:38.260854+00
81d79026-2ae8-41e9-85a0-0a77d18db29c	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/63474e26-efcb-4c23-b514-d47ccaa956c0.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 09:03:12.929864+00	2026-10-15 09:36:31.730941+00
422f1838-a110-45f6-904a-6dd50c9a1c54	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/35cf4ebe-628b-4641-9a9d-228307c85a3d.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 09:36:31.730941+00	2026-10-15 10:49:45.919049+00
62723e2f-f02c-4386-a3d3-266b29ddb441	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/c3c10753-acb5-4b2b-8de9-4e0d6090f44c.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 10:49:52.34326+00	2026-10-15 10:55:14.523507+00
e2b3ef1f-0bd5-4b00-a38a-76fc6c0ae396	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/4d12a862-b35d-426d-88e7-7f473021675f.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 10:55:23.351051+00	2026-10-15 11:14:28.695131+00
d825459c-bf68-4efc-985b-1f4c67b308a1	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/3633309f-60f9-4908-82f3-3986824117bb.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 11:14:28.695131+00	2026-10-15 12:06:50.531818+00
53676842-c282-4d6e-855d-af1da399ba5e	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/16497dbd-9a11-482f-a08a-f361d4d76ff2.webp	user-profile_.png	image/webp	15154	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 12:06:56.439033+00	2026-10-15 12:45:25.126519+00
dd2520ff-2a2a-4ffc-9843-7614f7bf3656	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/03816039-249c-462d-a1a2-7a1b855c07ab/profile/a8591142-d71f-4619-9cef-70700f3628c2.webp	user-profile.png	image/webp	10122	03816039-249c-462d-a1a2-7a1b855c07ab	2026-10-15 12:45:25.126519+00	2026-10-15 12:45:31.938525+00
50da028a-34d6-421d-9808-1576a76ac964	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/expenses/50a74013-21fd-4641-8c73-369507b8b7c2/receipts/2629001e-1424-437b-909b-602e3ed752bc.jpg	devyansh_nature.jpg	image/jpeg	52321	50a74013-21fd-4641-8c73-369507b8b7c2	2026-10-23 11:24:32.52902+00	\N
6067e527-4a40-4b2a-900d-4a5c8da38dd1	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/expenses/50a74013-21fd-4641-8c73-369507b8b7c2/receipts/5a850349-3b9d-45e1-a716-0cf651a2c81e.jpg	devyansh_nature.jpg	image/jpeg	52321	50a74013-21fd-4641-8c73-369507b8b7c2	2026-10-23 11:27:57.850476+00	\N
4f8c7e07-c243-4ede-92cf-9c496c3df418	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/2d88ee2a-b305-4919-b1f4-5ff29adfa86b/profile/fbea6955-a585-4bfa-b3c0-d48fc932f61a.webp	devyansh_nature.jpg	image/webp	29800	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	2026-10-17 11:20:38.9244+00	2026-10-26 11:55:11.716703+00
530a7dfe-3bb8-419b-9dca-4d2291b1471b	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/2d88ee2a-b305-4919-b1f4-5ff29adfa86b/profile/036ce4c3-c686-4ff6-8f55-f6f860f8c43c.webp	user-profile.png	image/webp	10122	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	2026-10-26 11:55:11.716703+00	2026-10-26 11:55:15.155404+00
56df70ae-e30a-4683-bf97-1211b1cc0c2c	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/employees/2d88ee2a-b305-4919-b1f4-5ff29adfa86b/profile/dcf8f7e0-c28e-4e2d-b84a-94d288374f4a.webp	user-profile_.png	image/webp	15154	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	2026-10-26 11:55:21.891962+00	\N
6b58b1fe-def7-4a6d-b139-a2ef42de740a	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/onboarding/06464fa3-e16d-4a77-b3f1-d6c371052bc0/offer-letter/sent/720d6754-dfdf-43d6-8b81-06abd9c7a7e7.pdf	Offer Letter - Tara Iyer.pdf	application/pdf	6226	f80816b4-1585-4a4b-9cf2-d284a81c8458	2026-11-04 06:21:51.836305+00	\N
56ee3d47-1a84-49e3-b11c-b8a38c690859	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/onboarding/06464fa3-e16d-4a77-b3f1-d6c371052bc0/offer-letter/sent/d2d35212-5281-4ed7-9be7-60d751fbd75c.pdf	Offer Letter - Tara Iyer.pdf	application/pdf	6226	f80816b4-1585-4a4b-9cf2-d284a81c8458	2026-11-04 07:07:19.727661+00	\N
bd9a3684-886c-4f0f-8a2a-3c8cd7a6e587	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/onboarding/06464fa3-e16d-4a77-b3f1-d6c371052bc0/offer-letter/sent/bd29d06f-8ca4-47ec-951b-5ed93041b625.pdf	Offer Letter - Tara Iyer.pdf	application/pdf	19703	f80816b4-1585-4a4b-9cf2-d284a81c8458	2026-11-04 07:17:25.053149+00	\N
f6cbb7ab-4f93-4800-98b2-f485822a54b7	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/onboarding/06464fa3-e16d-4a77-b3f1-d6c371052bc0/offer-letter/sent/6eda3306-50fb-4a13-9bab-16d1887382b8.pdf	Offer Letter - Tara Iyer.pdf	application/pdf	6226	f80816b4-1585-4a4b-9cf2-d284a81c8458	2026-11-04 07:43:10.085916+00	\N
832f06e4-5895-407c-9a46-3313593db8f4	9edca853-7860-4925-b81b-1206dc4298cb	9edca853-7860-4925-b81b-1206dc4298cb/onboarding/58548d3b-dc38-4c83-938f-db38ccd0a7ed/offer-letter/sent/890e4c41-4794-4005-ab3f-cff10dd3f472.pdf	Offer Letter - Roshni Thakor.pdf	application/pdf	6226	f80816b4-1585-4a4b-9cf2-d284a81c8458	2026-11-04 10:34:44.985432+00	\N
\.


--
-- Data for Name: holidays; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.holidays (id, date, name, location, created_by, updated_by, created_at, updated_at, deleted_at, organization_id) FROM stdin;
\.


--
-- Data for Name: leave_balances; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.leave_balances (id, user_id, leave_type_id, cycle_year, opening, accrued, used, pending, created_by, updated_by, created_at, updated_at, deleted_at, organization_id, quota_period, employment_status) FROM stdin;
efb352d6-1963-4603-b829-ddaa8ee44153	50a74013-21fd-4641-8c73-369507b8b7c2	fdbdfe4e-de9a-47db-bfa2-d763fe2ab798	2026	0.00	7.00	0.00	0.00	system	\N	2026-10-16 06:42:35.014578+00	2026-10-16 06:42:35.014578+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
b9f3d563-be54-4351-bf7f-429c97e4c899	50a74013-21fd-4641-8c73-369507b8b7c2	28064c74-0ec4-4773-acde-b2eb7379cd85	2026	0.00	12.00	0.00	2.00	system	devyansh.solanki@shreemaruti.com	2026-10-16 06:42:35.014578+00	2026-10-16 07:00:02.395886+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
94b8dd57-9928-4ef1-8a91-ffff59e521e0	50a74013-21fd-4641-8c73-369507b8b7c2	fae291ef-52d8-4584-b08f-df418dbf27c4	2026	0.00	24.00	0.00	0.50	system	devyansh.solanki@shreemaruti.com	2026-10-16 06:42:35.014578+00	2026-10-16 07:04:55.098098+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
14687c38-725b-4eef-b509-6b4efc54c7f0	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	fae291ef-52d8-4584-b08f-df418dbf27c4	2026	0.00	24.00	0.00	0.00	system	\N	2026-10-16 09:57:21.41562+00	2026-10-16 09:57:21.41562+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
94d97db5-1f92-4bc3-8684-68baba97dc94	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	fdbdfe4e-de9a-47db-bfa2-d763fe2ab798	2026	0.00	7.00	0.00	0.00	system	\N	2026-10-16 09:57:21.41562+00	2026-10-16 09:57:21.41562+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
a3ffdb41-cc3b-4b27-bde1-14ac6c50fadf	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	fae291ef-52d8-4584-b08f-df418dbf27c4	2026	0.00	24.00	0.00	0.00	system	\N	2026-10-16 10:43:47.681871+00	2026-10-16 10:43:47.681871+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
b8855198-87e6-4e2a-9e8e-a756add23d00	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	fdbdfe4e-de9a-47db-bfa2-d763fe2ab798	2026	0.00	7.00	0.00	0.00	system	\N	2026-10-16 10:43:47.681871+00	2026-10-16 10:43:47.681871+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
5b8a1bd9-422b-4c78-9e42-ec9f6b2f2bed	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	28064c74-0ec4-4773-acde-b2eb7379cd85	2026	0.00	12.00	0.00	2.00	system	roshni.thakor@shreemaruti.com	2026-10-16 10:43:47.681871+00	2026-10-16 10:43:47.681871+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
037ff66e-7531-4f7e-9fc6-5db2dec472eb	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	28064c74-0ec4-4773-acde-b2eb7379cd85	2026	0.00	12.00	0.00	0.00	system	test@example.com	2026-10-16 09:57:21.41562+00	2026-10-16 12:08:51.036585+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
a8b7a3ea-ad62-43df-b826-6d80c299b768	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	fae291ef-52d8-4584-b08f-df418dbf27c4	2026	0.00	24.00	0.00	0.00	system	\N	2026-10-20 18:47:14.274576+00	2026-10-20 18:47:14.274576+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
e63f9013-490a-404f-954c-8b3010402613	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	fdbdfe4e-de9a-47db-bfa2-d763fe2ab798	2026	0.00	7.00	0.00	0.00	system	\N	2026-10-20 18:47:14.274576+00	2026-10-20 18:47:14.274576+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
ea19384c-e9b4-4e91-8427-cb6b788fce4c	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	28064c74-0ec4-4773-acde-b2eb7379cd85	2026	0.00	12.00	2.00	0.00	system	harsh.shah@shreemaruti.com	2026-10-20 18:47:14.274576+00	2026-10-22 07:21:50.011921+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
b582dac9-d869-40a9-bfa9-7021534a0a73	f80816b4-1585-4a4b-9cf2-d284a81c8458	fdbdfe4e-de9a-47db-bfa2-d763fe2ab798	2026	0.00	0.00	0.00	2.00	system	system	2026-10-21 04:58:16.844113+00	2026-10-22 10:39:33.011069+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
374b3b25-339a-4ee0-ac6a-e47307d7af51	f80816b4-1585-4a4b-9cf2-d284a81c8458	fae291ef-52d8-4584-b08f-df418dbf27c4	2026	0.00	0.00	0.00	0.00	system	system	2026-10-21 04:58:16.844113+00	2026-10-22 10:39:33.011069+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
c1016140-c9c9-468f-a6d3-00325bb316dc	f80816b4-1585-4a4b-9cf2-d284a81c8458	fdbdfe4e-de9a-47db-bfa2-d763fe2ab798	\N	0.00	2.00	0.00	0.00	system	\N	2026-10-22 10:39:33.023434+00	2026-10-22 10:39:33.023434+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	STATUS_PERIOD	probation
9eaac136-17fb-4c19-a20f-592b1cc0e2ff	f80816b4-1585-4a4b-9cf2-d284a81c8458	28064c74-0ec4-4773-acde-b2eb7379cd85	\N	0.00	2.00	0.00	2.00	system	harsh.shah@shreemaruti.com	2026-10-22 10:39:33.023434+00	2026-10-23 03:57:21.400326+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	STATUS_PERIOD	probation
e511bf00-89b9-4f90-8b52-14c412a6effa	f80816b4-1585-4a4b-9cf2-d284a81c8458	28064c74-0ec4-4773-acde-b2eb7379cd85	2026	0.00	2.00	0.00	1.00	system	system	2026-10-21 04:58:16.844113+00	2026-10-24 05:01:07.742107+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	YEARLY	\N
\.


--
-- Data for Name: leave_guidelines; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.leave_guidelines (id, sort_order, title, description, is_active, created_by, updated_by, created_at, updated_at, deleted_at, organization_id) FROM stdin;
e4ba77a4-2be3-4dcc-a3b6-20d0117c6f2b	1	Advance Notice Requirement	Casual Leave requires at least 1 day prior notice. Earn Leave exceeding 3 consecutive days requires minimum 7 days notice.	t	system	\N	2026-10-13 12:35:29.188654+00	2026-10-13 12:35:29.188654+00	\N	9edca853-7860-4925-b81b-1206dc4298cb
6b1d4dea-09f7-4781-ac29-e1f3b1b2b4f0	2	Half-Day Leave Rules	Half-day leave (First Half or Second Half) is applicable only for Casual Leave and Earn Leave.	t	system	\N	2026-10-13 12:35:29.188654+00	2026-10-13 12:35:29.188654+00	\N	9edca853-7860-4925-b81b-1206dc4298cb
0585bfe4-e56e-4c1a-aaee-4133d29031c4	3	Medical Documentation	Sick leaves extending beyond 2 consecutive working days require a registered medical practitioner certificate upon resumption.	t	system	\N	2026-10-13 12:35:29.188654+00	2026-10-13 12:35:29.188654+00	\N	9edca853-7860-4925-b81b-1206dc4298cb
859c335d-1962-48e2-9e49-6b092f5927f8	4	Year-End Encashment & Carry Forward	Up to 15 Earned Leaves can be carried forward to the subsequent calendar year per Shree Maruti Integrated Logistics policy.	t	system	\N	2026-10-13 12:35:29.188654+00	2026-10-13 12:35:29.188654+00	\N	9edca853-7860-4925-b81b-1206dc4298cb
\.


--
-- Data for Name: leave_request_events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.leave_request_events (id, organization_id, request_id, action, actor_id, remarks, created_at) FROM stdin;
e4fa679b-6927-4145-be1c-6e4d3814f4bf	9edca853-7860-4925-b81b-1206dc4298cb	afc99fae-c00c-4682-ab68-32d48a307786	SUBMITTED	50a74013-21fd-4641-8c73-369507b8b7c2	\N	2026-10-16 07:00:02.395886+00
33e9b024-7965-43e4-96aa-4967c996f8fe	9edca853-7860-4925-b81b-1206dc4298cb	50e2c40d-290a-4186-b72e-5ef5749b38ea	SUBMITTED	50a74013-21fd-4641-8c73-369507b8b7c2	\N	2026-10-16 07:04:55.098098+00
4190bdf1-1a15-4bce-8839-47078617170a	9edca853-7860-4925-b81b-1206dc4298cb	05f2f3c3-87a4-495a-a44f-d4d9f2b203ac	SUBMITTED	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	\N	2026-10-16 10:43:47.681871+00
13e00a4f-0a5b-4d0e-8e52-fdbb98453e61	9edca853-7860-4925-b81b-1206dc4298cb	034c3348-2c76-4505-8b99-51621d2f9316	SUBMITTED	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	\N	2026-10-16 10:55:58.274918+00
d20aacc1-3208-4da6-8794-574544c823b7	9edca853-7860-4925-b81b-1206dc4298cb	034c3348-2c76-4505-8b99-51621d2f9316	WITHDRAWN	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	Withdrawn by employee	2026-10-16 12:08:51.093+00
8bf026c9-6f8b-4e5e-b12f-0469792b4572	9edca853-7860-4925-b81b-1206dc4298cb	afe41c4b-ae31-4b09-bed1-6b92a8759156	SUBMITTED	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	\N	2026-10-20 18:47:14.274576+00
8bcd8ce3-15f9-4374-a833-b1650751ad92	9edca853-7860-4925-b81b-1206dc4298cb	df2c4f41-5d36-4ee0-bc24-2c7fd8848ebe	SUBMITTED	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-21 05:50:03.181239+00
009ed033-0d83-467e-a8a2-552be6007940	9edca853-7860-4925-b81b-1206dc4298cb	198fe7de-833b-452c-a835-0daa21821331	SUBMITTED	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-21 05:51:03.99928+00
da205d34-bda8-4799-89bb-747dc176d490	9edca853-7860-4925-b81b-1206dc4298cb	afe41c4b-ae31-4b09-bed1-6b92a8759156	APPROVED	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-22 07:21:50.019+00
06b5892a-98a0-45bc-8aa8-ed76db5d0a06	9edca853-7860-4925-b81b-1206dc4298cb	5be47b37-34ff-4def-88cb-ab3f34d3796d	SUBMITTED	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-23 03:57:21.400326+00
\.


--
-- Data for Name: leave_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.leave_requests (id, user_id, leave_type_id, from_date, to_date, day_count, half_day, reason, attachment_id, status, applied_on, approver_id, decided_on, remarks, created_by, updated_by, created_at, updated_at, deleted_at, organization_id, reason_category, emergency_contact, handover_to, document_status, cancel_reason, cancelled_on, decided_by, balance_id) FROM stdin;
afc99fae-c00c-4682-ab68-32d48a307786	50a74013-21fd-4641-8c73-369507b8b7c2	28064c74-0ec4-4773-acde-b2eb7379cd85	2026-10-20	2026-10-21	2.0	\N	Cousin wedding	\N	PENDING	2026-10-16 07:00:02.395886+00	\N	\N	\N	devyansh.solanki@shreemaruti.com	\N	2026-10-16 07:00:02.395886+00	2026-10-16 07:00:02.395886+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	FAMILY_FUNCTION	\N	\N	NOT_REQUIRED	\N	\N	\N	b9f3d563-be54-4351-bf7f-429c97e4c899
50e2c40d-290a-4186-b72e-5ef5749b38ea	50a74013-21fd-4641-8c73-369507b8b7c2	fae291ef-52d8-4584-b08f-df418dbf27c4	2026-10-22	2026-10-22	0.5	FIRST_HALF	Cousin's wedding	\N	PENDING	2026-10-16 07:04:55.098098+00	\N	\N	\N	devyansh.solanki@shreemaruti.com	\N	2026-10-16 07:04:55.098098+00	2026-10-16 07:04:55.098098+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	FAMILY_FUNCTION	\N	\N	NOT_REQUIRED	\N	\N	\N	94b8dd57-9928-4ef1-8a91-ffff59e521e0
05f2f3c3-87a4-495a-a44f-d4d9f2b203ac	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	28064c74-0ec4-4773-acde-b2eb7379cd85	2026-10-20	2026-10-21	2.0	\N	Cousin wedding	\N	PENDING	2026-10-16 10:43:47.681871+00	50a74013-21fd-4641-8c73-369507b8b7c2	\N	\N	roshni.thakor@shreemaruti.com	\N	2026-10-16 10:43:47.681871+00	2026-10-16 10:43:47.681871+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	FAMILY_FUNCTION	+919876543210	Ramesh Kumar (Hub Operations)	NOT_REQUIRED	\N	\N	\N	5b8a1bd9-422b-4c78-9e42-ec9f6b2f2bed
034c3348-2c76-4505-8b99-51621d2f9316	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	28064c74-0ec4-4773-acde-b2eb7379cd85	2026-10-19	2026-10-19	1.0	\N	Testing	\N	WITHDRAWN	2026-10-16 10:55:58.274918+00	\N	\N	\N	test@example.com	test@example.com	2026-10-16 10:55:58.274918+00	2026-10-16 12:08:51.036585+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	PERSONAL_WORK	12121212	Rrrr	NOT_REQUIRED	Withdrawn by employee	2026-10-16 12:08:51.093+00	\N	037ff66e-7531-4f7e-9fc6-5db2dec472eb
df2c4f41-5d36-4ee0-bc24-2c7fd8848ebe	f80816b4-1585-4a4b-9cf2-d284a81c8458	28064c74-0ec4-4773-acde-b2eb7379cd85	2026-10-22	2026-10-22	1.0	\N	Personal Work	\N	PENDING	2026-10-21 05:50:03.181239+00	50a74013-21fd-4641-8c73-369507b8b7c2	\N	\N	harsh.shah@shreemaruti.com	\N	2026-10-21 05:50:03.181239+00	2026-10-21 05:50:03.181239+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	PERSONAL_WORK	\N	\N	NOT_REQUIRED	\N	\N	\N	e511bf00-89b9-4f90-8b52-14c412a6effa
198fe7de-833b-452c-a835-0daa21821331	f80816b4-1585-4a4b-9cf2-d284a81c8458	fdbdfe4e-de9a-47db-bfa2-d763fe2ab798	2026-10-19	2026-10-20	2.0	\N	Medical Checkup	\N	PENDING	2026-10-21 05:51:03.99928+00	50a74013-21fd-4641-8c73-369507b8b7c2	\N	\N	harsh.shah@shreemaruti.com	\N	2026-10-21 05:51:03.99928+00	2026-10-21 05:51:03.99928+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	MEDICAL_CHECKUP	\N	\N	NOT_REQUIRED	\N	\N	\N	b582dac9-d869-40a9-bfa9-7021534a0a73
afe41c4b-ae31-4b09-bed1-6b92a8759156	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	28064c74-0ec4-4773-acde-b2eb7379cd85	2026-10-26	2026-10-27	2.0	\N	Cousin wedding	\N	APPROVED	2026-10-20 18:47:14.274576+00	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	2026-10-22 07:21:50.019+00	\N	john.doe@acme.com	harsh.shah@shreemaruti.com	2026-10-20 18:47:14.274576+00	2026-10-22 07:21:50.011921+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	FAMILY_FUNCTION	+919876543210	Ramesh Kumar (Hub Operations)	NOT_REQUIRED	\N	\N	f80816b4-1585-4a4b-9cf2-d284a81c8458	ea19384c-e9b4-4e91-8427-cb6b788fce4c
5be47b37-34ff-4def-88cb-ab3f34d3796d	f80816b4-1585-4a4b-9cf2-d284a81c8458	28064c74-0ec4-4773-acde-b2eb7379cd85	2026-10-24	2026-10-26	2.0	\N	Cousins wedding	\N	PENDING	2026-10-23 03:57:21.400326+00	50a74013-21fd-4641-8c73-369507b8b7c2	\N	\N	harsh.shah@shreemaruti.com	\N	2026-10-23 03:57:21.400326+00	2026-10-23 03:57:21.400326+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	FAMILY_FUNCTION	+919876543210	Ramesh Kumar (Hub Operations)	NOT_REQUIRED	\N	\N	\N	9eaac136-17fb-4c19-a20f-592b1cc0e2ff
\.


--
-- Data for Name: leave_settings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.leave_settings (id, organization_id, week_off, approval_note, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
d54c4fdf-e3d5-4ccd-94c7-a3cdec85b001	9edca853-7860-4925-b81b-1206dc4298cb	{"sunday": "ALL"}	All approvals are routed to reporting managers and subject to HR operations validation.	system	\N	2026-10-13 12:35:29.188654+00	2026-10-13 12:35:29.188654+00	\N
\.


--
-- Data for Name: leave_type_policies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.leave_type_policies (id, organization_id, leave_type_id, employee_type, employment_status, is_allowed, quota, quota_period, min_notice_days, max_consecutive_days, carry_forward_limit, max_retroactive_days, allow_half_day, created_by, updated_by, created_at, updated_at, deleted_at, credit_frequency) FROM stdin;
b0f717af-1fe3-4ad9-8f35-592143881196	9edca853-7860-4925-b81b-1206dc4298cb	fae291ef-52d8-4584-b08f-df418dbf27c4	\N	probation	f	\N	YEARLY	\N	\N	\N	\N	\N	system	\N	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	\N
8bc5c661-d5ae-4c67-8ccb-ba0642e709c5	9edca853-7860-4925-b81b-1206dc4298cb	fdbdfe4e-de9a-47db-bfa2-d763fe2ab798	\N	probation	t	2.0	STATUS_PERIOD	\N	\N	\N	\N	\N	system	\N	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N	\N
bca79672-0b94-4b05-96e7-eafc5c6267f0	9edca853-7860-4925-b81b-1206dc4298cb	28064c74-0ec4-4773-acde-b2eb7379cd85	Full-time	probation	t	2.0	YEARLY	0	1	0.0	0	t	prince.h@shreemaruti.com	\N	2026-10-24 04:58:00.065703+00	2026-10-24 04:58:00.065703+00	\N	UPFRONT
917e1e6f-e737-4f04-82df-0c9fc98a048e	9edca853-7860-4925-b81b-1206dc4298cb	28064c74-0ec4-4773-acde-b2eb7379cd85	\N	probation	t	2.0	STATUS_PERIOD	\N	\N	\N	\N	\N	system	prince.h@shreemaruti.com	2026-10-21 16:44:07.711969+00	2026-10-24 04:58:06.894238+00	2026-10-24 04:58:06.894238+00	\N
\.


--
-- Data for Name: leave_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.leave_types (id, code, name, color, is_active, created_by, updated_by, created_at, updated_at, deleted_at, organization_id, is_paid, sandwich_rule, yearly_quota, min_notice_days, max_consecutive_days, allow_half_day, carry_forward_limit, max_retroactive_days, hint, sort_order, credit_frequency) FROM stdin;
28064c74-0ec4-4773-acde-b2eb7379cd85	CL	Casual Leave	#4F46E5	t	system	prince.h@shreemaruti.com	2026-10-13 12:35:29.188654+00	2026-10-24 04:42:31.787893+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	t	NONE	12.0	1	3	t	0.0	0	\N	1	UPFRONT
fae291ef-52d8-4584-b08f-df418dbf27c4	EL	Earn Leave	#16A34A	t	system	prince.h@shreemaruti.com	2026-10-13 12:35:29.188654+00	2026-10-24 04:54:27.18381+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	t	NONE	24.0	1	\N	t	15.0	0	\N	3	UPFRONT
fdbdfe4e-de9a-47db-bfa2-d763fe2ab798	SL	Sick Leave	#DC2626	t	system	prince.h@shreemaruti.com	2026-10-13 12:35:29.188654+00	2026-10-24 04:55:02.334725+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	t	NONE	7.0	0	\N	t	0.0	3	\N	2	UPFRONT
\.


--
-- Data for Name: master_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.master_items (id, organization_id, master_type_code, name, code, is_active, created_by, updated_by, created_at, updated_at, deleted_at, master_type_id, sort_order) FROM stdin;
40909243-13e7-4e9f-ab5c-c821c476d0a3	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYMENT_TYPE	Full-time	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	4705ee20-4dcc-4565-b9f1-56c5f17356f9	\N
34621597-1226-4027-be17-d9752ae4a7cb	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYMENT_TYPE	Part-time	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	4705ee20-4dcc-4565-b9f1-56c5f17356f9	\N
3ac6a802-71ae-44cf-ae87-5c0b7227f96c	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYMENT_TYPE	Contract	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	4705ee20-4dcc-4565-b9f1-56c5f17356f9	\N
cd012dbc-a9dc-4bb7-b9ad-40ae0c683431	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYMENT_TYPE	Intern	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	4705ee20-4dcc-4565-b9f1-56c5f17356f9	\N
cf6af4c8-aa22-4c30-8d69-dd4458bc96b9	9edca853-7860-4925-b81b-1206dc4298cb	DOCUMENT_TYPE	Aadhaar	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	a913c08c-b5ab-48e2-8fbb-d414f8d73c21	\N
a3176e85-dfa9-4170-8ed0-d90fc8c440de	9edca853-7860-4925-b81b-1206dc4298cb	DOCUMENT_TYPE	PAN	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	a913c08c-b5ab-48e2-8fbb-d414f8d73c21	\N
00f8a166-c2ed-4b6f-a077-a63cb0d9b813	9edca853-7860-4925-b81b-1206dc4298cb	DOCUMENT_TYPE	Passport	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	a913c08c-b5ab-48e2-8fbb-d414f8d73c21	\N
e490cb80-6f29-449c-a663-d0aef55b3d61	9edca853-7860-4925-b81b-1206dc4298cb	DOCUMENT_TYPE	Offer Letter	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	a913c08c-b5ab-48e2-8fbb-d414f8d73c21	\N
6e034c1f-4ff0-4360-b5c7-df035c3915b2	9edca853-7860-4925-b81b-1206dc4298cb	DOCUMENT_TYPE	Experience Letter	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	a913c08c-b5ab-48e2-8fbb-d414f8d73c21	\N
11aa30c6-e850-4123-8d07-fff56700d6ca	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Father	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
d4c12493-029a-4c01-acd5-99f3eee2a237	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Mother	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
2089b9d0-a998-4b70-81d1-74e5fd67c108	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Spouse	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
80944d02-5f61-46f0-9b60-bc162a524558	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Sibling	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
be0e2679-8497-4a92-90ff-964ce3aee71c	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Child	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
ac6d0856-7cb0-46c4-bda9-1859da709515	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Friend	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
78bb6cee-d1db-4035-a006-e9a88328bb8f	9edca853-7860-4925-b81b-1206dc4298cb	REIMBURSEMENT_CATEGORY	Travel	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	923dd954-8659-4c39-866f-388e0bc5801e	\N
9be78634-b837-45c9-8be8-9db97bbbdf18	9edca853-7860-4925-b81b-1206dc4298cb	REIMBURSEMENT_CATEGORY	Internet	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	923dd954-8659-4c39-866f-388e0bc5801e	\N
5bbe258b-7205-4d6d-b53c-a9fc744db991	9edca853-7860-4925-b81b-1206dc4298cb	REIMBURSEMENT_CATEGORY	Medical	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	923dd954-8659-4c39-866f-388e0bc5801e	\N
40b73aa4-f59a-4889-8254-32a66e3cc5d8	9edca853-7860-4925-b81b-1206dc4298cb	REIMBURSEMENT_CATEGORY	Food	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	923dd954-8659-4c39-866f-388e0bc5801e	\N
c52b7341-e9f1-4199-a978-7082d11cfa39	9edca853-7860-4925-b81b-1206dc4298cb	QUALIFICATION	10th	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	8aec880b-1d71-4b49-be13-c13f784f2245	\N
b5059551-d8d7-4761-8e23-1ec71f6881d4	9edca853-7860-4925-b81b-1206dc4298cb	QUALIFICATION	12th	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	8aec880b-1d71-4b49-be13-c13f784f2245	\N
571ff4b1-4cfc-4ed6-8320-e6ee6f17cfb8	9edca853-7860-4925-b81b-1206dc4298cb	QUALIFICATION	Diploma	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	8aec880b-1d71-4b49-be13-c13f784f2245	\N
0de26a29-9df1-4b9a-b791-48711023cad9	9edca853-7860-4925-b81b-1206dc4298cb	QUALIFICATION	Bachelor's	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	8aec880b-1d71-4b49-be13-c13f784f2245	\N
9495a21e-be3f-4303-b0ee-c28e422d7ea5	9edca853-7860-4925-b81b-1206dc4298cb	QUALIFICATION	Master's	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	8aec880b-1d71-4b49-be13-c13f784f2245	\N
bc1f3210-aa01-446b-8303-8842836d31f5	9edca853-7860-4925-b81b-1206dc4298cb	QUALIFICATION	PhD	\N	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N	8aec880b-1d71-4b49-be13-c13f784f2245	\N
afa36269-7fc4-4938-90a0-359acd75584c	9edca853-7860-4925-b81b-1206dc4298cb	HIRING_SOURCE	Referral	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	71346fea-da52-407b-882b-f1e61965748c	\N
6efcc188-83b6-4aac-845a-0f2643e41ee9	9edca853-7860-4925-b81b-1206dc4298cb	HIRING_SOURCE	Job Portal	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	71346fea-da52-407b-882b-f1e61965748c	\N
20e2d2ba-c0f3-45b1-81dc-f1c4b43519ab	9edca853-7860-4925-b81b-1206dc4298cb	HIRING_SOURCE	Campus	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	71346fea-da52-407b-882b-f1e61965748c	\N
e097ca04-6791-46fe-89d2-b08f4c5f766c	9edca853-7860-4925-b81b-1206dc4298cb	HIRING_SOURCE	Consultant	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	71346fea-da52-407b-882b-f1e61965748c	\N
d42ff5bc-eca5-4abf-992b-4fbdc3f09f5d	9edca853-7860-4925-b81b-1206dc4298cb	HIRING_SOURCE	Walk-in	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	71346fea-da52-407b-882b-f1e61965748c	\N
1d7af23a-3b7d-4ca8-8846-32724321014f	9edca853-7860-4925-b81b-1206dc4298cb	HIRING_SOURCE	Direct	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	71346fea-da52-407b-882b-f1e61965748c	\N
67588f46-6bde-4529-b2d9-7a03416db563	9edca853-7860-4925-b81b-1206dc4298cb	VERIFICATION_SOURCE	Background Agency	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	293e68f4-47a4-42dc-b95d-6ad546f1328f	\N
2e0ece75-86fb-45d4-8a92-5412a23f2086	9edca853-7860-4925-b81b-1206dc4298cb	VERIFICATION_SOURCE	Internal HR	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	293e68f4-47a4-42dc-b95d-6ad546f1328f	\N
020f8049-f566-4d86-b307-26e9e669b49c	9edca853-7860-4925-b81b-1206dc4298cb	VERIFICATION_SOURCE	Previous Employer	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	293e68f4-47a4-42dc-b95d-6ad546f1328f	\N
2f97b909-4cea-4149-b139-f5df50cb8607	9edca853-7860-4925-b81b-1206dc4298cb	ZONE	North	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	6881121d-72a0-4a22-b4fc-2b48733f5287	\N
2669937f-813a-4a39-b4c9-a84a47de313c	9edca853-7860-4925-b81b-1206dc4298cb	ZONE	South	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	6881121d-72a0-4a22-b4fc-2b48733f5287	\N
f92e1a2f-84b1-4d6a-ac61-309f85e2158d	9edca853-7860-4925-b81b-1206dc4298cb	ZONE	East	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	6881121d-72a0-4a22-b4fc-2b48733f5287	\N
f4eae34b-3b36-4b1e-8204-153b0a4858a8	9edca853-7860-4925-b81b-1206dc4298cb	ZONE	West	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	6881121d-72a0-4a22-b4fc-2b48733f5287	\N
e0d5cca2-0c0c-4523-ac13-2235d3e29660	9edca853-7860-4925-b81b-1206dc4298cb	ZONE	Central	\N	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	6881121d-72a0-4a22-b4fc-2b48733f5287	\N
6ef12a61-a92a-40e7-ac83-b46970027750	9edca853-7860-4925-b81b-1206dc4298cb	GRADE	G1	G1	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	5ba48071-e45d-4d4f-95e1-907d01ee0060	1
b9cf63ac-fdaf-4450-824a-1b9c4bb90bcd	9edca853-7860-4925-b81b-1206dc4298cb	GRADE	G2	G2	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	5ba48071-e45d-4d4f-95e1-907d01ee0060	2
4f104b94-1fa1-4f44-8e6a-9724d57043f4	9edca853-7860-4925-b81b-1206dc4298cb	GRADE	G3	G3	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	5ba48071-e45d-4d4f-95e1-907d01ee0060	3
abc7fcbd-7737-4baa-a67c-2b92b9a934e8	9edca853-7860-4925-b81b-1206dc4298cb	GRADE	M1	M1	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	5ba48071-e45d-4d4f-95e1-907d01ee0060	4
1b5d1aa8-d336-4626-b777-779c5cf3871a	9edca853-7860-4925-b81b-1206dc4298cb	GRADE	M2	M2	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	5ba48071-e45d-4d4f-95e1-907d01ee0060	5
7464d5b4-5623-4f9f-873f-1e5bf333ced6	9edca853-7860-4925-b81b-1206dc4298cb	LEAVE_REASON	Personal Work	PERSONAL_WORK	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	68d5fb3a-55ad-4465-89b9-d8afb0f32ba0	1
fd6935b0-f26e-47a5-9fbf-0062cf14fd06	9edca853-7860-4925-b81b-1206dc4298cb	LEAVE_REASON	Medical Checkup	MEDICAL_CHECKUP	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	68d5fb3a-55ad-4465-89b9-d8afb0f32ba0	2
4d0a49bc-f3d0-4683-90db-ba2e684b9eff	9edca853-7860-4925-b81b-1206dc4298cb	LEAVE_REASON	Family Function	FAMILY_FUNCTION	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	68d5fb3a-55ad-4465-89b9-d8afb0f32ba0	3
5084887c-d5f0-4485-a0c1-6578ca6e8939	9edca853-7860-4925-b81b-1206dc4298cb	LEAVE_REASON	Emergency	EMERGENCY	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	68d5fb3a-55ad-4465-89b9-d8afb0f32ba0	4
a7980fb4-8a21-4416-8ffd-56846d1bad45	9edca853-7860-4925-b81b-1206dc4298cb	LEAVE_REASON	Out of Town	OUT_OF_TOWN	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N	68d5fb3a-55ad-4465-89b9-d8afb0f32ba0	5
4624c050-5b03-4910-890e-ba7b94f27c20	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYEE_STATUS	Probation	PROBATION	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	b15f0114-442a-4978-b004-68c8b74ed500	1
be067871-457d-4efd-8be9-042d8ddd50a8	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYEE_STATUS	Confirmed	CONFIRMED	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	b15f0114-442a-4978-b004-68c8b74ed500	2
0a7f8285-7430-4412-a5e2-82d246f74b0d	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYEE_STATUS	Notice Period	NOTICE_PERIOD	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	b15f0114-442a-4978-b004-68c8b74ed500	3
5cd1e151-bc3a-4436-8bd7-365e9f67dfae	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYEE_STATUS	Resigned	RESIGNED	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	b15f0114-442a-4978-b004-68c8b74ed500	4
4934fbfb-eb21-4da4-9cc5-17ef95bdb435	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYEE_STATUS	Terminated	TERMINATED	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	b15f0114-442a-4978-b004-68c8b74ed500	5
4d7e4f35-3487-4122-a56d-a7be241baf02	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYEE_STATUS	Retired	RETIRED	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	b15f0114-442a-4978-b004-68c8b74ed500	6
e85adb11-a751-442a-979b-32483b890640	9edca853-7860-4925-b81b-1206dc4298cb	LOCATION_TYPE	Head Office	HEAD_OFFICE	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	1b8eefe3-df12-453b-823b-6eb0e9a0eb19	1
2dc41fba-aa78-4186-bcd9-8213196b3e12	9edca853-7860-4925-b81b-1206dc4298cb	LOCATION_TYPE	Branch	BRANCH	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	1b8eefe3-df12-453b-823b-6eb0e9a0eb19	2
9f75994a-d625-4d63-94e0-f333b91008d2	9edca853-7860-4925-b81b-1206dc4298cb	LOCATION_TYPE	Hub	HUB	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	1b8eefe3-df12-453b-823b-6eb0e9a0eb19	3
0d6cca3a-bf59-4d47-9ef1-1facaf22d789	9edca853-7860-4925-b81b-1206dc4298cb	LOCATION_TYPE	Warehouse	WAREHOUSE	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	1b8eefe3-df12-453b-823b-6eb0e9a0eb19	4
d0bc5294-4fec-4a5f-acd3-bf35deb71442	9edca853-7860-4925-b81b-1206dc4298cb	LOCATION_TYPE	Remote	REMOTE	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N	1b8eefe3-df12-453b-823b-6eb0e9a0eb19	5
9915c48c-fd64-4a2a-a3e9-9eadcd5efee0	9edca853-7860-4925-b81b-1206dc4298cb	EXPENSE_CATEGORY	Travel	TRAVEL	t	system	\N	2026-10-23 11:09:46.515584+00	2026-10-23 11:09:46.515584+00	\N	ccb2def9-2662-4df4-85ed-15e819c29585	1
95c0f3e0-b21f-478a-a1ee-7a7c8033578f	9edca853-7860-4925-b81b-1206dc4298cb	EXPENSE_CATEGORY	Meal	MEAL	t	system	\N	2026-10-23 11:09:46.515584+00	2026-10-23 11:09:46.515584+00	\N	ccb2def9-2662-4df4-85ed-15e819c29585	2
7db775cc-e9a8-4d39-8cd1-01c813611843	9edca853-7860-4925-b81b-1206dc4298cb	EXPENSE_CATEGORY	Hotel	HOTEL	t	system	\N	2026-10-23 11:09:46.515584+00	2026-10-23 11:09:46.515584+00	\N	ccb2def9-2662-4df4-85ed-15e819c29585	3
e979fb3d-a7ae-4c68-a4b1-c41f9d0c68dd	9edca853-7860-4925-b81b-1206dc4298cb	EXPENSE_CATEGORY	Fuel	FUEL	t	system	\N	2026-10-23 11:09:46.515584+00	2026-10-23 11:09:46.515584+00	\N	ccb2def9-2662-4df4-85ed-15e819c29585	4
b26e2aea-ae41-4e38-ae90-136c60783a02	9edca853-7860-4925-b81b-1206dc4298cb	EXPENSE_CATEGORY	Tolls	TOLLS	t	system	\N	2026-10-23 11:09:46.515584+00	2026-10-23 11:09:46.515584+00	\N	ccb2def9-2662-4df4-85ed-15e819c29585	5
b7c47708-ff62-4d8c-bccf-8883fa8dd8b1	9edca853-7860-4925-b81b-1206dc4298cb	EXPENSE_CATEGORY	Office Supplies	OFFICE_SUPPLIES	t	system	\N	2026-10-23 11:09:46.515584+00	2026-10-23 11:09:46.515584+00	\N	ccb2def9-2662-4df4-85ed-15e819c29585	6
76d7a6b6-5f68-4dd5-a8fa-f3bc0519be0e	9edca853-7860-4925-b81b-1206dc4298cb	EXPENSE_CATEGORY	Test	TEST	t	devyansh.solanki@shreemaruti.com	\N	2026-10-23 11:11:50.476874+00	2026-10-23 11:11:50.476874+00	\N	ccb2def9-2662-4df4-85ed-15e819c29585	\N
adff6392-beed-41ea-bbe8-eb7eaf20858a	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYEE_TYPE	Black List	BLACK_LIST	t	system	\N	2026-10-29 12:04:17.135858+00	2026-10-29 12:04:17.135858+00	\N	e118a54b-0996-4e35-a4aa-51aaaa081f4c	1
1327c777-f29a-4e19-b254-91bc73e1ba32	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYEE_TYPE	Blue Collar	BLUE_COLLAR	t	system	\N	2026-10-29 12:04:17.135858+00	2026-10-29 12:04:17.135858+00	\N	e118a54b-0996-4e35-a4aa-51aaaa081f4c	2
dffb040a-f085-4f0e-a723-f981129fd7df	9edca853-7860-4925-b81b-1206dc4298cb	EMPLOYEE_TYPE	White Collar	WHITE_COLLAR	t	system	\N	2026-10-29 12:04:17.135858+00	2026-10-29 12:04:17.135858+00	\N	e118a54b-0996-4e35-a4aa-51aaaa081f4c	3
5de2012f-ee4a-4e38-81ba-2843c416a897	9edca853-7860-4925-b81b-1206dc4298cb	GENDER	Male	MALE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	e5a2615d-2591-4532-bc57-dcd8b344b3eb	1
8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	9edca853-7860-4925-b81b-1206dc4298cb	GENDER	Female	FEMALE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	e5a2615d-2591-4532-bc57-dcd8b344b3eb	2
32debd63-4a95-4f42-911c-1e134b78c3bb	9edca853-7860-4925-b81b-1206dc4298cb	GENDER	Other	OTHER	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	e5a2615d-2591-4532-bc57-dcd8b344b3eb	3
d99c0d14-128f-4466-ac0b-09342149bc5e	9edca853-7860-4925-b81b-1206dc4298cb	GENDER	Prefer not to say	PREFER_NOT_TO_SAY	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	e5a2615d-2591-4532-bc57-dcd8b344b3eb	4
1e6f0afa-00d2-4cc5-9191-5122ebb6debc	9edca853-7860-4925-b81b-1206dc4298cb	MARITAL_STATUS	Single	SINGLE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	47a72686-6b86-46d9-86e5-521b1f40752e	1
29bf9275-8645-4d36-a1fd-f9c8b9ee0841	9edca853-7860-4925-b81b-1206dc4298cb	MARITAL_STATUS	Married	MARRIED	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	47a72686-6b86-46d9-86e5-521b1f40752e	2
03ec2073-aaa7-42a6-9e28-518a508eb184	9edca853-7860-4925-b81b-1206dc4298cb	MARITAL_STATUS	Divorced	DIVORCED	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	47a72686-6b86-46d9-86e5-521b1f40752e	3
50764bf3-777a-49b4-a603-7b1c25693e56	9edca853-7860-4925-b81b-1206dc4298cb	MARITAL_STATUS	Widowed	WIDOWED	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	47a72686-6b86-46d9-86e5-521b1f40752e	4
92c389ff-393a-4fca-b185-850103fbec2a	9edca853-7860-4925-b81b-1206dc4298cb	MARITAL_STATUS	Separated	SEPARATED	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	47a72686-6b86-46d9-86e5-521b1f40752e	5
bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	9edca853-7860-4925-b81b-1206dc4298cb	BLOOD_GROUP	A+	A_POSITIVE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	62a82da3-f181-47a4-aa2e-8c731cbac52a	1
106ff468-5d6c-4743-8d86-0f196a45376a	9edca853-7860-4925-b81b-1206dc4298cb	BLOOD_GROUP	A-	A_NEGATIVE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	62a82da3-f181-47a4-aa2e-8c731cbac52a	2
76a0a528-fe87-4d11-b608-8a6c05f15bd7	9edca853-7860-4925-b81b-1206dc4298cb	BLOOD_GROUP	B+	B_POSITIVE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	62a82da3-f181-47a4-aa2e-8c731cbac52a	3
604cb62b-dc4c-47c0-876e-62fc64fc176a	9edca853-7860-4925-b81b-1206dc4298cb	BLOOD_GROUP	B-	B_NEGATIVE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	62a82da3-f181-47a4-aa2e-8c731cbac52a	4
9b0b0601-b6c3-4be2-889e-4e91c6c2392d	9edca853-7860-4925-b81b-1206dc4298cb	BLOOD_GROUP	AB+	AB_POSITIVE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	62a82da3-f181-47a4-aa2e-8c731cbac52a	5
024d1a90-fb2e-4ba0-bc16-83f6a75f7383	9edca853-7860-4925-b81b-1206dc4298cb	BLOOD_GROUP	AB-	AB_NEGATIVE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	62a82da3-f181-47a4-aa2e-8c731cbac52a	6
d2a3e883-6188-44e2-b4f8-1c45d2cf972f	9edca853-7860-4925-b81b-1206dc4298cb	BLOOD_GROUP	O+	O_POSITIVE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	62a82da3-f181-47a4-aa2e-8c731cbac52a	7
67e33421-717e-4010-8926-fe4ababf87ba	9edca853-7860-4925-b81b-1206dc4298cb	BLOOD_GROUP	O-	O_NEGATIVE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	62a82da3-f181-47a4-aa2e-8c731cbac52a	8
46eaa9b3-5a8f-47f3-86bd-243f172c465a	9edca853-7860-4925-b81b-1206dc4298cb	CITY_TYPE	Metro	METRO	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	acc2eb37-0637-4f4a-8cd2-558591b6ab29	1
57b2f716-e73c-4ebb-9ae4-5c4f3a2a861a	9edca853-7860-4925-b81b-1206dc4298cb	CITY_TYPE	Non Metro	NON_METRO	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	acc2eb37-0637-4f4a-8cd2-558591b6ab29	2
edb5f971-5c50-42cd-bf74-a75f08b98102	9edca853-7860-4925-b81b-1206dc4298cb	PAYROLL_TYPE	Monthly	MONTHLY	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	1689d589-aa6f-41cc-8139-c7c4ee05220e	1
43592452-5adc-46a8-a764-030af5abe3ca	9edca853-7860-4925-b81b-1206dc4298cb	PAYROLL_TYPE	Bi-weekly	BI_WEEKLY	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	1689d589-aa6f-41cc-8139-c7c4ee05220e	2
5eb0ee02-937b-4996-8e5e-ffaa50fe175f	9edca853-7860-4925-b81b-1206dc4298cb	PAYROLL_TYPE	Weekly	WEEKLY	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	1689d589-aa6f-41cc-8139-c7c4ee05220e	3
b94a10e4-00b5-454b-84e2-18ca13176b70	9edca853-7860-4925-b81b-1206dc4298cb	PAYROLL_TYPE	Day Wise	DAILY	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	1689d589-aa6f-41cc-8139-c7c4ee05220e	4
2ed8df0d-3c52-4e9a-abc6-b3fae8568359	9edca853-7860-4925-b81b-1206dc4298cb	PAYROLL_TYPE	Hour Wise	HOURLY	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	1689d589-aa6f-41cc-8139-c7c4ee05220e	5
8145b78e-759c-44d7-b161-a64b2c6f30ff	9edca853-7860-4925-b81b-1206dc4298cb	RELIGION	Hinduism	HINDUISM	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	41306b7b-e0b0-49d9-b064-c7b36f75c353	1
28908ec2-df7d-4469-9342-9541fe4435d4	9edca853-7860-4925-b81b-1206dc4298cb	RELIGION	Islam	ISLAM	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	41306b7b-e0b0-49d9-b064-c7b36f75c353	2
ef6ac44d-52c9-47d3-a193-03d84e2c68ab	9edca853-7860-4925-b81b-1206dc4298cb	RELIGION	Christianity	CHRISTIANITY	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	41306b7b-e0b0-49d9-b064-c7b36f75c353	3
d86a56e7-1928-4f15-9930-91710214585f	9edca853-7860-4925-b81b-1206dc4298cb	RELIGION	Sikhism	SIKHISM	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	41306b7b-e0b0-49d9-b064-c7b36f75c353	4
26671974-c782-4e17-a849-dd244abef8fd	9edca853-7860-4925-b81b-1206dc4298cb	RELIGION	Buddhism	BUDDHISM	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	41306b7b-e0b0-49d9-b064-c7b36f75c353	5
c51fa68b-95ca-4414-8dce-30d0b45f4296	9edca853-7860-4925-b81b-1206dc4298cb	RELIGION	Jainism	JAINISM	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	41306b7b-e0b0-49d9-b064-c7b36f75c353	6
d0662b14-45f4-4d87-b15a-2fbab7523840	9edca853-7860-4925-b81b-1206dc4298cb	RELIGION	Zoroastrianism	ZOROASTRIANISM	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	41306b7b-e0b0-49d9-b064-c7b36f75c353	7
93025abc-0a44-4630-9295-cd05b09e0b3c	9edca853-7860-4925-b81b-1206dc4298cb	RELIGION	Other	OTHER	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	41306b7b-e0b0-49d9-b064-c7b36f75c353	8
6797c806-7f31-483f-8157-d3b0dc346821	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	B.COM	B_COM	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	1
5494f3d1-bd18-43b1-8fcd-bf94631891f0	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	B.SC	B_SC	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	2
1726b993-084e-4c39-9713-722523cf963a	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	B.A	B_A	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	3
c998e7f3-91e3-484a-b9b6-0db94b246d86	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	BBA	BBA	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	4
6bd9318b-0420-4afb-bab9-3cc54ce55a74	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	BCA	BCA	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	5
092f689d-b403-4ea0-a53b-2ad2aa31ef6e	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	B.TECH	B_TECH	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	6
419e3bfe-9dc5-46a8-bb19-6c10aaf976bf	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	B.E	B_E	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	7
2c55b4ae-d7ce-4edd-8e54-36899594f367	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	M.COM	M_COM	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	8
fdb59645-89a6-4a9a-b36a-6fb66c14388d	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	M.SC	M_SC	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	9
ea7d23b7-8b8c-45d0-a98a-42db33bd63ab	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	M.A	M_A	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	10
6e377e6d-b1b0-4b7c-b963-1e24f26d918f	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	MBA - MARKETING	MBA_MARKETING	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	11
70b41bd1-d4f8-4133-8cea-17f93e557f4f	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	MBA - FINANCE	MBA_FINANCE	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	12
866f521f-4061-481a-b36b-eaa6808d6f6a	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	MBA - HR	MBA_HR	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	13
a5829f42-eaf7-4aab-8c3a-a1f90747dba4	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	MCA	MCA	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	14
357c3a63-a464-4e63-a77f-fad3f063ae47	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	M.TECH	M_TECH	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	15
3e2a3cea-56c3-4081-8e91-df74ee686bd0	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	M.E	M_E	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	16
79f0adba-d031-4b6e-bd6c-d5589a8834de	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	MASTER OF SCIENCE - TELECOMMUNICATION NETWORKS	MASTER_OF_SCIENCE_TELECOMMUNICATION_NETWORKS	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	17
2eb4f176-decb-4709-91b6-4560874ce7a7	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	CA	CA	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	18
879f4892-605a-42fb-8bd4-494c5e7de116	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	CS	CS	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	19
6bc0bf4b-24fb-4c31-8db1-431745c4c28e	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	ICWA	ICWA	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	20
263e6f70-40a9-4ba2-86e9-63100f481f96	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	LLB	LLB	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	21
723977a6-55cd-4b46-8358-f453f5da7725	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	MBBS	MBBS	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	22
8abeea94-6680-43b7-ae88-ab971e96f5a8	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	DIPLOMA IN ENGINEERING	DIPLOMA_IN_ENGINEERING	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	23
f88d8eb5-2540-4812-8614-8489772ef78b	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	ITI	ITI	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	24
5ecf363c-c929-44ca-9076-f977f19a23ba	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	ADCA	ADCA	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	25
bf96b5fd-959e-466b-829e-79be096792d3	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	APGDIT	APGDIT	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	26
ec125440-435c-4688-80fb-10e0c2c00b62	9edca853-7860-4925-b81b-1206dc4298cb	DEGREE	AMFI	AMFI	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	91e89aae-8193-4bc4-a63c-b28a615a862e	27
6fad2287-2872-4fe8-9b1c-c9f1990ab2d2	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Son	\N	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
07f087fa-db6f-4d7f-99e5-69fc634d2808	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Daughter	\N	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
ef259c13-2bf4-4284-b854-77065c6614fa	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Brother	\N	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
17103ef0-923c-4111-a5c1-03dbd048c0e1	9edca853-7860-4925-b81b-1206dc4298cb	RELATIONSHIP_TYPE	Sister	\N	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N	2df5edde-be8b-406a-8811-6b5f09551bb3	\N
\.


--
-- Data for Name: master_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.master_types (id, code, name, is_system, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
8aec880b-1d71-4b49-be13-c13f784f2245	QUALIFICATION	Qualification	t	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N
2df5edde-be8b-406a-8811-6b5f09551bb3	RELATIONSHIP_TYPE	Relationship Type	t	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N
a913c08c-b5ab-48e2-8fbb-d414f8d73c21	DOCUMENT_TYPE	Document Type	t	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N
4705ee20-4dcc-4565-b9f1-56c5f17356f9	EMPLOYMENT_TYPE	Employment Type	t	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N
923dd954-8659-4c39-866f-388e0bc5801e	REIMBURSEMENT_CATEGORY	Reimbursement Category	t	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N
b3925285-0898-4a04-9c59-6f2bc5aba320	SKILL	Skill	t	t	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N
71346fea-da52-407b-882b-f1e61965748c	HIRING_SOURCE	Hiring Source	t	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N
293e68f4-47a4-42dc-b95d-6ad546f1328f	VERIFICATION_SOURCE	Verification Source	t	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N
6881121d-72a0-4a22-b4fc-2b48733f5287	ZONE	Zone	t	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N
a8e5a465-baac-45f5-8aaf-97e060ff39b5	COST_CENTER	Cost Center	t	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N
5ba48071-e45d-4d4f-95e1-907d01ee0060	GRADE	Grade	t	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N
68d5fb3a-55ad-4465-89b9-d8afb0f32ba0	LEAVE_REASON	Leave Reason	t	t	system	\N	2026-10-16 12:37:37.761202+00	2026-10-16 12:37:37.761202+00	\N
b15f0114-442a-4978-b004-68c8b74ed500	EMPLOYEE_STATUS	Employee Status	t	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N
1b8eefe3-df12-453b-823b-6eb0e9a0eb19	LOCATION_TYPE	Location Type	t	t	system	\N	2026-10-21 10:30:54.996256+00	2026-10-21 10:30:54.996256+00	\N
ccb2def9-2662-4df4-85ed-15e819c29585	EXPENSE_CATEGORY	Expense Category	t	t	system	\N	2026-10-23 11:09:46.515584+00	2026-10-23 11:09:46.515584+00	\N
e118a54b-0996-4e35-a4aa-51aaaa081f4c	EMPLOYEE_TYPE	Employee Type	t	t	system	\N	2026-10-29 12:04:17.135858+00	2026-10-29 12:04:17.135858+00	\N
e5a2615d-2591-4532-bc57-dcd8b344b3eb	GENDER	Gender	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
47a72686-6b86-46d9-86e5-521b1f40752e	MARITAL_STATUS	Marital Status	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
62a82da3-f181-47a4-aa2e-8c731cbac52a	BLOOD_GROUP	Blood Group	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
acc2eb37-0637-4f4a-8cd2-558591b6ab29	CITY_TYPE	City Type	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
1689d589-aa6f-41cc-8139-c7c4ee05220e	PAYROLL_TYPE	Payroll Type	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
41306b7b-e0b0-49d9-b064-c7b36f75c353	RELIGION	Religion	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
91e89aae-8193-4bc4-a63c-b28a615a862e	DEGREE	Degree / Diploma	t	t	system	\N	2026-11-02 11:42:50.092214+00	2026-11-02 11:42:50.092214+00	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1791532800000	CreateUsersAndRolesTables1791532800000
2	1791619200000	CreatePasswordResetTokensTable1791619200000
3	1791705600000	AddMultiTenancy1791705600000
4	1791705600000	AddEmployeeFieldsToUsers1791705600000
5	1791792000000	CreateUserDetailTables1791792000000
6	1791878400000	CreateFilesAndProfilePictures1791878400000
7	1791964800000	DropProfilePictureFromUserPersonalDetails1791964800000
8	1792051200000	CreateEmployeeCodeSequence1792051200000
9	1792137600000	SyncBiometricIdWithEmployeeCode1792137600000
10	1791878400000	CreateLeaveTables1791878400000
11	1791964800000	UpdateLeavePoliciesAndGuidelines1791964800000
12	1792051200000	AddTeamLeadRole1792051200000
13	1792137600000	ScopeLeaveToOrganizations1792137600000
14	1792224000000	AddLeaveRequestApplyFields1792224000000
15	1792310400000	AddLeaveRequestCancelFields1792310400000
18	1792396800000	CreateMasterTables1792396800000
19	1792483200000	CreateCountriesAndStatesTables1792483200000
20	1792569600000	AddEmergencyContactSecondaryFields1792569600000
21	1792656000000	AddEmergencyContactSecondaryRelationship1792656000000
22	1792310400002	AddLeaveRequestEvents1792310400002
23	1792396800001	AddLeaveRequestDecidedByIndex1792396800001
24	1792742400000	CreateDepartmentsDesignationsBranchesTables1792742400000
25	1792828800000	CreateProfileChangeRequestsTable1792828800000
26	1792742400001	CreatePolicyInfoTable1792742400001
27	1792915200000	ReplaceDepartmentParentWithSubdepartment1792915200000
28	1793001600000	MoveDepartmentHierarchyToParentDepartmentId1793001600000
29	1792828800001	AddMasterTypeIdToMasterItems1792828800001
30	1793088000000	SimplifyLeavePermissions1793088000000
31	1793001600001	AddLookupMasterTypes1793001600001
32	1793001600002	AddMasterItemSortOrder1793001600002
33	1793001600003	AddLeaveReasonMasterType1793001600003
34	1793001600004	CreateBanksTable1793001600004
35	1793001600005	AddWorkDetailMasterItemIds1793001600005
36	1793001600006	AddWorkDetailDepartmentDesignationIds1793001600006
37	1793001600007	AddAddressNationalityBankIds1793001600007
38	1793001600008	AddFamilyEmergencyQualificationItemIds1793001600008
39	1793001600009	AddWorkDetailBranchId1793001600009
40	1793174400000	UserBankNameInsteadOfBankId1793174400000
41	1793260800000	DropDesignationDepartment1793260800000
42	1793347200000	AddUserLoginDevice1793347200000
43	1793433600000	ReplaceLeavePermissions1793433600000
44	1793520000000	DeriveTeamLeavePermissions1793520000000
46	1793606400000	AlignUserWorkPersonalEnums1793606400000
48	1793692800000	AddEmployeeStatusLocationTypeMasterTypes1793692800000
49	1793520000001	CreateCurrenciesTable1793520000001
50	1793606400001	AddCurrencyRatesAndOrganizationCurrencies1793606400001
51	1793779200000	AddLeaveTypeRulesAndPolicies1793779200000
52	1793865600000	AddWorkDetailLocationEmploymentStatusItemIds1793865600000
53	1793952000000	SwitchLeaveToLeaveTypeRules1793952000000
54	1794038400000	AddLeaveCreditFrequencyAndNoticeStartDate1794038400000
55	1793520000002	CreateExpenseRequests1793520000002
56	1794124800000	AddExpenseCategoryMasterType1794124800000
57	1794124800001	MoveDraftExpenseItemsToExpenseCategory1794124800001
58	1794038400001	CreateExpensePolicyDocuments1794038400001
59	1794211200000	CreateAccessControl1794211200000
60	1794297600000	DataPermissionGroupRules1794297600000
61	1794384000000	ModuleAccessMenuIds1794384000000
62	1794470400000	ReseedHrMenus1794470400000
63	1794556800000	DropDataPermissionGroupAllAccess1794556800000
64	1794643200000	AddAppModuleTabName1794643200000
65	1794729600000	AddEmployeeTypeMasterType1794729600000
66	1794816000000	AddWorkDetailEmployeeTypeId1794816000000
67	1794902400000	EmployeeModuleMenuAccess1794902400000
68	1794988800000	AddWorkDetailLastWorkingDate1794988800000
69	1794988800001	AddJoineeFormMasterTypes1794988800001
70	1794988800002	AddCitiesAndProfileMasterIds1794988800002
71	1794988800003	AddSalaryStructureMasterType1794988800003
72	1795075200000	CreateCandidates1795075200000
73	1795161600000	CreateOnboardingBoard1795161600000
74	1795161600001	CreateSalaryStructures1795161600001
75	1795248000000	AddOnboardingStatusStages1795248000000
76	1795248000001	RenameCandidateStageStatuses1795248000001
77	1795334400000	CreateCandidatePortalLinks1795334400000
78	1795334400001	CreateOfferLetterTemplates1795334400001
79	1795420800000	AddJoineeFormSubmission1795420800000
80	1795420800001	CreateOfferLetters1795420800001
81	1795507200000	AddCandidateJoineeFormDraft1795507200000
82	1795507200001	AddOfferLetterResponse1795507200001
\.


--
-- Data for Name: offer_letter_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.offer_letter_attachments (offer_letter_id, file_id, organization_id, sort_order) FROM stdin;
\.


--
-- Data for Name: offer_letter_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.offer_letter_templates (id, organization_id, name, code, header_html, body_html, footer_html, is_active, sort_order, version, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
512596b0-ad4a-411f-b77f-dbd34b41b980	9edca853-7860-4925-b81b-1206dc4298cb	Intent to Offer	INTENT_TO_OFFER	<p style="text-align:center;font-size:20px;"><strong>Shree Maruti</strong></p>\n<p style="text-align:center;">Corporate Office : 52A - TITANIUM, Near Prahladnagar Garden, Corporate Road, Ahmedabad (Gujarat) - 380015. | PH: 079-40394918</p>	<p>{{TODAYDATE}}</p>\n<p>{{candidate_name}}</p>\n<p>{{CANDIDATE_ADDRESS}}</p>\n<p><br></p>\n<p style="text-align:center;"><strong>Subject</strong>: Intent to offer</p>\n<p>{{salutation}} {{candidate_name}}</p>\n<p>Following your successful interview process, it is our pleasure to extend an offer to you for the position of {{designation}} at Shree Maruti Integrated Logistics Limited "SMILe". This role will be stationed at {{LOCATION}}. Please be advised that SMILe reserves the right to modify your position, duties, responsibilities, or location as deemed necessary, which may include relocation within India.</p>\n<p>Kindly note that this offer and your subsequent employment with SMILe are contingent upon the satisfactory completion of reference checks and the verification of your qualifications, work experience, and other background information provided.</p>\n<p><strong>A. Commencement Date: </strong>Your employment with SMILe will commence on {{JOINING_DATE}} as specified herein or on any other date mutually agreed upon in writing by both parties prior to your commencement of duties.</p>\n<p><strong>B. Probationary Period: </strong>For the initial six (6) months from the commencement date, your employment shall be deemed probationary. Upon the conclusion of this probationary period, your continuation of service with SMILe shall be contingent upon satisfactory conduct and performance evaluation.</p>\n<p><strong>C. Termination:</strong> Subject to the probationary period, either party may terminate employment by providing one months' written notice. Also, SMILe reserves the discretion to remunerate you in lieu of notice should your services no longer be required. Termination notices by either party shall be conveyed in writing.</p>\n<p><strong>D. Remuneration and Benefits:</strong></p>\n<p>a. Your compensation package includes an annual salary/CTC of INR {{candidate_CTC}} {{CANDIDATE_CTC_IN_WORDS}} as detailed in the annexure provided herewith. It is imperative to note that you are solely responsible for all statutory taxes and applicable duties arising from the remuneration and benefits received from SMILe under this employment.</p>\n<p>Matters pertaining to compensation and/or salary are considered strictly confidential by SMILe. You are expected to uphold the highest levels of integrity and discretion in maintaining the confidentiality of such information during your tenure with the company.</p>\n<p>b. In addition to your remuneration, you shall be entitled to a total of 35 leaves per calendar year, as per SMILe's leave policy. This allocation includes earned leaves, sick leaves, and casual leaves.</p>\n<p>c. Further benefits, such as maternity or paternity leaves, bereavement leaves, and public holidays, are available to you in accordance with SMILe's leave policy.</p>\n<p>d. Comprehensive medical insurance and personal accident insurance coverage will be provided to you throughout your employment tenure, in compliance with SMILe's policies.</p>\n<p>e. You are eligible to enroll in the Employee Provident Fund Scheme, subject to the prevailing rules and regulations. It is imperative that you submit the necessary enrollment or transfer forms to the HR Department immediately upon joining.</p>\n<p>f. Your retirement from SMILe's employment is set at 58 years of age, or as may be stipulated in SMILe's HR policy from time to time. You are entitled to retirement benefits as per applicable laws and SMILe's policies.</p>\n<p><strong>E. Employment Verification:</strong></p>\n<p>Your employment with Shree Maruti Integrated Logistics Limited (‘SMILe’) is contingent upon the submission of all requisite documents as outlined below and the successful completion of a background check conducted by our HR team.</p>\n<p>The company retains the right to rescind its offer of employment should the results of the background verification process prove unfavorable at any juncture. Furthermore, in the event that your background verification report is found to be unfavorable or unsuccessful subsequent to your commencement of employment, SMILe reserves the right to terminate your employment.</p>\n<p><strong>F. Compliance with Company Policies:</strong></p>\n<p>As a condition of your employment with Shree Maruti Integrated Logistics Limited (‘SMILe’), you are obligated to adhere to the company's rules, processes, and policies, which are accessible via the company's Employee Self-Service (ESS) Portal. It is imperative that you regularly review these policies for updates, as the company reserves the right to modify them without prior notice. Non-compliance with company policies may result in disciplinary action, up to and including termination of employment, without prior notice.</p>\n<p><strong>G. Acceptance of this offer:</strong></p>\n<p>This offer of employment remains valid for acceptance by you for a period of 3 working days from the date of receipt. Upon your timely acceptance of this offer, the terms outlined in this letter shall constitute a legally binding employment agreement between yourself and Shree Maruti Integrated Logistics Limited (‘SMILe’), effective from the commencement of your employment.</p>\n<p>Please signify your acceptance of the terms and conditions outlined herein by signing and returning a copy of this letter, including any annexures, at your earliest convenience.</p>\n<p>Best Regards,</p>\n<p style="line-height:1;">Bhavesh Katariya</p>\n<p style="line-height:1;">Authorised Signatory</p>\n<p style="line-height:1;">Shree Maruti Integrated Logistics Limited</p>\n<p><br></p>\n<p style="text-align:center;"><strong>Annexure - I</strong></p>\n<p style="text-align:center;">{{salary_structure}}</p>	<p style="text-align:center;"><strong>SHREE MARUTI INTEGRATED LOGISTICS LIMITED</strong></p>\n<p style="text-align:center;">(Formerly known as Shree Maruti Courier Services Private Limited)</p>\n<p style="text-align:center;">Regd. Office: "Shree Maruti House", 5 Jagnath Road, Off. Radhakrishna Road, Rajkot (Gujarat) - 360001.</p>\n<p style="text-align:center;">www.shreemaruti.com | CIN: U64120GJ1987PLC010124 | corp@shreemaruti.com</p>	t	1	1	system	\N	2026-11-03 11:35:13.079+00	2026-11-03 11:35:13.079+00	\N
\.


--
-- Data for Name: offer_letters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.offer_letters (id, organization_id, candidate_id, stage_id, template_id, template_name, subject, to_email, cc_emails, external_email, header_html, body_html, footer_html, pdf_file_id, sent_by_user_id, sent_by, sent_at, response_token_hash, response_expires_at, revoked_at, accepted_at, rejected_at, rejection_reason, response_ip, response_user_agent) FROM stdin;
f92b96bc-0ca4-4dff-bb1f-2b41df532569	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	0817a8f7-5c4d-4989-b065-6335a0a024d7	512596b0-ad4a-411f-b77f-dbd34b41b980	Intent to Offer	Offer Letter - Shree Maruti Integrated Logistics Limited	tara.iyer@example.com	{roshni.thakor@shreemaruti.com,consultant@example.org}	consultant@example.org	string	string	string	6b58b1fe-def7-4a6d-b139-a2ef42de740a	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	2026-11-04 06:21:51.836305+00	\N	\N	\N	\N	\N	\N	\N	\N
4fc2c527-d5d1-4a5c-9018-00a6482dbfd9	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	0817a8f7-5c4d-4989-b065-6335a0a024d7	512596b0-ad4a-411f-b77f-dbd34b41b980	Intent to Offer	Offer Letter - Shree Maruti Integrated Logistics Limited	tara.iyer@example.com	{roshni.thakor@shreemaruti.com,consultant@example.org}	consultant@example.org	string	string	string	56ee3d47-1a84-49e3-b11c-b8a38c690859	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	2026-11-04 07:07:19.727661+00	\N	\N	\N	\N	\N	\N	\N	\N
6cd54041-ca57-4a00-b89a-1445d18b328b	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	0817a8f7-5c4d-4989-b065-6335a0a024d7	512596b0-ad4a-411f-b77f-dbd34b41b980	Intent to Offer	Offer Letter - Shree Maruti Integrated Logistics Limited	tara.iyer@example.com	{roshni.thakor@shreemaruti.com,rohan.mehta@example.com,consultant@example.org}	consultant@example.org	<p style="text-align:center"><strong>Shree Maruti</strong></p>	<p>04 November 2026</p><p>Dear Tara Iyer,</p><p>We are pleased to offer you the position of Team Lead at Shree Maruti Integrated Logistics Limited, Pune. Your joining date is 01 March 2027 and your annual CTC is INR 14,50,000 (Rupees Fourteen Lakh Fifty Thousand Only).</p><p>Best Regards,<br />Bhavesh Katariya</p><p style="text-align:center"><strong>Annexure - I</strong></p><p style="text-align:center">Band A</p>	<p style="text-align:center">www.shreemaruti.com | corp@shreemaruti.com</p>	bd9a3684-886c-4f0f-8a2a-3c8cd7a6e587	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	2026-11-04 07:17:25.053149+00	\N	\N	\N	\N	\N	\N	\N	\N
573d9375-596c-40dd-81cf-adff9abb9921	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	0817a8f7-5c4d-4989-b065-6335a0a024d7	512596b0-ad4a-411f-b77f-dbd34b41b980	Intent to Offer	Offer Letter - Shree Maruti Integrated Logistics Limited	tara.iyer@example.com	{consultant@example.org}	consultant@example.org	string	string	string	f6cbb7ab-4f93-4800-98b2-f485822a54b7	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	2026-11-04 07:43:10.085916+00	\N	\N	\N	\N	\N	\N	\N	\N
72c5c7b3-7551-4bef-86bf-0cab0ccb87f6	9edca853-7860-4925-b81b-1206dc4298cb	58548d3b-dc38-4c83-938f-db38ccd0a7ed	0817a8f7-5c4d-4989-b065-6335a0a024d7	512596b0-ad4a-411f-b77f-dbd34b41b980	Intent to Offer	Offer Letter - Shree Maruti Integrated Logistics Limited	roshni.thakor@shreemaruti.com	{hr.head@example.com,consultant@example.org}	consultant@example.org	string	string	string	832f06e4-5895-407c-9a46-3313593db8f4	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	2026-11-04 10:34:44.985432+00	e60aacf04521cd316e7d91c66d9e0d2b16ccbc18c4e4f2302a9d1bf77644f67d	2026-11-09 18:29:59.999+00	\N	2026-11-04 10:36:17.98032+00	\N	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36
\.


--
-- Data for Name: onboarding_candidate_events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.onboarding_candidate_events (id, organization_id, candidate_id, event_type, method, from_stage_id, to_stage_id, actor_id, actor_name, remark, payload, created_at) FROM stdin;
7f389a0a-7abd-4e23-bda8-197fa317d11b	9edca853-7860-4925-b81b-1206dc4298cb	0e9e6a42-33e2-4b9f-b738-14d3d37454a8	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
29c7a1b2-ada2-4990-be1f-8b67bab0f5c8	9edca853-7860-4925-b81b-1206dc4298cb	d0996a72-0660-44db-89c1-718af0cac1f4	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
a98272d7-5c70-4ab3-96ab-55b47ce05221	9edca853-7860-4925-b81b-1206dc4298cb	7a1477cb-3221-4208-9251-8f4638504988	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
df91bae3-ea57-4288-9511-40ef7603123e	9edca853-7860-4925-b81b-1206dc4298cb	9741dc32-1481-450c-a7b2-a2988f77bb33	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
e9c8b2c0-dfa1-4f43-8fa5-4735e9ec8949	9edca853-7860-4925-b81b-1206dc4298cb	7fe2bbe8-55d3-40ab-8177-92b04e616ab0	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
527fe8e9-d15d-4636-886e-bd9f73bda114	9edca853-7860-4925-b81b-1206dc4298cb	caf58d25-9d52-4ca1-9f2b-7e53b8e02633	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
85a586b9-e2f5-4261-8a12-30f2ffc28612	9edca853-7860-4925-b81b-1206dc4298cb	3b4e1a5a-ba84-4f08-87be-6bb2cf29d1e8	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
38b7c9bf-2ad5-450c-896a-1b9b3e54f320	9edca853-7860-4925-b81b-1206dc4298cb	14aba31d-01a9-4892-b733-21bfb634b1e2	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
c83394e2-c6fd-40cc-9152-d975e0d930b2	9edca853-7860-4925-b81b-1206dc4298cb	1e96b728-17d0-4942-82f6-aa5c50efb202	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
e29af727-d771-43e6-a9e1-4304657c9d47	9edca853-7860-4925-b81b-1206dc4298cb	fc5ad563-eac6-41ec-b622-40453e808e06	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
b784bb5a-a429-4871-8176-8bffead0092d	9edca853-7860-4925-b81b-1206dc4298cb	4f9c9d40-e6c6-445f-911b-87397807eca9	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
d5162504-9c46-475e-8897-cd09f79d0c44	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	created	system	\N	24f41013-0ce3-412d-8d05-05f71664e8d7	\N	seed	\N	\N	2026-11-03 04:35:07.252227+00
483e104e-a340-4c89-a306-1df2b462a945	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	status_changed	manual	24f41013-0ce3-412d-8d05-05f71664e8d7	fe898d54-14cf-4e74-a63d-e6ac3f0d8f4b	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	Better Opportunity	{"status": {"to": "withdrawn", "from": "active"}}	2026-11-03 09:47:52.683738+00
661ca2fb-caff-4301-9214-cf59af2925a6	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	status_changed	manual	fe898d54-14cf-4e74-a63d-e6ac3f0d8f4b	6e70c8d7-f09b-48b2-805b-def721781fd0	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	string	{"status": {"to": "deleted", "from": "withdrawn"}}	2026-11-03 09:49:13.379342+00
c318fd5f-6d64-4f2b-ac78-099fe443fc5c	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	status_changed	manual	6e70c8d7-f09b-48b2-805b-def721781fd0	fe898d54-14cf-4e74-a63d-e6ac3f0d8f4b	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	\N	{"status": "withdrawn", "restored": true}	2026-11-03 09:50:40.532819+00
fc21a4a5-f424-4028-b89f-34ea8c039162	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	status_changed	manual	fe898d54-14cf-4e74-a63d-e6ac3f0d8f4b	24f41013-0ce3-412d-8d05-05f71664e8d7	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	\N	{"status": {"to": "active", "from": "withdrawn"}}	2026-11-03 09:51:42.680577+00
3e1e2ae0-5c7b-44eb-8788-4af697b0eb07	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	stage_moved	manual	24f41013-0ce3-412d-8d05-05f71664e8d7	b1c2eab3-f99a-40bf-96a2-34bfe297df06	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	string	{"direction": "next"}	2026-11-03 11:38:36.675319+00
3ab2d48f-cb6e-466a-ab41-8be070e2ea4b	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	stage_moved	manual	b1c2eab3-f99a-40bf-96a2-34bfe297df06	0817a8f7-5c4d-4989-b065-6335a0a024d7	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	string	{"direction": "next"}	2026-11-03 11:38:51.326844+00
d79da606-c008-4705-acac-45e5638e7d22	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	stage_action	action	0817a8f7-5c4d-4989-b065-6335a0a024d7	0817a8f7-5c4d-4989-b065-6335a0a024d7	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	\N	{"cc": ["roshni.thakor@shreemaruti.com", "consultant@example.org"], "action": "offer_letter_sent", "resent": false, "sentTo": "tara.iyer@example.com", "templateId": "512596b0-ad4a-411f-b77f-dbd34b41b980", "offerLetterId": "f92b96bc-0ca4-4dff-bb1f-2b41df532569", "attachmentCount": 0}	2026-11-04 06:21:51.836305+00
32f439aa-d01b-472c-a21a-50e079ce0ba2	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	stage_action	action	0817a8f7-5c4d-4989-b065-6335a0a024d7	0817a8f7-5c4d-4989-b065-6335a0a024d7	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	\N	{"cc": ["roshni.thakor@shreemaruti.com", "consultant@example.org"], "action": "offer_letter_sent", "resent": true, "sentTo": "tara.iyer@example.com", "templateId": "512596b0-ad4a-411f-b77f-dbd34b41b980", "offerLetterId": "4fc2c527-d5d1-4a5c-9018-00a6482dbfd9", "attachmentCount": 0}	2026-11-04 07:07:19.727661+00
a93e1d77-5f39-471a-b276-ac1083b04247	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	stage_action	action	0817a8f7-5c4d-4989-b065-6335a0a024d7	0817a8f7-5c4d-4989-b065-6335a0a024d7	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	\N	{"cc": ["roshni.thakor@shreemaruti.com", "rohan.mehta@example.com", "consultant@example.org"], "action": "offer_letter_sent", "resent": true, "sentTo": "tara.iyer@example.com", "templateId": "512596b0-ad4a-411f-b77f-dbd34b41b980", "offerLetterId": "6cd54041-ca57-4a00-b89a-1445d18b328b", "attachmentCount": 0}	2026-11-04 07:17:25.053149+00
b10a65bc-bfde-49e6-b7a2-2eb8844aa50f	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	stage_action	action	0817a8f7-5c4d-4989-b065-6335a0a024d7	0817a8f7-5c4d-4989-b065-6335a0a024d7	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	\N	{"cc": ["consultant@example.org"], "action": "offer_letter_sent", "resent": true, "sentTo": "tara.iyer@example.com", "templateId": "512596b0-ad4a-411f-b77f-dbd34b41b980", "offerLetterId": "573d9375-596c-40dd-81cf-adff9abb9921", "attachmentCount": 0}	2026-11-04 07:43:10.085916+00
52a77902-8547-4f11-8048-bb0113f81751	9edca853-7860-4925-b81b-1206dc4298cb	58548d3b-dc38-4c83-938f-db38ccd0a7ed	created	system	\N	0817a8f7-5c4d-4989-b065-6335a0a024d7	\N	roshni.thakor@shreemaruti.com	\N	\N	2026-11-04 10:33:20.121364+00
fc541ea6-6a5b-4d4e-a7bc-210aa55bfcbf	9edca853-7860-4925-b81b-1206dc4298cb	58548d3b-dc38-4c83-938f-db38ccd0a7ed	stage_action	action	0817a8f7-5c4d-4989-b065-6335a0a024d7	0817a8f7-5c4d-4989-b065-6335a0a024d7	f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	\N	{"cc": ["hr.head@example.com", "consultant@example.org"], "action": "offer_letter_sent", "resent": false, "sentTo": "roshni.thakor@shreemaruti.com", "templateId": "512596b0-ad4a-411f-b77f-dbd34b41b980", "offerLetterId": "72c5c7b3-7551-4bef-86bf-0cab0ccb87f6", "attachmentCount": 0}	2026-11-04 10:34:44.985432+00
da7889e4-32d9-4e40-819c-6bb9e6dc1f3c	9edca853-7860-4925-b81b-1206dc4298cb	58548d3b-dc38-4c83-938f-db38ccd0a7ed	stage_action	action	0817a8f7-5c4d-4989-b065-6335a0a024d7	0817a8f7-5c4d-4989-b065-6335a0a024d7	\N	roshni.thakor@shreemaruti.com	\N	{"action": "offer_letter_approved", "offerLetterId": "72c5c7b3-7551-4bef-86bf-0cab0ccb87f6"}	2026-11-04 10:36:17.98032+00
3d4b60f5-3886-49d0-99af-6103a6e1c03e	9edca853-7860-4925-b81b-1206dc4298cb	58548d3b-dc38-4c83-938f-db38ccd0a7ed	stage_moved	action	0817a8f7-5c4d-4989-b065-6335a0a024d7	b4567999-d1de-406c-aacc-b5ec6bec41da	\N	roshni.thakor@shreemaruti.com	\N	{"direction": "next"}	2026-11-04 10:36:17.98032+00
\.


--
-- Data for Name: onboarding_candidate_stages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.onboarding_candidate_stages (id, organization_id, candidate_id, stage_id, entered_at, entered_by, entered_method, completed_at, completed_by, completion) FROM stdin;
ee80e5fe-2c8e-494f-91fe-04f71a8341d9	9edca853-7860-4925-b81b-1206dc4298cb	0e9e6a42-33e2-4b9f-b738-14d3d37454a8	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
e7775774-9dc3-4e98-8efd-9a44a1f4fe2a	9edca853-7860-4925-b81b-1206dc4298cb	d0996a72-0660-44db-89c1-718af0cac1f4	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
cf00a819-fc21-4948-8112-0d089b91375f	9edca853-7860-4925-b81b-1206dc4298cb	7a1477cb-3221-4208-9251-8f4638504988	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
2b94660f-e35a-4c2b-8070-d35b3c1c51b7	9edca853-7860-4925-b81b-1206dc4298cb	9741dc32-1481-450c-a7b2-a2988f77bb33	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
0faec2b2-d5aa-48bb-a2a0-61ce4f5fda97	9edca853-7860-4925-b81b-1206dc4298cb	7fe2bbe8-55d3-40ab-8177-92b04e616ab0	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
5a4b4bbe-7dd3-434e-afaf-17b484d70119	9edca853-7860-4925-b81b-1206dc4298cb	caf58d25-9d52-4ca1-9f2b-7e53b8e02633	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
1bf0b6e7-aa35-4917-9194-dceb5f7e1b65	9edca853-7860-4925-b81b-1206dc4298cb	3b4e1a5a-ba84-4f08-87be-6bb2cf29d1e8	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
18bb0222-4d45-48d0-9887-70f4c602d1e8	9edca853-7860-4925-b81b-1206dc4298cb	14aba31d-01a9-4892-b733-21bfb634b1e2	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
e7e5ce93-618b-41a3-a61e-8afd96dd560e	9edca853-7860-4925-b81b-1206dc4298cb	1e96b728-17d0-4942-82f6-aa5c50efb202	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
60ace4e1-f159-4257-a004-26e69d17c015	9edca853-7860-4925-b81b-1206dc4298cb	fc5ad563-eac6-41ec-b622-40453e808e06	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
4af2e5b4-be0f-45cc-891a-ce224f9899d7	9edca853-7860-4925-b81b-1206dc4298cb	4f9c9d40-e6c6-445f-911b-87397807eca9	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	\N	\N	\N
d19871bd-d4d3-4599-8b8c-7a33ce5caab9	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	24f41013-0ce3-412d-8d05-05f71664e8d7	2026-11-03 04:35:07.252227+00	seed	system	2026-11-03 11:38:36.681+00	harsh.shah@shreemaruti.com	manual_skip
ac961457-0c6b-486b-a032-237f0074ee55	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	b1c2eab3-f99a-40bf-96a2-34bfe297df06	2026-11-03 11:38:36.681+00	harsh.shah@shreemaruti.com	manual	2026-11-03 11:38:51.329+00	harsh.shah@shreemaruti.com	manual_skip
d1485000-fd4b-45d8-928e-20742dbf5d24	9edca853-7860-4925-b81b-1206dc4298cb	06464fa3-e16d-4a77-b3f1-d6c371052bc0	0817a8f7-5c4d-4989-b065-6335a0a024d7	2026-11-03 11:38:51.329+00	harsh.shah@shreemaruti.com	manual	\N	\N	\N
39732c3d-2ea3-4b66-bc28-59d1a63c6103	9edca853-7860-4925-b81b-1206dc4298cb	58548d3b-dc38-4c83-938f-db38ccd0a7ed	0817a8f7-5c4d-4989-b065-6335a0a024d7	2026-11-04 10:33:20.121364+00	roshni.thakor@shreemaruti.com	system	2026-11-04 10:36:17.993+00	roshni.thakor@shreemaruti.com	action
7dcc1c0a-c241-4f65-8772-23ded2f92cf1	9edca853-7860-4925-b81b-1206dc4298cb	58548d3b-dc38-4c83-938f-db38ccd0a7ed	b4567999-d1de-406c-aacc-b5ec6bec41da	2026-11-04 10:36:17.993+00	roshni.thakor@shreemaruti.com	action	\N	\N	\N
\.


--
-- Data for Name: onboarding_stages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.onboarding_stages (id, organization_id, workflow_id, stage_type, name, sort_order, supports_automation, automation_enabled, automation_config, is_terminal, is_active, created_at, created_by, updated_at, updated_by, deleted_at, kind) FROM stdin;
24f41013-0ce3-412d-8d05-05f71664e8d7	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	add_candidate_ctc	Add Candidate CTC	1	f	f	\N	f	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
b1c2eab3-f99a-40bf-96a2-34bfe297df06	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	ctc_approval	CTC Approval	2	f	f	\N	f	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
0817a8f7-5c4d-4989-b065-6335a0a024d7	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	offer_letter_initiation	Offer Letter Initiation	3	t	f	\N	f	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
b4567999-d1de-406c-aacc-b5ec6bec41da	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	candidate_joinee_form	Candidate Joinee Form	4	t	f	\N	f	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
e2082a6d-5ce2-4802-8a51-7ae1aa28d16a	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	verify_candidate_details	Verify Candidate Details	5	f	f	\N	f	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
37e8023c-14d4-419a-bc85-39bf3fbe7693	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	welcome_mail	Welcome Mail	6	t	f	\N	f	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
4dfd39d0-63e2-4e40-bef3-8d7fe6a5339a	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	convert_to_employee	Convert to Employee	7	f	f	\N	f	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
02b6e99a-8e20-4103-b833-34044d1ef0bd	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	employee_credentials	Employee Credentials	8	f	f	\N	f	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
137563bb-efef-4bb8-9acf-dd07fa9e0c6d	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	appointment_letter_initiation	Appointment Letter Initiation	9	t	f	\N	f	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
7771fa8b-16e8-4019-a230-a8e693ad9c24	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	onboarded	Onboarded	10	f	f	\N	t	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N	process
fe898d54-14cf-4e74-a63d-e6ac3f0d8f4b	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	withdrawn	Withdrawn Candidates	11	f	f	\N	f	t	2026-11-03 05:42:23.915692+00	system	2026-11-03 05:42:23.915692+00	system	\N	status
e111e157-62f4-4399-ab89-fec70728327d	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	blacklisted	Blacklisted Candidates	12	f	f	\N	f	t	2026-11-03 05:42:23.915692+00	system	2026-11-03 05:42:23.915692+00	system	\N	status
6e70c8d7-f09b-48b2-805b-def721781fd0	9edca853-7860-4925-b81b-1206dc4298cb	ee54ba04-ecd4-4bfa-8837-57a3168de77a	deleted	Deleted Candidates	13	f	f	\N	f	t	2026-11-03 05:42:23.915692+00	system	2026-11-03 05:42:23.915692+00	system	\N	status
\.


--
-- Data for Name: onboarding_workflows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.onboarding_workflows (id, organization_id, name, is_default, is_active, created_at, created_by, updated_at, updated_by, deleted_at) FROM stdin;
ee54ba04-ecd4-4bfa-8837-57a3168de77a	9edca853-7860-4925-b81b-1206dc4298cb	Default	t	t	2026-11-03 04:06:05.088278+00	system	2026-11-03 04:06:05.088278+00	system	\N
\.


--
-- Data for Name: organization_currencies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organization_currencies (id, organization_id, currency_id, exchange_rate, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organizations (id, name, slug, status, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
9edca853-7860-4925-b81b-1206dc4298cb	Default Organization	default	active	system	\N	2026-10-12 10:29:31.917337+00	2026-10-12 10:29:31.917337+00	\N
\.


--
-- Data for Name: otp_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.otp_logs (id, mobile_number, otp_code, purpose, expires_at, attempts, is_verified, verified_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.password_reset_tokens (id, user_id, token_hash, expires_at, used_at, requested_ip, created_at) FROM stdin;
09a42458-1720-4c77-9cf8-fce18965399d	50a74013-21fd-4641-8c73-369507b8b7c2	fa3b78ac7c999dbd127cb096fa5620409e6315599c2ac49b62bc15c074c56a0e	2026-10-10 11:38:15.431+00	2026-10-10 11:48:43.549+00	202.131.96.18	2026-10-10 11:08:15.439546+00
46e14a29-d699-4cae-b691-26d92419c6c4	50a74013-21fd-4641-8c73-369507b8b7c2	b4f0e27414e815474a610e35af2ae7a90a60242c4b8d909bfd3acb6197d3c9c7	2026-10-10 12:18:43.554+00	2026-10-10 11:49:21.270228+00	202.131.96.18	2026-10-10 11:48:43.558218+00
49c1ba97-cd4f-4ef5-b335-bf4a4d859157	50a74013-21fd-4641-8c73-369507b8b7c2	99b2ece43ae42c7175889daf7f9d746cde42fd7ec64c8441c64b3b587d041a0f	2026-10-10 12:38:43.494+00	2026-10-10 12:09:15.150359+00	202.131.96.18	2026-10-10 12:08:43.500534+00
bf9c132a-bd6f-4b5e-baae-dc90b4834e87	03816039-249c-462d-a1a2-7a1b855c07ab	3a58b7ae25791c2b5e16d5508f6da291baf3346491616611c383a84e961f886d	2026-10-12 12:21:15.715+00	2026-10-12 11:57:35.472+00	202.131.96.18	2026-10-12 11:51:15.717337+00
c9f39729-cce4-47b2-ad64-7082f79ac266	50a74013-21fd-4641-8c73-369507b8b7c2	f8296ec33c371b6e349109dad524d940f8027eac5701127dbdff47897161cdee	2026-10-10 12:52:13.581+00	2026-10-10 12:22:46.638356+00	202.131.96.18	2026-10-10 12:22:13.584893+00
334afead-b668-4fb6-965f-19646f2627ba	50a74013-21fd-4641-8c73-369507b8b7c2	20dd12a5da0dbfc88f2923dba9d7d8e440329bfba08c9a8aae83aacb2ddfedd7	2026-10-11 14:02:06.949+00	2026-10-11 13:33:38.257491+00	2409:4090:1005:fe13:68a6:af39:e6e1:7c0b	2026-10-11 13:32:06.961744+00
6f7ba72a-c592-4a91-be8d-141e4eba7158	50a74013-21fd-4641-8c73-369507b8b7c2	ce0a6a7235ad6de7c125f30345d397c2f4c6afeaee23cd909cc9a6860c564314	2026-10-11 21:16:34.478+00	2026-10-11 20:48:06.06+00	2409:4090:1005:fe13:693f:6fb1:9691:8fc7	2026-10-11 20:46:34.487079+00
33a4184e-78c6-48d8-b0b2-2af7fa4c2455	50a74013-21fd-4641-8c73-369507b8b7c2	ec0e393cc49dd7060e709e6670c129ea8ffb67e3b8b3abe09a9e593a82968e96	2026-10-11 21:18:06.075+00	2026-10-11 20:49:01.069+00	2409:4090:1005:fe13:693f:6fb1:9691:8fc7	2026-10-11 20:48:06.085516+00
f210aa5b-bdb9-4c09-8502-b216ee845e19	50a74013-21fd-4641-8c73-369507b8b7c2	bb411170ec7324b0ce08a3dc32bbae4c14ed6ecd434da4e1a46de64ffb1736f1	2026-10-11 21:19:01.107+00	2026-10-11 20:51:35.464+00	2409:4090:1005:fe13:693f:6fb1:9691:8fc7	2026-10-11 20:49:01.114918+00
ef899550-98f0-41e0-bf33-58c23579b921	03816039-249c-462d-a1a2-7a1b855c07ab	99910809eda90b59a16c2c80fcaae53fda713fd76e9033f2bc54ea3347576a34	2026-10-12 06:30:15.823+00	2026-10-12 07:10:42.88+00	202.131.96.18	2026-10-12 06:00:15.824553+00
e2d2e4e6-b619-4c1c-9d65-a9875e56def0	03816039-249c-462d-a1a2-7a1b855c07ab	56be1e32b208e7a55257ecc00a09eea4d73f339b76d0858559f4ed3aa757954f	2026-10-12 07:40:42.885+00	2026-10-12 07:16:25.034+00	::1	2026-10-12 07:10:42.899832+00
692aa00c-6d32-4644-a1b1-80962863d309	03816039-249c-462d-a1a2-7a1b855c07ab	98a620888e5711f1b7637bb9aaedb3906768cfa764cb52a6d7654b32f5b4dd68	2026-10-12 07:46:25.036+00	2026-10-12 07:17:13.518624+00	202.131.96.18	2026-10-12 07:16:25.039501+00
3ede3e6c-5a08-4c78-b9a8-400fd0e65181	50a74013-21fd-4641-8c73-369507b8b7c2	8d1212660e1c95bb20fb9d1e70c436ac0067a71aec106152f2467855d398d943	2026-10-11 21:21:35.473+00	2026-10-12 07:47:43.983+00	2409:4090:1005:fe13:693f:6fb1:9691:8fc7	2026-10-11 20:51:35.478545+00
12a9ecfe-16d6-4ee4-bc78-9d46632b3a6a	50a74013-21fd-4641-8c73-369507b8b7c2	a212745f60434173aa91260499db8a028a392b32aab31e107b03d7742ab1c155	2026-10-12 08:17:43.988+00	2026-10-12 07:53:49.656+00	202.131.96.18	2026-10-12 07:47:43.989611+00
da139a83-3b02-4578-a297-1ebf44139ffb	50a74013-21fd-4641-8c73-369507b8b7c2	10b1daafeeb2851c252fb59428c26cb0b16b8a97c5e9745b95f17d24e50f9e8d	2026-10-12 08:23:49.66+00	2026-10-12 07:56:04.875771+00	202.131.96.18	2026-10-12 07:53:49.66224+00
818ad2d8-72b7-41e2-9129-18826d109962	03816039-249c-462d-a1a2-7a1b855c07ab	2bb939ced26a9fbf8d65d5c1732294bb7ef713e3ec98fc890c99f03cea9988a1	2026-10-12 11:34:12.643+00	2026-10-12 11:05:38.481353+00	202.131.96.18	2026-10-12 11:04:12.64562+00
5e6ec7ee-ce34-4cd4-a2c4-09974f78794c	03816039-249c-462d-a1a2-7a1b855c07ab	7c0eb50c79b838e74dc1d643dc4d8e8ca93501ba152d6be2051df071508d4a5f	2026-10-12 11:49:43.184+00	2026-10-12 11:25:34.706063+00	202.131.96.18	2026-10-12 11:19:43.192474+00
6ec4b6aa-dd16-40bb-a44a-3919f69c00f6	03816039-249c-462d-a1a2-7a1b855c07ab	4bd973f0a959e85efc0ca727891035a780920b5348ec918398a9890f513b1a36	2026-10-12 12:16:02.65+00	2026-10-12 11:46:18.929+00	202.131.96.18	2026-10-12 11:46:02.651587+00
1689a622-0092-4288-aeb2-2b7110d79890	03816039-249c-462d-a1a2-7a1b855c07ab	19f04a8b37f5cc45c082f5c37297bf0b76b0de5a1e5165542ffd9578f94e10ad	2026-10-12 12:16:18.931+00	2026-10-12 11:47:52.076+00	202.131.96.18	2026-10-12 11:46:18.932591+00
96e84406-b02f-4cc7-9329-6c9f48dfae1c	03816039-249c-462d-a1a2-7a1b855c07ab	770f108821863b3b51fef02f40bbe05fffddb961f64058bcbc928fae3e36679c	2026-10-12 12:17:52.079+00	2026-10-12 11:51:15.712+00	202.131.96.18	2026-10-12 11:47:52.081556+00
954567ec-92bd-4397-b91b-a712643e451c	03816039-249c-462d-a1a2-7a1b855c07ab	455cca4aa197e0a965aa0ea7e80ba6432d3f93ea958a60bf179cb6eecb4e8122	2026-10-12 12:27:35.477+00	2026-10-12 11:58:13.337426+00	202.131.96.18	2026-10-12 11:57:35.479153+00
6575f406-d9aa-47c3-987c-dee80a409df2	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	04af5f99bdab2c7fd9cab1fb8f170e93f738ead720de16a16b2cadd82dcdade6	2026-10-14 06:38:18.938+00	2026-10-14 06:08:21.226+00	202.131.96.18	2026-10-14 06:08:18.938583+00
ef7f1743-5a2d-41e9-b30f-b1d8a354b727	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	f34cd7db11eff5b1293026439e0ecf3ed10ce3bda43514fc9e9f7e4a0032bff2	2026-10-14 06:38:21.228+00	2026-10-14 06:08:35.191+00	202.131.96.18	2026-10-14 06:08:21.22852+00
0788d1c0-6084-4203-a314-7235d0bf53c4	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	7d9a03183e775966761321b36d23e491bd156e7cd598e629044011a09ba57b50	2026-10-14 06:38:35.194+00	2026-10-14 06:08:46.399+00	202.131.96.18	2026-10-14 06:08:35.195431+00
ee50e119-fdd6-4f99-8e81-64604a665e71	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	f9b7bb38dc8c4f62cdb4bca5f492bd495ee26a716a86a75eadb54c0a8640c605	2026-10-14 06:38:46.401+00	2026-10-14 06:08:48.828+00	202.131.96.18	2026-10-14 06:08:46.402069+00
dceba7fd-dafb-4587-869f-b6049f1846c2	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	cc933bdd212c391fb8c987303395bc2748b318cfdf9b60ea999868419801da0c	2026-10-14 06:38:48.83+00	2026-10-14 06:34:20.462+00	202.131.96.18	2026-10-14 06:08:48.830987+00
007f4df3-7e70-4b6e-8b8b-26cfd47dbad7	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	0eae36c816767ab629e6c03562ef51ba475fe4d13d538b1f8454ec78d786eee9	2026-10-14 07:04:20.465+00	\N	202.131.96.18	2026-10-14 06:34:20.470882+00
d5a73109-c970-4525-86c7-c24cdf72d077	a4acc004-9d12-4dec-a1f4-6b89175b85e1	548ff4bce6da37df0f90e6afb1142c941812abf222f4c15549f6c9e3892b2cf7	2026-10-14 07:37:03.89+00	\N	202.131.96.18	2026-10-14 07:07:03.892532+00
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.permissions (id, code, name, module, action, description, status, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
a46b45aa-1849-4d8c-b8cf-c182c9674e07	dashboard.read	View Dashboard	dashboard	read	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
c2746a06-9211-4a95-bcf9-646de123bc72	users.read	View Users	users	read	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
54ec5cc6-7f39-4506-8a6e-e15d85db7690	users.create	Create Users	users	create	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
b56da6f4-9686-4bc0-ad13-891724c67a10	users.update	Update Users	users	update	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
d6a0fef3-c18b-4270-8b02-f104cdc5b062	users.status	Change Users Status	users	status	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
8222f0ad-a57e-469e-8d5d-4891c8ca1a80	users.delete	Delete Users	users	delete	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
096999f3-ee38-416f-b083-4b1126983226	roles.read	View Roles	roles	read	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
9208aa3d-f366-4085-b365-b98c30b9a15c	roles.create	Create Roles	roles	create	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
2f5eaa47-7dea-4172-b188-dfd7e5fea205	roles.update	Update Roles	roles	update	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
de83c963-5a7b-4ae3-88cf-51b5ff9e2eb6	roles.status	Change Roles Status	roles	status	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
46d6d844-3b61-4afe-aeb9-f21f0f4e73e0	roles.delete	Delete Roles	roles	delete	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
2195d9d1-3a0c-45c8-8cdc-ec03a61d969a	permissions.read	View Permissions	permissions	read	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
6699d3ba-b912-43cf-bf6f-108b0f70ca45	permissions.create	Create Permissions	permissions	create	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
952efc64-7cfb-45e3-adea-ceffe2982817	permissions.update	Update Permissions	permissions	update	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
1d702717-1520-4cc8-8eb3-429469c28a90	permissions.status	Change Permissions Status	permissions	status	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
d90c1fd3-27e3-4ea9-b622-e0f948aaf6f1	permissions.delete	Delete Permissions	permissions	delete	\N	active	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N
2e98cf01-6c27-4d6e-98b9-aa3dbfb74904	employee.update-profile-picture	Update Employee Profile Picture	employee	update	Upload or remove the profile picture of any employee of the organization.	active	system	\N	2026-10-13 06:36:53.344724+00	2026-10-13 06:36:53.344724+00	\N
06db2c41-daec-48ce-9153-e03cda913743	master.field.create	Create Master Values	master	create	\N	active	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N
511a8ded-1cfa-4954-a5f4-ef5f9a0f2f72	master.field.update	Update Master Values	master	update	\N	active	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N
0d753909-dc28-4cee-a5e1-440f0f319cb4	master.field.delete	Delete Master Values	master	delete	\N	active	system	\N	2026-10-14 06:40:15.988317+00	2026-10-14 06:40:15.988317+00	\N
16b9243a-4d61-4872-a5bd-73035a7cb44d	profile_change_request.view	View Profile Change Requests	profile_change_request	read	List, view, approve and reject the profile change requests of the organization.	active	system	\N	2026-10-15 08:14:50.601969+00	2026-10-15 08:14:50.601969+00	\N
7a1daf22-4e8f-4a43-89aa-3196e30556ec	master.policy-info.read	View Policy & Information	master	read	\N	active	system	\N	2026-10-15 12:19:53.654683+00	2026-10-15 12:19:53.654683+00	\N
b59e2e00-4ba5-472f-98de-34095a3f559a	master.policy-info.create	Create Policy & Information	master	create	\N	active	system	\N	2026-10-15 12:19:53.654683+00	2026-10-15 12:19:53.654683+00	\N
9bf249ca-1e2d-449a-8c98-d76feccf450f	master.policy-info.update	Update Policy & Information	master	update	\N	active	system	\N	2026-10-15 12:19:53.654683+00	2026-10-15 12:19:53.654683+00	\N
0ab82c97-7eb4-4b54-9aba-dcde5011b2a4	master.policy-info.delete	Delete Policy & Information	master	delete	\N	active	system	\N	2026-10-15 12:19:53.654683+00	2026-10-15 12:19:53.654683+00	\N
b344e2c2-e5ef-41ef-8ea1-2bb9065fa8b9	leave.req.read:all	View All Leave Requests	leave	read	\N	active	system	\N	2026-10-20 12:21:02.071256+00	2026-10-20 12:21:02.071256+00	\N
5b26bb90-65f2-4daa-8d17-93aea24c12d8	leave.req.action:all	Decide All Leave Requests	leave	approve	\N	active	system	\N	2026-10-20 12:21:02.071256+00	2026-10-20 12:21:02.071256+00	\N
9193988c-3376-4fea-aa3d-4f522c1bce7e	leave.balance.read:all	View All Leave Balances	leave	read	\N	active	system	\N	2026-10-20 12:21:02.071256+00	2026-10-20 12:21:02.071256+00	\N
430e9672-563b-408a-b74b-f9690b7e2826	leave.balance.action:all	Manage All Leave Balances	leave	update	\N	active	system	\N	2026-10-20 12:21:02.071256+00	2026-10-20 12:21:02.071256+00	\N
61845d77-1abe-486c-a181-6794d3e46476	leave.policy.action:all	Manage Leave Policies	leave	update	\N	active	system	\N	2026-10-20 12:21:02.071256+00	2026-10-20 12:21:02.071256+00	\N
4e76ce27-bba9-4ab3-ad6f-1f020668900b	leave:admin	Leave Admin	leave	update	\N	active	system	\N	2026-10-20 12:21:02.071256+00	2026-10-20 12:21:02.071256+00	\N
5b52a958-0411-4674-a089-089321b20113	master.org-currency.read:all	View Organization Currencies	master	read	\N	active	system	\N	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N
cdcfe940-533c-4bb0-81e9-2901bc427cab	master.org-currency.action:all	Manage Organization Currencies	master	update	\N	active	system	\N	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N
05e56d6e-5f6a-4385-8ef8-141f2dcf2c3e	master.leave_type.create	Create Leave Types	master	create	\N	active	system	\N	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N
8fef64bb-84d3-4d33-b3d2-e8a2c8c08830	master.leave_type.update	Update Leave Types	master	update	\N	active	system	\N	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N
0630d338-bbee-418e-bdac-9163573d1483	master.leave_type.delete	Delete Leave Types	master	delete	\N	active	system	\N	2026-10-21 16:44:07.711969+00	2026-10-21 16:44:07.711969+00	\N
feb43dd2-9f38-497a-9526-95d585c3435f	expense.req.read:all	View All Expense Requests	expense	read	\N	active	system	\N	2026-10-22 13:04:19.65287+00	2026-10-22 13:04:19.65287+00	\N
07874202-387b-4944-88ab-61ef3928b331	expense.req.action:all	Decide All Expense Requests	expense	approve	\N	active	system	\N	2026-10-22 13:04:19.65287+00	2026-10-22 13:04:19.65287+00	\N
46335961-b07d-4ff7-8457-a53119235a73	expense.policy.action:all	Manage Expense Policy Documents	expense	update	\N	active	system	\N	2026-10-23 12:30:58.419973+00	2026-10-23 12:30:58.419973+00	\N
\.


--
-- Data for Name: policy_info; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.policy_info (id, organization_id, code, title, subtitle, sections, sort_order, is_active, version, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
e6b428d1-6948-4612-b6dd-c181d88c620e	9edca853-7860-4925-b81b-1206dc4298cb	PRIVACY_POLICY	Privacy Policy	How your personal data is collected and used	[{"title": "Information we collect", "description": "We collect the information needed to manage your employment, such as your name, contact details, identity documents, bank details, attendance and leave records."}, {"title": "How we use your information", "description": "Your information is used to run HR processes: payroll, leave and attendance, statutory compliance and communication with you."}, {"title": "Sharing your information", "description": "We share your information only with people who need it for their work, with service providers acting on our behalf, or when the law requires it."}, {"title": "Data security", "description": "We protect your information with access controls and secure systems. Only authorised people can view or change it."}, {"title": "Your rights", "description": "You can view your profile at any time and ask HR to correct information that is wrong or out of date."}, {"title": "Contact", "description": "For questions about this policy, please contact your HR team."}]	1	t	1	system	\N	2026-10-15 12:19:53.654683+00	2026-10-15 12:19:53.654683+00	\N
a58435c9-59a7-4ae3-94bb-a94877397deb	9edca853-7860-4925-b81b-1206dc4298cb	TERMS_CONDITIONS	Terms & Conditions	Rules for using this application	[{"title": "Acceptance", "description": "By using this application you agree to these terms and to the company policies."}, {"title": "Use of the application", "description": "This application is for work purposes only. Use it to view and manage your own employment information."}, {"title": "Your account", "description": "Keep your password confidential and do not share your account. Tell HR at once if you think someone else has used it."}, {"title": "Acceptable use", "description": "Do not try to access information that is not yours, disrupt the service, or enter false information."}, {"title": "Changes to these terms", "description": "These terms may be updated from time to time. The latest version is always available on this page."}, {"title": "Contact", "description": "For questions about these terms, please contact your HR team."}]	2	t	1	system	\N	2026-10-15 12:19:53.654683+00	2026-10-15 12:19:53.654683+00	\N
4b353ddb-24a4-4686-a1e7-3fcb7d273c9a	9edca853-7860-4925-b81b-1206dc4298cb	ABOUT_US	About Us	Who we are and what this application does	[{"title": "Who we are", "description": "We are committed to supporting our people with simple, transparent HR processes."}, {"title": "What this application does", "description": "This application lets you manage your profile, apply for leave, track approvals and stay informed about company policies in one place."}, {"title": "Contact", "description": "For help with the application, please contact your HR team."}]	3	t	1	system	\N	2026-10-15 12:19:53.654683+00	2026-10-15 12:19:53.654683+00	\N
0042757f-95ab-4989-b6d6-e19e80305ff9	9edca853-7860-4925-b81b-1206dc4298cb	FAQ	FAQ	Answers to common questions	[{"title": "How do I apply for leave?", "description": "Open Leave, choose Apply Leave, select the leave type and dates, add a reason and submit. Your approver is notified."}, {"title": "How do I check my leave balance?", "description": "Open Leave. Your available, used and pending days are shown for each leave type."}, {"title": "Can I cancel a leave request?", "description": "Yes. A pending request can be withdrawn at any time. Approved leave can be cancelled before it starts."}, {"title": "I forgot my password. What should I do?", "description": "On the login screen, choose Forgot Password and follow the link sent to your email."}, {"title": "How do I update my profile details?", "description": "You can update your address, family and emergency contact details in your profile. For other changes, please contact HR."}]	4	t	1	system	\N	2026-10-15 12:19:53.654683+00	2026-10-15 12:19:53.654683+00	\N
890da08d-384b-42c9-929b-43085bce67c0	9edca853-7860-4925-b81b-1206dc4298cb	CODE_OF_CONDUCT	Code of Conduct	How we work together	[{"title": "How do I apply for leave?", "description": "Open Leave, choose Apply Leave and submit.\\nYour approver is notified."}]	9999	t	1	prince.h@shreemaruti.com	prince.h@shreemaruti.com	2026-10-17 06:50:24.823343+00	2026-10-17 07:38:37.049842+00	\N
\.


--
-- Data for Name: profile_change_requests; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.profile_change_requests (id, organization_id, employee_id, section, request, reason, status, reviewed_by, reviewed_at, review_remark, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.role_permissions (role_id, permission_id) FROM stdin;
5c89fb68-b65c-4598-9682-16de4bcaccb2	a46b45aa-1849-4d8c-b8cf-c182c9674e07
5c89fb68-b65c-4598-9682-16de4bcaccb2	c2746a06-9211-4a95-bcf9-646de123bc72
5c89fb68-b65c-4598-9682-16de4bcaccb2	54ec5cc6-7f39-4506-8a6e-e15d85db7690
5c89fb68-b65c-4598-9682-16de4bcaccb2	b56da6f4-9686-4bc0-ad13-891724c67a10
5c89fb68-b65c-4598-9682-16de4bcaccb2	d6a0fef3-c18b-4270-8b02-f104cdc5b062
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	a46b45aa-1849-4d8c-b8cf-c182c9674e07
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	c2746a06-9211-4a95-bcf9-646de123bc72
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	54ec5cc6-7f39-4506-8a6e-e15d85db7690
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	b56da6f4-9686-4bc0-ad13-891724c67a10
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	d6a0fef3-c18b-4270-8b02-f104cdc5b062
5c89fb68-b65c-4598-9682-16de4bcaccb2	096999f3-ee38-416f-b083-4b1126983226
5c89fb68-b65c-4598-9682-16de4bcaccb2	9208aa3d-f366-4085-b365-b98c30b9a15c
5c89fb68-b65c-4598-9682-16de4bcaccb2	2f5eaa47-7dea-4172-b188-dfd7e5fea205
5c89fb68-b65c-4598-9682-16de4bcaccb2	de83c963-5a7b-4ae3-88cf-51b5ff9e2eb6
5c89fb68-b65c-4598-9682-16de4bcaccb2	46d6d844-3b61-4afe-aeb9-f21f0f4e73e0
5c89fb68-b65c-4598-9682-16de4bcaccb2	2195d9d1-3a0c-45c8-8cdc-ec03a61d969a
5c89fb68-b65c-4598-9682-16de4bcaccb2	2e98cf01-6c27-4d6e-98b9-aa3dbfb74904
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	2e98cf01-6c27-4d6e-98b9-aa3dbfb74904
b367a48f-6764-46f1-bc20-85b8b82845a6	a46b45aa-1849-4d8c-b8cf-c182c9674e07
5c89fb68-b65c-4598-9682-16de4bcaccb2	06db2c41-daec-48ce-9153-e03cda913743
5c89fb68-b65c-4598-9682-16de4bcaccb2	0d753909-dc28-4cee-a5e1-440f0f319cb4
5c89fb68-b65c-4598-9682-16de4bcaccb2	511a8ded-1cfa-4954-a5f4-ef5f9a0f2f72
5c89fb68-b65c-4598-9682-16de4bcaccb2	16b9243a-4d61-4872-a5bd-73035a7cb44d
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	16b9243a-4d61-4872-a5bd-73035a7cb44d
5c89fb68-b65c-4598-9682-16de4bcaccb2	b59e2e00-4ba5-472f-98de-34095a3f559a
5c89fb68-b65c-4598-9682-16de4bcaccb2	0ab82c97-7eb4-4b54-9aba-dcde5011b2a4
5c89fb68-b65c-4598-9682-16de4bcaccb2	7a1daf22-4e8f-4a43-89aa-3196e30556ec
5c89fb68-b65c-4598-9682-16de4bcaccb2	9bf249ca-1e2d-449a-8c98-d76feccf450f
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	b59e2e00-4ba5-472f-98de-34095a3f559a
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	0ab82c97-7eb4-4b54-9aba-dcde5011b2a4
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	7a1daf22-4e8f-4a43-89aa-3196e30556ec
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	9bf249ca-1e2d-449a-8c98-d76feccf450f
5c89fb68-b65c-4598-9682-16de4bcaccb2	430e9672-563b-408a-b74b-f9690b7e2826
5c89fb68-b65c-4598-9682-16de4bcaccb2	4e76ce27-bba9-4ab3-ad6f-1f020668900b
5c89fb68-b65c-4598-9682-16de4bcaccb2	5b26bb90-65f2-4daa-8d17-93aea24c12d8
5c89fb68-b65c-4598-9682-16de4bcaccb2	61845d77-1abe-486c-a181-6794d3e46476
5c89fb68-b65c-4598-9682-16de4bcaccb2	9193988c-3376-4fea-aa3d-4f522c1bce7e
5c89fb68-b65c-4598-9682-16de4bcaccb2	b344e2c2-e5ef-41ef-8ea1-2bb9065fa8b9
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	430e9672-563b-408a-b74b-f9690b7e2826
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	4e76ce27-bba9-4ab3-ad6f-1f020668900b
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	5b26bb90-65f2-4daa-8d17-93aea24c12d8
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	61845d77-1abe-486c-a181-6794d3e46476
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	9193988c-3376-4fea-aa3d-4f522c1bce7e
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	b344e2c2-e5ef-41ef-8ea1-2bb9065fa8b9
5c89fb68-b65c-4598-9682-16de4bcaccb2	5b52a958-0411-4674-a089-089321b20113
5c89fb68-b65c-4598-9682-16de4bcaccb2	cdcfe940-533c-4bb0-81e9-2901bc427cab
5c89fb68-b65c-4598-9682-16de4bcaccb2	05e56d6e-5f6a-4385-8ef8-141f2dcf2c3e
5c89fb68-b65c-4598-9682-16de4bcaccb2	0630d338-bbee-418e-bdac-9163573d1483
5c89fb68-b65c-4598-9682-16de4bcaccb2	8fef64bb-84d3-4d33-b3d2-e8a2c8c08830
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	05e56d6e-5f6a-4385-8ef8-141f2dcf2c3e
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	0630d338-bbee-418e-bdac-9163573d1483
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	8fef64bb-84d3-4d33-b3d2-e8a2c8c08830
5c89fb68-b65c-4598-9682-16de4bcaccb2	feb43dd2-9f38-497a-9526-95d585c3435f
5c89fb68-b65c-4598-9682-16de4bcaccb2	07874202-387b-4944-88ab-61ef3928b331
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	feb43dd2-9f38-497a-9526-95d585c3435f
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	07874202-387b-4944-88ab-61ef3928b331
5c89fb68-b65c-4598-9682-16de4bcaccb2	46335961-b07d-4ff7-8457-a53119235a73
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	46335961-b07d-4ff7-8457-a53119235a73
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roles (id, name, slug, description, status, is_system, created_by, updated_by, created_at, updated_at, deleted_at, organization_id) FROM stdin;
5c89fb68-b65c-4598-9682-16de4bcaccb2	Admin	admin	Operational admin; cannot manage roles or permissions.	active	t	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N	9edca853-7860-4925-b81b-1206dc4298cb
ecc6d6fc-8f02-4efb-be05-99ecf33760ff	HR Manager	hr_manager	Manages users and views the dashboard.	active	t	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N	9edca853-7860-4925-b81b-1206dc4298cb
43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	Employee	employee	Default role for regular employees.	active	t	system	\N	2026-10-09 11:18:09.269642+00	2026-10-09 11:18:09.269642+00	\N	9edca853-7860-4925-b81b-1206dc4298cb
b367a48f-6764-46f1-bc20-85b8b82845a6	Team Lead	team_lead	Manage their team's employees	active	t	system	\N	2026-10-11 20:30:55.161682+00	2026-10-11 20:30:55.161682+00	\N	9edca853-7860-4925-b81b-1206dc4298cb
\.


--
-- Data for Name: salary_structures; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.salary_structures (id, organization_id, name, code, description, sort_order, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
8516194d-0bc6-4fdf-9ac0-fd46fccc8d59	9edca853-7860-4925-b81b-1206dc4298cb	Above 15 LPA (CTC)	ABOVE_15_LPA	\N	1	t	system	\N	2026-11-02 11:52:12.11968+00	2026-11-02 11:52:12.11968+00	\N
116085a5-f43f-486b-aef6-b08ff2cebf9f	9edca853-7860-4925-b81b-1206dc4298cb	Below 5 LPA (CTC)	BELOW_5_LPA	\N	2	t	system	\N	2026-11-02 11:52:12.11968+00	2026-11-02 11:52:12.11968+00	\N
953427d5-aa2d-4041-aa3b-f4b9bfaec234	9edca853-7860-4925-b81b-1206dc4298cb	5 to 10 LPA (CTC)	FROM_5_TO_10_LPA	\N	3	t	system	\N	2026-11-02 11:52:12.11968+00	2026-11-02 11:52:12.11968+00	\N
d8ad10f1-426f-4233-b066-4fa60fd38650	9edca853-7860-4925-b81b-1206dc4298cb	10 to 15 LPA (CTC)	FROM_10_TO_15_LPA	\N	4	t	system	\N	2026-11-02 11:52:12.11968+00	2026-11-02 11:52:12.11968+00	\N
106a0663-e20b-4fab-a07f-a80c20fc8c48	9edca853-7860-4925-b81b-1206dc4298cb	Below 5 LPA Without PF (CTC)	BELOW_5_LPA_WITHOUT_PF	\N	5	t	system	\N	2026-11-02 11:52:12.11968+00	2026-11-02 11:52:12.11968+00	\N
399ce63b-14f8-46ee-9777-1b0af68f9cfb	9edca853-7860-4925-b81b-1206dc4298cb	Above 15 LPA Without PF (CTC)	ABOVE_15_LPA_WITHOUT_PF	\N	6	t	system	\N	2026-11-02 11:52:12.11968+00	2026-11-02 11:52:12.11968+00	\N
fe6ccf3c-250b-4fbb-81cb-4bde1c369300	9edca853-7860-4925-b81b-1206dc4298cb	5 to 10 LPA Without PF (CTC)	FROM_5_TO_10_LPA_WITHOUT_PF	\N	7	t	system	\N	2026-11-02 11:52:12.11968+00	2026-11-02 11:52:12.11968+00	\N
1a85676e-1832-4870-b804-6415b0184374	9edca853-7860-4925-b81b-1206dc4298cb	10 to 15 LPA Without PF (CTC)	FROM_10_TO_15_LPA_WITHOUT_PF	\N	8	t	system	\N	2026-11-02 11:52:12.11968+00	2026-11-02 11:52:12.11968+00	\N
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.states (id, country_id, name, code, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
a016ef78-f7e2-401c-af38-5dbce51af908	36f48ce3-7186-41e6-8ce3-3955ca089920	Andhra Pradesh	AP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
71b6f8a4-ef4c-4ae6-b087-3177e8066169	36f48ce3-7186-41e6-8ce3-3955ca089920	Arunachal Pradesh	AR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
8689ada1-dc55-41ba-9018-2670fbbcc264	36f48ce3-7186-41e6-8ce3-3955ca089920	Assam	AS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
bda891bc-fd92-4e1d-98be-ed334dc833d2	36f48ce3-7186-41e6-8ce3-3955ca089920	Bihar	BR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
620d503d-d0bc-4c15-95a0-42a2564ec600	36f48ce3-7186-41e6-8ce3-3955ca089920	Chhattisgarh	CG	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
c67f05c2-a9a4-475d-886c-3d9ddd28b79e	36f48ce3-7186-41e6-8ce3-3955ca089920	Goa	GA	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
29666eaf-98f5-4308-b219-99661b7a903a	36f48ce3-7186-41e6-8ce3-3955ca089920	Gujarat	GJ	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
0a5f8a69-5635-4dae-9c26-b02703536483	36f48ce3-7186-41e6-8ce3-3955ca089920	Haryana	HR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
a319e2d9-f599-4d36-a596-dc98937de90c	36f48ce3-7186-41e6-8ce3-3955ca089920	Himachal Pradesh	HP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
63ee4638-1c08-4612-98c7-18afd544e18a	36f48ce3-7186-41e6-8ce3-3955ca089920	Jharkhand	JH	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9a457391-9668-4be2-b650-be63b35a9df5	36f48ce3-7186-41e6-8ce3-3955ca089920	Karnataka	KA	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
2fcccd3a-7af1-4791-82e7-2530527c2eff	36f48ce3-7186-41e6-8ce3-3955ca089920	Kerala	KL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
eae5166b-f0fc-4f74-b885-93a264240bea	36f48ce3-7186-41e6-8ce3-3955ca089920	Madhya Pradesh	MP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
558d4843-16cd-4090-ad3f-dd40e586f527	36f48ce3-7186-41e6-8ce3-3955ca089920	Maharashtra	MH	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
0f139b4d-602b-4d67-ac0e-15a7aebd3c04	36f48ce3-7186-41e6-8ce3-3955ca089920	Manipur	MN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
7b78dd32-a1f5-4527-b68b-bc1dcba136df	36f48ce3-7186-41e6-8ce3-3955ca089920	Meghalaya	ML	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
1aa9b2a5-5841-400d-b7e3-ee38990836b8	36f48ce3-7186-41e6-8ce3-3955ca089920	Mizoram	MZ	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
59087978-564d-42c3-8f99-dba2bc26bc0d	36f48ce3-7186-41e6-8ce3-3955ca089920	Nagaland	NL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
cebfb24e-3b2d-499b-b150-b5aab2350dfc	36f48ce3-7186-41e6-8ce3-3955ca089920	Odisha	OD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
8bb38587-5e9e-4ab8-a2d2-43277ddd7b72	36f48ce3-7186-41e6-8ce3-3955ca089920	Punjab	PB	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
14ab5880-5857-498b-93d3-4e79c653c096	36f48ce3-7186-41e6-8ce3-3955ca089920	Rajasthan	RJ	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
330d9e16-172c-44d4-bfff-14d2174dcbcf	36f48ce3-7186-41e6-8ce3-3955ca089920	Sikkim	SK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
553a840e-989a-4324-832b-156c77b28785	36f48ce3-7186-41e6-8ce3-3955ca089920	Tamil Nadu	TN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
3b3c6785-7dae-4d34-a617-9a088201c402	36f48ce3-7186-41e6-8ce3-3955ca089920	Telangana	TS	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
569b01a0-534e-424a-9bfb-458f0b2db906	36f48ce3-7186-41e6-8ce3-3955ca089920	Tripura	TR	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
d16fc974-0bfd-47fa-93c7-d5b564665192	36f48ce3-7186-41e6-8ce3-3955ca089920	Uttar Pradesh	UP	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
22a6495e-44c0-4481-af34-ab0bcf905e54	36f48ce3-7186-41e6-8ce3-3955ca089920	Uttarakhand	UK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
379dc055-d9a8-4a02-b87b-c8e80685d42f	36f48ce3-7186-41e6-8ce3-3955ca089920	West Bengal	WB	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
f220d05b-cf65-4720-8db7-75fd09d54d88	36f48ce3-7186-41e6-8ce3-3955ca089920	Andaman and Nicobar Islands	AN	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
1b74a652-5d5f-4cfa-a82f-a9bb03048ace	36f48ce3-7186-41e6-8ce3-3955ca089920	Chandigarh	CH	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
be7afc70-dc04-497c-869d-c0677807b7c6	36f48ce3-7186-41e6-8ce3-3955ca089920	Dadra and Nagar Haveli and Daman and Diu	DH	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
0ca399ec-c575-4493-a2e3-d0be7028f79a	36f48ce3-7186-41e6-8ce3-3955ca089920	Delhi	DL	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
5889aca9-0544-4381-9131-5169c75b4125	36f48ce3-7186-41e6-8ce3-3955ca089920	Jammu and Kashmir	JK	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9940a4c6-72a1-49cb-a556-6a9492b688d0	36f48ce3-7186-41e6-8ce3-3955ca089920	Ladakh	LA	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
9ffefbbf-0f28-4494-a478-3e0f2c6fb927	36f48ce3-7186-41e6-8ce3-3955ca089920	Lakshadweep	LD	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
3087d2f6-f4b8-46e0-8f10-df5705a789f1	36f48ce3-7186-41e6-8ce3-3955ca089920	Puducherry	PY	t	system	system	2026-10-14 08:20:24.523021+00	2026-10-27 11:51:45.664414+00	\N
\.


--
-- Data for Name: user_addresses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_addresses (id, user_id, city_type, current_address_line1, current_address_line2, current_country, current_state, current_city, current_zip, same_as_current_address, permanent_address_line1, permanent_address_line2, permanent_country, permanent_state, permanent_city, permanent_zip, created_by, updated_by, created_at, updated_at, deleted_at, current_country_id, current_state_id, permanent_country_id, permanent_state_id, city_type_id, current_city_id, permanent_city_id) FROM stdin;
d57ad5d3-de27-4ae9-8335-8aa65cf9f5f5	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	\N	Ajab	Near City Club	India	Gujarat	Keshod	362229	t	Ajab	Near City Club	India	Gujarat	Keshod	362229	test@example.com	test@example.com	2026-10-14 09:37:42.81113+00	2026-10-14 10:30:37.243922+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	\N	\N	\N
7a7e50d1-6fd8-4361-ac33-b692bc82d602	03816039-249c-462d-a1a2-7a1b855c07ab	metro	12, Sunrise Society, Near Main Cross Road	Ahmedabad aa	India	Gujarat	Ahmedabad	380001	f	12, Sunrise Society, Near Main Cross Road	Near City Club	India	Gujarat	Ahmedabad	380001	prince.h@shreemaruti.com	prince.h@shreemaruti.com	2026-10-13 09:58:50.973142+00	2026-10-21 05:41:40.423463+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	46eaa9b3-5a8f-47f3-86bd-243f172c465a	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e
94a268a7-2cc8-49e9-983d-abfa50fbb95f	a4acc004-9d12-4dec-a1f4-6b89175b85e1	metro	12, Sunrise Society, Near Main Cross Road	Near City Club	India	Gujarat	Ahmedabad	380001	f	12, Sunrise Society, Near Main Cross Road	Near City Club	India	Gujarat	Ahmedabad	380001	devyansh.solanki@shreemaruti.com	\N	2026-10-14 07:04:36.359269+00	2026-10-14 07:04:36.359269+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	46eaa9b3-5a8f-47f3-86bd-243f172c465a	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e
602f418e-d21f-43a4-9810-6dc89a78faff	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	metro	12, Sunrise Society, Near Main Cross Road	Near City Club	India	Gujarat	Ahmedabad	380001	f	12, Sunrise Society, Near Main Cross Road	Near City Club	India	Gujarat	Ahmedabad	380001	devyansh.solanki@shreemaruti.com	\N	2026-10-13 07:21:39.010968+00	2026-10-13 07:21:39.010968+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	46eaa9b3-5a8f-47f3-86bd-243f172c465a	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e
f76613e5-8c10-4c9b-8763-57b61ac8c2d3	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	non_metro	14, Sunrise Society, Near Main Cross Road	Near City Club	India	Gujarat	Ahmedabad	380001	f	12, Sunrise Society, Near Main Cross Road	Near City Club	India	Gujarat	Ahmedabad	380001	devyansh.solanki@shreemaruti.com	john.doe@acme.com	2026-10-12 20:00:32.155042+00	2026-10-12 21:30:22.118563+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	57b2f716-e73c-4ebb-9ae4-5c4f3a2a861a	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e
84066f45-2246-42da-ab60-156a4cdd54b6	f80816b4-1585-4a4b-9cf2-d284a81c8458	metro	12, Sunrise Society, Near Main Cross Road	Near City Club	\N	\N	Ahmedabad	380001	f	12, Sunrise Society, Near Main Cross Road	Near City Club	\N	\N	Ahmedabad	380001	devyansh.solanki@shreemaruti.com	\N	2026-10-19 06:11:45.152517+00	2026-10-19 06:11:45.152517+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	46eaa9b3-5a8f-47f3-86bd-243f172c465a	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e
7e5448a5-ef78-42b1-9656-b8e816a4d1c9	50a74013-21fd-4641-8c73-369507b8b7c2	metro	12, Sunrise Society, Near Main Cross Road	Near City Club	India	Gujarat	Ahmedabad	380001	f	12, Sunrise Society, Near Main Cross Road	Near City Club	India	Gujarat	Ahmedabad	380001	devyansh.solanki@shreemaruti.com	\N	2026-10-13 11:17:41.529589+00	2026-10-13 11:17:41.529589+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	36f48ce3-7186-41e6-8ce3-3955ca089920	29666eaf-98f5-4308-b219-99661b7a903a	46eaa9b3-5a8f-47f3-86bd-243f172c465a	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e	0b52c7a9-3a16-4c12-b7c9-2ac273a6ea5e
\.


--
-- Data for Name: user_bank_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_bank_details (id, user_id, bank_name, account_no, ifsc_code, account_holder_name, pan, pf_uan, pf_no, esi_number, created_by, updated_by, created_at, updated_at, deleted_at, company_esic_code) FROM stdin;
de739974-0a02-44e4-833f-3e3a7278f7b9	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	Sample Bank	1234567890	SMPL0000123	Doe John	ABCDE1234F	100000000001	GJAHD0000000000001234	3100123456	devyansh.solanki@shreemaruti.com	\N	2026-10-12 20:00:32.155042+00	2026-10-12 20:00:32.155042+00	\N	\N
6014265f-70ae-47ec-86c5-1699ab90435c	a4acc004-9d12-4dec-a1f4-6b89175b85e1	Sample Bank	1234567890	SMPL0000123	Rutvik Shah	ABCDE1234F	100000000001	GJAHD0000000000001234	3100123456	devyansh.solanki@shreemaruti.com	\N	2026-10-14 07:04:36.359269+00	2026-10-14 07:04:36.359269+00	\N	\N
97cbd91d-24de-46ed-b464-599bae262bbf	03816039-249c-462d-a1a2-7a1b855c07ab	Sample Bank	1000000000	SMPL0000123	Doe John	ABCDE1234F	100000000001	GJAHD0000000000001234	3100123456	prince.h@shreemaruti.com	prince.h@shreemaruti.com	2026-10-15 05:57:20.46154+00	2026-10-15 10:49:29.931207+00	\N	\N
703d7de2-a006-41cd-9a3d-acb83d5bcb94	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	Kotak Mahindra Bank	1234567890	SMPL0000123	Doe John	ABCDE1234F	100000000001	GJAHD0000000000001234	3100123456	devyansh.solanki@shreemaruti.com	\N	2026-10-13 07:21:39.010968+00	2026-10-13 07:21:39.010968+00	\N	\N
bd0f8029-b0ab-4600-ad6f-efbf13286466	f80816b4-1585-4a4b-9cf2-d284a81c8458	State Bank of India	1234567890	SBIN0001234	Doe John	ABCDE1234F	100000000001	GJAHD0000000000001234	3100123456	devyansh.solanki@shreemaruti.com	\N	2026-10-19 06:11:45.152517+00	2026-10-19 06:11:45.152517+00	\N	\N
\.


--
-- Data for Name: user_emergency_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_emergency_contacts (id, user_id, name, relationship, contact_number, address, created_by, updated_by, created_at, updated_at, deleted_at, secondary_name, secondary_phone, secondary_relationship, relationship_id, secondary_relationship_id) FROM stdin;
19620e00-8f43-4475-a3cb-9c439f3aa1ec	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	Mary Doe	Mother	9988776655	12, Sunrise Society, Near Main Cross Road, Area A, 380001	devyansh.solanki@shreemaruti.com	\N	2026-10-12 20:00:32.155042+00	2026-10-12 20:00:32.155042+00	\N	\N	\N	\N	d4c12493-029a-4c01-acd5-99f3eee2a237	\N
5155a786-4f24-46fe-8d53-4299d93f2672	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	Mary Doe	Mother	9988776655	12, Sunrise Society, Near Main Cross Road, Area A, 380001	devyansh.solanki@shreemaruti.com	\N	2026-10-13 07:21:39.010968+00	2026-10-13 07:21:39.010968+00	\N	\N	\N	\N	d4c12493-029a-4c01-acd5-99f3eee2a237	\N
44384338-6fe2-4239-8bfc-3f29e33009b0	a4acc004-9d12-4dec-a1f4-6b89175b85e1	Smitaben Shah	Mother	9988776655	12, Sunrise Society, Near Main Cross Road, Area A, 380001	devyansh.solanki@shreemaruti.com	\N	2026-10-14 07:04:36.359269+00	2026-10-14 07:04:36.359269+00	\N	\N	\N	\N	d4c12493-029a-4c01-acd5-99f3eee2a237	\N
af130c52-c196-4886-b698-a0724ab2202f	03816039-249c-462d-a1a2-7a1b855c07ab	Mary Doe	Mother	9989776657	12, Sunrise Society, Near Main Cross Road, Area A, 380001	prince.h@shreemaruti.com	prince.h@shreemaruti.com	2026-10-13 10:06:28.198249+00	2026-10-15 09:13:34.939216+00	\N	John Doe	9989776642	Father	d4c12493-029a-4c01-acd5-99f3eee2a237	11aa30c6-e850-4123-8d07-fff56700d6ca
d9f32ade-f742-4ed4-8931-d21e6442815f	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	Test p	Mother	9988700000	\N	test@example.com	test@example.com	2026-10-14 10:39:43.144531+00	2026-10-17 12:43:27.355541+00	\N	Test S	9981111111	Father	80944d02-5f61-46f0-9b60-bc162a524558	11aa30c6-e850-4123-8d07-fff56700d6ca
ad66177b-3383-49f4-aaf2-d4b660a08fb3	f80816b4-1585-4a4b-9cf2-d284a81c8458	Prince Hingrajiya	\N	9988776655	12, Sunrise Society, Near Main Cross Road, Area A, 380001	devyansh.solanki@shreemaruti.com	\N	2026-10-19 06:11:45.152517+00	2026-10-19 06:11:45.152517+00	\N	\N	\N	\N	2089b9d0-a998-4b70-81d1-74e5fd67c108	\N
\.


--
-- Data for Name: user_family_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_family_details (id, user_id, sort_order, father_name, mother_name, spouse_name, primary_nominee, nominee_relationship, created_by, updated_by, created_at, updated_at, deleted_at, nominee_relationship_id, name, mobile_no, aadhar_number, date_of_birth, relationship_id) FROM stdin;
06366e8b-a837-4a9f-9427-9b6df83056ce	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	0	Test F	Test M	Test S	SMC	Family	test@example.com	test@example.com	2026-10-14 09:57:00.991607+00	2026-10-14 09:57:55.211073+00	\N	\N	\N	\N	\N	\N	\N
3e294a1b-8f35-4f2e-adce-263fbb0845e1	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	0	John Doe	Mary Doo	string	Mary Doe	Mother	devyansh.solanki@shreemaruti.com	john.doe@acme.com	2026-10-12 20:00:32.155042+00	2026-10-12 21:49:55.751713+00	\N	d4c12493-029a-4c01-acd5-99f3eee2a237	\N	\N	\N	\N	\N
8687e9a7-4047-49ff-9ebc-71e1ec6ded95	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	0	John Doe	Mary Doe	string	Mary Doe	Mother	devyansh.solanki@shreemaruti.com	\N	2026-10-13 07:21:39.010968+00	2026-10-13 07:21:39.010968+00	\N	d4c12493-029a-4c01-acd5-99f3eee2a237	\N	\N	\N	\N	\N
052bb34a-2f7d-44e3-8306-deb9d0546159	a4acc004-9d12-4dec-a1f4-6b89175b85e1	0	Shailesh Shah	Smitaben Shah	string	Smitaben Shah	Mother	devyansh.solanki@shreemaruti.com	\N	2026-10-14 07:04:36.359269+00	2026-10-14 07:04:36.359269+00	\N	d4c12493-029a-4c01-acd5-99f3eee2a237	\N	\N	\N	\N	\N
990dc65e-6750-4cbc-865c-5c5bec1ce23c	03816039-249c-462d-a1a2-7a1b855c07ab	0	John Doe	Mary Doe	string	Mary Doe	Mother	prince.h@shreemaruti.com	prince.h@shreemaruti.com	2026-10-13 10:04:30.678649+00	2026-10-15 10:44:50.962098+00	\N	d4c12493-029a-4c01-acd5-99f3eee2a237	\N	\N	\N	\N	\N
91e5d195-e7e1-4bbc-8756-7502db5e6c03	f80816b4-1585-4a4b-9cf2-d284a81c8458	0			Prince Hingrajiya	Prince Hingrajiya	\N	devyansh.solanki@shreemaruti.com	\N	2026-10-19 06:11:45.152517+00	2026-10-19 06:11:45.152517+00	\N	2089b9d0-a998-4b70-81d1-74e5fd67c108	\N	\N	\N	\N	\N
\.


--
-- Data for Name: user_module_access; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_module_access (id, organization_id, user_id, app_id, label, data_permission_group_id, created_by, updated_by, created_at, updated_at, deleted_at, menu_ids) FROM stdin;
cce111c9-22f5-4267-a36a-5352ae14827b	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	1	admin	c8142d68-8ef6-410d-ba7f-8078ac2b8696	system	\N	2026-10-26 12:37:09.308116+00	2026-10-26 12:37:09.308116+00	\N	{}
e9e3027e-92b5-4a4b-b43b-f978f44de5dc	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	3	admin	c8142d68-8ef6-410d-ba7f-8078ac2b8696	system	\N	2026-10-26 12:37:09.308116+00	2026-10-26 12:37:09.308116+00	\N	{}
a2699b48-81b6-4a7a-b079-91fb2be274ca	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	5	admin	c8142d68-8ef6-410d-ba7f-8078ac2b8696	system	\N	2026-10-26 12:37:09.308116+00	2026-10-26 12:37:09.308116+00	\N	{}
59e18af0-912b-4a5b-babb-5f9d5610b44b	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	6	admin	c8142d68-8ef6-410d-ba7f-8078ac2b8696	system	\N	2026-10-26 12:37:09.308116+00	2026-10-26 12:37:09.308116+00	\N	{}
b9b0e187-76b8-4cd7-9380-7d2a021aae37	9edca853-7860-4925-b81b-1206dc4298cb	f80816b4-1585-4a4b-9cf2-d284a81c8458	7	admin	c8142d68-8ef6-410d-ba7f-8078ac2b8696	system	\N	2026-10-26 12:37:09.308116+00	2026-10-26 12:37:09.308116+00	\N	{}
31f6bfc3-256b-4459-8630-8ce96f5635b8	9edca853-7860-4925-b81b-1206dc4298cb	3f4e5e52-6d48-4266-86c5-03f57e2947e6	1	sub_admin	53888bda-9e25-4a97-9ca5-62e188192178	24f04f5b-9007-4480-94cd-0556d4aef097	24f04f5b-9007-4480-94cd-0556d4aef097	2026-10-28 12:28:50.208502+00	2026-10-28 12:30:11.054389+00	\N	{1,8,9,10,2,11,55,56,57,58,59,60,61,12,13,14,15,16,17,18,19,20,21,22,4,27,67,68,69,70,28,29,30,31,5,32,71,72,73,33,34,35,36,6,37,74,75,76,38,39,40,41,42,43,44,45,46}
bbd25580-6d06-49c8-9d07-ad998f59e39f	9edca853-7860-4925-b81b-1206dc4298cb	470ed31a-9262-4c40-81c9-a03f0ebcd840	1	sub_admin	4605e41e-1121-456d-bb1c-38b26b509874	24f04f5b-9007-4480-94cd-0556d4aef097	\N	2026-10-28 12:40:48.468016+00	2026-10-28 12:40:48.468016+00	\N	{8,9,10,12,13,14,15,16,17,18,19,20,21,22,24,25,26,28,29,30,31,33,34,35,36,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76}
b5ab5273-3641-44c5-bb80-b28fcc5d6f56	9edca853-7860-4925-b81b-1206dc4298cb	4f855c59-60da-487a-b8ad-0330af959bb5	1	sub_admin	4605e41e-1121-456d-bb1c-38b26b509874	24f04f5b-9007-4480-94cd-0556d4aef097	\N	2026-10-28 12:41:11.075132+00	2026-10-28 12:41:11.075132+00	\N	{8,9,10,12,13,14,15,16,17,18,19,20,21,22,24,25,26,28,29,30,31,33,34,35,36,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76}
508c5041-49ab-448c-b762-e7974ae1ad53	9edca853-7860-4925-b81b-1206dc4298cb	3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	1	sub_admin	4605e41e-1121-456d-bb1c-38b26b509874	24f04f5b-9007-4480-94cd-0556d4aef097	\N	2026-10-28 12:44:46.9262+00	2026-10-28 12:44:46.9262+00	\N	{8,9,10,12,13,14,15,16,17,18,19,20,21,22,24,25,26,28,29,30,31,33,34,35,36,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76}
517c2753-54a0-44ef-a654-58cec7abaf7b	9edca853-7860-4925-b81b-1206dc4298cb	24f04f5b-9007-4480-94cd-0556d4aef097	1	sub_admin	4605e41e-1121-456d-bb1c-38b26b509874	f80816b4-1585-4a4b-9cf2-d284a81c8458	f80816b4-1585-4a4b-9cf2-d284a81c8458	2026-10-28 12:22:11.385679+00	2026-10-28 13:06:53.52575+00	\N	{1,8,9,10,2,11,55,56,57,58,59,60,61,12,13,14,15,16,17,18,19,20,21,22,3,23,62,63,64,65,66,24,25,26}
8b2f5a65-7b99-4d39-9f75-9ba4dd1b468e	9edca853-7860-4925-b81b-1206dc4298cb	5c3245b2-f884-4d4f-98b4-23fb0a156853	3	sub_admin	c8142d68-8ef6-410d-ba7f-8078ac2b8696	f80816b4-1585-4a4b-9cf2-d284a81c8458	\N	2026-10-29 05:21:44.184519+00	2026-10-29 05:21:44.184519+00	\N	{111,112,114,115,117,118,119,120,121,122,123,124,125,126,127,131,132,133,134,135}
610d62cd-142a-45d1-81eb-5da67451d14e	9edca853-7860-4925-b81b-1206dc4298cb	63853727-011a-432b-9746-3857ac429456	1	sub_admin	b2ec3165-0292-4691-aab0-7644089060eb	claude-test	\N	2026-10-29 07:10:36.424513+00	2026-10-29 07:10:36.424513+00	\N	{}
\.


--
-- Data for Name: user_personal_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_personal_details (id, user_id, full_name, father_name, mother_name, gender, date_of_birth, marital_status, date_of_marriage, nationality, religion, blood_group, personal_email_id, aadhar_card, passport_no, date_of_gratuity, created_by, updated_by, created_at, updated_at, deleted_at, nationality_country_id, gender_id, marital_status_id, blood_group_id, religion_id) FROM stdin;
2eefb5e3-ae9f-49c3-a2ab-6291c8880977	1b3e765c-f4b6-4263-994b-b7221c34f75c	Devyansh Solanki	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	system	dev@example.com	2026-10-12 19:47:45.895015+00	2026-10-12 19:47:45.895015+00	\N	\N	\N	\N	\N	\N
cac1b231-e31e-4ccf-8160-ff8b19498526	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	Test User	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	system	\N	2026-10-12 19:47:45.895015+00	2026-10-12 19:47:45.895015+00	\N	\N	\N	\N	\N	\N
3c42b6e1-7808-49db-8ccc-65c845bca186	50a74013-21fd-4641-8c73-369507b8b7c2	Devyansh Solanki	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	system	devyansh.solanki@shreemaruti.com	2026-10-12 19:47:45.895015+00	2026-10-12 19:47:45.895015+00	\N	\N	\N	\N	\N	\N
b1a98420-4e64-4380-a4c9-7196e4d78e47	c22fb54f-db68-45f6-a203-a66103741b2e	Manish Solanki	\N	\N	male	1999-04-03	single	\N	\N	\N	A+	manish.solanki.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	\N
7be689a2-4650-4a76-bc7d-174ffbdb80e2	03816039-249c-462d-a1a2-7a1b855c07ab	Prince Patel	Robert Doe	Mary Doe	male	2001-01-01	single	2026-10-15	Indian		A+	prince@gamil.com	123412341234	K1234567	2026-10-15	system	prince.h@shreemaruti.com	2026-10-12 19:47:45.895015+00	2026-10-15 08:59:49.645955+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	\N
c5ce390f-1373-4dd9-840e-79ae755a72b2	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	Roshni Thakor	Papa	Mumma	male	1998-05-15	married	2026-10-13	Indian	hindu	A+	roshni.personal@example.com	123412341234	K1234567	2026-10-13	devyansh.solanki@shreemaruti.com	\N	2026-10-13 07:21:39.010968+00	2026-10-13 07:21:39.010968+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	\N
71bc58ac-27f3-492c-8917-a117052f8ad7	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	John Doe	Robert Doe	Mary Doe	male	1998-05-15	married	2026-10-12	Indian	string	A+	john.doe.personal@example.com	123412341234	K1234567	2026-10-12	devyansh.solanki@shreemaruti.com	\N	2026-10-12 20:00:32.155042+00	2026-10-12 20:00:32.155042+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	\N
1e4d26b3-e3d8-4ecb-9fc3-081f7bb08ba8	470ed31a-9262-4c40-81c9-a03f0ebcd840	Riya Bhatt	\N	\N	female	1994-09-14	married	\N	\N	\N	B-	riya.bhatt.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	604cb62b-dc4c-47c0-876e-62fc64fc176a	\N
ccdb5443-1132-4713-8bc3-96d67cb8e18d	3f4e5e52-6d48-4266-86c5-03f57e2947e6	Rohan Mehta	\N	\N	male	1995-05-14	married	\N	\N	\N	O+	rohan.mehta.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	d2a3e883-6188-44e2-b4f8-1c45d2cf972f	\N
99338370-b874-4fcf-9b5f-dc80fc39a6bb	df1a3122-0d91-4e5d-a27c-20ac5d74f9f9	Sneha Shah	\N	\N	female	1998-08-02	single	\N	\N	\N	A+	sneha.shah.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	\N
f1bb642c-170d-4fac-a004-91eada8b89eb	eb8b78dd-5692-4f65-8c5b-a82418b707d8	Aarav Desai	\N	\N	male	1999-12-21	single	\N	\N	\N	B+	aarav.desai.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	76a0a528-fe87-4d11-b608-8a6c05f15bd7	\N
16a0bb67-64a3-41d6-a2e1-368bf584e18e	5fd7de3b-afa2-4483-9039-5e6bd4d12dcf	Vikram Chauhan	\N	\N	male	1993-06-27	married	\N	\N	\N	AB-	vikram.chauhan.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	024d1a90-fb2e-4ba0-bc16-83f6a75f7383	\N
09a777d9-dae5-4e01-995d-4b3ce4305d7c	63853727-011a-432b-9746-3857ac429456	Pooja Rathod	\N	\N	female	1995-01-25	married	\N	\N	\N	O+	pooja.rathod.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	d2a3e883-6188-44e2-b4f8-1c45d2cf972f	\N
eb6f2549-1457-433f-9ef4-3d936feb66c0	76fdfa62-7cda-433d-aebf-1ec9959abf40	Yash Thakkar	\N	\N	male	1998-03-08	single	\N	\N	\N	O+	yash.thakkar.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	d2a3e883-6188-44e2-b4f8-1c45d2cf972f	\N
0db86908-b8b9-4c28-919b-76b9501d4045	8beb9ae0-7e13-4a01-8201-88703a800bad	Dhruvi Vyas	\N	\N	female	2000-11-29	single	\N	\N	\N	AB+	dhruvi.vyas.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	9b0b0601-b6c3-4be2-889e-4e91c6c2392d	\N
9c078d65-1b10-4c63-9fa3-8bcbc0ec263d	5c3245b2-f884-4d4f-98b4-23fb0a156853	Jay Prajapati	\N	\N	male	1991-12-17	married	\N	\N	\N	B+	jay.prajapati.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	76a0a528-fe87-4d11-b608-8a6c05f15bd7	\N
efe6d6fb-dfeb-4f29-a8c6-750aafd616cd	e97cfeee-196e-4d68-9f33-93abf8216cb6	Mitali Dave	\N	\N	female	1997-05-06	married	\N	\N	\N	A+	mitali.dave.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	\N
d299a05d-9a0f-45bf-9088-e87c4696ddba	d2f4e22d-e94d-444f-8810-1ec598a3d98f	Kunal Pandya	\N	\N	male	1996-08-22	single	\N	\N	\N	O-	kunal.pandya.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	67e33421-717e-4010-8926-fe4ababf87ba	\N
7f296134-6bc7-4144-9abb-c6f1c7e71c7b	4f855c59-60da-487a-b8ad-0330af959bb5	Prapti Gadhiya	\N	\N	female	1997-03-18	single	\N	\N	\N	B-	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	604cb62b-dc4c-47c0-876e-62fc64fc176a	\N
2dc63589-f87b-475a-9b98-bbe0d623683d	99415aeb-b341-414a-8828-67eea46d98d1	Toral Patel	\N	\N	female	1990-09-23	married	\N	\N	\N	O+	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	d2a3e883-6188-44e2-b4f8-1c45d2cf972f	\N
fe82418c-5cb4-4d5d-afc5-14e09f109964	da8f6a78-2d00-42f7-b08e-c0c149678c0d	Anu Pandey	\N	\N	female	1994-11-05	single	\N	\N	\N	AB+	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	9b0b0601-b6c3-4be2-889e-4e91c6c2392d	\N
29b7f2ba-7426-401b-9b53-dd28dbe5bbec	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	Bhavesh Katariya	\N	\N	male	1986-04-12	married	\N	\N	\N	B+	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	76a0a528-fe87-4d11-b608-8a6c05f15bd7	\N
378e355a-5325-41a1-a253-da013e10553b	3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	Nidhi Trivedi	\N	\N	female	1996-10-09	married	\N	\N	\N	A-	nidhi.trivedi.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	106ff468-5d6c-4743-8d86-0f196a45376a	\N
77a56e56-c064-46e7-9e39-9b7f120dcf11	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	Krunal Katariya	\N	\N	male	1992-01-30	married	\N	\N	\N	A+	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	\N
83b6e079-db6c-4d4e-bb79-c6f31a9c5d08	f80816b4-1585-4a4b-9cf2-d284a81c8458	Harsh shah			male	2004-01-01	married	2022-02-14	\N	Hindu	A+	harsh.shah@gmail.com	123412341234	K1234567	2031-09-01	devyansh.solanki@shreemaruti.com	\N	2026-10-19 06:11:45.152517+00	2026-10-19 06:11:45.152517+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	\N
d64e638f-b764-4ac6-8e7d-66dba056a697	24f04f5b-9007-4480-94cd-0556d4aef097	Harsh Parmar	\N	\N	male	1997-07-19	single	\N	\N	\N	B+	harsh.parmar.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	76a0a528-fe87-4d11-b608-8a6c05f15bd7	\N
214f8619-7f58-4203-9dda-0b86e6c44a15	0e9621c5-c42a-47de-9520-4f3da89600d7	Kavya Joshi	\N	\N	female	2003-02-11	single	\N	\N	\N	O-	kavya.joshi.personal@example.com	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	8be1a1a9-e3af-4a8a-94c5-782f04c18ba7	1e6f0afa-00d2-4cc5-9191-5122ebb6debc	67e33421-717e-4010-8926-fe4ababf87ba	\N
d9372176-4fc3-4aee-af1a-787131c0c036	a4acc004-9d12-4dec-a1f4-6b89175b85e1	Rutvik Shah	Shailesh Shah	Smitaben Shah	male	1998-05-15	married	2026-10-14	Indian	Hinduism	A+	rutvik.shah.personal@example.com	121256563434	K1234567	2026-10-14	devyansh.solanki@shreemaruti.com	\N	2026-10-14 07:04:36.359269+00	2026-10-14 07:04:36.359269+00	\N	36f48ce3-7186-41e6-8ce3-3955ca089920	5de2012f-ee4a-4e38-81ba-2843c416a897	29bf9275-8645-4d36-a1fd-f9c8b9ee0841	bb3f6faf-0bb7-4d16-abf5-c21fe3c2604d	8145b78e-759c-44d7-b161-a64b2c6f30ff
\.


--
-- Data for Name: user_previous_experiences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_previous_experiences (id, user_id, sort_order, previous_company_name, from_date, to_date, job_title, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
f034458a-f9f1-486c-b0e6-0e2ba897e398	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	0	Previous Tech Pvt Ltd	2024-04-01	2026-06-19	Software Developer	devyansh.solanki@shreemaruti.com	\N	2026-10-12 20:00:32.155042+00	2026-10-12 20:00:32.155042+00	\N
a9e1ddb4-cde6-46a7-9dc1-4a0b1baeac3e	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	0	Previous Tech Pvt Ltd	2024-04-01	2026-06-19	Software Developer	devyansh.solanki@shreemaruti.com	\N	2026-10-13 07:21:39.010968+00	2026-10-13 07:21:39.010968+00	\N
88c421e5-0f0e-43bd-962d-9d438604e146	a4acc004-9d12-4dec-a1f4-6b89175b85e1	0	Previous Tech Pvt Ltd	2024-04-01	2026-06-19	Software Developer	devyansh.solanki@shreemaruti.com	\N	2026-10-14 07:04:36.359269+00	2026-10-14 07:04:36.359269+00	\N
c15f848f-054d-470d-a8c7-90ef29ae20e9	03816039-249c-462d-a1a2-7a1b855c07ab	0	Previous Tech Pvt Ltd	2024-04-01	2026-06-19	Software Developer	prince.h@shreemaruti.com	\N	2026-10-15 05:57:20.46154+00	2026-10-15 05:57:20.46154+00	\N
dcb60625-4c60-4ce9-ae27-8359aedc9520	f80816b4-1585-4a4b-9cf2-d284a81c8458	0	Previous Tech Pvt Ltd	2024-04-01	2026-06-19	Software Developer	devyansh.solanki@shreemaruti.com	\N	2026-10-19 06:11:45.152517+00	2026-10-19 06:11:45.152517+00	\N
\.


--
-- Data for Name: user_qualifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_qualifications (id, user_id, sort_order, diploma_degree_name, institution_name, passing_year, percentage, created_by, updated_by, created_at, updated_at, deleted_at, qualification_id, diploma_degree_id) FROM stdin;
859f9141-dfae-433b-9d97-6edb66226e1c	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	0	Bachelor of Technology (BTech)	Sample Institute of Technology	2024	85.00	devyansh.solanki@shreemaruti.com	\N	2026-10-12 20:00:32.155042+00	2026-10-12 20:00:32.155042+00	\N	0de26a29-9df1-4b9a-b791-48711023cad9	\N
84cbb90d-38b9-4188-b64a-978782918c8a	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	0	Bachelor of Technology (BTech)	Sample Institute of Technology	2024	85.00	devyansh.solanki@shreemaruti.com	\N	2026-10-13 07:21:39.010968+00	2026-10-13 07:21:39.010968+00	\N	0de26a29-9df1-4b9a-b791-48711023cad9	\N
ca696938-7d88-4cd0-b720-74339d5ceddd	a4acc004-9d12-4dec-a1f4-6b89175b85e1	0	Bachelor of Technology (BTech)	Sample Institute of Technology	2024	85.00	devyansh.solanki@shreemaruti.com	\N	2026-10-14 07:04:36.359269+00	2026-10-14 07:04:36.359269+00	\N	0de26a29-9df1-4b9a-b791-48711023cad9	\N
e1221d4e-24e6-405b-8fb7-46ac1c8c1603	03816039-249c-462d-a1a2-7a1b855c07ab	0	Bachelor of Technology (BTech)	Sample Institute of Technology	2024	85.00	prince.h@shreemaruti.com	\N	2026-10-15 05:57:20.46154+00	2026-10-15 05:57:20.46154+00	\N	0de26a29-9df1-4b9a-b791-48711023cad9	\N
fee00533-5e4f-44f0-9685-3b6a93d7ce4f	f80816b4-1585-4a4b-9cf2-d284a81c8458	0	Bachelor of Technology (BTech)	Sample Institute of Technology	2024	85.00	devyansh.solanki@shreemaruti.com	\N	2026-10-19 06:11:45.152517+00	2026-10-19 06:11:45.152517+00	\N	\N	\N
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_sessions (id, user_id, refresh_token_hash, device_id, device_name, browser, os, ip_address, last_activity, expires_at, is_revoked, revoked_at, created_at, updated_at) FROM stdin;
e3175151-e3c9-43d8-b81e-767587601615	50a74013-21fd-4641-8c73-369507b8b7c2	f2c5dceeed8a33982d81b1b94d5355f26b3f735159fe26e3925c8c06c20ec3d1	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 10:24:12.927+00	2026-11-13 10:24:12.927+00	f	\N	2026-10-14 10:24:12.934541+00	2026-10-14 10:24:12.934541+00
f8d47a6f-f785-45a6-8412-9ed91fe072d6	50a74013-21fd-4641-8c73-369507b8b7c2	c34933a1420cc4cbf43fe1020ee0f89c8b6ec0ce1320bbec81d4b38e5452bfa6	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 07:58:57.302+00	2026-11-11 07:58:57.302+00	f	\N	2026-10-12 07:58:57.305281+00	2026-10-12 07:58:57.305281+00
b3dd9459-ba31-4166-870e-32c848611851	50a74013-21fd-4641-8c73-369507b8b7c2	cee2b21bb4d9865c850ad45ffcd2ee852533049e1caa38d3ac72a9ed146037e2	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 11:13:34.264+00	2026-11-14 11:13:34.264+00	f	\N	2026-10-15 11:13:34.283097+00	2026-10-15 11:13:34.283097+00
a7b5462f-0d11-4c54-bf17-9095a7c007c7	03816039-249c-462d-a1a2-7a1b855c07ab	1c0eade0700178f94e235fb8d8aa765b7f8d5f84474f7a9fcb2705190ab74f03	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 07:24:31.531+00	2026-11-11 07:24:31.531+00	t	2026-10-12 11:05:39.302+00	2026-10-12 07:24:31.533394+00	2026-10-12 11:05:39.303042+00
ebacf9b3-7bca-4d1b-a0a5-1290d0e17233	03816039-249c-462d-a1a2-7a1b855c07ab	f9b2121d1b300e1aa7aab27ef0b534ab2376f59aaba59548fcb6d428298171f0	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 09:43:08.771+00	2026-11-11 09:43:08.771+00	t	2026-10-12 11:05:39.302+00	2026-10-12 09:43:08.776275+00	2026-10-12 11:05:39.303042+00
72c96471-ddae-41a4-941e-f16ca331dd6a	03816039-249c-462d-a1a2-7a1b855c07ab	4cd529839b11dcad5f08227ad659b7516e318b3d7771d9803875ff1ef6fb67f3	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 11:08:43.217+00	2026-11-11 11:08:43.218+00	t	2026-10-12 11:08:51.257+00	2026-10-12 11:08:43.227339+00	2026-10-12 11:08:51.267374+00
ef0f321c-a5fa-4b33-9830-23211c782a3b	50a74013-21fd-4641-8c73-369507b8b7c2	14458d239af5da1e02d6c34ee1fca69a97beb88cee3b60af2b87adb39cbc79a3	34e67ecff561a18f35acc04b6eb1d11d	Unknown device	\N	\N	127.0.0.1	2026-10-10 03:16:37.582+00	2026-11-09 03:16:37.582+00	t	2026-10-10 03:30:54.208+00	2026-10-10 03:16:37.587253+00	2026-10-10 03:30:54.211722+00
68d1f8f8-6962-465c-928d-17ef3af3d897	1b3e765c-f4b6-4263-994b-b7221c34f75c	a147ef9233015c908171043bb226b40efa8ee893da819d0a5775f0f68a3ae3f5	250b38471e89495953da23791ba0b6fe	Unknown device	\N	\N	127.0.0.1	2026-10-09 12:27:08.144+00	2026-11-08 12:27:08.144+00	t	2026-10-10 03:37:53.29+00	2026-10-09 12:27:08.149218+00	2026-10-10 03:37:53.293132+00
4cfb2541-2825-44ec-9f73-dad1bf26010e	1b3e765c-f4b6-4263-994b-b7221c34f75c	47e813410b6ff87a3011c7dd5a01d2bef5e4a5feeb0ce499f320c29460d09f3d	34e67ecff561a18f35acc04b6eb1d11d	Unknown device	\N	\N	127.0.0.1	2026-10-09 19:16:55.333+00	2026-11-08 19:16:55.334+00	t	2026-10-10 03:37:53.29+00	2026-10-09 19:16:55.345853+00	2026-10-10 03:37:53.293132+00
e7a046ab-ecce-4fb4-850d-2014d111c7cc	1b3e765c-f4b6-4263-994b-b7221c34f75c	c2520ebc2255b5eae65d992e8d9d2264d56c57b41ef6513012524e4bca4c1ff7	34e67ecff561a18f35acc04b6eb1d11d	Unknown device	\N	\N	127.0.0.1	2026-10-10 03:37:48.597+00	2026-11-09 03:37:48.597+00	t	2026-10-10 03:37:53.29+00	2026-10-10 03:37:48.599651+00	2026-10-10 03:37:53.293132+00
f400ebf4-66c2-4d17-b8de-cf6fed6d0c06	03816039-249c-462d-a1a2-7a1b855c07ab	aa8b33db90286de91e9de26df6c1f99c190736ff7c0b7049359680e6fb3d8f6e	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 11:44:44.134+00	2026-11-11 11:44:44.135+00	t	2026-10-12 11:58:13.728+00	2026-10-12 11:44:44.140423+00	2026-10-12 11:58:13.730352+00
f25a5d22-fe28-4f0d-bddc-54c6f8de74c2	03816039-249c-462d-a1a2-7a1b855c07ab	827711f1a8058edda5498be98e492384a9ac36697c3f200fe7ce8f8f781738a6	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 12:30:10.618+00	2026-11-11 12:30:10.618+00	t	2026-10-12 12:30:35.497+00	2026-10-12 12:30:10.621907+00	2026-10-12 12:30:35.49938+00
2b06e0c9-7f01-4600-b109-5a335bea8229	03816039-249c-462d-a1a2-7a1b855c07ab	5da383e70a9900bfed0d143b5b4b3b9ecf745b9e6e9ee5426995f82f7c8b4e6e	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 06:48:29.147+00	2026-11-09 06:48:29.147+00	t	2026-10-10 07:31:44.467+00	2026-10-10 06:48:29.150258+00	2026-10-10 07:31:44.469512+00
e8cba862-a405-4fa2-b5be-7c0dec537a74	1b3e765c-f4b6-4263-994b-b7221c34f75c	ad46eb4df33014ccebf600d2888b43bf199f08f2fbcfda8d21e358f3675a2e78	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 07:45:56.758+00	2026-11-09 07:45:56.758+00	t	2026-10-10 07:46:06.469+00	2026-10-10 07:45:56.761808+00	2026-10-10 07:46:06.473712+00
d82dfb3e-d703-46b3-ac33-dfcbc8013290	1b3e765c-f4b6-4263-994b-b7221c34f75c	1bb6e92019d7f73fbe30b6b11855259efaab5d59d2ed44eaaca3a70c8542c8e0	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 07:46:18.863+00	2026-11-09 07:46:18.864+00	t	2026-10-10 07:46:29.661+00	2026-10-10 07:46:18.86758+00	2026-10-10 07:46:29.664843+00
3e54fb02-e412-426a-bf52-df3e728af769	03816039-249c-462d-a1a2-7a1b855c07ab	179c127478b90433282ce5f60a153515d16317617406eb02c4c4f17dc39794c4	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 07:46:56.134+00	2026-11-09 07:46:56.134+00	t	2026-10-10 07:47:28.73+00	2026-10-10 07:46:56.137314+00	2026-10-10 07:47:28.739416+00
f0bbce16-2439-497e-abfb-24be59d37b8a	03816039-249c-462d-a1a2-7a1b855c07ab	4c4900b42382ed97855080065d2f367a17b1fbda88d4de7b7c95556851a83d9c	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 07:47:34.371+00	2026-11-09 07:47:34.371+00	t	2026-10-10 07:47:59.37+00	2026-10-10 07:47:34.380564+00	2026-10-10 07:47:59.380444+00
c3fe03f0-09e3-44e7-b1c1-d40a792807a9	03816039-249c-462d-a1a2-7a1b855c07ab	50e35fa974beec2bd808bfb406a06bb28d20a042dbd1b599756fc3a18a41d894	78831d8d6ea64208c6119ad2b1319c67	Unknown device	\N	\N	202.131.96.18	2026-10-10 09:17:59.692+00	2026-11-09 09:17:59.692+00	t	2026-10-10 09:18:11.625+00	2026-10-10 09:17:59.69295+00	2026-10-10 09:18:11.626904+00
266512f4-a137-4a43-ad7b-f3dda96f03cc	03816039-249c-462d-a1a2-7a1b855c07ab	f8f109559b41f8671d185b2fb6a61c6ab80fc0d08b7b98f8d479b8c11a31a746	78831d8d6ea64208c6119ad2b1319c67	Unknown device	\N	\N	202.131.96.18	2026-10-10 09:26:09.996+00	2026-11-09 09:26:09.996+00	t	2026-10-10 09:26:28.491+00	2026-10-10 09:26:10.000064+00	2026-10-10 09:26:28.494639+00
c7e5fbf2-e258-488d-965f-94ace60fc63d	03816039-249c-462d-a1a2-7a1b855c07ab	c8f277da96c8b5d561b729ab66228188495cfe48c2f77a99017c62bac859dc2d	78831d8d6ea64208c6119ad2b1319c67	Unknown device	\N	\N	202.131.96.18	2026-10-10 09:28:26.791+00	2026-11-09 09:28:26.791+00	t	2026-10-10 09:38:16.039+00	2026-10-10 09:28:26.79299+00	2026-10-10 09:38:16.050408+00
c034797a-a265-45e6-b78b-9c0f31f3a8ab	1b3e765c-f4b6-4263-994b-b7221c34f75c	ca648c39a9983169ebf200c00ecbb2a19c988e8f9e8ae254e65105a1a1c42c49	34e67ecff561a18f35acc04b6eb1d11d	Unknown device	\N	\N	127.0.0.1	2026-10-10 03:51:15.945+00	2026-11-09 03:51:15.945+00	t	2026-10-12 07:14:01.67+00	2026-10-10 03:39:07.765457+00	2026-10-12 07:14:01.674181+00
bed18ebf-751c-4901-880a-55849088c726	1b3e765c-f4b6-4263-994b-b7221c34f75c	fb58d1dc42587fc92133d20f68217c53be3839e0ed09c40b5d83be786e67e715	34e67ecff561a18f35acc04b6eb1d11d	Unknown device	\N	\N	127.0.0.1	2026-10-10 05:51:45.003+00	2026-11-09 05:51:45.003+00	t	2026-10-12 07:14:01.67+00	2026-10-10 05:51:45.010093+00	2026-10-12 07:14:01.674181+00
981b9791-5ebd-4b8f-b92a-6b2c76d168ed	1b3e765c-f4b6-4263-994b-b7221c34f75c	5a2e24f145da4ef27dc90666ef0d64eb52c4cda32c29c35d54e737fb666698ca	2bddbf0e98c5d3a0a57e52510fa4bea9	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-10 05:52:09.515+00	2026-11-09 05:52:09.515+00	t	2026-10-12 07:14:01.67+00	2026-10-10 05:52:09.51905+00	2026-10-12 07:14:01.674181+00
9f2807ef-4b62-42e9-a438-59979ead8a9c	1b3e765c-f4b6-4263-994b-b7221c34f75c	f7ccd3134400e58c7d7c238dfc9bfe4f993cd5e141d4051e3290a8b8edca3598	2bddbf0e98c5d3a0a57e52510fa4bea9	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-10 06:10:11.486+00	2026-11-09 06:10:11.486+00	t	2026-10-12 07:14:01.67+00	2026-10-10 06:10:11.492238+00	2026-10-12 07:14:01.674181+00
b28e365a-1387-48a4-85e1-74ece914b7d8	03816039-249c-462d-a1a2-7a1b855c07ab	4ad323563562d97916eaf2b569cf0ac88c212fa24421c38fd767499dd9bab578	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 06:46:54.23+00	2026-11-09 06:46:54.23+00	t	2026-10-12 07:17:13.864+00	2026-10-10 06:46:54.233745+00	2026-10-12 07:17:13.874026+00
e137f953-92c6-4b04-ab50-9806d64b600c	03816039-249c-462d-a1a2-7a1b855c07ab	ff3ccd04d1ae06a0a7f6e6c6f26a61190bfc519295e335c8b64a9f4703120822	e4e503401be91d9fc2af034e0fcc6662	Windows	\N	Windows	202.131.96.18	2026-10-10 07:22:02.242+00	2026-11-09 07:22:02.242+00	t	2026-10-12 07:17:13.864+00	2026-10-10 07:22:02.250195+00	2026-10-12 07:17:13.874026+00
052857a8-b78d-416c-9c42-81aa3b5d14c7	03816039-249c-462d-a1a2-7a1b855c07ab	39d21fc04e986ee77e535921634e15df2172de71adda3fe03bcae26f82fb9bed	78831d8d6ea64208c6119ad2b1319c67	Unknown device	\N	\N	202.131.96.18	2026-10-10 07:26:22.211+00	2026-11-09 07:26:22.211+00	t	2026-10-12 07:17:13.864+00	2026-10-10 07:26:22.215656+00	2026-10-12 07:17:13.874026+00
793a29f7-f307-4982-885d-9e62db83b6d7	03816039-249c-462d-a1a2-7a1b855c07ab	876a269c46759b48778e09042639dcfb11d892c1454245a595180ad87df8b596	78831d8d6ea64208c6119ad2b1319c67	Unknown device	\N	\N	202.131.96.18	2026-10-10 07:34:08.34+00	2026-11-09 07:34:08.34+00	t	2026-10-12 07:17:13.864+00	2026-10-10 07:34:08.343879+00	2026-10-12 07:17:13.874026+00
1eaa6515-d930-4afd-8051-cef104f8bbd0	03816039-249c-462d-a1a2-7a1b855c07ab	006f7cf5ca34ff820f671cedd22a10e11c6a6e364c82d70d66f7fd6f732f19fb	78831d8d6ea64208c6119ad2b1319c67	Unknown device	\N	\N	202.131.96.18	2026-10-10 07:34:47.858+00	2026-11-09 07:34:47.858+00	t	2026-10-12 07:17:13.864+00	2026-10-10 07:34:47.861812+00	2026-10-12 07:17:13.874026+00
cc9c7324-8abc-4fd2-a765-de7edfdfe064	03816039-249c-462d-a1a2-7a1b855c07ab	7f00dfe9566d29114dc3605006b8c6ca6903c08921002a08f7dc62f5ae92ffb7	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 07:44:39.972+00	2026-11-09 07:44:39.972+00	t	2026-10-12 07:17:13.864+00	2026-10-10 07:44:39.97552+00	2026-10-12 07:17:13.874026+00
8c150ba8-cc3b-4fea-8e0e-20b29c507ca0	03816039-249c-462d-a1a2-7a1b855c07ab	67368f2eb89975eac9d5eeab822e92c78fa449febe8086be688610c3e45978b8	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 07:45:03.013+00	2026-11-09 07:45:03.013+00	t	2026-10-12 07:17:13.864+00	2026-10-10 07:45:03.015524+00	2026-10-12 07:17:13.874026+00
5d316cb6-d9d9-430c-8517-04b3981421f5	03816039-249c-462d-a1a2-7a1b855c07ab	a7e321e09f51ec47d2119d8e50c2f70f88ac89dac762529a4941ee471ad1f64d	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 10:43:05.257+00	2026-11-13 10:43:05.257+00	f	\N	2026-10-14 10:43:05.266529+00	2026-10-14 10:43:05.266529+00
f7212d4f-1a5f-4047-b79c-91b208f31fa1	1b3e765c-f4b6-4263-994b-b7221c34f75c	8b570fc6d7ff130c90612fc38936be2dd0c07607885a0383bb2838fbaa4d8d60	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 09:38:01.6+00	2026-11-09 09:38:01.601+00	t	2026-10-10 09:38:44.856+00	2026-10-10 09:38:01.61573+00	2026-10-10 09:38:44.867269+00
336d113e-1b68-4a85-96b9-6c6bedc80027	50a74013-21fd-4641-8c73-369507b8b7c2	067713a017d552ae46a66c5ee8576f0ec5f702eb368c7f6d83eea39311d2e9d2	97182d262752ab7ea1012cdc4aec5dfc	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:68a6:af39:e6e1:7c0b	2026-10-11 13:34:13.666+00	2026-11-10 13:34:13.667+00	t	2026-10-12 07:56:05.196+00	2026-10-11 13:34:13.669852+00	2026-10-12 07:56:05.198112+00
53dff196-84fc-447a-8bae-5b5ea6284eb5	1b3e765c-f4b6-4263-994b-b7221c34f75c	5d0f9e903298af6b88a37761fe46d88854a64bed6955419ccab64dc17fcff068	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 07:45:27.371+00	2026-11-11 07:45:27.371+00	t	2026-10-12 07:56:18.664+00	2026-10-12 07:45:27.372549+00	2026-10-12 07:56:18.670854+00
ff1e752a-043c-4462-ad27-5b23c28335c0	03816039-249c-462d-a1a2-7a1b855c07ab	cb5fecaf9ffd1e2ec6b10dbbf7f1a98d33e2aebbe1828afbe8a40132eabc4c6c	78831d8d6ea64208c6119ad2b1319c67	Unknown device	\N	\N	202.131.96.18	2026-10-10 10:03:12.701+00	2026-11-09 10:03:12.701+00	t	2026-10-10 10:03:15.001+00	2026-10-10 10:03:12.720705+00	2026-10-10 10:03:15.017905+00
a6421e8d-3f42-4875-a164-1ca206abb637	1b3e765c-f4b6-4263-994b-b7221c34f75c	cab1ca66a6b032e066af60417acc6f1ce64f0eec5e29cfd0a40b25c04027e063	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 07:59:38.5+00	2026-11-11 07:59:38.5+00	f	\N	2026-10-12 07:59:38.504436+00	2026-10-12 07:59:38.504436+00
9f09a943-a5be-4599-bfc1-bcccea01a94c	03816039-249c-462d-a1a2-7a1b855c07ab	5d59c4d1d3eb12e40bbfa11c2757bd8c51d85514e5a2d87924bf9e4532e44057	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 11:14:00.199+00	2026-11-14 11:14:00.199+00	f	\N	2026-10-15 11:14:00.212374+00	2026-10-15 11:14:00.212374+00
89d03545-7c21-42a6-bea1-d44af0ffb44b	03816039-249c-462d-a1a2-7a1b855c07ab	c1ecae11cd6b1deab7fdef6fd340a4c4d5945c0f60bdaf08724f37789c26fa04	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 09:45:55.952+00	2026-11-11 09:45:55.952+00	t	2026-10-12 11:05:39.302+00	2026-10-12 09:45:55.954366+00	2026-10-12 11:05:39.303042+00
314a927c-5c70-4f65-a753-9f49b6bcbe33	1b3e765c-f4b6-4263-994b-b7221c34f75c	e801a6425eadb04d6b802337928d88e71c5027ecc9129e55bc183d5b54ebf826	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 11:23:52.84+00	2026-11-09 11:23:52.84+00	t	2026-10-10 11:24:07.443+00	2026-10-10 11:23:52.841176+00	2026-10-10 11:24:07.445274+00
c47f39e8-2f19-4c66-a18c-a0f78356d563	03816039-249c-462d-a1a2-7a1b855c07ab	ffed9474fe02c17cd76c7dc00b4e9f01133ba125b9097184865171bee8351187	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 11:45:47.233+00	2026-11-11 11:45:47.233+00	t	2026-10-12 11:58:13.728+00	2026-10-12 11:45:47.234039+00	2026-10-12 11:58:13.730352+00
928ce0d2-7bee-4a22-9173-f0f12cf59288	1b3e765c-f4b6-4263-994b-b7221c34f75c	b059d7940011120d453ba42a666fab704560106116ceffef182930cdce9509db	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 11:46:38.73+00	2026-11-09 11:46:38.731+00	t	2026-10-10 11:46:49.831+00	2026-10-10 11:46:38.741253+00	2026-10-10 11:46:49.838719+00
8839e481-9bed-4295-80a9-ba9c36ab658e	03816039-249c-462d-a1a2-7a1b855c07ab	8e60508c0488146b68096cab1bef346dc6e09bac201fe6566b22d625b3d8f3b6	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 12:31:00.746+00	2026-11-11 12:31:00.746+00	t	2026-10-12 12:48:34.663+00	2026-10-12 12:31:00.748734+00	2026-10-12 12:48:34.664877+00
03d952fe-ca99-4378-9014-361075daf836	1b3e765c-f4b6-4263-994b-b7221c34f75c	74b4897b3069e8ef01b343c96fa52520c95321813ae189b2592fef2e154d4ffa	2bddbf0e98c5d3a0a57e52510fa4bea9	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-12 19:23:15.502+00	2026-11-11 19:23:15.503+00	f	\N	2026-10-12 19:23:15.511437+00	2026-10-12 19:23:15.511437+00
6b993932-1eb3-456c-93b1-d441005bd699	1b3e765c-f4b6-4263-994b-b7221c34f75c	d2aa6a3c5b38614387e176be3b19d7e928a4544bd8c0de1bb4f5e8a23aca8060	2bddbf0e98c5d3a0a57e52510fa4bea9	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-12 20:31:16.291+00	2026-11-11 20:31:16.291+00	f	\N	2026-10-12 20:31:16.308044+00	2026-10-12 20:31:16.308044+00
3abf720f-7ef6-4fea-a326-9ba6b05dcc46	03816039-249c-462d-a1a2-7a1b855c07ab	b4f12c818dd71554cbf520a148d4bbd4af1d6faf92b82cbd8370486f4c16e914	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 11:51:53.251+00	2026-11-09 11:51:53.251+00	t	2026-10-10 11:52:07.39+00	2026-10-10 11:51:53.256009+00	2026-10-10 11:52:07.396009+00
e5a3e66c-8a87-4eb8-a7e0-e683f7763061	03816039-249c-462d-a1a2-7a1b855c07ab	11fa9966008fb8b5568ca4e055f99687c83acc2fb74b1850560cb53810005ed1	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 11:53:07.306+00	2026-11-09 11:53:07.306+00	t	2026-10-10 11:53:12.204+00	2026-10-10 11:53:07.314144+00	2026-10-10 11:53:12.213288+00
f11d63a5-a867-4739-83a4-f24c5a2a9695	03816039-249c-462d-a1a2-7a1b855c07ab	b9ecd82a328e57c9f294200f4809edd9378fe05d1bc56da816ca0c16cfccbccd	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 05:01:40.992+00	2026-11-12 05:01:40.992+00	t	2026-10-13 05:32:12.811+00	2026-10-13 05:01:40.99381+00	2026-10-13 05:32:12.813233+00
156778da-5fe6-4994-976b-320c0a737786	03816039-249c-462d-a1a2-7a1b855c07ab	1089dc2a450055a01923ca178f1c824f0ccbdbf9eda2765828dfdf024be0f15d	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 05:36:53.371+00	2026-11-12 05:36:53.372+00	t	2026-10-13 05:39:33.108+00	2026-10-13 05:36:53.372882+00	2026-10-13 05:39:33.110251+00
06921875-aa94-492f-81a0-b4ca5f281073	50a74013-21fd-4641-8c73-369507b8b7c2	c30c0a5db1c95fc1d22497d6bb44e493314c215726d153c899d03b87df5d8c79	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 06:48:26.859+00	2026-11-12 06:48:26.859+00	f	\N	2026-10-13 06:48:26.865649+00	2026-10-13 06:48:26.865649+00
7bff1e06-3b5d-42da-a694-0404e3be8486	03816039-249c-462d-a1a2-7a1b855c07ab	28510f226f982581a3dd940576bcb5a34f8308b1b44723fe08005e2ea0daace2	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 07:17:42.962+00	2026-11-12 07:17:42.962+00	t	2026-10-13 07:18:36.138+00	2026-10-13 07:17:42.965447+00	2026-10-13 07:18:36.142277+00
f5d6ca14-e32c-4766-85ba-85df0de0194d	03816039-249c-462d-a1a2-7a1b855c07ab	54f7956f4393caae0058f5066ceb4bf6cf87f1df073c1c95c4955395804f1bb3	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 07:45:36.798+00	2026-11-12 07:45:36.799+00	t	2026-10-13 07:52:03.942+00	2026-10-13 07:45:36.802703+00	2026-10-13 07:52:03.954385+00
96893042-a9ea-481d-94ba-de50ceb45bed	1b3e765c-f4b6-4263-994b-b7221c34f75c	2a1bd9dae9ec62bd749a6d48bbdbb718b780ff510b6ae76d7bf77d378557e322	97182d262752ab7ea1012cdc4aec5dfc	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:68a6:af39:e6e1:7c0b	2026-10-11 13:03:17.597+00	2026-11-10 13:03:17.597+00	t	2026-10-11 13:31:41.704+00	2026-10-11 13:03:17.605608+00	2026-10-11 13:31:41.716431+00
4e89e35c-6c29-400d-ab11-54c9fbf9a693	50a74013-21fd-4641-8c73-369507b8b7c2	b42124315aaf24bd77d176edfe449a0271c6b655643711386e70e4d70ef5af26	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 12:26:18.313+00	2026-11-09 12:26:18.313+00	t	2026-10-11 13:33:39.147+00	2026-10-10 12:26:18.31632+00	2026-10-11 13:33:39.150756+00
28af6ef7-6f70-470c-aae1-16ed46b7505f	03816039-249c-462d-a1a2-7a1b855c07ab	27af09970b5f27ba0af33569958bd3158b83c958b7faef24af47295e90dc7e1d	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 05:52:58.532+00	2026-11-12 05:52:58.532+00	t	2026-10-13 09:14:13.941+00	2026-10-13 05:44:29.753494+00	2026-10-13 09:14:13.942059+00
849f9f5a-e10f-41ef-b6ed-5e811c6d605c	1b3e765c-f4b6-4263-994b-b7221c34f75c	6702929ae9b0387ca5aa7b1f32d00551e847435c4bf54651d7e6b8f343048704	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 09:39:33.196+00	2026-11-09 09:39:33.196+00	t	2026-10-12 07:14:01.67+00	2026-10-10 09:39:33.198095+00	2026-10-12 07:14:01.674181+00
9aa7223a-ba8b-45d5-9ba5-691303a5ab45	1b3e765c-f4b6-4263-994b-b7221c34f75c	cf3b62ffff7fd476ae5eb03324f323bd77ee7a0402b21d76b14f64fcfa762e25	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 11:46:58.34+00	2026-11-09 11:46:58.34+00	t	2026-10-12 07:14:01.67+00	2026-10-10 11:46:58.347037+00	2026-10-12 07:14:01.674181+00
9b622c30-d888-4ea2-bd45-51432ebf418d	03816039-249c-462d-a1a2-7a1b855c07ab	b115499b2df3e75abf3465f13d33dd3f9737dda8449b7dac1eb37c09bfac284a	bed1493f4ae933154754d0b2cedc21a1	Chrome on Android	Chrome	Android	202.131.96.18	2026-10-10 10:57:14.497+00	2026-11-09 10:57:14.497+00	t	2026-10-12 07:17:13.864+00	2026-10-10 10:57:14.501007+00	2026-10-12 07:17:13.874026+00
b344de22-baa6-4b86-93a4-6ed3f8c525be	03816039-249c-462d-a1a2-7a1b855c07ab	1f55eb62b4dee49c01712e0e49a0aac7bac4bcb942a60791d003c09d93130526	78831d8d6ea64208c6119ad2b1319c67	Unknown device	\N	\N	202.131.96.18	2026-10-10 11:09:45.198+00	2026-11-09 11:09:45.198+00	t	2026-10-12 07:17:13.864+00	2026-10-10 11:09:45.205317+00	2026-10-12 07:17:13.874026+00
09d3520a-20a2-459e-ac5e-b12c8bb5d91a	03816039-249c-462d-a1a2-7a1b855c07ab	a7048c1f8534c81c916899d8657311baba5659021f0e69897b91eca6553ab180	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 11:17:51.911+00	2026-11-09 11:17:51.911+00	t	2026-10-12 07:17:13.864+00	2026-10-10 11:17:51.914271+00	2026-10-12 07:17:13.874026+00
381bbe23-f13d-45f7-b43f-eca8bfb82ab3	03816039-249c-462d-a1a2-7a1b855c07ab	78059681245a67787c4669ccee12b2c93c78140fce4e48616f287d6f61717d64	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 11:22:20.415+00	2026-11-09 11:22:20.415+00	t	2026-10-12 07:17:13.864+00	2026-10-10 11:22:20.417589+00	2026-10-12 07:17:13.874026+00
782eb177-2491-4a20-ab8a-2f9df01853c8	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	7f9e8ff78e99353edbbcc38e964e8055d39e49dbbb9b27169f7555e8ce3f76de	9b48a634a1205d1db1f8bc844c8cd459	Unknown device	\N	\N	2401:4900:aafd:edb8::ba86:bb9d	2026-10-14 06:30:11.421+00	2026-11-13 06:30:11.421+00	t	2026-10-14 06:30:11.593+00	2026-10-12 11:21:14.928361+00	2026-10-14 06:30:11.595789+00
92813e25-06b3-416e-a9fb-fab86e0ff767	50a74013-21fd-4641-8c73-369507b8b7c2	2c4cbe46ad6175ecaa8f56ba201c5a74284ff18ff136fe40f8069c04c308b7aa	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 12:03:25.227+00	2026-11-14 12:03:25.227+00	f	\N	2026-10-15 12:03:25.231772+00	2026-10-15 12:03:25.231772+00
c63be780-12cf-46bb-9c7e-f72966e0b11f	03816039-249c-462d-a1a2-7a1b855c07ab	c9a86adb20cc1d579657997ffc66c550d7e32da31a4c73ec0ef3da6831341f91	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 07:55:21.187+00	2026-11-11 07:55:21.187+00	t	2026-10-12 11:05:39.302+00	2026-10-12 07:55:21.189008+00	2026-10-12 11:05:39.303042+00
83db51fd-02bc-4f68-bdd0-f3fe4bb77d59	03816039-249c-462d-a1a2-7a1b855c07ab	3759b4f83e0aa212649da1888e3208e9e119728c28160eb8414b99f3967f947b	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 11:03:59.175+00	2026-11-11 11:03:59.175+00	t	2026-10-12 11:05:39.302+00	2026-10-12 11:03:59.181792+00	2026-10-12 11:05:39.303042+00
872ff057-937d-4265-881a-48434c780f72	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	07b7d98fd23f38ba1587178dd6562db826512fcb080f9368934a72bfc768dbf3	a8f06615712320df847acbbc3fdb64df	Unknown device	\N	\N	202.131.96.18	2026-10-12 05:29:24.824+00	2026-11-11 05:29:24.824+00	f	\N	2026-10-12 05:29:24.82522+00	2026-10-12 05:29:24.82522+00
6df29fef-c479-4ed5-87cc-c2ed959111a0	03816039-249c-462d-a1a2-7a1b855c07ab	4c12f308255b3ae4f339f9d45a44c555a405ec5b5218e70eed6e41952afc01f9	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 11:25:47.882+00	2026-11-11 11:25:47.882+00	t	2026-10-12 11:58:13.728+00	2026-10-12 11:25:47.886146+00	2026-10-12 11:58:13.730352+00
e6a5d51f-3e23-4273-b1da-5648b4a784f3	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	21becfbe711abe1f07e835fc613c636fbef6e8880de329e4c98e8ad5060a5f3b	a8f06615712320df847acbbc3fdb64df	Unknown device	\N	\N	202.131.96.18	2026-10-12 05:29:49.961+00	2026-11-11 05:29:49.961+00	f	\N	2026-10-12 05:29:32.775886+00	2026-10-12 05:29:49.962749+00
b5288c49-8a33-4383-8c43-883972b04602	03816039-249c-462d-a1a2-7a1b855c07ab	06de18b34a2ee028eb1872ecdd71fd376d795997590a4761870684729c8e440c	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 11:58:30.229+00	2026-11-11 11:58:30.229+00	t	2026-10-12 12:12:55.883+00	2026-10-12 11:58:30.231349+00	2026-10-12 12:12:55.88591+00
ae24f0c5-e21a-4250-b1f5-de4d3a149f99	03816039-249c-462d-a1a2-7a1b855c07ab	a9ec2896385be550c5f3f1c3d38f20e70b5999efce5800f7ae9acb6cfa902ba7	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 05:54:21.398+00	2026-11-11 05:54:21.398+00	t	2026-10-12 05:54:27.22+00	2026-10-12 05:54:21.398879+00	2026-10-12 05:54:27.222938+00
7dce3617-f5eb-400c-9280-32568c090757	1b3e765c-f4b6-4263-994b-b7221c34f75c	0afc904823fd63e2e6c84c4f9e735847ca3b35661d91f8b849b976a05a32fcaa	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 12:32:07.799+00	2026-11-11 12:32:07.799+00	f	\N	2026-10-12 12:32:07.800104+00	2026-10-12 12:32:07.800104+00
4e9d9b7f-ba6d-4d36-8701-a890b1839333	1b3e765c-f4b6-4263-994b-b7221c34f75c	f5c96386d243f48f97008f50ea94a3738d1a549d2055f45da642d48db5bd8c93	2bddbf0e98c5d3a0a57e52510fa4bea9	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-12 19:52:02.067+00	2026-11-11 19:52:02.067+00	f	\N	2026-10-12 19:52:02.074775+00	2026-10-12 19:52:02.074775+00
77e9cf50-99c1-45b7-8c47-ae177b7b7bb1	1b3e765c-f4b6-4263-994b-b7221c34f75c	dafccac3c152d5f76c3fbcf9b7b437fc26afc21dfa6b0d93ac3d5a5c6851efed	78a502c7d02f26285e0cc4cee1aea1e8	Unknown device	\N	\N	202.131.96.18	2026-10-10 06:37:15.267+00	2026-11-09 06:37:15.267+00	t	2026-10-12 07:14:01.67+00	2026-10-10 06:37:15.270802+00	2026-10-12 07:14:01.674181+00
5a30783d-ef4b-4560-a1bf-2d9d9912b0fd	1b3e765c-f4b6-4263-994b-b7221c34f75c	68fb652814c4178d4c5710a0e6503fd3ba516ded58696db2c18c7cf1397415ca	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 06:39:41.544+00	2026-11-09 06:39:41.545+00	t	2026-10-12 07:14:01.67+00	2026-10-10 06:39:41.547908+00	2026-10-12 07:14:01.674181+00
a7dcb6da-a5b1-4065-879a-a90a07c3d2c8	1b3e765c-f4b6-4263-994b-b7221c34f75c	f40cd68a63034dac86b7d9e69b3743b13a1fdfd2829b5ef7329d5ea5e805ff98	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 12:08:28.058+00	2026-11-09 12:08:28.058+00	t	2026-10-12 07:14:01.67+00	2026-10-10 12:08:28.068732+00	2026-10-12 07:14:01.674181+00
f6b63dfb-db9c-470a-945c-451110cdaaf4	1b3e765c-f4b6-4263-994b-b7221c34f75c	a9898a753e2b4dca9419e133ab57fd48b2a94d2e5fe54489a21cd1c5823a6562	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 12:23:04.865+00	2026-11-09 12:23:04.865+00	t	2026-10-12 07:14:01.67+00	2026-10-10 12:23:04.867047+00	2026-10-12 07:14:01.674181+00
d579b324-3a90-4d19-8062-26845ddf04f9	1b3e765c-f4b6-4263-994b-b7221c34f75c	1dae186c09c3976c9815fd38660aab00954b76d647601f6dbf3f24386a598a89	97182d262752ab7ea1012cdc4aec5dfc	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:68a6:af39:e6e1:7c0b	2026-10-11 20:12:25.257+00	2026-11-10 20:12:25.257+00	t	2026-10-12 07:14:01.67+00	2026-10-11 20:12:25.266299+00	2026-10-12 07:14:01.674181+00
3af96af6-9bf7-42bb-8d74-39518e4ad369	1b3e765c-f4b6-4263-994b-b7221c34f75c	3b7e14f7dbef3da8039396c54b2408066ec58de42bb46f88eac57742a80be490	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 05:15:25.815+00	2026-11-11 05:15:25.815+00	t	2026-10-12 07:14:01.67+00	2026-10-12 05:15:25.820263+00	2026-10-12 07:14:01.674181+00
441416d4-b39f-40c5-bd2d-793cec41ed75	1b3e765c-f4b6-4263-994b-b7221c34f75c	1fcc68bf69ca716ec7bf7b92423d51481f28382ac78515937c0671c82ab278e1	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 07:13:18.407+00	2026-11-11 07:13:18.407+00	t	2026-10-12 07:14:01.67+00	2026-10-12 07:13:18.410779+00	2026-10-12 07:14:01.674181+00
7e24725d-4373-4879-b89c-5ad86e1e485b	03816039-249c-462d-a1a2-7a1b855c07ab	51dc1575c9f1b0716b5610b0e3a71d663a0a0cc1d27da0edb9aff3e0c5cede14	e4e503401be91d9fc2af034e0fcc6662	Windows	\N	Windows	202.131.96.18	2026-10-10 09:12:50.619+00	2026-11-09 09:12:50.619+00	t	2026-10-12 07:17:13.864+00	2026-10-10 09:12:50.633661+00	2026-10-12 07:17:13.874026+00
19013c8a-2756-486f-9e69-82d8a7ac3e26	03816039-249c-462d-a1a2-7a1b855c07ab	3744d911d2aec436edae16e0ebd64922f3162b612749dcc2a3c0de9833068cf5	78831d8d6ea64208c6119ad2b1319c67	Unknown device	\N	\N	202.131.96.18	2026-10-10 09:28:34.432+00	2026-11-09 09:28:34.432+00	t	2026-10-12 07:17:13.864+00	2026-10-10 09:28:34.434757+00	2026-10-12 07:17:13.874026+00
9ca15375-24d3-403a-9ec8-a5a549b865ad	03816039-249c-462d-a1a2-7a1b855c07ab	c641600fcfeca7b1d52014b79e046ddc8231b6b7460927a381dc7085371b507f	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 11:30:30.167+00	2026-11-09 11:30:30.167+00	t	2026-10-12 07:17:13.864+00	2026-10-10 11:30:30.168663+00	2026-10-12 07:17:13.874026+00
fda1f3de-e0b7-423d-b6e9-48e5a4e9e1cb	03816039-249c-462d-a1a2-7a1b855c07ab	7cf73a88d9301b2465f7b3b315c6363cd8adc3e1cfd9072b754515bffe4c733b	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 11:49:30.772+00	2026-11-09 11:49:30.772+00	t	2026-10-12 07:17:13.864+00	2026-10-10 11:49:30.776497+00	2026-10-12 07:17:13.874026+00
c4c503c3-3fa8-4fcf-b889-e95672980ef9	03816039-249c-462d-a1a2-7a1b855c07ab	3a2ad0e35e3b44d96344adfba4a79448f2c9b3a31f4347abc7c2457e54ffb2a0	bed1493f4ae933154754d0b2cedc21a1	Chrome on Android	Chrome	Android	202.131.96.18	2026-10-10 11:57:48.788+00	2026-11-09 11:57:48.788+00	t	2026-10-12 07:17:13.864+00	2026-10-10 11:57:48.791129+00	2026-10-12 07:17:13.874026+00
34a2928f-c770-485d-ba51-dd6bbe029e37	03816039-249c-462d-a1a2-7a1b855c07ab	4a5eb7c3a42a9b24f8dd558c638cc01673df9a93c5fb92491e90136cfbf56860	bed1493f4ae933154754d0b2cedc21a1	Chrome on Android	Chrome	Android	202.131.96.18	2026-10-10 12:01:50.126+00	2026-11-09 12:01:50.126+00	t	2026-10-12 07:17:13.864+00	2026-10-10 12:01:50.127622+00	2026-10-12 07:17:13.874026+00
b17ccd52-0383-4b82-8dbc-406e80a75204	03816039-249c-462d-a1a2-7a1b855c07ab	2249448be8834eaabf5a5a3449e34b3fc496bc7af1840798c62a64b6049d4914	bed1493f4ae933154754d0b2cedc21a1	Chrome on Android	Chrome	Android	202.131.96.18	2026-10-10 12:04:58.48+00	2026-11-09 12:04:58.48+00	t	2026-10-12 07:17:13.864+00	2026-10-10 12:04:58.482367+00	2026-10-12 07:17:13.874026+00
6698c33d-827a-4565-849b-7f85286cb998	03816039-249c-462d-a1a2-7a1b855c07ab	8b43745c234ae8fa01480dda15aeb8252924b6a11e7a8f8f8c2c37062b280bf9	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 12:05:55.416+00	2026-11-09 12:05:55.416+00	t	2026-10-12 07:17:13.864+00	2026-10-10 12:05:55.417591+00	2026-10-12 07:17:13.874026+00
fd5c8f32-a2cb-4cc0-9823-e164829ec62c	03816039-249c-462d-a1a2-7a1b855c07ab	e022194febbb0bf173f8b6d403947d6ae1bfff056990c637b4bbdf368842cf28	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 12:09:10.71+00	2026-11-09 12:09:10.71+00	t	2026-10-12 07:17:13.864+00	2026-10-10 12:09:10.716318+00	2026-10-12 07:17:13.874026+00
7f769061-dab3-4f65-af2b-9c23d941ed63	03816039-249c-462d-a1a2-7a1b855c07ab	13a4be6c90fcac1e633143326631679f55f0d3492a90395df46acb5292c9d038	971024aeea37c9e88ceba292da0f4389	Chrome on Windows	Chrome	Windows	43.242.116.253	2026-10-11 17:20:09.357+00	2026-11-10 17:20:09.357+00	t	2026-10-12 07:17:13.864+00	2026-10-11 17:20:09.362888+00	2026-10-12 07:17:13.874026+00
36d3337d-e5c6-4025-82d9-a9c5535ffa1a	03816039-249c-462d-a1a2-7a1b855c07ab	2f5d0f54f9bd24c0aa7c0d04f29ef85bb3605bfc626a0c323cfc35a594e3bc5d	971024aeea37c9e88ceba292da0f4389	Chrome on Windows	Chrome	Windows	43.242.116.253	2026-10-11 17:24:26.798+00	2026-11-10 17:24:26.798+00	t	2026-10-12 07:17:13.864+00	2026-10-11 17:24:26.799756+00	2026-10-12 07:17:13.874026+00
3708adf7-3fbc-4f65-b243-78f1e241e9a3	03816039-249c-462d-a1a2-7a1b855c07ab	5f4b87cff2ff537201f077b7024554625afbb4affbd376c067a580fd2d494271	971024aeea37c9e88ceba292da0f4389	Chrome on Windows	Chrome	Windows	43.242.116.253	2026-10-11 17:25:03.281+00	2026-11-10 17:25:03.281+00	t	2026-10-12 07:17:13.864+00	2026-10-11 17:25:03.28298+00	2026-10-12 07:17:13.874026+00
2d56b965-e2e2-4311-b73d-67bf5213bab8	03816039-249c-462d-a1a2-7a1b855c07ab	160098f4cf07d2b4a378d841ec4f752313387452622bbd1198e27a989fb400d6	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 05:28:12.296+00	2026-11-11 05:28:12.297+00	t	2026-10-12 07:17:13.864+00	2026-10-12 05:28:12.299203+00	2026-10-12 07:17:13.874026+00
c948cc00-78df-48c5-acfa-bcc7affa4a92	03816039-249c-462d-a1a2-7a1b855c07ab	2d1660b5f31cdc3ccc0e86bc3df2d727e8f57eaf16cfa3ec68de70c7db2a5fc0	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 05:51:50.568+00	2026-11-11 05:51:50.568+00	t	2026-10-12 07:17:13.864+00	2026-10-12 05:51:50.576115+00	2026-10-12 07:17:13.874026+00
b8fc6221-235a-4349-a351-7246eaa41f02	03816039-249c-462d-a1a2-7a1b855c07ab	f6db89cbc409a57e12d6fc41b80af7022d9b8e7011511dfdc44eb4e55cb49178	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 12:13:19.402+00	2026-11-09 12:13:19.402+00	t	2026-10-12 07:17:13.864+00	2026-10-10 12:13:19.412767+00	2026-10-12 07:17:13.874026+00
79642081-4f06-48f1-b4e9-1aa6b0a55f1d	03816039-249c-462d-a1a2-7a1b855c07ab	186bc952d36c4a532d4f679df907dd8cf051f3dae07ac83360426be501a02f7c	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 12:17:25.553+00	2026-11-09 12:17:25.553+00	t	2026-10-12 07:17:13.864+00	2026-10-10 12:17:25.554456+00	2026-10-12 07:17:13.874026+00
4914dca3-d155-43a4-9a84-447a8e850d5c	03816039-249c-462d-a1a2-7a1b855c07ab	2a55e25d797aa76f2127ad0335999db86c6f4fc437f32e06b6958fb31bec1f06	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 12:18:38.285+00	2026-11-09 12:18:38.285+00	t	2026-10-12 07:17:13.864+00	2026-10-10 12:18:38.28657+00	2026-10-12 07:17:13.874026+00
b4cd3544-5b8a-46d7-9d80-066b32296088	03816039-249c-462d-a1a2-7a1b855c07ab	a70612f9a7ee8d8a6e691fc29bb97848e6cae52645c313660a3d5dff08e5d13c	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-10 12:23:33.086+00	2026-11-09 12:23:33.086+00	t	2026-10-12 07:17:13.864+00	2026-10-10 12:23:33.087906+00	2026-10-12 07:17:13.874026+00
cfb72e3b-5c67-4b0e-844f-fd86cd97e734	03816039-249c-462d-a1a2-7a1b855c07ab	bbaeee229b15cb0d2de4657324b51ea7d1d09e42c6a1c6d964f37f016a985145	971024aeea37c9e88ceba292da0f4389	Chrome on Windows	Chrome	Windows	43.242.116.253	2026-10-11 17:19:09.606+00	2026-11-10 17:19:09.606+00	t	2026-10-12 07:17:13.864+00	2026-10-11 17:19:09.61751+00	2026-10-12 07:17:13.874026+00
24471562-89cc-4f03-99d3-51125ad918ca	03816039-249c-462d-a1a2-7a1b855c07ab	71c38d348338a5ce69dde1b9d4a440a98e80a7d84a6bd57452a06a69d094d320	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 07:11:07.395+00	2026-11-11 07:11:07.395+00	t	2026-10-12 07:17:13.864+00	2026-10-12 07:11:07.405776+00	2026-10-12 07:17:13.874026+00
5094b8d1-5992-467d-9bec-a9e12cfbb0fa	03816039-249c-462d-a1a2-7a1b855c07ab	b34001f50d1c4f43e6586cb28a8fff469e7e67826fd448556387e991b3757054	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 07:16:09.161+00	2026-11-11 07:16:09.161+00	t	2026-10-12 07:17:13.864+00	2026-10-12 07:16:09.163735+00	2026-10-12 07:17:13.874026+00
bd178d9e-fc3e-4b9a-8038-d4e65df825f2	03816039-249c-462d-a1a2-7a1b855c07ab	f2903e7a2c99cf9150d7e381fee1868d950e41c73760bd856b738ff8320e68ce	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 07:56:41.397+00	2026-11-11 07:56:41.397+00	t	2026-10-12 11:05:39.302+00	2026-10-12 07:56:41.403847+00	2026-10-12 11:05:39.303042+00
04d1ea5b-1193-45d4-8f28-31f21a534d47	03816039-249c-462d-a1a2-7a1b855c07ab	638283c89fb7269d0f3cafc37820ddc9d6e4ec74f6e4920e1e66a3ccea249a60	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 09:06:17.614+00	2026-11-11 09:06:17.614+00	t	2026-10-12 11:05:39.302+00	2026-10-12 09:06:17.62234+00	2026-10-12 11:05:39.303042+00
0b7de67b-e03f-44e7-8b98-86738a2680ef	03816039-249c-462d-a1a2-7a1b855c07ab	096fc61db2460acae46f7228505cf227e6fbe2bc0fa734914cafd9f5a3e3dc60	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 11:06:04.137+00	2026-11-11 11:06:04.137+00	t	2026-10-12 11:25:35.625+00	2026-10-12 11:06:04.139117+00	2026-10-12 11:25:35.629086+00
e0d1de52-9108-49cb-ac0c-e83deb9415f0	03816039-249c-462d-a1a2-7a1b855c07ab	bc8604d7146084c5707a974c51cc6697f5c4e1ffb30252ca105386aa6ac3a5da	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 11:31:38.268+00	2026-11-11 11:31:38.268+00	t	2026-10-12 11:58:13.728+00	2026-10-12 11:31:38.270029+00	2026-10-12 11:58:13.730352+00
fa768ac6-3537-40d6-b607-cf86d57dc2f1	50a74013-21fd-4641-8c73-369507b8b7c2	4165c2939332a8774c62286948bc9b730157c57d1e7c497a7f570d733ae67a0f	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 12:12:33.437+00	2026-11-11 12:12:33.437+00	f	\N	2026-10-12 12:12:33.451084+00	2026-10-12 12:12:33.451084+00
0ece2cc0-cfbe-43fd-85ec-35e51eda3c9a	03816039-249c-462d-a1a2-7a1b855c07ab	692750ec5d2df07d454457b48819746e25cfa93ea09a5b466d45cfdab30cb06c	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 12:48:55.969+00	2026-11-11 12:48:55.969+00	t	2026-10-12 12:58:15.979+00	2026-10-12 12:48:55.970903+00	2026-10-12 12:58:15.980956+00
9bbe81ec-31cb-418b-9440-f4223fadb1fa	50a74013-21fd-4641-8c73-369507b8b7c2	7ca325f46dcf1a28680a42db76aa35896ba1ee46bf267eeac80befab7fcd845f	2bddbf0e98c5d3a0a57e52510fa4bea9	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-12 19:57:45.096+00	2026-11-11 19:57:45.096+00	f	\N	2026-10-12 19:57:45.097682+00	2026-10-12 19:57:45.097682+00
4769ef93-f98c-4177-8e78-ffeb781b8962	03816039-249c-462d-a1a2-7a1b855c07ab	53da9c249fdf9a7f77bab264af3b15e15f3553095ffd4de90e78f3e8f6fb5b5d	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 05:00:03.583+00	2026-11-12 05:00:03.584+00	t	2026-10-13 05:00:16.766+00	2026-10-13 05:00:03.587371+00	2026-10-13 05:00:16.768278+00
3adc52cb-e21e-4213-bbf7-3894663b0eaf	50a74013-21fd-4641-8c73-369507b8b7c2	3d3b3d59749691ec394c7f964ed1901ec88604ebb2d1101826974c1c03820318	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 05:08:02.159+00	2026-11-12 05:08:02.159+00	f	\N	2026-10-13 05:08:02.161373+00	2026-10-13 05:08:02.161373+00
6695bdbd-9468-4734-bc16-e8953f674ab8	03816039-249c-462d-a1a2-7a1b855c07ab	016879af116cbb09481484ca95e620de31aa0b654dcefea8b5c05c9e9e2177e6	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-12 13:03:09.291+00	2026-11-11 13:03:09.291+00	t	2026-10-13 05:24:17.851+00	2026-10-12 13:03:09.292425+00	2026-10-13 05:24:17.854537+00
b7e6d93b-b7c4-4564-b3e6-c5943e4f5fef	03816039-249c-462d-a1a2-7a1b855c07ab	ecdd9678ef07747847e323b44b050b1b44393f0ee2f92b6c5d4d813e48c2b4d4	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 05:39:51.74+00	2026-11-12 05:39:51.74+00	t	2026-10-13 06:38:45.985+00	2026-10-13 05:39:51.742346+00	2026-10-13 06:38:45.988914+00
1abac9a0-8927-4b65-9c0e-29792a71a5d3	50a74013-21fd-4641-8c73-369507b8b7c2	4b80f8b97c4cc256f1890efe3ffb8ec5435664d27f03df4b5113d50381a726ca	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 06:50:56.049+00	2026-11-12 06:50:56.049+00	f	\N	2026-10-13 06:50:56.060758+00	2026-10-13 06:50:56.060758+00
ed49d34d-da9f-4a09-94a2-4d7b8cc3c4f7	03816039-249c-462d-a1a2-7a1b855c07ab	ece896e97ea999573dc9cd4712e8385a2db2c8edbe63b4123e817d0062290e32	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 06:39:06.725+00	2026-11-12 06:39:06.725+00	t	2026-10-13 07:17:21.546+00	2026-10-13 06:39:06.728697+00	2026-10-13 07:17:21.550507+00
9b499341-3086-4a8d-aed0-ffab2c8d97fa	03816039-249c-462d-a1a2-7a1b855c07ab	215d88f4b4a6e71117991a95ae59444519cef6326da21a27c4b03cfaf6eb942d	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 07:18:49.084+00	2026-11-12 07:18:49.084+00	t	2026-10-13 07:45:17.13+00	2026-10-13 07:18:49.087526+00	2026-10-13 07:45:17.133917+00
b6a11d57-1d14-49c7-84af-b535ce3d8b3a	03816039-249c-462d-a1a2-7a1b855c07ab	3ee3abe052ee090f2054eb1445eac6f6d37ec8f43a668d4b7df3e648fe129b1d	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 09:02:24.803+00	2026-11-12 09:02:24.803+00	t	2026-10-13 09:02:51.696+00	2026-10-13 09:02:24.806826+00	2026-10-13 09:02:51.700802+00
2924cad0-5c64-4e91-b125-7b539ed410fe	03816039-249c-462d-a1a2-7a1b855c07ab	7ddbb15f91ddb7088aa9bbabbfcc71ca02b43a9661cd5811ac62997673dc3536	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 07:52:13.696+00	2026-11-12 07:52:13.696+00	t	2026-10-13 09:14:13.941+00	2026-10-13 07:52:13.708041+00	2026-10-13 09:14:13.942059+00
00c4f455-a6b5-4cfa-825f-35b683371410	03816039-249c-462d-a1a2-7a1b855c07ab	4729637aec9e59f44a72ae91e93115fc3210b78a2a8c2fad7d54cb35370e4e08	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 09:13:35.765+00	2026-11-12 09:13:35.765+00	t	2026-10-13 09:14:27.769+00	2026-10-13 09:13:35.765902+00	2026-10-13 09:14:27.770079+00
0a4731bf-c5b7-415d-90f0-4bf9187c5e45	03816039-249c-462d-a1a2-7a1b855c07ab	030ad12fb50ca96f1c3c9e7175d15005f1e26d1b37bbdf392aa63cea2d27f732	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 09:29:23.001+00	2026-11-12 09:29:23.001+00	t	2026-10-13 10:31:46.689+00	2026-10-13 09:29:23.0031+00	2026-10-13 10:31:46.691853+00
0ba6df5b-c3bc-4b70-a7d9-4bf527f2cf22	03816039-249c-462d-a1a2-7a1b855c07ab	eed5a0ff5f9c243c31fb67a8fba4269fb08445bacd8f2d7b6bd429dff5a075ad	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 10:32:02.563+00	2026-11-12 10:32:02.563+00	f	\N	2026-10-13 10:32:02.565912+00	2026-10-13 10:32:02.565912+00
5df9a3e9-f3b4-41db-bbc6-ffd5e0490790	50a74013-21fd-4641-8c73-369507b8b7c2	de88300a94f2b67a1581e7b84b3e436198ddc30b174aa713cbebe13c89ba9366	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 11:14:02.237+00	2026-11-12 11:14:02.237+00	f	\N	2026-10-13 11:14:02.245792+00	2026-10-13 11:14:02.245792+00
d2cd9f58-c5cd-4c0c-9d5b-332b65b8b4f4	50a74013-21fd-4641-8c73-369507b8b7c2	31c4d4838eac17fa9a8927ea2918a83d86e355359516f1256649e5b1ca9827ae	78a502c7d02f26285e0cc4cee1aea1e8	Unknown device	\N	\N	202.131.96.18	2026-10-13 11:15:20.704+00	2026-11-12 11:15:20.704+00	f	\N	2026-10-13 11:15:20.705215+00	2026-10-13 11:15:20.705215+00
994fa940-6420-408d-8846-1ff48e09d0c9	50a74013-21fd-4641-8c73-369507b8b7c2	bc48850617307a03a1dd71c1b723b78cf8d40f6048412613c3cd91124b79f360	78a502c7d02f26285e0cc4cee1aea1e8	Unknown device	\N	\N	202.131.96.18	2026-10-13 11:15:45.69+00	2026-11-12 11:15:45.69+00	f	\N	2026-10-13 11:15:45.691328+00	2026-10-13 11:15:45.691328+00
6125bcbc-766f-485a-8f58-fbefab481086	03816039-249c-462d-a1a2-7a1b855c07ab	a4a4644e5348eaee622aa2a225192c4b9a96b1af9e96551e24bb4cee46bb6293	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 09:58:37.737+00	2026-11-12 09:58:37.737+00	t	2026-10-13 11:24:18.212+00	2026-10-13 09:58:37.738103+00	2026-10-13 11:24:18.216052+00
aabc0f24-644e-4a47-a14d-6125b87f5517	1b3e765c-f4b6-4263-994b-b7221c34f75c	8e1a2dd14b5242e519b65a1edf35d4d1952e5f086201fa1c0cf340a682d47fd9	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 12:06:38.444+00	2026-11-12 12:06:38.444+00	f	\N	2026-10-13 12:06:38.454145+00	2026-10-13 12:06:38.454145+00
f2ae968e-df12-49fe-832a-df1e41e4f210	03816039-249c-462d-a1a2-7a1b855c07ab	c599979bb289ec06741242ad93dc115522966bb7ebe3ab50c9fa63cbb67201ba	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 12:07:57.799+00	2026-11-12 12:07:57.8+00	f	\N	2026-10-13 12:07:57.800977+00	2026-10-13 12:07:57.800977+00
5b098676-9e7c-4709-904c-2e8504201718	03816039-249c-462d-a1a2-7a1b855c07ab	27be77537f3c1356916944a11bc01ba3dfa1f4d825f1fe80042f759f50f4dea9	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-13 12:48:01.601+00	2026-11-12 12:48:01.601+00	f	\N	2026-10-13 12:48:01.611257+00	2026-10-13 12:48:01.611257+00
f892d065-ba21-4a17-8743-b778f1ede99a	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	45106b368424310e932f5e43e36a01996ed321a022b47f66a3c25bbc899c639d	80a6db4359a215dbfd7414493e185419	Chrome on macOS	Chrome	macOS	202.131.96.18	2026-10-15 11:23:14.561+00	2026-11-14 11:23:14.561+00	f	\N	2026-10-15 11:23:14.564293+00	2026-10-15 11:23:14.564293+00
5ce55b1e-16aa-4817-b70d-9043827514a8	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	19f687a7f4e1df77f60dc7c4e4d1af050f713bad1d06b324dd83ceb9fb635a7b	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 05:00:58.367+00	2026-11-13 05:00:58.367+00	t	2026-10-14 05:01:14.86+00	2026-10-14 05:00:58.369163+00	2026-10-14 05:01:14.862086+00
10c1072f-4ac5-406b-a7b4-c63bff5ac143	03816039-249c-462d-a1a2-7a1b855c07ab	44a1ddddf9257d9047e23a3cc6a8df5aeeeb7edaf75f31dbb2700320c0f84755	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 05:05:09.097+00	2026-11-13 05:05:09.097+00	f	\N	2026-10-14 05:05:09.109809+00	2026-10-14 05:05:09.109809+00
e0dc1ff2-b3b9-4964-aaf7-fbb9e88cc3e9	0e9621c5-c42a-47de-9520-4f3da89600d7	cbd50f6d23641a907c8f76a9543ec7baca7cefb007bd8da57a07c72a89081adf	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:29:25.304+00	2026-11-27 10:29:25.304+00	t	2026-10-28 10:39:53.753+00	2026-10-28 10:29:25.306316+00	2026-10-28 10:39:53.753587+00
c60acfbb-e8f1-4d76-bcde-fd14e4454b21	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	5af2afb02b5d75e912912bdcfb7298e5c2ed37b2f2d948bcc94335bda513ff37	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 05:28:37.431+00	2026-11-13 05:28:37.431+00	t	2026-10-14 05:28:53.385+00	2026-10-14 05:28:37.433937+00	2026-10-14 05:28:53.388+00
15f3222f-d4be-4b9d-befd-9e142003331d	1b3e765c-f4b6-4263-994b-b7221c34f75c	e17988f189e2980320be8101fa6ffb4658d4db7027f57dfc883d1add3be57002	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 05:34:48.789+00	2026-11-13 05:34:48.789+00	f	\N	2026-10-14 05:34:48.791049+00	2026-10-14 05:34:48.791049+00
c044baf6-3862-4007-84f7-5cda560b5fee	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	dcf8247c810dd93c5015ed80f71f8b1c288aaefc13f9cbbeb89bdff72d9306bb	0da97d52ff184537a2c5cdc4f73699c1	Unknown device	\N	\N	202.131.96.18	2026-10-14 05:43:16.727+00	2026-11-13 05:43:16.727+00	f	\N	2026-10-14 05:43:16.73052+00	2026-10-14 05:43:16.73052+00
2aed6be7-123f-4391-b5c4-0bebbe91fe7d	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	791aa89895215359937db0c10c46e97ec585d8f42a2e7d3213dc8ea6d0b93dab	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 05:45:30.382+00	2026-11-13 05:45:30.382+00	t	2026-10-14 05:45:42.739+00	2026-10-14 05:45:30.383596+00	2026-10-14 05:45:42.741306+00
32c15d7a-2522-481d-a447-51e09b06e3c0	50a74013-21fd-4641-8c73-369507b8b7c2	b4b43f84147b9684d90be8a23029f763edb475b8c21c2f76033e6445c4197894	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 05:48:31.765+00	2026-11-13 05:48:31.765+00	f	\N	2026-10-14 05:48:31.766131+00	2026-10-14 05:48:31.766131+00
4f4cad3d-1029-45a2-861e-5c4a151f13c0	03816039-249c-462d-a1a2-7a1b855c07ab	e9fe13bb0a699669a237c2e79ff1d9121ad777e67abaece1379fe4eefa9e873f	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 06:13:33.214+00	2026-11-13 06:13:33.214+00	f	\N	2026-10-14 06:13:33.216862+00	2026-10-14 06:13:33.216862+00
ccc936b4-98fc-45d3-a15e-6157aa6460ef	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	3c17486e70ea63cc2714a413df81efe21ef6d547884826f72f2a53f23e4ff834	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 05:48:50.59+00	2026-11-13 05:48:50.59+00	t	2026-10-14 06:26:13.738+00	2026-10-14 05:48:50.591267+00	2026-10-14 06:26:13.740802+00
2fb85c1f-7490-4d94-95e8-b5d73846ba8f	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	8385f9c1898d0d2f03ad63b46108bb84b78857812573d9b860982d12bdbc81d3	0da97d52ff184537a2c5cdc4f73699c1	Unknown device	\N	\N	202.131.96.18	2026-10-14 06:34:34.948+00	2026-11-13 06:34:34.948+00	t	2026-10-14 06:34:35.123+00	2026-10-14 06:34:34.853169+00	2026-10-14 06:34:35.128683+00
7b35c46a-cd87-4f09-b84b-4833429a7215	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	0654376c4d8a2737f7a782d78609e707b302c4137ce4292acc069da8b3c922d4	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 06:43:27.459+00	2026-11-13 06:43:27.46+00	f	\N	2026-10-14 06:43:27.473395+00	2026-10-14 06:43:27.473395+00
0ebe1e80-bca5-48bd-a621-d261436427a0	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	f5c39da4ebc47379de52a3930f47544ad733dd307362c92caf469af6e606efaf	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 06:50:16.667+00	2026-11-13 06:50:16.667+00	t	2026-10-14 06:50:58.368+00	2026-10-14 06:50:16.669928+00	2026-10-14 06:50:58.368987+00
949d9c3c-60da-427c-ab42-9c452a270fda	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	4c3596821987b7b905f1f632403a83b1b5d8a5fceee17b093e2b30da363602ff	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 06:51:46.123+00	2026-11-13 06:51:46.123+00	t	2026-10-14 06:52:18.921+00	2026-10-14 06:51:46.128503+00	2026-10-14 06:52:18.924771+00
7b29974e-ab40-471d-886d-8107437b74ff	50a74013-21fd-4641-8c73-369507b8b7c2	ffb8a25e3c32c12bc0a53f41f53aa4d786ba0eb050d724f987447a0cf9ca10b3	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 06:52:45.036+00	2026-11-13 06:52:45.036+00	f	\N	2026-10-14 06:52:45.040452+00	2026-10-14 06:52:45.040452+00
f682e048-84d1-4758-856e-d3b658bc392d	03816039-249c-462d-a1a2-7a1b855c07ab	e8fbe6321644f9f6fb6ea1e2432e74a58eeb94597e80a617942df64442ed8778	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 04:45:33.401+00	2026-11-13 04:45:33.401+00	t	2026-10-14 06:57:21.221+00	2026-10-14 04:45:33.407185+00	2026-10-14 06:57:21.223053+00
812dbf1d-5183-4d5b-b945-b9b8346359db	a4acc004-9d12-4dec-a1f4-6b89175b85e1	b08360a96a5517b3519da6ed00b8bc81f20a328b75b230ab2946a0e46dedab94	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 07:06:11.532+00	2026-11-13 07:06:11.532+00	t	2026-10-14 07:06:40.256+00	2026-10-14 07:06:11.534722+00	2026-10-14 07:06:40.258422+00
6d03320a-5058-4360-bf16-d09079ddd402	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	b96ac711b9c708a788a336ff8bd7a94f02b8e57e854fe7ce2dde1e53a8da4fcf	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 11:01:34.007+00	2026-11-13 11:01:34.007+00	t	2026-10-14 11:01:34.077+00	2026-10-14 07:08:38.709025+00	2026-10-14 11:01:34.079569+00
4d045bcb-df28-4041-9ecc-0c25659d229c	03816039-249c-462d-a1a2-7a1b855c07ab	b654d77360a6f716c5d2b997c271dabcc5deb08584bb646c4eaf844b818fdfa9	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 07:15:00.646+00	2026-11-13 07:15:00.646+00	t	2026-10-14 07:18:03.578+00	2026-10-14 06:57:30.005457+00	2026-10-14 07:18:03.583416+00
cfc6de6e-727a-4b74-b310-f90fdda514a8	50a74013-21fd-4641-8c73-369507b8b7c2	17d75a5f643ae8ac503802a401b77c4df50abdcff6db068dab24f234be3af619	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 07:38:42.488+00	2026-11-13 07:38:42.488+00	f	\N	2026-10-14 07:38:42.495195+00	2026-10-14 07:38:42.495195+00
36d2ad0b-0118-4d6f-8855-11b5a32e1730	03816039-249c-462d-a1a2-7a1b855c07ab	70468060909ea25730f7586fe0c15b8a3a43aacd181f44c720b3df76615978ba	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 11:30:24.309+00	2026-11-13 11:30:24.309+00	f	\N	2026-10-14 11:30:24.310912+00	2026-10-14 11:30:24.310912+00
be055fcc-33d4-499b-9618-1369e81bd424	50a74013-21fd-4641-8c73-369507b8b7c2	d2ec6b3bfcccdc48d99ff5a94421094005006dd80b849215020b38ec639f13cd	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 11:31:37.769+00	2026-11-13 11:31:37.769+00	f	\N	2026-10-14 11:31:37.776361+00	2026-10-14 11:31:37.776361+00
799b3548-0eb0-4a26-984f-1d349aa949b6	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	b6653510a113e77025c165e9d0154d38bbbe825cb3761b8ebce16ce55910c34f	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-14 12:08:22.333+00	2026-11-13 12:08:22.333+00	f	\N	2026-10-14 11:01:38.932547+00	2026-10-14 12:08:22.338027+00
969d6e00-a00b-47bd-90f5-eed78f107a3e	50a74013-21fd-4641-8c73-369507b8b7c2	390864a31aa51732eb1a5159ce5a6e390232f9fd2dcb194fbc1053e354ccfaa0	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 09:11:58.91+00	2026-11-13 09:11:58.91+00	f	\N	2026-10-14 09:11:58.920368+00	2026-10-14 09:11:58.920368+00
0b8cc0eb-362e-4060-89a8-31047067649b	1b3e765c-f4b6-4263-994b-b7221c34f75c	4aa55fd933a713ed84b500a083ed463fcf3846ad659b25570529a8941d949b1f	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 09:14:41.582+00	2026-11-13 09:14:41.582+00	f	\N	2026-10-14 09:14:41.583825+00	2026-10-14 09:14:41.583825+00
526e10d8-34ed-483a-89f9-f60b58ab4acd	50a74013-21fd-4641-8c73-369507b8b7c2	3d9d9961c911541efd06936f6f66a24ed131ef7d0036791405d3090ecf9ab82c	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 09:28:17.256+00	2026-11-13 09:28:17.257+00	f	\N	2026-10-14 09:28:17.272235+00	2026-10-14 09:28:17.272235+00
353ec7af-b1dd-4424-a963-9a09adc17b34	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	5eeb40ed8c04dd90bc04cc292092572a2bbebe668b9b2d1ddd189f723cf6b109	1d348f5093c7bd6acca4bfa42b2f0a78	Unknown device	\N	\N	202.131.96.18	2026-10-14 10:16:18.01+00	2026-11-13 10:16:18.011+00	f	\N	2026-10-14 10:16:18.0153+00	2026-10-14 10:16:18.0153+00
c6d1e6d0-938f-4215-afc6-f134569a54bc	50a74013-21fd-4641-8c73-369507b8b7c2	1016f131ba2c483b576127cd3a92b17a9b2bfbd94d0a09b6d738b0510267fade	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 11:32:17.048+00	2026-11-13 11:32:17.048+00	f	\N	2026-10-14 11:32:17.052978+00	2026-10-14 11:32:17.052978+00
6bb37c98-b481-4021-bd36-254d5983c2e6	03816039-249c-462d-a1a2-7a1b855c07ab	b6b57a72404aa5190eced1038363542cb29a98863d44a505629d4b3e59e2d46e	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 11:33:14.853+00	2026-11-13 11:33:14.853+00	f	\N	2026-10-14 11:33:14.857845+00	2026-10-14 11:33:14.857845+00
4b2d16f4-fb33-4a2a-b7c7-b8c4879bb2d1	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	c7647325d856be745e2efc91d5d4081072425cf965c862e5f7a475e71a6f327d	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 10:04:47.647+00	2026-11-15 10:04:47.647+00	f	\N	2026-10-16 10:04:47.655247+00	2026-10-16 10:04:47.655247+00
13757643-7dd4-44a1-8365-3de3432ba509	50a74013-21fd-4641-8c73-369507b8b7c2	a871ca7393af0697342e2f3511fb93b11d3941b71599b3338d2a847857f9cc61	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 10:28:34.298+00	2026-11-15 10:28:34.298+00	f	\N	2026-10-16 10:28:34.306688+00	2026-10-16 10:28:34.306688+00
aa78a507-cefa-4fc3-a69d-8f754aa1d084	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	7114599456edd1ddf10a7618a05751580d6b2b68f9b0308ce342e5d4ff6fec4f	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 11:44:35.289+00	2026-11-13 11:44:35.289+00	f	\N	2026-10-14 11:44:35.292651+00	2026-10-14 11:44:35.292651+00
e210daeb-c468-4a02-abc0-787224c6e01b	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	0ea6d8476d1a55ea901872aeae9236c719fbfc14e24b067101856ae5dd2bce72	2bddbf0e98c5d3a0a57e52510fa4bea9	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-12 20:13:55.646+00	2026-11-11 20:13:55.647+00	t	2026-10-14 11:45:44.033+00	2026-10-12 20:13:55.654189+00	2026-10-14 11:45:44.041803+00
4f45cbb7-d82f-45b6-8cf1-b9cc18bb80da	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	f86a5c54efdcc8eaf1c3991477f77135c3ad9561c11ccc47bdb990bc7e5d7b9d	2bddbf0e98c5d3a0a57e52510fa4bea9	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-13 05:12:11.683+00	2026-11-12 05:12:11.684+00	t	2026-10-14 11:45:44.033+00	2026-10-13 05:12:11.685569+00	2026-10-14 11:45:44.041803+00
fb6ad402-d88f-43cc-b284-ddc479b86371	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	11ef9db88c14df8391c40366b7596690c60562da44b2d3d3deeea17caa1d2efb	2bddbf0e98c5d3a0a57e52510fa4bea9	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-12 21:29:10.789+00	2026-11-11 21:29:10.789+00	t	2026-10-14 11:45:44.033+00	2026-10-12 21:29:10.801468+00	2026-10-14 11:45:44.041803+00
31c68e69-f916-4d46-9df4-2aee09f2656a	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	88ceb4f50950487496ab86abda4d6f16b31e98a88541bc1d15ab83682acc4305	1cbafd09ce5bf4f3ef6ce1bd1f022465	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 11:46:03.25+00	2026-11-13 11:46:03.25+00	f	\N	2026-10-14 11:46:03.258591+00	2026-10-14 11:46:03.258591+00
782e50a0-f346-41c6-aa11-6a9f1096e4fb	50a74013-21fd-4641-8c73-369507b8b7c2	c778b39e74e497e1747d49ba7ab0bfba587a84a935776da32b9af87ce97d0642	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 12:58:21.937+00	2026-11-13 12:58:21.937+00	f	\N	2026-10-14 12:58:21.95324+00	2026-10-14 12:58:21.95324+00
09b28aa2-d20a-463c-a95e-2c4a74d5d129	50a74013-21fd-4641-8c73-369507b8b7c2	248d1e1f973c2ea41d63776d5b96f24c2cb0d14201fc5fd3feb190a56e555a8e	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-14 12:59:26.767+00	2026-11-13 12:59:26.767+00	f	\N	2026-10-14 12:59:26.777462+00	2026-10-14 12:59:26.777462+00
0346d17e-5313-4a02-9957-fe807adcfeb2	03816039-249c-462d-a1a2-7a1b855c07ab	4b39d8c186f43093ca35e8993fa6192ec7641bf68803da6d31efc5c4a87e9fae	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 11:13:07.962+00	2026-11-14 11:13:07.962+00	t	2026-10-15 11:14:10.761+00	2026-10-15 09:45:24.506087+00	2026-10-15 11:14:10.775049+00
fcb15dde-bb4b-44f8-8155-b295a3890bad	03816039-249c-462d-a1a2-7a1b855c07ab	7ac6e02f51890ccecdbbb44b0b4c4092788947879b3cc6e29260b905dc4ffd3e	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 05:01:15.905+00	2026-11-14 05:01:15.905+00	t	2026-10-15 05:04:50.686+00	2026-10-14 07:18:18.85649+00	2026-10-15 05:04:50.688789+00
7522be32-95d2-456b-ba3d-1c2e854869f3	1b3e765c-f4b6-4263-994b-b7221c34f75c	00db460c6b0b1a12ad3c8ce8f8a9e0e8796e964cd112fa9364a385765e567967	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 05:18:02.331+00	2026-11-14 05:18:02.331+00	f	\N	2026-10-15 05:18:02.334758+00	2026-10-15 05:18:02.334758+00
598ac003-22db-428a-8736-3b491d4417da	50a74013-21fd-4641-8c73-369507b8b7c2	2e9690df3a31ad96ce485bd2eae7d8c27e21d402917544d149587883cb159358	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 05:18:52.867+00	2026-11-14 05:18:52.868+00	f	\N	2026-10-15 05:18:52.871422+00	2026-10-15 05:18:52.871422+00
dc3765e5-9ef0-4a1e-9b4d-358bb07df90d	03816039-249c-462d-a1a2-7a1b855c07ab	3cec237f4b9d99066c127fa245dc2a26edd62b543006241340de28b373cb2e45	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 05:45:32.976+00	2026-11-14 05:45:32.976+00	f	\N	2026-10-15 05:45:32.978306+00	2026-10-15 05:45:32.978306+00
4c53c5bb-0363-4e1d-acc2-de595f30a1b7	03816039-249c-462d-a1a2-7a1b855c07ab	9f7ac196468114f7ebb2a7fd3f43f9537f2f9e84020768429b43766755ed5675	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 05:57:10.009+00	2026-11-14 05:57:10.009+00	f	\N	2026-10-15 05:57:10.012337+00	2026-10-15 05:57:10.012337+00
9f8816bf-229e-4243-be3c-ec65d79441d7	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	da63f12cc227f3485450ce6a54c609958ab114eeb2d3e54b61ff31affc92c313	ae1af694f5586919d7f8f2eb712eefc9	Unknown device	\N	\N	2402:3a80:465a:61c7:10c4:e7ff:fe69:c65f	2026-10-15 06:02:13.526+00	2026-11-14 06:02:13.527+00	f	\N	2026-10-15 06:02:13.529358+00	2026-10-15 06:02:13.529358+00
519a1230-a86e-43e7-bb23-1095bd7358d4	50a74013-21fd-4641-8c73-369507b8b7c2	ef927ed41fca00129fc4268f37ddba48a884b581db1ed792292bf409ca8b95b8	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 12:24:01.082+00	2026-11-14 12:24:01.083+00	f	\N	2026-10-15 12:24:01.088819+00	2026-10-15 12:24:01.088819+00
18203215-26cd-4a34-81be-6268936db604	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	2077054287756fd8ba8b4d5b1e4e9e3c8a927712a03823d9b8e88e8cd74487be	e1ed2933acf810a8bd8128fbd22c48de	Unknown device	\N	\N	2409:4080:9293:94c2::36d:50a4	2026-10-15 06:39:39.854+00	2026-11-14 06:39:39.854+00	f	\N	2026-10-15 06:39:39.857003+00	2026-10-15 06:39:39.857003+00
ebc6e92d-6722-4f6b-a8b1-b0ef12e578f9	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	ee6987fd53f7e74c1d392ba81c5b4d1238db683743b0dfb58747e87c16ac8c8e	1d348f5093c7bd6acca4bfa42b2f0a78	Unknown device	\N	\N	202.131.96.18	2026-10-15 12:41:19.77+00	2026-11-14 12:41:19.77+00	f	\N	2026-10-15 12:25:51.004294+00	2026-10-15 12:41:19.771983+00
43b67945-4352-45c9-9a65-85a7b8be72ab	03816039-249c-462d-a1a2-7a1b855c07ab	aee775f0593ae4a0463cb39b1d2f30cdfb026a70982daaa8fe9c36b863b9e55e	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 13:04:19.314+00	2026-11-14 13:04:19.314+00	f	\N	2026-10-15 13:04:19.317346+00	2026-10-15 13:04:19.317346+00
25315eaf-06ac-4c92-a815-529720af137e	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	3c003ef8e8a57618a67e45dbc37d1897b76572bb32abebd11dc6f8bb25f3abc2	a8f06615712320df847acbbc3fdb64df	Unknown device	\N	\N	202.131.96.18	2026-10-15 09:01:01.683+00	2026-11-14 09:01:01.684+00	f	\N	2026-10-15 09:01:01.692457+00	2026-10-15 09:01:01.692457+00
ba15b16d-eb58-439e-8821-9a7198f5788a	03816039-249c-462d-a1a2-7a1b855c07ab	e8ac4418e71693a9e9b789e5fa07557a1e6931a166fe70858ef52e91664956f8	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 09:06:52.138+00	2026-11-14 09:06:52.138+00	f	\N	2026-10-15 09:06:52.141019+00	2026-10-15 09:06:52.141019+00
514f1cde-7aba-4f15-a904-fff2aeba434f	50a74013-21fd-4641-8c73-369507b8b7c2	62999f2dc37cceed04fbb28d530475bd0406a4bdf6515b216baf9cf659c94a53	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 04:53:17.837+00	2026-11-15 04:53:17.837+00	f	\N	2026-10-16 04:53:17.843503+00	2026-10-16 04:53:17.843503+00
2c46c205-2e17-40b7-a3e0-4e04875e1ea9	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	3ad7a1ecc18159af4cad3f321542ec4d57367742b68fe4bd918cf3cd4d393296	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-15 09:14:50.716+00	2026-11-14 09:14:50.716+00	f	\N	2026-10-15 04:48:32.704162+00	2026-10-15 09:14:50.717079+00
7240b81b-1a66-48af-b61b-6299930dd19d	03816039-249c-462d-a1a2-7a1b855c07ab	805b058940fa6366f15d1356b65aedae3fd944f018e09c63f98db871c52a7225	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 05:08:06.804+00	2026-11-15 05:08:06.804+00	f	\N	2026-10-15 11:14:19.616802+00	2026-10-16 05:08:06.80672+00
b6f16947-42b5-4575-9fd3-899156fdeb18	03816039-249c-462d-a1a2-7a1b855c07ab	e8b2e600ea8d35147a336898031dec5448ad1f4b46c00c1ee40e42b5e39abfae	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 05:09:19.32+00	2026-11-15 05:09:19.32+00	t	2026-10-16 05:09:25.442+00	2026-10-16 05:09:19.320772+00	2026-10-16 05:09:25.443094+00
3de3c830-59ad-4081-af8c-d52bf2d2fa5f	50a74013-21fd-4641-8c73-369507b8b7c2	01c3d1de495323db709cf8c6e3e6563ed1858b09e830c5fff678afa792c1a36f	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 05:20:19.282+00	2026-11-15 05:20:19.283+00	f	\N	2026-10-16 05:20:19.292544+00	2026-10-16 05:20:19.292544+00
3708eced-e530-4f9b-a078-a4ec668e8a43	03816039-249c-462d-a1a2-7a1b855c07ab	90307a12127e950e74b056928bcd8489091af2ccadea0302e766e3d40df925df	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-15 09:41:53.351+00	2026-11-14 09:41:53.351+00	t	2026-10-15 09:44:03.884+00	2026-10-15 05:06:58.440546+00	2026-10-15 09:44:03.885935+00
61504083-3210-4ec2-a32b-81eff5cbd6b6	03816039-249c-462d-a1a2-7a1b855c07ab	91b531c07e40da2c2c27bb621af68c6d414c6bd2436a6ab78ddec63a61d43b59	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 05:10:26.417+00	2026-11-15 05:10:26.417+00	t	2026-10-16 05:22:18.793+00	2026-10-16 05:10:26.428133+00	2026-10-16 05:22:18.797262+00
28de2f3f-faa4-4379-b5cf-52cd3db31250	24f04f5b-9007-4480-94cd-0556d4aef097	d79d0e221b2f58a57e9b3c010638fa5aa53c6d28cac07eb361ceeba2e2cd1703	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:40:11.747+00	2026-11-27 10:40:11.747+00	t	2026-10-28 10:42:08.403+00	2026-10-28 10:40:11.747624+00	2026-10-28 10:42:08.415114+00
7f48ec63-9f3f-4a0d-ab47-a80e083ef69b	50a74013-21fd-4641-8c73-369507b8b7c2	49cd9304805fd3498858958e9ba951c91b2003e5f2b7fe8990a62ea8edc28c38	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 05:42:22.163+00	2026-11-15 05:42:22.163+00	f	\N	2026-10-16 05:42:22.166624+00	2026-10-16 05:42:22.166624+00
faa82247-d5cd-433c-9f22-309e4f84cb3d	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	ed122bdd3ae0ea12f7a95bfb56de02146bde5c15cccc91352f07761a5143c5f0	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 10:28:01.975+00	2026-11-15 10:28:01.975+00	f	\N	2026-10-16 10:28:01.986911+00	2026-10-16 10:28:01.986911+00
0208c5a9-bc2a-4b1b-a170-a30bf139f9c8	03816039-249c-462d-a1a2-7a1b855c07ab	6d6a6c1fd9a9b6f77db9672674bcffc11cb81d56c37d308a437c2398948f0b17	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 05:57:27.575+00	2026-11-15 05:57:27.575+00	f	\N	2026-10-16 05:57:27.5782+00	2026-10-16 05:57:27.5782+00
3db66f7b-0aae-4eaf-9a5d-e7d16a0f6060	50a74013-21fd-4641-8c73-369507b8b7c2	03af930609816de4350efd8125b795e4137a6f477fd3b271fb1ff3a24941280e	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 10:33:39.912+00	2026-11-15 10:33:39.912+00	f	\N	2026-10-16 10:33:39.916109+00	2026-10-16 10:33:39.916109+00
c327f86f-3924-4bcd-bd8e-2a2fd796e4d4	03816039-249c-462d-a1a2-7a1b855c07ab	69914c63dd839119c3002a6ba286f6f1cd682efc4d99d04165eb09d546af22a9	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 10:38:10.638+00	2026-11-15 10:38:10.638+00	f	\N	2026-10-16 10:38:10.648486+00	2026-10-16 10:38:10.648486+00
616cf490-337e-4bff-96e3-07507fd3d5fe	50a74013-21fd-4641-8c73-369507b8b7c2	32a7393e419a7eb5902a12251be3e99d06794dc361854599363fe157b6dbfb65	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 06:16:23.569+00	2026-11-15 06:16:23.57+00	f	\N	2026-10-16 06:16:23.576018+00	2026-10-16 06:16:23.576018+00
244df7cc-73c6-402d-83d7-ae93af1342ca	03816039-249c-462d-a1a2-7a1b855c07ab	7dfa4f430021321ee391c965016511a834c613f9240e1b460896e3f2b5e6cd08	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 10:39:01.465+00	2026-11-15 10:39:01.465+00	f	\N	2026-10-16 05:24:21.541185+00	2026-10-16 10:39:01.475709+00
6d71d980-7814-4167-aa8b-07d5c549828a	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	e8392a3ab5dc766a3aa688ab7384607aa50caec56a72bd06ccc22790a58f0a13	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 10:41:35.623+00	2026-11-15 10:41:35.623+00	f	\N	2026-10-16 10:41:35.626177+00	2026-10-16 10:41:35.626177+00
84748572-ccf0-469e-8e47-1c73a1d8ff66	50a74013-21fd-4641-8c73-369507b8b7c2	886cf0273607f8b0cc23323a03b271db433a6b9618a7aef6268482d1f9a73976	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 10:44:11.518+00	2026-11-15 10:44:11.518+00	f	\N	2026-10-16 10:44:11.525568+00	2026-10-16 10:44:11.525568+00
5cf4c5f7-c763-4e88-b366-88be5200777e	50a74013-21fd-4641-8c73-369507b8b7c2	d7bb371ed8caed58591bb131d22c27bf3e6c356b8476ca1f7ff3238dd5748649	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 06:42:21.657+00	2026-11-15 06:42:21.657+00	f	\N	2026-10-16 06:42:21.667165+00	2026-10-16 06:42:21.667165+00
84addf16-4b07-4e77-944e-e987c9dc8a1d	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	f1b31e6f938b4c73263122b497226d9360349c4105afd38495a328d16930e090	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-16 10:50:32.59+00	2026-11-15 10:50:32.59+00	f	\N	2026-10-16 08:57:08.777965+00	2026-10-16 10:50:32.5922+00
d1dd42f9-d6c0-4795-9047-38af18101ec3	50a74013-21fd-4641-8c73-369507b8b7c2	9f656ed0cce409016b6c43a2228b4aab2e4d6d3e75e0371da95394db9034ab51	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 06:57:36.88+00	2026-11-15 06:57:36.88+00	f	\N	2026-10-16 06:57:36.884025+00	2026-10-16 06:57:36.884025+00
46eb5e96-7f48-4a7a-b7d9-eee476ed1d81	03816039-249c-462d-a1a2-7a1b855c07ab	c38b05c3903b820c49d47efe5e6a2572b5341e4e6f18ac5c151ad537e43a4d89	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-17 06:49:13.181+00	2026-11-16 06:49:13.181+00	f	\N	2026-10-17 06:49:13.185646+00	2026-10-17 06:49:13.185646+00
aa442322-4599-46ba-bb89-f1c462d07aea	50a74013-21fd-4641-8c73-369507b8b7c2	540521ffbb79959b847200a5f45c30b0bfc5d9cc0cf7debe737dfe66aaa353b6	80a6db4359a215dbfd7414493e185419	Chrome on macOS	Chrome	macOS	202.131.96.18	2026-10-17 07:21:58.546+00	2026-11-16 07:21:58.546+00	f	\N	2026-10-17 07:21:58.55129+00	2026-10-17 07:21:58.55129+00
9b06ed4d-4cdc-43c2-a0b0-950240035ccb	50a74013-21fd-4641-8c73-369507b8b7c2	d3a6783301236ee23708894f0d0b97424ca54138f884473ce1eb24687e838aa9	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 07:18:01.866+00	2026-11-15 07:18:01.866+00	f	\N	2026-10-16 07:18:01.870638+00	2026-10-16 07:18:01.870638+00
50180bfa-7e1f-40af-b62e-4ce0426ec72c	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	95fdc82d316e5ab888c5ca71204b923196e91c80d60b902ee5f79137f4a1db72	1d348f5093c7bd6acca4bfa42b2f0a78	Unknown device	\N	\N	202.131.96.18	2026-10-17 09:18:54.16+00	2026-11-16 09:18:54.16+00	f	\N	2026-10-17 09:18:54.168423+00	2026-10-17 09:18:54.168423+00
3ecc2784-a893-4ae9-84b9-727a48dc014d	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	69b64ce3e4d8f2acbc96c66f1b967da2d83bf0898a64884da4f8ae382a830e2b	1d348f5093c7bd6acca4bfa42b2f0a78	Unknown device	\N	\N	202.131.96.18	2026-10-17 09:41:26.26+00	2026-11-16 09:41:26.26+00	f	\N	2026-10-17 09:41:26.265914+00	2026-10-17 09:41:26.265914+00
ce1a6809-bb7b-4089-90e9-09fa58a5366a	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	9ed42edae6b2ca32d2179d5f8ce7fe89867b2a4723c582042a6ff1123374c5f3	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-17 06:44:48.847+00	2026-11-16 06:44:48.847+00	t	2026-10-17 10:22:53.662+00	2026-10-17 06:44:48.851654+00	2026-10-17 10:22:53.6653+00
27be6f77-ffc1-43fa-b184-2d49099a7378	50a74013-21fd-4641-8c73-369507b8b7c2	5524519f9cf71635229a3684a79bea703f62a4ea315fd1dc3035cb2dca53b10b	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-17 10:24:46.579+00	2026-11-16 10:24:46.579+00	f	\N	2026-10-17 10:24:46.580902+00	2026-10-17 10:24:46.580902+00
271ebdfb-4c36-479f-bb8a-e3a17943d557	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	8f7987fe56be53d9e9e982b5b49862f0f7f86466f60ccce373a5993549acee84	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-17 11:15:10.097+00	2026-11-16 11:15:10.097+00	f	\N	2026-10-17 11:15:10.109856+00	2026-10-17 11:15:10.109856+00
9b9afb0c-f936-4484-ab7e-a07664268054	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	5d37f6bb62d014f066f936a65208c6dc324036ce373306597e107cf002823dcb	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-17 11:54:25.158+00	2026-11-16 11:54:25.158+00	f	\N	2026-10-17 11:54:25.172099+00	2026-10-17 11:54:25.172099+00
99cc8b47-745a-41a1-8784-668449f9569a	03816039-249c-462d-a1a2-7a1b855c07ab	6e51dfbea949bd366abde1ec74d1b3f43402a62bc10cc9caeae0cd9a542d3316	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 04:46:24.357+00	2026-11-20 04:46:24.357+00	t	2026-10-21 04:46:29.326+00	2026-10-17 06:44:44.003218+00	2026-10-21 04:46:29.330713+00
acf47f17-af9a-4441-9716-84d18725bcda	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	d1a148fe5ccc4b967261f539c068c35688e499b886e985e46c7560d8483581e3	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-16 08:51:10.582+00	2026-11-15 08:51:10.582+00	t	2026-10-16 08:51:10.665+00	2026-10-15 09:19:04.458552+00	2026-10-16 08:51:10.672058+00
13a30353-874c-4bdf-be36-19ae86453e43	50a74013-21fd-4641-8c73-369507b8b7c2	147374cc2ac5780fe4e93062af871e5d9724603712a66de7095f4914cd9355ec	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 08:57:48.104+00	2026-11-15 08:57:48.104+00	f	\N	2026-10-16 08:57:48.106187+00	2026-10-16 08:57:48.106187+00
dd4235aa-41af-41cc-bcaa-449ae8c54b95	03816039-249c-462d-a1a2-7a1b855c07ab	324f0e09e2b62778e70bbcce6f49501527e424b6a74da55b61d7d03409e9b6ab	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 09:10:39.578+00	2026-11-15 09:10:39.579+00	f	\N	2026-10-16 09:10:39.587176+00	2026-10-16 09:10:39.587176+00
67a20420-a315-4371-a62e-748408dc12e1	50a74013-21fd-4641-8c73-369507b8b7c2	b802b2f3353f474df2622f3244942f9b7e5b1bc27c326deedbea59d6772396c0	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 09:25:20.949+00	2026-11-15 09:25:20.949+00	f	\N	2026-10-16 09:25:20.968963+00	2026-10-16 09:25:20.968963+00
fd748a69-003b-4214-8111-dbf9b634ceda	03816039-249c-462d-a1a2-7a1b855c07ab	31fc8b20d0a77e8eb044e8c5dc236dd8f3eb3a54cf60a6c277c30a1fe015bfe0	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 09:31:28.295+00	2026-11-15 09:31:28.295+00	f	\N	2026-10-16 09:31:28.3077+00	2026-10-16 09:31:28.3077+00
3e8fc71f-4218-4a4d-8c2f-8e27bf5d662e	50a74013-21fd-4641-8c73-369507b8b7c2	4897fc7535bc2ecf2d2680cada074cd07957652e46a57274e2499399aa82b67d	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 09:44:47.911+00	2026-11-15 09:44:47.911+00	f	\N	2026-10-16 09:44:47.917629+00	2026-10-16 09:44:47.917629+00
b393823a-6cfd-4210-a297-e9dd32671611	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	aad3d7929c74c45fad2482e4d3c50d3874b5ab2d19c56ff48cfadbdeae60b13e	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-16 09:46:08.22+00	2026-11-15 09:46:08.22+00	f	\N	2026-10-16 09:46:08.229914+00	2026-10-16 09:46:08.229914+00
ac9c8986-c7f8-4249-9987-a08de9cede2e	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	9a3497e04be8cbdba96b351cbce3460176cd8a204e535b8a2132e85197c823fd	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-17 12:24:13.203+00	2026-11-16 12:24:13.203+00	f	\N	2026-10-17 12:24:13.214078+00	2026-10-17 12:24:13.214078+00
d365d2b9-38ff-402d-8ac4-b3ded7e13d62	50a74013-21fd-4641-8c73-369507b8b7c2	5aee1288e2c19de1c270c4913b2019435e48a0fe0ed0f17052705b6219a03734	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-17 12:30:20.684+00	2026-11-16 12:30:20.684+00	f	\N	2026-10-17 12:30:20.690875+00	2026-10-17 12:30:20.690875+00
1436255f-a36e-4bfa-91c0-73daef8d19e5	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	a79b8215a6bc708df208f5def92772d240a2daa022a214ec3f6e3746d20bdce8	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-17 12:43:15.536+00	2026-11-16 12:43:15.536+00	f	\N	2026-10-17 12:43:15.54065+00	2026-10-17 12:43:15.54065+00
c17becce-9b8b-4897-acf5-db3d292b94fd	0e9621c5-c42a-47de-9520-4f3da89600d7	ce3de6b2220fce4515b559812d3647e0ae2db347e66940a2f7e5e1b856e2f429	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:42:21.106+00	2026-11-27 10:42:21.106+00	t	2026-10-28 11:11:01.372+00	2026-10-28 10:42:21.118434+00	2026-10-28 11:11:01.378299+00
263df099-bbea-4384-a659-339cad195bbb	50a74013-21fd-4641-8c73-369507b8b7c2	68a1a77bf63bdaa1b8412db37e428b6b964ae6616570fe4669304ef77ca1b1d4	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 04:53:07.033+00	2026-11-18 04:53:07.033+00	f	\N	2026-10-19 04:53:07.043687+00	2026-10-19 04:53:07.043687+00
2b802f82-37d6-4078-b68f-a9efe9d4c851	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	07b114178561250fef08c15cc9cf677a55ba30f6b1ad2329bb6cf23635f535f6	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 04:55:04.809+00	2026-11-18 04:55:04.809+00	f	\N	2026-10-19 04:55:04.811889+00	2026-10-19 04:55:04.811889+00
e1d25940-4b41-4021-b437-d42e051a0024	50a74013-21fd-4641-8c73-369507b8b7c2	44e182abaaed7b0880805168e4e88a6a5a7afbe0f0f00897179d5cb882ba337b	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 04:58:49.85+00	2026-11-18 04:58:49.85+00	f	\N	2026-10-19 04:58:49.853717+00	2026-10-19 04:58:49.853717+00
609b8f52-cb5f-4d16-930b-15b698ea3be7	3f4e5e52-6d48-4266-86c5-03f57e2947e6	e7fea885b2fc061ae69fdf64df7e2074f5b7a2a3223fd9c03a12f77d57d54e80	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 12:30:45.863+00	2026-11-27 12:30:45.863+00	t	2026-10-28 12:59:12.026+00	2026-10-28 12:30:45.865096+00	2026-10-28 12:59:12.035413+00
147048a9-1f17-4c0d-8ea7-898628ef9f37	50a74013-21fd-4641-8c73-369507b8b7c2	a5958163742c87c8e128f9c89519e618be7ed3053ece8b106a3ad1515daac966	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 06:10:37.347+00	2026-11-18 06:10:37.347+00	f	\N	2026-10-19 06:10:37.350029+00	2026-10-19 06:10:37.350029+00
bfc700d7-2ae4-4bc8-bbf1-6307242ba409	50a74013-21fd-4641-8c73-369507b8b7c2	5f72e81894bf14f50a8af449634867f32ff64e81caa533e62a7cd8d683e69426	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 06:30:21.594+00	2026-11-18 06:30:21.594+00	f	\N	2026-10-19 06:30:21.597746+00	2026-10-19 06:30:21.597746+00
7d72a3d2-baa2-40c8-bf9d-56868a37566f	50a74013-21fd-4641-8c73-369507b8b7c2	1df8b2d436cad381e2671fbef65009d4e1e61a5b49aece2e5e4ab149e8b25dc5	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 10:05:44.44+00	2026-11-18 10:05:44.44+00	f	\N	2026-10-19 10:05:44.441332+00	2026-10-19 10:05:44.441332+00
fe0bb932-67c6-4874-9a91-772acdcab52f	50a74013-21fd-4641-8c73-369507b8b7c2	e5fb2f5367e3c124a8baced1af1eef42c509a6a92c2df0f64b59121172b6ac35	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 10:53:25.443+00	2026-11-18 10:53:25.443+00	f	\N	2026-10-19 10:53:25.4534+00	2026-10-19 10:53:25.4534+00
6190d4c7-daae-4dda-98c7-6d2d713a1bfb	50a74013-21fd-4641-8c73-369507b8b7c2	4b392b6a3b1bf100626bfe9a16d79c0492e66b353d34e1d51b7ade31959b7657	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 12:11:37.393+00	2026-11-18 12:11:37.393+00	f	\N	2026-10-19 12:11:37.397201+00	2026-10-19 12:11:37.397201+00
52afea4b-e40d-4dcb-81c5-88ca46fd46c5	50a74013-21fd-4641-8c73-369507b8b7c2	d606e258b24befebe4d53586c70af72cec6b79331dd483cf02b43beb60b6ef88	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 12:40:08.289+00	2026-11-18 12:40:08.289+00	f	\N	2026-10-19 12:40:08.305531+00	2026-10-19 12:40:08.305531+00
968c8fa3-b9c1-4535-8fa9-c0ab1b91b2b5	50a74013-21fd-4641-8c73-369507b8b7c2	acff895f74d61ee9208d15662e83892d5565ca540e01a5e4a31f26d357c9a50e	ea220a1b2a953c11a6ad812f45812f70	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:cdca:eae6:db98:3035	2026-10-20 12:16:02.274+00	2026-11-19 12:16:02.274+00	f	\N	2026-10-20 12:16:02.289111+00	2026-10-20 12:16:02.289111+00
0aa9c5c5-ef9e-4f3c-94f9-da40424c9cdb	50a74013-21fd-4641-8c73-369507b8b7c2	c79c57b329b893b41224d2999f9f573b4e653dec8acf835478528bb15be6e79a	ea220a1b2a953c11a6ad812f45812f70	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:cdca:eae6:db98:3035	2026-10-20 17:29:37.919+00	2026-11-19 17:29:37.919+00	f	\N	2026-10-20 17:29:37.939035+00	2026-10-20 17:29:37.939035+00
f303de07-30ba-412e-9654-9de54439c427	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	42f34f35a7a93e21e8ee13468cd5f74fc842ce405101d22620081e546cff7541	ea220a1b2a953c11a6ad812f45812f70	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:cdca:eae6:db98:3035	2026-10-20 18:45:48.992+00	2026-11-19 18:45:48.992+00	f	\N	2026-10-20 18:45:49.00674+00	2026-10-20 18:45:49.00674+00
83938b57-dc68-4a55-9ad2-b8e62f752989	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	bac58552480c05da410e43f2e9e7d092efdeb049f7705a496561394317f3d4db	ea220a1b2a953c11a6ad812f45812f70	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:cdca:eae6:db98:3035	2026-10-20 18:47:49.799+00	2026-11-19 18:47:49.799+00	f	\N	2026-10-20 18:47:49.801213+00	2026-10-20 18:47:49.801213+00
e6cc814e-d841-459b-8f4a-039cb155eca3	50a74013-21fd-4641-8c73-369507b8b7c2	68aa1686935c8409b06dcca55dd7205f35ccb2bb987ee0d8a3c0206a13ad191a	ea220a1b2a953c11a6ad812f45812f70	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:cdca:eae6:db98:3035	2026-10-20 19:49:49.616+00	2026-11-19 19:49:49.616+00	f	\N	2026-10-20 19:49:49.624325+00	2026-10-20 19:49:49.624325+00
0167c124-d793-4471-8b28-bd8bcc63a033	50a74013-21fd-4641-8c73-369507b8b7c2	a67c4d00515e5b5d607c4ac4ec14cf95c7843f3735c2c06200bd3dd12d07dc55	ea220a1b2a953c11a6ad812f45812f70	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:cdca:eae6:db98:3035	2026-10-20 19:50:07.055+00	2026-11-19 19:50:07.055+00	f	\N	2026-10-20 19:50:07.061704+00	2026-10-20 19:50:07.061704+00
431b4e75-408b-4c6f-8707-99cf7be4279c	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	0d0f4928e7cc588172f7ee31178ad276d02a4d894ed986156df227182a2e0c6b	ea220a1b2a953c11a6ad812f45812f70	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:cdca:eae6:db98:3035	2026-10-20 20:01:40.006+00	2026-11-19 20:01:40.006+00	f	\N	2026-10-20 20:01:40.014544+00	2026-10-20 20:01:40.014544+00
32d9bb99-1065-4398-ae98-a386a4699472	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	024e0894f707a0f9e56bc16b208b7ca44c30a89ada09c502eb375b442e21819f	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-21 04:57:02.573+00	2026-11-20 04:57:02.573+00	t	2026-10-21 04:57:41.615+00	2026-10-17 10:33:45.444523+00	2026-10-21 04:57:41.61886+00
0fdc7000-b723-4126-87a7-2b1686c3125e	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	0857fcb7d1be41d5f8ae17fea18373d82efbbd5a8ad0787a7379f696e42b7b5e	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 05:14:16.83+00	2026-11-20 05:14:16.83+00	f	\N	2026-10-21 05:14:16.832266+00	2026-10-21 05:14:16.832266+00
f13d5136-a632-4d85-9250-9681c63f9b39	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	4c975eddeccdb3ac0ed2c7582d27c16d3b1055daa1eacc5229fea97c6daffe1b	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 05:17:39.307+00	2026-11-20 05:17:39.307+00	f	\N	2026-10-21 05:17:39.312957+00	2026-10-21 05:17:39.312957+00
824512d6-fcca-4000-ba2c-83a2fe5d374f	03816039-249c-462d-a1a2-7a1b855c07ab	3f2161ab98773f4e785662cb9f6d39c773e8b409ac62a34dcc93fa916067b3aa	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 05:00:13.16+00	2026-11-20 05:00:13.16+00	t	2026-10-21 09:34:01.269+00	2026-10-21 05:00:13.162146+00	2026-10-21 09:34:01.273118+00
969e0960-af5b-463f-92e8-56bf0c4926ee	f80816b4-1585-4a4b-9cf2-d284a81c8458	d32fe7c174e6f04c4c9f98f3e7d0bf84ba37aeedd937b2c37c0135bfc34d303d	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-21 04:58:14.146+00	2026-11-20 04:58:14.146+00	t	2026-10-21 10:25:31.972+00	2026-10-21 04:58:14.160144+00	2026-10-21 10:25:31.975107+00
43d148cb-9b09-46c0-bd3f-cb1804d30ed5	f80816b4-1585-4a4b-9cf2-d284a81c8458	c98bdfc4a316bed4c9404f1ae609c32460b1cc63b714511820a5c61fe7931be5	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 06:17:11.067+00	2026-11-18 06:17:11.067+00	t	2026-10-28 07:16:06.176+00	2026-10-19 06:17:11.069728+00	2026-10-28 07:16:06.180702+00
949c63e2-c897-401f-96ef-ea7344dc684b	03816039-249c-462d-a1a2-7a1b855c07ab	8a12f3e74020d16bd9a51301ad97873cb8d6bb9a805051af247e85df7e54b6db	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 05:21:32.959+00	2026-11-20 05:21:32.959+00	t	2026-10-21 05:31:10.238+00	2026-10-21 05:21:32.960576+00	2026-10-21 05:31:10.241219+00
8ab50f68-603f-434b-95d7-487d8dfaba44	03816039-249c-462d-a1a2-7a1b855c07ab	4ef1dbffab43d529a06721175dc45e6bec4cb0b7bdb4ad40ae070906de23027d	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 05:31:21.349+00	2026-11-20 05:31:21.349+00	f	\N	2026-10-21 05:31:21.353803+00	2026-10-21 05:31:21.353803+00
74fe5d89-e371-4b17-939e-167c1f7e7761	50a74013-21fd-4641-8c73-369507b8b7c2	68b9474cccca0a813425e76fe718c8c53845bce3fed40576d580c3ed92521dcd	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 06:05:49.888+00	2026-11-20 06:05:49.889+00	f	\N	2026-10-21 06:05:49.901026+00	2026-10-21 06:05:49.901026+00
0208dd1a-5aa6-4438-bf6b-80607689adbb	0e9621c5-c42a-47de-9520-4f3da89600d7	11fc26c3212449a0071f2635607c2a7a9a89b0cd7bfbe5c71f875bd3e73dc4e1	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:57:08.382+00	2026-11-27 10:57:08.382+00	f	\N	2026-10-28 10:57:08.386758+00	2026-10-28 10:57:08.386758+00
ce2b9e7e-96b5-471d-b92c-f8afd2364493	03816039-249c-462d-a1a2-7a1b855c07ab	a65e4215831409af7d0a25448cee50949907afee5f874c5565b292cad2bf8579	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 07:27:07.037+00	2026-11-20 07:27:07.038+00	f	\N	2026-10-21 07:27:07.048222+00	2026-10-21 07:27:07.048222+00
55715e5a-2bc3-4a26-a9fb-0c1655cececc	f80816b4-1585-4a4b-9cf2-d284a81c8458	c68e2f5025aabb9eb881a9fef2be67409d0480515e11eb0879c3a21e23487d1e	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 12:59:24.629+00	2026-11-27 12:59:24.629+00	f	\N	2026-10-28 12:59:24.637692+00	2026-10-28 12:59:24.637692+00
632eb109-a561-47c7-b737-1cafaf50dbc2	03816039-249c-462d-a1a2-7a1b855c07ab	b160bc2e26335e0a97731230cc2fdd309e510e41280eeef1857fd8ea8e6d6570	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 10:07:17.75+00	2026-11-20 10:07:17.75+00	f	\N	2026-10-21 10:07:17.759556+00	2026-10-21 10:07:17.759556+00
19b0276a-1ac6-4c12-9bf9-e2e286cbc770	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	a4c91371270da6f7dab396d905a8eba3eace97e6c34848df7d405e30125010a7	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-21 10:25:43.74+00	2026-11-20 10:25:43.74+00	t	2026-10-21 10:54:02.246+00	2026-10-21 10:25:43.744349+00	2026-10-21 10:54:02.249009+00
5957247c-e214-46e8-9bfa-d2c06105deca	50a74013-21fd-4641-8c73-369507b8b7c2	9bc50fa9222e30c625b3fc416d2ded5f74ef2b2e6816984164720bc3c66e85e6	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 11:49:34.341+00	2026-11-20 11:49:34.341+00	f	\N	2026-10-21 11:49:34.343352+00	2026-10-21 11:49:34.343352+00
6b1d6902-df1c-47c0-b865-c39df3c56252	03816039-249c-462d-a1a2-7a1b855c07ab	f563d41ab2c82202343c23cf484ed16a9984e3603a56d07967d7fde3490fce8f	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 09:34:15.419+00	2026-11-20 09:34:15.419+00	t	2026-10-21 12:52:52.538+00	2026-10-21 09:34:15.42266+00	2026-10-21 12:52:52.542828+00
7bc00e16-2abe-4fc2-bef6-8d3abfc32ad2	50a74013-21fd-4641-8c73-369507b8b7c2	c51355deb3150ea11c3a5a3cdf04bcd88e5a1402d2f1604bdf68d7ffb4a4b2bf	f27147a0297be99df761b24fc3daf25e	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:1140:7fb4:9cf2:c7ab	2026-10-21 16:48:23.914+00	2026-11-20 16:48:23.914+00	f	\N	2026-10-21 16:48:23.929825+00	2026-10-21 16:48:23.929825+00
78220224-520c-49e2-a1d9-9c09897934db	03816039-249c-462d-a1a2-7a1b855c07ab	6f0acff6511ade0fdafc8783cd776456a827359ff0b989acd65afc66e6ce236a	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-22 04:49:53.52+00	2026-11-21 04:49:53.52+00	f	\N	2026-10-22 04:49:53.523984+00	2026-10-22 04:49:53.523984+00
39b498b5-0d48-406d-9cad-ac8edb183374	50a74013-21fd-4641-8c73-369507b8b7c2	b22a347469f832dbeed333ee5d84a10a3af8abad66ef55c3b77caea349c74ac1	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-22 05:14:35.714+00	2026-11-21 05:14:35.714+00	f	\N	2026-10-22 05:14:35.716126+00	2026-10-22 05:14:35.716126+00
af1345f1-b6ec-4f84-8f92-5117f443eb34	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	d475887d17f9abeb46883c8a839c34a6dd2b1ef9b448e7eb2383b35fe292f47f	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-22 05:14:38.625+00	2026-11-21 05:14:38.625+00	f	\N	2026-10-22 05:14:38.627568+00	2026-10-22 05:14:38.627568+00
0b492358-6848-4050-b040-cd242bd23093	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	c6668942230af4fd21945d67382d6a83bce733d09b3750c3108b7e4f6391acaf	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-22 05:17:31.887+00	2026-11-21 05:17:31.888+00	f	\N	2026-10-22 05:17:31.909944+00	2026-10-22 05:17:31.909944+00
3b10d12d-0131-4144-8973-c35e600e6738	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	db2363aad2d787e9e19c92d29113f4f840ee214f6641acb61b7ef5f6e0c5e536	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-22 05:25:25.522+00	2026-11-21 05:25:25.522+00	f	\N	2026-10-22 05:25:25.525091+00	2026-10-22 05:25:25.525091+00
4be1f0d0-013d-4cc1-8c51-12931a8578ed	50a74013-21fd-4641-8c73-369507b8b7c2	6f41783075ae05f50a0fe418f035d329222ba0f426ab251288565da2f34ba20a	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-22 05:51:28.087+00	2026-11-21 05:51:28.088+00	f	\N	2026-10-22 05:51:28.099125+00	2026-10-22 05:51:28.099125+00
72ded569-3025-4c8e-a092-de0a2bb2d404	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	1eee9824dd3e54969887a06f0cce98e64567c9879b80e689df71183dde9697c0	70573a01236149aa796e477446cf6e00	Unknown device	\N	\N	202.131.96.18	2026-10-22 06:37:17.894+00	2026-11-21 06:37:17.894+00	f	\N	2026-10-22 06:37:17.895988+00	2026-10-22 06:37:17.895988+00
2e547e7a-bd7b-4c73-ab92-78712046c9ab	50a74013-21fd-4641-8c73-369507b8b7c2	ecda3e4bf2e8d39d02855bd687cf69f08fc9c5d7b97741e2bf537fd919c0d61b	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-22 06:54:15.369+00	2026-11-21 06:54:15.369+00	f	\N	2026-10-22 06:54:15.374029+00	2026-10-22 06:54:15.374029+00
b81b8500-d96d-4371-aec7-f837e276abab	03816039-249c-462d-a1a2-7a1b855c07ab	bfa04c0fb47448b65e4315a90be95689a0c7400ed739df3a655480e0698a02a8	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 04:49:29.736+00	2026-11-22 04:49:29.736+00	t	2026-10-23 04:51:16.127+00	2026-10-23 04:49:29.738889+00	2026-10-23 04:51:16.130153+00
1bd6bf55-3759-4e71-95df-e7732450daeb	03816039-249c-462d-a1a2-7a1b855c07ab	37fc0dc02bc99a7a1e13d68e50c42592f7cda532cfd935ef204d2fa4bd1fe1eb	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 04:51:24.386+00	2026-11-22 04:51:24.387+00	f	\N	2026-10-23 04:51:24.388485+00	2026-10-23 04:51:24.388485+00
28740d84-9b9f-4fae-8b9a-64810c1cbfe8	50a74013-21fd-4641-8c73-369507b8b7c2	4d523e9e8ca091fb9da5c7e49bb5a073c5557f28b5e49a71018acf843bf7ec4b	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 04:53:24.445+00	2026-11-22 04:53:24.445+00	f	\N	2026-10-23 04:53:24.451123+00	2026-10-23 04:53:24.451123+00
f2dad6c2-3210-4b13-aea8-79194f193809	50a74013-21fd-4641-8c73-369507b8b7c2	9753d38b048f17694d724b862cc194695f641a4c027495e3337d5cc06dca1ee6	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 05:03:24.715+00	2026-11-22 05:03:24.715+00	f	\N	2026-10-23 05:03:24.728182+00	2026-10-23 05:03:24.728182+00
8fe6bab9-2a0c-4c48-be5b-820f0b7ed82e	50a74013-21fd-4641-8c73-369507b8b7c2	96bed2e316fbc1aadc30698589e67562b2125a2154a35ae7f4ad08b0ef3156e8	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 05:16:32.113+00	2026-11-22 05:16:32.113+00	f	\N	2026-10-23 05:16:32.11904+00	2026-10-23 05:16:32.11904+00
d9594f76-8d00-4c24-a06f-659c678312b5	50a74013-21fd-4641-8c73-369507b8b7c2	806b3c4a199f56c23a0f2e35cf52a162430527f808ffbf5c544afa320aa805a8	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 09:18:44.704+00	2026-11-22 09:18:44.705+00	f	\N	2026-10-23 09:18:44.714934+00	2026-10-23 09:18:44.714934+00
f0b77002-20c0-4992-8239-278458b6b1f3	03816039-249c-462d-a1a2-7a1b855c07ab	58fe44835c4dfa67c81c91045aa4bff66cd312f3bf62bc6560219c71fe98ea4c	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 10:18:03.601+00	2026-11-22 10:18:03.601+00	t	2026-10-23 11:22:53.18+00	2026-10-23 10:18:03.608284+00	2026-10-23 11:22:53.185711+00
bbbc6775-5037-45f0-8e30-ce5db1e99ae4	f80816b4-1585-4a4b-9cf2-d284a81c8458	c22e1c879fd3c6bd875bfca8f275494f70eeaecd329dbaeaf4b885b9894fa3bc	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 06:14:59.349+00	2026-11-20 06:14:59.35+00	t	2026-10-28 07:16:06.176+00	2026-10-21 06:14:59.351451+00	2026-10-28 07:16:06.180702+00
5100c3c8-c01e-461b-94c1-806f735ced3e	f80816b4-1585-4a4b-9cf2-d284a81c8458	e3aa69d3fbfeff32a8dd98ac34457880d4d80c146afd998f8fe04b7014c3697b	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:59:14.485+00	2026-11-27 10:59:14.485+00	f	\N	2026-10-28 10:59:14.486875+00	2026-10-28 10:59:14.486875+00
8bf919b3-80e6-47dd-93df-f8b06ce6fe9c	03816039-249c-462d-a1a2-7a1b855c07ab	d9503340464056754611d6af6376efdc88d1c581ee93111e31e5f975db9c830c	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 11:23:02.108+00	2026-11-22 11:23:02.108+00	t	2026-10-23 11:36:01.099+00	2026-10-23 11:23:02.112615+00	2026-10-23 11:36:01.109044+00
7c581e47-c8f0-4a62-b4de-27171ed4367a	f80816b4-1585-4a4b-9cf2-d284a81c8458	ae6b8a261022dd80edc5222302db5dce3cb09417c87edb4ff7308ae4cad9717c	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-29 05:02:30.154+00	2026-11-28 05:02:30.154+00	f	\N	2026-10-29 05:02:30.166838+00	2026-10-29 05:02:30.166838+00
bf45f3ac-9285-4580-8a14-aac5ee94ea48	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	3202eed8e39ea82917dd7ff693c2edff27a42d27f33a635842ae6644ecb22541	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 11:36:23.507+00	2026-11-22 11:36:23.508+00	t	2026-10-23 11:37:53.407+00	2026-10-23 11:36:23.516449+00	2026-10-23 11:37:53.409884+00
3fcf5449-e2a8-43d0-8c04-2d630f02b05d	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	a40f5508ff0c1af314708cabe763a1e9794597c632929ea425ba9e18ca25f8ee	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 11:53:36.627+00	2026-11-22 11:53:36.629+00	f	\N	2026-10-23 11:53:36.634719+00	2026-10-23 11:53:36.634719+00
b35a7fef-21e6-45c1-a29e-33a12442ece8	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	be333543a9d42e9e806973b46c7fe8747f308c7d1eaf95b321a29cb29af547c7	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 11:40:09.947+00	2026-11-22 11:40:09.948+00	t	2026-10-23 11:56:07.354+00	2026-10-23 11:40:09.950924+00	2026-10-23 11:56:07.358301+00
e3a28bc4-8ee9-4b4c-af76-f2567c4a5e9c	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	aa0f29fdb2b7f67f695f617c5eb9c24509bdf23fe22ca38688ccc4205ea94d01	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-23 11:56:32.137+00	2026-11-22 11:56:32.137+00	f	\N	2026-10-23 11:56:32.14109+00	2026-10-23 11:56:32.14109+00
3d9d81db-1a7c-4687-9600-051b97fe56d5	03816039-249c-462d-a1a2-7a1b855c07ab	3a99fe17705d1a92f2bc9bbc741d27e8f8566fa7b00b5285ac790bc5261678b5	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-24 04:36:41.494+00	2026-11-23 04:36:41.494+00	f	\N	2026-10-24 04:36:41.496907+00	2026-10-24 04:36:41.496907+00
c9badde9-cee6-4e30-af26-0099812f830a	50a74013-21fd-4641-8c73-369507b8b7c2	eaedbdaac95c13f387c63ad08ab87bd2108cd760006c920f33215fd7b47d4907	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-24 04:45:58.849+00	2026-11-23 04:45:58.849+00	f	\N	2026-10-24 04:45:58.850924+00	2026-10-24 04:45:58.850924+00
205276ac-30de-41b3-ab28-77384bed3b61	03816039-249c-462d-a1a2-7a1b855c07ab	ea3471b301fb090bd044a6e1507e16b341f431aa1d9721f811d1752842bd2399	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-24 05:13:56.085+00	2026-11-23 05:13:56.085+00	f	\N	2026-10-24 05:13:56.086366+00	2026-10-24 05:13:56.086366+00
164b8d44-ba06-4857-8a9b-6d2fd8a75ff4	03816039-249c-462d-a1a2-7a1b855c07ab	9af977f4738a54edae2e3d7722c2c016f4cfbd94767dd4c15877aabfccf999ba	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 05:21:49.347+00	2026-11-25 05:21:49.347+00	f	\N	2026-10-26 05:21:49.357165+00	2026-10-26 05:21:49.357165+00
4ada0c05-fe35-43d1-af4b-2e0218b1def6	50a74013-21fd-4641-8c73-369507b8b7c2	c27ee73f9a90462faef61c1bfd5c830066090b2abbf153821201ab3fe8fafce0	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 06:11:32.714+00	2026-11-25 06:11:32.714+00	f	\N	2026-10-26 06:11:32.716222+00	2026-10-26 06:11:32.716222+00
c7ac5a6f-4d4e-4f21-9bd7-5451ac972692	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	a40e8ae498b1e49e3f17574a2da90876820499bebf751ee9de38b590da46d026	3afb689f8e6e812ee137a984d8955c7a	Unknown device	\N	\N	202.131.96.18	2026-10-26 07:54:44.323+00	2026-11-25 07:54:44.323+00	f	\N	2026-10-26 07:54:44.326251+00	2026-10-26 07:54:44.326251+00
22a49fdc-ace3-40c7-961e-c3e36305bfe7	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	1c2919f2bf5cf7bfbd93516ca97788865766f25ff4880a415c7a6085352e2d99	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 07:37:26.215+00	2026-11-25 07:37:26.216+00	t	2026-10-26 09:19:09.766+00	2026-10-26 07:37:26.217224+00	2026-10-26 09:19:09.768195+00
19f80f0e-8873-4266-9b23-2f073d1600c6	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	834ce3a16d004b97c5dc15e41744580a2ec9ae9350babfbdadd41455b09ca888	3afb689f8e6e812ee137a984d8955c7a	Unknown device	\N	\N	202.131.96.18	2026-10-26 09:26:05.845+00	2026-11-25 09:26:05.845+00	f	\N	2026-10-26 09:26:05.850236+00	2026-10-26 09:26:05.850236+00
b24f3c1b-af07-48c0-99bc-d14b70bef11f	50a74013-21fd-4641-8c73-369507b8b7c2	c6840f94e76be0de42120a6fd9334956eb5bed5b2bc64ec27bebf6e6aeaf46c2	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 09:41:50.66+00	2026-11-25 09:41:50.66+00	f	\N	2026-10-26 09:41:50.661313+00	2026-10-26 09:41:50.661313+00
672bad8d-758e-4d2a-bcb2-72d0197870cb	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	33f0ae269d5f98492aadc04d5e420120b2d491fec896d999937e836a7fe4cf2d	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 09:19:27.64+00	2026-11-25 09:19:27.64+00	t	2026-10-26 10:38:16.375+00	2026-10-26 09:19:27.642652+00	2026-10-26 10:38:16.383576+00
f45cd296-133c-4138-af2e-f40112a06581	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	25a8d9e47c6a08b9f0e446d662b15ca9a65e7508961e652c09a70a36d461b5c3	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 10:38:26.043+00	2026-11-25 10:38:26.043+00	t	2026-10-26 12:00:22.424+00	2026-10-26 10:38:26.051153+00	2026-10-26 12:00:22.42579+00
c3536893-68fe-4931-a3c3-56bdd131b329	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	f36b30cfc3d700b9fd6ff63d6ffa90104f4b0355c19de31e3c60fea949d35595	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 12:00:37.988+00	2026-11-25 12:00:37.988+00	f	\N	2026-10-26 12:00:37.990363+00	2026-10-26 12:00:37.990363+00
b25c4954-47d2-45c5-a81f-f0c66dbe706d	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	44f80758eed8074222e3e9f20223c064d3fe4d693d0cf5638e19c2ebfd0b715c	7909290e1d71bb92258e8399391b124c	Unknown device	\N	\N	202.131.96.18	2026-10-27 04:50:53.08+00	2026-11-26 04:50:53.08+00	f	\N	2026-10-27 04:50:53.082096+00	2026-10-27 04:50:53.082096+00
cfa0f990-de8e-4c0e-bf09-bb414c286fbe	50a74013-21fd-4641-8c73-369507b8b7c2	9148b3c5fd3554b7fd68a4b5b7e476ca7729b08702bb35f6b5bfd9922c311492	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 06:17:16.386+00	2026-11-26 06:17:16.386+00	f	\N	2026-10-27 06:17:16.390816+00	2026-10-27 06:17:16.390816+00
428beb03-6ce1-404a-8190-5df58a07d14b	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	26c5527137fc9359f5d027164b5b82b0000b4a8a2338655b0f3d21218bcaed58	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 06:17:55.571+00	2026-11-26 06:17:55.571+00	f	\N	2026-10-27 06:17:55.579834+00	2026-10-27 06:17:55.579834+00
394563c8-d2e4-4f99-b8d2-2fc982078945	50a74013-21fd-4641-8c73-369507b8b7c2	b3a9f24b1caa7688f6dccfe6b37d7466b5a3a0a45210f8054620d622f176f4fb	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 06:20:04.691+00	2026-11-26 06:20:04.691+00	f	\N	2026-10-27 06:20:04.692317+00	2026-10-27 06:20:04.692317+00
72013b56-9259-4cfc-8ecc-f1b2da2f1ce4	50a74013-21fd-4641-8c73-369507b8b7c2	6bc60d645115ab06eed07e79e7e33a6466f59bb65a83927fe1540934186d10a5	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 06:20:24.952+00	2026-11-26 06:20:24.952+00	f	\N	2026-10-27 06:20:24.953642+00	2026-10-27 06:20:24.953642+00
2c91f7c8-2e3b-433f-bfa3-d7c83fc39084	f80816b4-1585-4a4b-9cf2-d284a81c8458	8dbdeca780d9d18b3a40bed5e6bb822ae0c752ed6a9f3333cc2fa502f5b47471	80a6db4359a215dbfd7414493e185419	Chrome on macOS	Chrome	macOS	202.131.96.18	2026-10-24 04:41:12.673+00	2026-11-23 04:41:12.673+00	t	2026-10-28 07:16:06.176+00	2026-10-24 04:41:12.673588+00	2026-10-28 07:16:06.180702+00
9822f429-5539-4cf5-9716-4a73e293ca2e	24f04f5b-9007-4480-94cd-0556d4aef097	1061b8042c2f513acb658f50a8620db196877efada2caba76838cf54f1491196	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 11:11:17.355+00	2026-11-27 11:11:17.355+00	f	\N	2026-10-28 11:11:17.361434+00	2026-10-28 11:11:17.361434+00
55da4e4d-11c4-4cb0-bcda-9392590dd22f	50a74013-21fd-4641-8c73-369507b8b7c2	2aad338b5285766af6a2d9dab3c8361de0983a5f4b8c86ece4b5d9c485bc28ea	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 06:21:55.759+00	2026-11-26 06:21:55.759+00	f	\N	2026-10-27 06:21:55.760692+00	2026-10-27 06:21:55.760692+00
56069936-1282-4c08-9667-88220ee04167	24f04f5b-9007-4480-94cd-0556d4aef097	365e0e7adfe72f2367a26ad03b14e3f73cc0eac4a97d744780bb92c891cd64ed	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-29 05:18:02.532+00	2026-11-28 05:18:02.533+00	f	\N	2026-10-29 05:18:02.534443+00	2026-10-29 05:18:02.534443+00
befe46c6-2bdc-4c5b-b377-1fd00ebdfaa8	50a74013-21fd-4641-8c73-369507b8b7c2	56927611993722d9eff7d0bdcb6625fe80f4039af830ffca1f4a8ee21388d5bb	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 08:01:00.644+00	2026-11-26 08:01:00.644+00	f	\N	2026-10-27 08:01:00.648202+00	2026-10-27 08:01:00.648202+00
3bbd4f7a-6b9e-4c32-943b-31ac4baa143d	50a74013-21fd-4641-8c73-369507b8b7c2	3d6d460a77ce33945b38aa592f7196d4ba10f98690e086e9a0e591e8f88c9e13	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 08:52:50.669+00	2026-11-26 08:52:50.669+00	f	\N	2026-10-27 08:52:50.673785+00	2026-10-27 08:52:50.673785+00
198b3180-4298-4612-a544-55774363e04f	50a74013-21fd-4641-8c73-369507b8b7c2	35c6884e33c62ccad3fd96d40e47e022d1dd406d4980fd5bbdd1a6a572af5967	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 09:11:21.054+00	2026-11-26 09:11:21.054+00	f	\N	2026-10-27 09:11:21.056417+00	2026-10-27 09:11:21.056417+00
7de4b204-562f-4a34-aaac-c6b1736c8d00	50a74013-21fd-4641-8c73-369507b8b7c2	3b3ecba5f51775e99efdea06f854f23792134d026c20bda724a7dca61e0992fd	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 09:16:23.581+00	2026-11-26 09:16:23.581+00	f	\N	2026-10-27 09:16:23.584014+00	2026-10-27 09:16:23.584014+00
3822f643-6f91-493f-83ef-a14dfe2f9422	50a74013-21fd-4641-8c73-369507b8b7c2	6a247112c4be6bcb46a6d3f099b6a878b9de0f114829255ff3cf274cf4aea20c	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 10:58:55.568+00	2026-11-26 10:58:55.568+00	f	\N	2026-10-27 10:58:55.580345+00	2026-10-27 10:58:55.580345+00
827802c0-57da-419e-b844-4fa47b578f25	03816039-249c-462d-a1a2-7a1b855c07ab	cba2885c015d09b9341f60c0a555270cd1eee13a186f41932be64c95e43ff761	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 06:16:55.571+00	2026-11-26 06:16:55.571+00	t	2026-10-27 11:47:41.73+00	2026-10-27 06:16:55.580016+00	2026-10-27 11:47:41.742775+00
31b947ec-4def-4942-84b1-ef1eb2b9103a	f80816b4-1585-4a4b-9cf2-d284a81c8458	2a130741bee0d803c0082d99d1e4d885e91946fbb3f97723df2edbfa7fc9ba3a	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 11:48:03.092+00	2026-11-26 11:48:03.092+00	t	2026-10-27 16:50:08.988+00	2026-10-27 11:48:03.102969+00	2026-10-27 16:50:08.996472+00
d95660e4-3333-4ff0-a071-51c7d989bd0a	f80816b4-1585-4a4b-9cf2-d284a81c8458	d98bdef9bd6fc88511d0a81e3b2463239f8e8c62560214994a75b4c8b8b7cafc	d23049a1c2b258b5fcfbfbdba1a06f11	Chrome on Windows	Chrome	Windows	103.240.169.100	2026-10-27 16:50:37.783+00	2026-11-26 16:50:37.783+00	t	2026-10-27 18:00:21.096+00	2026-10-27 16:50:37.78781+00	2026-10-27 18:00:21.099361+00
e07e1352-de12-4fa2-907f-54d45d5fd4e0	f80816b4-1585-4a4b-9cf2-d284a81c8458	55ed5f615805339e0dea68b128d86e77b295e479ef7903c19abcac7314776575	306c73190fbf53948d93c779180753c6	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 05:17:23.145+00	2026-11-27 05:17:23.145+00	t	2026-10-28 05:18:29.807+00	2026-10-28 05:17:23.147706+00	2026-10-28 05:18:29.823338+00
b280758d-a7fe-48f7-8a42-b6280008b212	f80816b4-1585-4a4b-9cf2-d284a81c8458	fabd930a7667e0cc1347726cc42021ad536ab1fcf993e7c0550759ac4464e929	306c73190fbf53948d93c779180753c6	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 05:18:32.217+00	2026-11-27 05:18:32.217+00	t	2026-10-28 05:19:41.913+00	2026-10-28 05:18:32.233564+00	2026-10-28 05:19:41.914747+00
d7ace734-210b-4664-8121-37be04b0aa8f	50a74013-21fd-4641-8c73-369507b8b7c2	1c2ab643cb9d6a3b25c3557c83da0dcf816b7148bb1201167f09d4de5fd00c1e	306c73190fbf53948d93c779180753c6	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 05:22:58.634+00	2026-11-27 05:22:58.634+00	f	\N	2026-10-28 05:22:58.636142+00	2026-10-28 05:22:58.636142+00
5ed86754-361d-45a1-89a4-2b3afe40e532	f80816b4-1585-4a4b-9cf2-d284a81c8458	210cca21e4ea904db641a8a69f67e9b077204aca65f7668062ff5037fc89f787	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 04:49:13.921+00	2026-11-27 04:49:13.921+00	t	2026-10-28 07:06:06.015+00	2026-10-28 04:49:13.927833+00	2026-10-28 07:06:06.017337+00
492f754b-28e8-43bb-9294-461aff7fd7a6	f80816b4-1585-4a4b-9cf2-d284a81c8458	0b999d571f1891241bfefeb8630115870bf2fa62d8513799e60e88fba95c9b40	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 05:15:08.427+00	2026-11-27 05:15:08.427+00	t	2026-10-28 07:09:47.288+00	2026-10-28 05:15:08.435171+00	2026-10-28 07:09:47.291995+00
8fabd164-43e9-4fd4-a795-de371a627b42	f80816b4-1585-4a4b-9cf2-d284a81c8458	a43c1189218d8ee3111503627f852a4ec02f9a5504e065f13df75f61f4a00a8b	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 06:21:49.627+00	2026-11-26 06:21:49.627+00	t	2026-10-28 07:16:06.176+00	2026-10-27 06:21:49.628018+00	2026-10-28 07:16:06.180702+00
74f9f533-aa85-42f6-82b8-3e191c3cb64f	f80816b4-1585-4a4b-9cf2-d284a81c8458	65db9312b5845ad99c05d3ff525bbc00c2cd472883512839c99799f8ae24d33f	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 07:27:31.96+00	2026-11-18 07:27:31.96+00	t	2026-10-28 07:16:06.176+00	2026-10-19 07:27:31.965241+00	2026-10-28 07:16:06.180702+00
79e64e0e-a7f1-467d-9560-53c218e20761	f80816b4-1585-4a4b-9cf2-d284a81c8458	cba6f408212e22e746b137cfbb1994b6a4c77275ce552464714acaf599cdc9f4	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-19 09:47:50.296+00	2026-11-18 09:47:50.296+00	t	2026-10-28 07:16:06.176+00	2026-10-19 09:47:50.301068+00	2026-10-28 07:16:06.180702+00
330889f2-4a31-4b3f-a332-9c667632c61f	f80816b4-1585-4a4b-9cf2-d284a81c8458	49fa05a0f2438acde33613d45fda18fddbf62cc5b6046b061e7c9a2a51685625	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 05:04:51.363+00	2026-11-20 05:04:51.363+00	t	2026-10-28 07:16:06.176+00	2026-10-21 05:04:51.3637+00	2026-10-28 07:16:06.180702+00
6a63ea46-f205-46cd-abcc-5adb3c7ec8af	f80816b4-1585-4a4b-9cf2-d284a81c8458	73d30230c9fd46b78181dec5c55b6a23dfed750d8deeaa0a07d5eb3733e01924	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-21 05:13:00.268+00	2026-11-20 05:13:00.268+00	t	2026-10-28 07:16:06.176+00	2026-10-21 05:13:00.270408+00	2026-10-28 07:16:06.180702+00
552f6e68-0843-41ec-9f35-728d4e7665c9	f80816b4-1585-4a4b-9cf2-d284a81c8458	a20ba9a11e56579f95ac71c2044bdcb40ef5b910ad32bd4f4f77b681a76e9f11	f27147a0297be99df761b24fc3daf25e	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:1140:7fb4:9cf2:c7ab	2026-10-21 17:07:11.089+00	2026-11-20 17:07:11.089+00	t	2026-10-28 07:16:06.176+00	2026-10-21 17:07:11.092286+00	2026-10-28 07:16:06.180702+00
b84ec13b-166e-44eb-bad5-2594b3fc1f81	f80816b4-1585-4a4b-9cf2-d284a81c8458	995a801efb4bfb2fd8ff70c1ed42d0503e19e8258805061eda4a91ebc2d8973c	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-22 11:23:11.069+00	2026-11-21 11:23:11.069+00	t	2026-10-28 07:16:06.176+00	2026-10-22 11:23:11.080259+00	2026-10-28 07:16:06.180702+00
77b1af4f-3530-4aa1-a4c4-48c8d57d298e	f80816b4-1585-4a4b-9cf2-d284a81c8458	9b2858ad6199205c018bea4d3282c16fcd219e46c47ec6f7b5232a4127e1da30	3ef716e34ea8e6743082d0a761ce2e52	Chrome on Windows	Chrome	Windows	2409:4090:1005:fe13:e130:f7d1:a03f:f727	2026-10-23 03:38:37.887+00	2026-11-22 03:38:37.887+00	t	2026-10-28 07:16:06.176+00	2026-10-23 03:38:37.895877+00	2026-10-28 07:16:06.180702+00
f57c4e28-47fe-4bcd-b5a5-97f7eec6bcf0	f80816b4-1585-4a4b-9cf2-d284a81c8458	90d41f5c2cbcced28b57af5c75997bc86b9f8a6f572be7df0abac194512bc8d1	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-24 12:46:43.047+00	2026-11-23 12:46:43.047+00	t	2026-10-28 07:16:06.176+00	2026-10-23 10:19:23.414369+00	2026-10-28 07:16:06.180702+00
4e7057dc-edd3-4424-a614-6c18ea7f07b1	f80816b4-1585-4a4b-9cf2-d284a81c8458	e6a1c9f660d1637b844e35f22c180401039f8a1e6311de6302fc27d0594074b8	14e929fb0bfcbdbabea351515c32418a	Unknown device	\N	\N	202.131.96.18	2026-10-26 06:23:46.975+00	2026-11-25 06:23:46.975+00	t	2026-10-28 07:16:06.176+00	2026-10-21 10:54:38.541343+00	2026-10-28 07:16:06.180702+00
926c7e54-1b49-4cc4-9a06-82e9341cb10b	f80816b4-1585-4a4b-9cf2-d284a81c8458	38406f9ffd62424e8700825ca38e513277aece205e5ee5e7545b93b37d33eae1	80a6db4359a215dbfd7414493e185419	Chrome on macOS	Chrome	macOS	202.131.96.18	2026-10-24 05:43:56.48+00	2026-11-23 05:43:56.481+00	t	2026-10-28 07:16:06.176+00	2026-10-24 05:43:56.488081+00	2026-10-28 07:16:06.180702+00
b439c9ca-41c1-45d9-8acd-4cbb266859c7	f80816b4-1585-4a4b-9cf2-d284a81c8458	47e2b6878f3a51791b3474003bcdd819040d01fb66394328c67a5675d48d9bbc	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 12:28:37.402+00	2026-11-25 12:28:37.402+00	t	2026-10-28 07:16:06.176+00	2026-10-26 12:28:37.413166+00	2026-10-28 07:16:06.180702+00
07152aa9-0b52-46e7-9bed-53640a2ea34f	f80816b4-1585-4a4b-9cf2-d284a81c8458	5a41c3e445afdc37c6ddffcf9fd25db6e174914fa94498040b60ab7c5f051ece	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 12:31:40.315+00	2026-11-25 12:31:40.316+00	t	2026-10-28 07:16:06.176+00	2026-10-26 12:31:40.324521+00	2026-10-28 07:16:06.180702+00
96c9c38a-85fb-4fbd-8ec2-182242db1737	f80816b4-1585-4a4b-9cf2-d284a81c8458	c15043237a9d8ea060235b841a7e45ec84aced420b4df689196c5179b3914b55	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 12:32:06.96+00	2026-11-25 12:32:06.96+00	t	2026-10-28 07:16:06.176+00	2026-10-26 12:32:06.968048+00	2026-10-28 07:16:06.180702+00
e0413cab-e149-4687-8dc6-8305171329a7	f80816b4-1585-4a4b-9cf2-d284a81c8458	97da23f503c8a9aea192d8a2ec70133b61a413652a0b35c1b4c361aab5b4a1ea	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-26 12:38:28.85+00	2026-11-25 12:38:28.851+00	t	2026-10-28 07:16:06.176+00	2026-10-26 12:38:28.857212+00	2026-10-28 07:16:06.180702+00
de283719-5e68-4d7d-9ed3-a6c5d78596ac	f80816b4-1585-4a4b-9cf2-d284a81c8458	babf850dcee276c78b58163241083be16f0a94bc7b8d636d12b861b769c41b83	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 04:43:59.554+00	2026-11-26 04:43:59.555+00	t	2026-10-28 07:16:06.176+00	2026-10-27 04:43:59.572567+00	2026-10-28 07:16:06.180702+00
234ee661-5f9c-4586-b68e-ca3ef908e7a9	f80816b4-1585-4a4b-9cf2-d284a81c8458	8ba34da1727da38ea772d2db4d2617a17d7bd5e24bddf9a360f964a7d102c593	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 05:16:56.037+00	2026-11-27 05:16:56.037+00	t	2026-10-28 07:16:06.176+00	2026-10-26 05:13:44.806735+00	2026-10-28 07:16:06.180702+00
38749e6c-319e-4a52-bef7-fc98f23a4d93	f80816b4-1585-4a4b-9cf2-d284a81c8458	aeb29345cf3afc6b21a36bf1adf4c9170d639855e3efc9d8603f44d3cab846e7	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 06:30:46.984+00	2026-11-26 06:30:46.985+00	t	2026-10-28 07:16:06.176+00	2026-10-27 06:30:46.986721+00	2026-10-28 07:16:06.180702+00
ca45cf39-3db7-4bcf-be99-4aa8da307dec	f80816b4-1585-4a4b-9cf2-d284a81c8458	a6f1f8683fe067e9c27671efaa94d2be9740130c11d1fd759786c59e57c9d5f0	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 08:53:32.289+00	2026-11-26 08:53:32.289+00	t	2026-10-28 07:16:06.176+00	2026-10-27 08:53:32.30146+00	2026-10-28 07:16:06.180702+00
ac7906ac-794a-43a3-aba1-9315efcf7109	f80816b4-1585-4a4b-9cf2-d284a81c8458	66822f8c200929a2db27ae60f2311234d4c5e0249d9a0f3cdcc5b33f2cc6ef61	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 09:02:59.7+00	2026-11-26 09:02:59.701+00	t	2026-10-28 07:16:06.176+00	2026-10-27 09:02:59.701763+00	2026-10-28 07:16:06.180702+00
d53914fd-3f6b-4f00-87b8-69b546f8a433	f80816b4-1585-4a4b-9cf2-d284a81c8458	d9538434b2a3689ad51009ea9a984d7d1e47658c8478fa5f78b5485ea97425b4	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 09:12:17.36+00	2026-11-26 09:12:17.36+00	t	2026-10-28 07:16:06.176+00	2026-10-27 09:12:17.370397+00	2026-10-28 07:16:06.180702+00
c7c47475-01b3-4430-aa29-eac5aea8e8e0	f80816b4-1585-4a4b-9cf2-d284a81c8458	09ea38f1b17a484342e6b1c3bdaf43d71fbd81455308c7afc291b2a58a03fb40	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 09:18:14.383+00	2026-11-26 09:18:14.383+00	t	2026-10-28 07:16:06.176+00	2026-10-27 09:18:14.385358+00	2026-10-28 07:16:06.180702+00
43c59adb-3b01-435b-981e-56ea344a546b	f80816b4-1585-4a4b-9cf2-d284a81c8458	d37e310ada37b885bcebf798a495ddce4c82af67ed55bc1e95b25a7c3a33d3be	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 09:26:50.423+00	2026-11-26 09:26:50.423+00	t	2026-10-28 07:16:06.176+00	2026-10-27 09:26:50.426782+00	2026-10-28 07:16:06.180702+00
0090178d-490e-4f75-807a-4ec2c4b4aa4e	f80816b4-1585-4a4b-9cf2-d284a81c8458	4d56cf789397788fbf1421d6f1645a0fb64594562bc60b0b164e5632ff832172	306c73190fbf53948d93c779180753c6	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 09:36:08.069+00	2026-11-26 09:36:08.069+00	t	2026-10-28 07:16:06.176+00	2026-10-27 09:36:08.071579+00	2026-10-28 07:16:06.180702+00
b1c05f7a-7684-4f47-a45f-65b8aad97ae4	f80816b4-1585-4a4b-9cf2-d284a81c8458	2eb7591e39f470d376466753611fc797e7fa74a7e81cdf4d45320837d8c749fd	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 10:59:39.457+00	2026-11-26 10:59:39.457+00	t	2026-10-28 07:16:06.176+00	2026-10-27 10:59:39.459032+00	2026-10-28 07:16:06.180702+00
3bc15779-b236-4229-aca9-abf0bf8f025a	f80816b4-1585-4a4b-9cf2-d284a81c8458	3e05155670094b2ca65a2a7380a87931423516628029b701a304ea7f44b68882	69dcb8780bb8b1e68b1d4155aee09a1c	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-27 12:08:00.487+00	2026-11-26 12:08:00.487+00	t	2026-10-28 07:16:06.176+00	2026-10-27 12:08:00.491686+00	2026-10-28 07:16:06.180702+00
18823ba3-c465-4c1c-a2a0-65a7aef497b4	f80816b4-1585-4a4b-9cf2-d284a81c8458	986070b559a8bbbbc4c91444cf9836ece86393e5cb0d50dd93024b3b32de3f7c	d23049a1c2b258b5fcfbfbdba1a06f11	Chrome on Windows	Chrome	Windows	103.240.169.100	2026-10-27 16:56:21.269+00	2026-11-26 16:56:21.269+00	t	2026-10-28 07:16:06.176+00	2026-10-27 16:56:21.272244+00	2026-10-28 07:16:06.180702+00
b58fad35-600c-4ed5-9e2c-ba0d7f2d5e2c	f80816b4-1585-4a4b-9cf2-d284a81c8458	e6734b7be62d0f02a52664a630b9c2df4c225ddf207abb79d1ed0376fde46489	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 04:56:05.709+00	2026-11-27 04:56:05.709+00	t	2026-10-28 07:16:06.176+00	2026-10-28 04:56:05.709709+00	2026-10-28 07:16:06.180702+00
5397c0ab-d99d-4fee-b7df-f5b92f229082	f80816b4-1585-4a4b-9cf2-d284a81c8458	a508abf77f81162b61c2f6022740e2fd0451b1dfbe3a3503e14472f78cd0115a	306c73190fbf53948d93c779180753c6	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 05:19:47.373+00	2026-11-27 05:19:47.373+00	t	2026-10-28 07:16:06.176+00	2026-10-28 05:19:47.374077+00	2026-10-28 07:16:06.180702+00
e7049cdd-df89-4561-b278-e25416f569cf	f80816b4-1585-4a4b-9cf2-d284a81c8458	8933068e0c91604e785fe74f8af7a318bb53bcdd0e46fedd1a8c36c7a27a5462	306c73190fbf53948d93c779180753c6	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 06:15:10.274+00	2026-11-27 06:15:10.274+00	t	2026-10-28 07:16:06.176+00	2026-10-28 06:15:10.283461+00	2026-10-28 07:16:06.180702+00
adf2e83c-012f-4b2e-8c99-d5a7db524ca1	0e9621c5-c42a-47de-9520-4f3da89600d7	c07af556c640355caa800300d279b09027ab477b6c6e7d868d6e9fc27e27921d	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:06:20.34+00	2026-11-27 07:06:20.34+00	t	2026-10-28 07:17:06.925+00	2026-10-28 07:06:20.343238+00	2026-10-28 07:17:06.926538+00
28b9ffa9-6240-4113-9251-172c6daf3013	f80816b4-1585-4a4b-9cf2-d284a81c8458	25476164e57d011264f3082f988a75372c552c6460a57c7ccf7555edeeada8fb	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 06:21:10.58+00	2026-11-27 06:21:10.58+00	t	2026-10-28 07:16:06.176+00	2026-10-28 06:21:10.581833+00	2026-10-28 07:16:06.180702+00
8e06f5f5-bbec-4c98-a54d-272672da99aa	f80816b4-1585-4a4b-9cf2-d284a81c8458	60fe1a12c98502d17d994332b060ae012a1b2048d7f81a624d35293b98d5fad1	306c73190fbf53948d93c779180753c6	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 06:52:17.159+00	2026-11-27 06:52:17.159+00	t	2026-10-28 07:16:06.176+00	2026-10-28 06:52:17.163595+00	2026-10-28 07:16:06.180702+00
0918bc0d-2364-4540-b35f-0172ed0e8807	f80816b4-1585-4a4b-9cf2-d284a81c8458	b0fba47851b97862eb35f8d43d087ca72bd9afc0adad08e2e66cc007c5723b90	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:15:59.049+00	2026-11-27 07:15:59.049+00	t	2026-10-28 07:16:06.176+00	2026-10-28 07:15:59.052748+00	2026-10-28 07:16:06.180702+00
d294daa8-dfc8-417c-b9bf-0f10f6b45b29	f80816b4-1585-4a4b-9cf2-d284a81c8458	2d84634d0bb0db9fb4e57136254d3f99f6d788890ae1ccf5ad242bd603bf4c02	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:21:28.255+00	2026-11-27 10:21:28.255+00	t	2026-10-28 12:24:04.473+00	2026-10-28 10:21:28.258815+00	2026-10-28 12:24:04.475577+00
9d7def13-eabe-4e3c-8dbd-873852c6ac21	0e9621c5-c42a-47de-9520-4f3da89600d7	9d592f1b25a288ce5813eaba12c9ca274331467144996d7ef0cbe925d70892a2	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:17:29.137+00	2026-11-27 07:17:29.137+00	t	2026-10-28 07:19:01.179+00	2026-10-28 07:17:29.138938+00	2026-10-28 07:19:01.180559+00
7bf8699b-8e62-4882-9551-3265b7312cbc	0e9621c5-c42a-47de-9520-4f3da89600d7	33a7d8731340753c09718ea259fc2a6495c7d2aaa5211aa78ae2005c5f48c394	306c73190fbf53948d93c779180753c6	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:23:02.352+00	2026-11-27 07:23:02.353+00	f	\N	2026-10-28 07:23:02.355058+00	2026-10-28 07:23:02.355058+00
30e389ba-bae3-421a-b3f1-f2aaf0d55728	f80816b4-1585-4a4b-9cf2-d284a81c8458	3684029d0c246c96787ba1d31a479bd1f5c99451e4c7dcdfd36c5e53777472bb	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:23:40.74+00	2026-11-27 07:23:40.74+00	f	\N	2026-10-28 07:23:40.742863+00	2026-10-28 07:23:40.742863+00
bea4f66b-8dbd-4327-ae43-fd6981878cd1	50a74013-21fd-4641-8c73-369507b8b7c2	15464aed1a231ba0997b760fd08573ae059e5ca648e3b531328c86c5ef34c111	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:37:54.247+00	2026-11-27 07:37:54.248+00	f	\N	2026-10-28 07:37:54.251822+00	2026-10-28 07:37:54.251822+00
e9285e4c-8a6a-4832-9e0a-edba88243e3d	f80816b4-1585-4a4b-9cf2-d284a81c8458	fbef508b2b1b7d2d37e8bcb7ef1d93cad87f7a1420fe2f463f960174bf4e4c0a	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:39:11.089+00	2026-11-27 07:39:11.089+00	f	\N	2026-10-28 07:39:11.092198+00	2026-10-28 07:39:11.092198+00
5453f532-1a59-4ac7-896f-81436eff609b	0e9621c5-c42a-47de-9520-4f3da89600d7	d963db0125ebc99e3504d978fc99b0e9112ff9ec279fe6e7b19cc13cede51bda	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:41:30.011+00	2026-11-27 07:41:30.011+00	f	\N	2026-10-28 07:41:30.017972+00	2026-10-28 07:41:30.017972+00
68405122-0fcb-4e32-910c-94549dd91c93	0e9621c5-c42a-47de-9520-4f3da89600d7	0fcfa87083ec70e1e29db136ecc73fd4d4a59fd796cd0bc6d29e60e1d8f893a3	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:19:26.895+00	2026-11-27 07:19:26.895+00	t	2026-10-28 07:58:04.136+00	2026-10-28 07:19:26.89668+00	2026-10-28 07:58:04.138417+00
e92d529b-705d-4dca-81d3-6528c41a9156	f80816b4-1585-4a4b-9cf2-d284a81c8458	84ea0f21afd5202064133b665c8db0e939b963dd9cd551fb826db176bb176e3c	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 07:58:20.183+00	2026-11-27 07:58:20.183+00	t	2026-10-28 08:59:43.249+00	2026-10-28 07:58:20.185719+00	2026-10-28 08:59:43.252417+00
ff3d916f-3fd0-4329-b109-d6964799b932	0e9621c5-c42a-47de-9520-4f3da89600d7	fdd5ab9e30f5c1d8c0a8e7302da714ed045e54e44e4c2712bbe0f5e208dd8e2e	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:02:43.044+00	2026-11-27 09:02:43.044+00	f	\N	2026-10-28 09:02:43.046167+00	2026-10-28 09:02:43.046167+00
b8cca633-e0d8-4641-9f61-5ae324df6926	0e9621c5-c42a-47de-9520-4f3da89600d7	b851a0d1c342da4d31a8beec966b2ac10bc04eb21ec92c6f71cb5e8d57fb9eab	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 08:59:52.503+00	2026-11-27 08:59:52.503+00	t	2026-10-28 09:03:54.266+00	2026-10-28 08:59:52.506295+00	2026-10-28 09:03:54.270351+00
f4268950-40f7-485b-a999-e8903f6a6f20	0e9621c5-c42a-47de-9520-4f3da89600d7	18071b993522c5b9fd2c4529c56cb359aa634ee4135018c9476c40ae0956a58b	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:05:24.102+00	2026-11-27 09:05:24.102+00	t	2026-10-28 09:07:55.566+00	2026-10-28 09:05:24.105503+00	2026-10-28 09:07:55.568145+00
cd9ab6f2-5654-459c-a5ea-2468f659a683	f80816b4-1585-4a4b-9cf2-d284a81c8458	60e273ce3d79ac17ffba3e0507bace7141984463d4c6750cf952d0be30c7f00a	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:08:09.6+00	2026-11-27 09:08:09.6+00	t	2026-10-28 09:10:00.905+00	2026-10-28 09:08:09.602589+00	2026-10-28 09:10:00.905947+00
986a063c-7978-4417-a224-70588cb3a5b0	0e9621c5-c42a-47de-9520-4f3da89600d7	18f4fbfea3558c89ad0a2414c922afdf57945b579298592fc438f32b27931252	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:13:58.93+00	2026-11-27 09:13:58.93+00	f	\N	2026-10-28 09:13:58.9312+00	2026-10-28 09:13:58.9312+00
4ba8d9cf-ea3d-4f7b-b385-3ab69e47ce13	f80816b4-1585-4a4b-9cf2-d284a81c8458	575c4b3344f07af675f444bda817e9135fae5a5a8a5a411540a5c9235836b015	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:04:06.414+00	2026-11-27 09:04:06.414+00	t	2026-10-28 09:34:27.719+00	2026-10-28 09:04:06.41873+00	2026-10-28 09:34:27.720915+00
9c651f93-137f-4b39-b868-688ab6cf9c82	0e9621c5-c42a-47de-9520-4f3da89600d7	9d2940646683ef88c327a8c5965275d0684b00ef15aab10744825e6ac3dfb21c	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:34:50.659+00	2026-11-27 09:34:50.659+00	t	2026-10-28 09:35:41.571+00	2026-10-28 09:34:50.66158+00	2026-10-28 09:35:41.573489+00
64cee145-65a4-48a9-8943-079c4c835419	f80816b4-1585-4a4b-9cf2-d284a81c8458	5989bce035546ec9cc97ce3a97f737bed933d8eb5925dcbb3ab9c4c189ea8d35	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:36:09.315+00	2026-11-27 09:36:09.315+00	t	2026-10-28 09:37:56.55+00	2026-10-28 09:36:09.317096+00	2026-10-28 09:37:56.552389+00
b4ec4983-cd86-41c6-91a1-0e092c595fbd	0e9621c5-c42a-47de-9520-4f3da89600d7	46b57e37aece2577e25a89023966c1efa184d9330e7f7abe3d009e72a2be0556	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:38:16.851+00	2026-11-27 09:38:16.851+00	t	2026-10-28 09:40:43.236+00	2026-10-28 09:38:16.853882+00	2026-10-28 09:40:43.238533+00
f6c44cbe-e467-4160-a8f3-254b6e1dd2f6	f80816b4-1585-4a4b-9cf2-d284a81c8458	8947cb128631f2f4c51a9763796c66bb2f9d6748afa0d9e8ad0ea47571c6b91e	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:41:01.317+00	2026-11-27 09:41:01.317+00	t	2026-10-28 09:42:06.464+00	2026-10-28 09:41:01.319434+00	2026-10-28 09:42:06.468121+00
5dd1ddc8-0f5e-49d0-86b0-09747441114b	0e9621c5-c42a-47de-9520-4f3da89600d7	3e85b1d7b3c220b81210123cab1e66b9b383f675b390ccfbd08e30b0f5470587	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:43:03.343+00	2026-11-27 09:43:03.343+00	f	\N	2026-10-28 09:43:03.347092+00	2026-10-28 09:43:03.347092+00
8da6985a-ce71-45e0-a6f8-81a763316d7e	24f04f5b-9007-4480-94cd-0556d4aef097	9bf040ea37859dfaf3daa6b2069bf777b8c1a0c79633dce905282d859c2dd032	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:42:30.575+00	2026-11-27 09:42:30.575+00	t	2026-10-28 10:01:24.504+00	2026-10-28 09:42:30.578668+00	2026-10-28 10:01:24.504826+00
55804dea-2fc1-498b-bd27-874590745357	f80816b4-1585-4a4b-9cf2-d284a81c8458	e85f13acacbf82f8e48461d82cbbaff93599211e1ae86ee1553dc6b7af70188a	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:01:42.511+00	2026-11-27 10:01:42.511+00	t	2026-10-28 10:02:03.342+00	2026-10-28 10:01:42.511481+00	2026-10-28 10:02:03.342724+00
a61632b6-976c-4585-ba2e-a2317c07647f	0e9621c5-c42a-47de-9520-4f3da89600d7	3f194f250bf17010dee8a946f8806eca3440d174e0090f1ecea54563fe47772d	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:02:20.033+00	2026-11-27 10:02:20.033+00	t	2026-10-28 10:02:55.304+00	2026-10-28 10:02:20.033348+00	2026-10-28 10:02:55.306675+00
4a3d01b9-3fa3-4cb3-b836-29ebdfb8bda0	0e9621c5-c42a-47de-9520-4f3da89600d7	fc84fe570745ee5fa83d49e06954199d8016d26fe3cd34f6b96d90d729facc39	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:07:08.968+00	2026-11-27 10:07:08.968+00	f	\N	2026-10-28 10:07:08.970119+00	2026-10-28 10:07:08.970119+00
93a5ab6e-46a5-42cc-a148-1e9de8dec179	24f04f5b-9007-4480-94cd-0556d4aef097	87985379487b42be836cfbb644aab056e56a01356b5c4805470822fb3de8e7e7	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:07:08.461+00	2026-11-27 10:07:08.461+00	t	2026-10-28 10:16:40.755+00	2026-10-28 10:07:08.462377+00	2026-10-28 10:16:40.764941+00
86fb1834-ad65-4dad-9da0-8675a7a3cdde	0e9621c5-c42a-47de-9520-4f3da89600d7	2c19fad3f6df9b052b52dd1bb243738cb4cdda26c2ac3c7d62c04676175ed417	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 09:10:07.829+00	2026-11-27 09:10:07.83+00	t	2026-10-28 10:21:19.167+00	2026-10-28 09:10:07.830921+00	2026-10-28 10:21:19.170131+00
c710aa13-ac48-45de-873b-80669273dd01	0e9621c5-c42a-47de-9520-4f3da89600d7	f12dc4fcc3c5b2931a8b1398832358a43f9f4f5aa5a45a0ce97744f5d4f5d54b	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:16:52.729+00	2026-11-27 10:16:52.729+00	t	2026-10-28 10:24:09.314+00	2026-10-28 10:16:52.734438+00	2026-10-28 10:24:09.31764+00
d4bcfcb9-6bf8-4c7d-a35b-54a0f03e4d54	24f04f5b-9007-4480-94cd-0556d4aef097	364ea9aace60a35600cf4a547981243cd7ae96dcc89bd05dcbe2b4cb2b73416b	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:28:02.069+00	2026-11-27 10:28:02.069+00	t	2026-10-28 10:29:08.911+00	2026-10-28 10:28:02.072103+00	2026-10-28 10:29:08.913087+00
a96c0d54-3b6a-4e13-9620-98fd47cd9d89	0e9621c5-c42a-47de-9520-4f3da89600d7	a21a406bdbcc199abf8913624e5d5eb6046407ecc1cdae3608e1d450e200a329	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 10:24:22.353+00	2026-11-27 10:24:22.353+00	t	2026-10-28 10:27:41.262+00	2026-10-28 10:24:22.355483+00	2026-10-28 10:27:41.265011+00
41e705a2-f343-492a-9fbe-663e89ca21dd	3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	ecea91ceb175811b3ab2e1f5c70380513783133970a38948bc99b3f80e1b8fbf	6ab8675074e027ecceed3fb3d79d03cf	Chrome on Windows	Chrome	Windows	202.131.96.18	2026-10-28 12:24:46.725+00	2026-11-27 12:24:46.725+00	t	2026-10-28 12:30:24.899+00	2026-10-28 12:24:46.727093+00	2026-10-28 12:30:24.901276+00
85ea912f-30d8-43b7-b40a-c1181abeb9fa	f80816b4-1585-4a4b-9cf2-d284a81c8458	57acdf94711da237ac54245c84d2dd441fea759b0ea9830867cfbac6b3dd0921	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-29 05:49:05.956+00	2026-11-28 05:49:05.956+00	f	\N	2026-10-29 05:49:05.959078+00	2026-10-29 05:49:05.959078+00
bed35603-a0d8-41b7-94ee-79894845936c	0e9621c5-c42a-47de-9520-4f3da89600d7	0eb5ae24a9747b3f47bfc6db51c4fe8813e1b45f16bdddfe0f97baa34b4f7b31	7a588fbbdee4bdd34cb17677e961a0bf	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 12:05:11.038+00	2026-11-29 12:05:11.038+00	f	\N	2026-10-30 12:05:11.04122+00	2026-10-30 12:05:11.04122+00
afda7407-c0c3-45a4-b487-2560baac31a5	f80816b4-1585-4a4b-9cf2-d284a81c8458	ddbf75aae3ced7a53009ab45d25565b6200cdf9e824fa0766f0369d382898934	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-29 10:38:23.485+00	2026-11-28 10:38:23.489+00	t	2026-10-29 10:39:11.888+00	2026-10-29 10:38:23.511187+00	2026-10-29 10:39:11.890056+00
7cf27291-ddb8-43c7-b53e-3c3da63c19dd	24f04f5b-9007-4480-94cd-0556d4aef097	d695c207633daa45aff135dfa309b3fb6a6784005dccaae31143ee5b4a95d9c3	7a588fbbdee4bdd34cb17677e961a0bf	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 12:06:50.413+00	2026-11-29 12:06:50.413+00	f	\N	2026-10-30 12:06:50.414157+00	2026-10-30 12:06:50.414157+00
6874d3cb-8887-4f8f-a5d1-331056273aee	f80816b4-1585-4a4b-9cf2-d284a81c8458	3721318a006d00ef5445de3e0155ca1e590c48202652b1dcbbb8ae7271b5ec42	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-29 10:39:18.292+00	2026-11-28 10:39:18.292+00	f	\N	2026-10-29 10:39:18.293377+00	2026-10-29 10:39:18.293377+00
e9c650e4-4c2a-49b1-9d71-6d10c47ba049	24f04f5b-9007-4480-94cd-0556d4aef097	d80aadd41e0c281e75a7287db2223554023eedfb37ae8664e7441faca7d41562	7a588fbbdee4bdd34cb17677e961a0bf	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 12:19:09.113+00	2026-11-29 12:19:09.114+00	f	\N	2026-10-30 12:19:09.114799+00	2026-10-30 12:19:09.114799+00
46e555ac-c8e3-4e21-beb2-6d54a33db2fb	f80816b4-1585-4a4b-9cf2-d284a81c8458	330d55097ac9dbe8fc58dd04a18b8c7409fed4d20dd202a4330193209e5c0de1	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-29 10:50:03.003+00	2026-11-28 10:50:03.004+00	f	\N	2026-10-29 10:50:03.007707+00	2026-10-29 10:50:03.007707+00
2d840b2d-e1dc-4a1c-9e7e-afe5f574c93a	50a74013-21fd-4641-8c73-369507b8b7c2	4271aee5a4427fc2d42dae00c34405f88d97060f9b24c17c103c84af1b180a09	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-11-02 08:47:11.072+00	2026-12-02 08:47:11.072+00	f	\N	2026-11-02 08:47:11.07536+00	2026-11-02 08:47:11.07536+00
9f0857f9-cf08-4d88-810d-15a5224309bc	f80816b4-1585-4a4b-9cf2-d284a81c8458	5495b0f063ff5956edfd061757bd6431d2ab68003c1f566bdb6653ebc60c04c0	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 04:30:41.619+00	2026-11-29 04:30:41.62+00	f	\N	2026-10-30 04:30:41.625479+00	2026-10-30 04:30:41.625479+00
5f25b7dc-ffb2-474b-90f5-f77bceb313b5	50a74013-21fd-4641-8c73-369507b8b7c2	6135f9ad44713f92ebd69a33601bb80ca65622e7087b2dc7335e521416a6b9f5	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-11-02 08:47:43.025+00	2026-12-02 08:47:43.026+00	f	\N	2026-11-02 08:47:43.02649+00	2026-11-02 08:47:43.02649+00
ee7de78c-bd1d-43fb-88c2-728a554c4ee6	0e9621c5-c42a-47de-9520-4f3da89600d7	53a4f3d6a18066ab3c7a68197c8104752ba392fdc51312a1d1cf7f647aabadde	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 04:56:40.991+00	2026-11-29 04:56:40.992+00	f	\N	2026-10-30 04:56:40.99543+00	2026-10-30 04:56:40.99543+00
b4ebbb31-e5f7-4110-923e-5205417283e2	f80816b4-1585-4a4b-9cf2-d284a81c8458	e64b9ce773d88779ea797613d339792ba84f5bc25273c2bb7354ccd83f5ab8ab	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-11-02 10:45:31.545+00	2026-12-02 10:45:31.552+00	f	\N	2026-11-02 10:45:31.559099+00	2026-11-02 10:45:31.559099+00
9d86478e-0988-41a8-9d77-8f2eed90a844	f80816b4-1585-4a4b-9cf2-d284a81c8458	2547911f448f44dd1c17537ed352c270b52e43cde393905d640300b4bdc992c4	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 05:40:31.344+00	2026-11-29 05:40:31.344+00	f	\N	2026-10-30 05:40:31.346362+00	2026-10-30 05:40:31.346362+00
c9f4a2d8-b977-403b-b574-1b56f1b15265	f80816b4-1585-4a4b-9cf2-d284a81c8458	99ab64bf197b7ba4534c2fbcfd751fe99e3c9270bfcd6617c7c88dad43b2dd00	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-11-03 04:14:04.22+00	2026-12-03 04:14:04.221+00	f	\N	2026-11-03 04:14:04.228419+00	2026-11-03 04:14:04.228419+00
febbd7a0-5cc7-42f1-a1c3-d23fc1c13f58	f80816b4-1585-4a4b-9cf2-d284a81c8458	f3e83f0d3a7d9d29247c30d28b77204fc83b708a5dd7861f24808e464abb0eab	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 05:40:46.685+00	2026-11-29 05:40:46.685+00	f	\N	2026-10-30 05:40:46.686993+00	2026-10-30 05:40:46.686993+00
c10517a1-3e01-49fa-a4d7-8df9c43cfd7e	f80816b4-1585-4a4b-9cf2-d284a81c8458	a7acf690d7d4a5dc1696f11a5ebd164ca88fa5ab26e9205311f27d40f8915335	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-11-03 12:17:47.72+00	2026-12-03 12:17:47.721+00	f	\N	2026-11-03 12:17:47.728944+00	2026-11-03 12:17:47.728944+00
1a852ddc-2656-408a-8fbb-a15f6bfbc3d2	f80816b4-1585-4a4b-9cf2-d284a81c8458	70d89d9a701375433b990830a16463663ec58774269fe8ce7663e26da446c300	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 07:14:11.505+00	2026-11-29 07:14:11.505+00	f	\N	2026-10-30 07:14:11.508988+00	2026-10-30 07:14:11.508988+00
5334f550-03ec-4dbe-ab2d-7b330cd119bb	f80816b4-1585-4a4b-9cf2-d284a81c8458	907c0f0e883a784449a63223064c5bc206af8c6c7ff11e3b0b4044b36485a477	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-11-04 04:04:09.839+00	2026-12-04 04:04:09.842+00	f	\N	2026-11-04 04:04:09.848254+00	2026-11-04 04:04:09.848254+00
5327cda2-8d51-426c-80b8-4ad0e62c7476	f80816b4-1585-4a4b-9cf2-d284a81c8458	1ff1045ab69dfe49ed6acf884df3bb5b983185f029e0b0b3f9e9a7a1ea8b95e9	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 08:46:42.863+00	2026-11-29 08:46:42.863+00	f	\N	2026-10-30 08:46:42.867028+00	2026-10-30 08:46:42.867028+00
7b2426ea-52e0-4e72-a51d-9b92fe575895	f80816b4-1585-4a4b-9cf2-d284a81c8458	8b88cb5fa7d1cf12db12024250f349ed9c8211cdec30b565a7abdcfa2d256c86	3b0518b951834b845718a65054c1cfb2	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-11-04 09:55:31.237+00	2026-12-04 09:55:31.237+00	f	\N	2026-11-04 09:55:31.239849+00	2026-11-04 09:55:31.239849+00
99c2d805-c241-41c9-9910-47c88933c2cb	24f04f5b-9007-4480-94cd-0556d4aef097	2e857fa5d23597d24897084fb62850a54da2e6ec5f3ddde57ddd759340b1df66	7a588fbbdee4bdd34cb17677e961a0bf	Chrome on Windows	Chrome	Windows	127.0.0.1	2026-10-30 11:46:21.713+00	2026-11-29 11:46:21.713+00	f	\N	2026-10-30 11:46:21.715827+00	2026-10-30 11:46:21.715827+00
\.


--
-- Data for Name: user_work_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_work_details (id, user_id, employee_code, biometric_id, company, location, location_type, office_address, zone_id, department, sub_department, designation, grade, employee_type, work_type, employee_status, cost_center, shift, leave_rule, payroll_type, hiring_source, source_of_verification, reporting_manager_id, functional_head_id, hrbp_id, official_email_id, official_mobile_number, joining_date, notice_days, probation_days, probation_date, probation_confirmation_date, contract_end_date, date_of_retirement, created_by, updated_by, created_at, updated_at, deleted_at, grade_id, cost_center_id, zone_item_id, hiring_source_id, verification_source_id, department_id, sub_department_id, designation_id, branch_id, location_type_id, employment_type_id, employee_status_id, notice_start_date, entity_id, employee_type_id, last_working_date, payroll_type_id) FROM stdin;
c5ad934f-fb3f-41e6-8507-6d9461284480	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	EMP000002	EMP000002	Acme Logistics Limited	Ahmedabad Corporate Office	head_office	string	string	Technology	IT Support	Full Stack Developer	string	white_collar	\N	probation	Support	Shift 2 HO (10:00:00 AM to 06:30:00 PM)	General	\N	string	string	50a74013-21fd-4641-8c73-369507b8b7c2	50a74013-21fd-4641-8c73-369507b8b7c2	50a74013-21fd-4641-8c73-369507b8b7c2	john.doe@acme.com	9123456780	2026-09-01	30	180	2027-02-28	2026-10-13	2026-10-13	2026-10-13	devyansh.solanki@shreemaruti.com	\N	2026-10-13 07:21:39.010968+00	2026-10-13 07:21:39.010968+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	e85adb11-a751-442a-979b-32483b890640	\N	4624c050-5b03-4910-890e-ba7b94f27c20	\N	3ec637ef-5f74-4c64-933a-9411644db07f	\N	\N	\N
2f2d1e3a-8aa0-4248-90cc-6b7adaa93cf3	03816039-249c-462d-a1a2-7a1b855c07ab	\N	\N	Acme Logistics Limited	Ahmedabad Corporate Office	head_office			Technology	IT Support	Admin		white_collar	\N	probation	Support	Shift 2 HO (10:00:00 AM to 06:30:00 PM)	General	\N		string	50a74013-21fd-4641-8c73-369507b8b7c2	50a74013-21fd-4641-8c73-369507b8b7c2	50a74013-21fd-4641-8c73-369507b8b7c2	john.doe@acme.com	9123356780	2026-09-01	30	180	2027-02-28	2026-10-15	2026-10-15	2026-10-15	prince.h@shreemaruti.com	prince.h@shreemaruti.com	2026-10-15 05:57:20.46154+00	2026-10-15 09:30:04.563985+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	e85adb11-a751-442a-979b-32483b890640	\N	4624c050-5b03-4910-890e-ba7b94f27c20	\N	3ec637ef-5f74-4c64-933a-9411644db07f	\N	\N	\N
7940509e-6aee-4f6b-9de2-639b56ae4e9f	3a77a62c-363f-41e5-b446-8a7aad3d7b9f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	system	\N	2026-10-26 12:37:09.308116+00	2026-10-26 12:37:09.308116+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3ec637ef-5f74-4c64-933a-9411644db07f	\N	\N	\N
ae9662b6-7705-4ebb-b134-aa3bb8ca19e5	a4acc004-9d12-4dec-a1f4-6b89175b85e1	EMP000003	EMP000003	Shree Maruti Courier Services Pvt Ltd	Ahmedabad Corporate Office	head_office	string	string	Technology	IT Support	Full Stack Developer	string	white_collar	\N	probation	Support	Shift 2 HO (10:00:00 AM to 06:30:00 PM)	General	\N	string	string	50a74013-21fd-4641-8c73-369507b8b7c2	50a74013-21fd-4641-8c73-369507b8b7c2	50a74013-21fd-4641-8c73-369507b8b7c2	rutvik.s@shreemaruti.com	9123456780	2026-09-01	30	180	2027-02-28	2026-10-14	2026-10-14	2026-10-14	devyansh.solanki@shreemaruti.com	\N	2026-10-14 07:04:36.359269+00	2026-10-14 07:04:36.359269+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	e85adb11-a751-442a-979b-32483b890640	\N	4624c050-5b03-4910-890e-ba7b94f27c20	\N	3ec637ef-5f74-4c64-933a-9411644db07f	\N	\N	\N
1fc12aa2-bb6d-45ae-bd9e-4de932615cc2	50a74013-21fd-4641-8c73-369507b8b7c2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	system	\N	2026-10-26 12:37:09.308116+00	2026-10-26 12:37:09.308116+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3ec637ef-5f74-4c64-933a-9411644db07f	\N	\N	\N
78640c17-9bf5-4990-8007-8129fea9d65f	d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	EMP001	EMP001	Acme Logistics Limited	Ahmedabad Corporate Office	head_office	string	string	Technology	IT Support	Full Stack Developer	string	white_collar	\N	probation	Support	Shift 2 HO (10:00:00 AM to 06:30:00 PM)	General	\N	string	string	2d88ee2a-b305-4919-b1f4-5ff29adfa86b	50a74013-21fd-4641-8c73-369507b8b7c2	50a74013-21fd-4641-8c73-369507b8b7c2	john.doe@acme.com	9123456780	2026-09-01	30	180	2027-02-28	2026-10-12	2026-10-12	2026-10-12	devyansh.solanki@shreemaruti.com	\N	2026-10-12 20:00:32.155042+00	2026-10-12 20:00:32.155042+00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	e85adb11-a751-442a-979b-32483b890640	\N	4624c050-5b03-4910-890e-ba7b94f27c20	\N	3ec637ef-5f74-4c64-933a-9411644db07f	\N	\N	\N
4e1e22b0-151f-4b2a-aa98-1c2aaf6c1e26	c22fb54f-db68-45f6-a203-a66103741b2e	EMP000026	EMP000026	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Part-time	onsite	probation	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	da8f6a78-2d00-42f7-b08e-c0c149678c0d	\N	\N	manish.solanki@example.com	\N	2026-05-04	30	180	2026-10-31	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	6ef12a61-a92a-40e7-ac83-b46970027750	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	d42ff5bc-eca5-4abf-992b-4fbdc3f09f5d	\N	4d7195c5-dd4e-492b-ac78-a989ab30fdab	\N	c775d5b8-b354-4d2e-b4d5-942e4b30fcbb	e7c39302-304c-45da-8776-a79a3e34fd52	\N	34621597-1226-4027-be17-d9752ae4a7cb	4624c050-5b03-4910-890e-ba7b94f27c20	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
6a16d0bc-4539-48f1-b712-ba91c46c681a	470ed31a-9262-4c40-81c9-a03f0ebcd840	EMP000027	EMP000027	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	hybrid	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	\N	\N	riya.bhatt@example.com	\N	2019-09-02	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	abc7fcbd-7737-4baa-a67c-2b92b9a934e8	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	e097ca04-6791-46fe-89d2-b08f4c5f766c	\N	1a68db86-2ab5-4d44-806b-810ac4315d88	\N	d84599a4-fc16-4c0d-a767-93e665a478f2	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
94dacb86-da0e-43d1-9104-2c489fe2368e	3f4e5e52-6d48-4266-86c5-03f57e2947e6	EMP000018	EMP000018	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	hybrid	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	\N	\N	rohan.mehta@example.com	\N	2021-04-05	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	4f104b94-1fa1-4f44-8e6a-9724d57043f4	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	afa36269-7fc4-4938-90a0-359acd75584c	\N	cf59bdc6-9902-4bea-98af-d86a639976c8	f3f1ca9e-88ed-4fcb-a987-44b1c7658b75	c8257aea-e14e-415f-9f4e-6f7181dc376c	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
b26e6238-5869-4bf5-997b-6a9bb8eeffb1	df1a3122-0d91-4e5d-a27c-20ac5d74f9f9	EMP000019	EMP000019	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	remote	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	\N	\N	sneha.shah@example.com	\N	2022-08-16	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	b9cf63ac-fdaf-4450-824a-1b9c4bb90bcd	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	20e2d2ba-c0f3-45b1-81dc-f1c4b43519ab	\N	cf59bdc6-9902-4bea-98af-d86a639976c8	f3f1ca9e-88ed-4fcb-a987-44b1c7658b75	62d8b051-021e-4001-b9bd-bbe7a776c9b0	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
ac48cf97-5456-4c46-9a36-bca78d023fa9	eb8b78dd-5692-4f65-8c5b-a82418b707d8	EMP000020	EMP000020	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	hybrid	probation	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	\N	\N	aarav.desai@example.com	\N	2026-07-01	30	180	2026-12-28	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	6ef12a61-a92a-40e7-ac83-b46970027750	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	6efcc188-83b6-4aac-845a-0f2643e41ee9	\N	cf59bdc6-9902-4bea-98af-d86a639976c8	f3f1ca9e-88ed-4fcb-a987-44b1c7658b75	62d8b051-021e-4001-b9bd-bbe7a776c9b0	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	4624c050-5b03-4910-890e-ba7b94f27c20	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
7ab7cf3a-b68e-4930-93a8-717e101593e4	5fd7de3b-afa2-4483-9039-5e6bd4d12dcf	EMP000022	EMP000022	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	\N	\N	vikram.chauhan@example.com	\N	2020-03-02	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	b9cf63ac-fdaf-4450-824a-1b9c4bb90bcd	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	d42ff5bc-eca5-4abf-992b-4fbdc3f09f5d	\N	cf59bdc6-9902-4bea-98af-d86a639976c8	bae28813-0127-4076-9b5b-8d1fe4f0fa7f	85a54d26-df1c-45d8-9ef4-5509ea8dbaf9	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
e910bd73-47ef-435c-8a0f-9ae1e0d5166a	63853727-011a-432b-9746-3857ac429456	EMP000025	EMP000025	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	da8f6a78-2d00-42f7-b08e-c0c149678c0d	\N	\N	pooja.rathod@example.com	\N	2021-11-15	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	4f104b94-1fa1-4f44-8e6a-9724d57043f4	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	6efcc188-83b6-4aac-845a-0f2643e41ee9	\N	4d7195c5-dd4e-492b-ac78-a989ab30fdab	\N	85a54d26-df1c-45d8-9ef4-5509ea8dbaf9	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
225cdf71-f877-46d1-bdd9-3276726cd002	76fdfa62-7cda-433d-aebf-1ec9959abf40	EMP000028	EMP000028	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	470ed31a-9262-4c40-81c9-a03f0ebcd840	\N	\N	yash.thakkar@example.com	\N	2023-06-12	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	b9cf63ac-fdaf-4450-824a-1b9c4bb90bcd	\N	2f97b909-4cea-4149-b139-f5df50cb8607	6efcc188-83b6-4aac-845a-0f2643e41ee9	\N	1a68db86-2ab5-4d44-806b-810ac4315d88	\N	230567b2-e408-4cce-82b8-3c62c46216f6	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
f519c65c-9cca-4810-be85-32eef7a4d80c	8beb9ae0-7e13-4a01-8201-88703a800bad	EMP000029	EMP000029	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	notice_period	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	470ed31a-9262-4c40-81c9-a03f0ebcd840	\N	\N	dhruvi.vyas@example.com	\N	2024-02-01	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	6ef12a61-a92a-40e7-ac83-b46970027750	\N	2669937f-813a-4a39-b4c9-a84a47de313c	afa36269-7fc4-4938-90a0-359acd75584c	\N	1a68db86-2ab5-4d44-806b-810ac4315d88	\N	230567b2-e408-4cce-82b8-3c62c46216f6	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	0a7f8285-7430-4412-a5e2-82d246f74b0d	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
7c3ceefe-c184-4e02-8ce9-cd796418788c	5c3245b2-f884-4d4f-98b4-23fb0a156853	EMP000030	EMP000030	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	\N	\N	jay.prajapati@example.com	\N	2017-12-11	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	abc7fcbd-7737-4baa-a67c-2b92b9a934e8	\N	e0d5cca2-0c0c-4523-ac13-2235d3e29660	1d7af23a-3b7d-4ca8-8846-32724321014f	\N	dcd9c3a4-3575-4be3-be30-37084c95c27e	\N	d84599a4-fc16-4c0d-a767-93e665a478f2	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
52ee4aa5-9701-483f-8660-6871e932f50c	e97cfeee-196e-4d68-9f33-93abf8216cb6	EMP000031	EMP000031	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Contract	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	5c3245b2-f884-4d4f-98b4-23fb0a156853	\N	\N	mitali.dave@example.com	\N	2025-03-17	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	6ef12a61-a92a-40e7-ac83-b46970027750	\N	f92e1a2f-84b1-4d6a-ac61-309f85e2158d	d42ff5bc-eca5-4abf-992b-4fbdc3f09f5d	\N	dcd9c3a4-3575-4be3-be30-37084c95c27e	\N	e192830a-64f3-42ca-9ada-e827329e2a9a	e7c39302-304c-45da-8776-a79a3e34fd52	\N	3ac6a802-71ae-44cf-ae87-5c0b7227f96c	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
9bff41ef-0aed-46e7-9492-2a6d69f2aa6a	d2f4e22d-e94d-444f-8810-1ec598a3d98f	EMP000032	EMP000032	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	5c3245b2-f884-4d4f-98b4-23fb0a156853	\N	\N	kunal.pandya@example.com	\N	2022-04-25	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	b9cf63ac-fdaf-4450-824a-1b9c4bb90bcd	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	6efcc188-83b6-4aac-845a-0f2643e41ee9	\N	dcd9c3a4-3575-4be3-be30-37084c95c27e	\N	85a54d26-df1c-45d8-9ef4-5509ea8dbaf9	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
26e60725-e561-4d6a-9d59-a0c9db696cbc	4f855c59-60da-487a-b8ad-0330af959bb5	EMP000017	EMP000017	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	99415aeb-b341-414a-8828-67eea46d98d1	\N	\N	prapti.gadhiya@shreemaruti.com	\N	2022-01-10	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	b9cf63ac-fdaf-4450-824a-1b9c4bb90bcd	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	20e2d2ba-c0f3-45b1-81dc-f1c4b43519ab	\N	c96c2707-dd48-4d61-bf49-6870918d7e5e	a396101d-84a2-4e27-b83f-d1294b74e714	80b0d847-a568-41d1-88db-1e5833a4a918	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
943764ef-2d1d-4d3b-be73-0a91da1df71e	99415aeb-b341-414a-8828-67eea46d98d1	EMP000014	EMP000014	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	\N	\N	toral.patel@shreemaruti.com	\N	2018-02-15	60	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	abc7fcbd-7737-4baa-a67c-2b92b9a934e8	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	afa36269-7fc4-4938-90a0-359acd75584c	\N	c96c2707-dd48-4d61-bf49-6870918d7e5e	\N	5e6e4c98-cf19-4d79-8c17-049156292f9d	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
f77c6b31-7218-47ab-8de0-78c871d2cea3	da8f6a78-2d00-42f7-b08e-c0c149678c0d	EMP000016	EMP000016	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	\N	\N	anu.pandey@shreemaruti.com	\N	2020-10-01	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	4f104b94-1fa1-4f44-8e6a-9724d57043f4	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	e097ca04-6791-46fe-89d2-b08f4c5f766c	\N	4d7195c5-dd4e-492b-ac78-a989ab30fdab	\N	c775d5b8-b354-4d2e-b4d5-942e4b30fcbb	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
07abc777-abc3-4133-9d30-0b0cf7fee89b	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	EMP000013	EMP000013	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	\N	\N	\N	bhavesh.katariya@shreemaruti.com	\N	2016-06-01	90	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	1b5d1aa8-d336-4626-b777-779c5cf3871a	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	1d7af23a-3b7d-4ca8-8846-32724321014f	\N	82fc603e-d02f-46d1-9089-d14e68ee5c21	\N	368db79c-da4f-4c34-8cb9-327f7e66ed0f	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
b7ad7268-16b0-468c-aada-243cf0839eeb	3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	EMP000023	EMP000023	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	hybrid	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	99415aeb-b341-414a-8828-67eea46d98d1	\N	\N	nidhi.trivedi@example.com	\N	2023-01-09	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	b9cf63ac-fdaf-4450-824a-1b9c4bb90bcd	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	afa36269-7fc4-4938-90a0-359acd75584c	\N	c96c2707-dd48-4d61-bf49-6870918d7e5e	a396101d-84a2-4e27-b83f-d1294b74e714	80b0d847-a568-41d1-88db-1e5833a4a918	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
2a73af97-e6aa-4ec1-9aa3-cb5deac98556	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	EMP000015	EMP000015	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Full-time	hybrid	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	e446d2d7-75a5-406a-b182-b0c8c5a29bb3	\N	\N	krunal.katariya@shreemaruti.com	\N	2019-07-08	60	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	abc7fcbd-7737-4baa-a67c-2b92b9a934e8	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	6efcc188-83b6-4aac-845a-0f2643e41ee9	\N	cf59bdc6-9902-4bea-98af-d86a639976c8	f3f1ca9e-88ed-4fcb-a987-44b1c7658b75	4e3ea68b-7ad4-4035-847a-a9e91270c01b	e7c39302-304c-45da-8776-a79a3e34fd52	\N	40909243-13e7-4e9f-ab5c-c821c476d0a3	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
6d1afd79-946c-4cf2-950f-c46f784c09e7	f80816b4-1585-4a4b-9cf2-d284a81c8458	EMP000006	EMP000006	Shree Maruti	Ahmedabad Head Office	head_office	1st Floor, Sunrise Business Park, SG Highway, Ahmedabad 380054	\N	\N	\N	\N	\N	Full-time	\N	probation	\N	Shift 2 HO (10:00:00 AM to 06:30:00 PM)	General	monthly	\N	\N	50a74013-21fd-4641-8c73-369507b8b7c2	50a74013-21fd-4641-8c73-369507b8b7c2	50a74013-21fd-4641-8c73-369507b8b7c2	harsh.shah@shreemaruti.com	9123456780	2026-09-01	30	180	2027-02-28	2027-03-01	2027-08-31	2056-04-30	devyansh.solanki@shreemaruti.com	harsh.shah@shreemaruti.com	2026-10-19 06:11:45.152517+00	2026-10-21 17:27:36.419139+00	\N	1b5d1aa8-d336-4626-b777-779c5cf3871a	\N	2669937f-813a-4a39-b4c9-a84a47de313c	e097ca04-6791-46fe-89d2-b08f4c5f766c	020f8049-f566-4d86-b307-26e9e669b49c	cf59bdc6-9902-4bea-98af-d86a639976c8	\N	a9ca7089-2883-4a56-9388-2927a3b5ca73	e7c39302-304c-45da-8776-a79a3e34fd52	e85adb11-a751-442a-979b-32483b890640	40909243-13e7-4e9f-ab5c-c821c476d0a3	4624c050-5b03-4910-890e-ba7b94f27c20	\N	3ec637ef-5f74-4c64-933a-9411644db07f	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
92accc29-abca-488f-96b2-3263f2c63199	24f04f5b-9007-4480-94cd-0556d4aef097	EMP000024	EMP000024	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Contract	onsite	confirmed	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	99415aeb-b341-414a-8828-67eea46d98d1	\N	\N	harsh.parmar@example.com	\N	2024-05-20	30	\N	\N	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	6ef12a61-a92a-40e7-ac83-b46970027750	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	e097ca04-6791-46fe-89d2-b08f4c5f766c	\N	c96c2707-dd48-4d61-bf49-6870918d7e5e	\N	e192830a-64f3-42ca-9ada-e827329e2a9a	e7c39302-304c-45da-8776-a79a3e34fd52	\N	3ac6a802-71ae-44cf-ae87-5c0b7227f96c	be067871-457d-4efd-8be9-042d8ddd50a8	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
3149ac2b-0f89-4b1c-88da-2cef7f2bb02f	0e9621c5-c42a-47de-9520-4f3da89600d7	EMP000021	EMP000021	\N	Ahmedabad Head Office	\N	\N	\N	\N	\N	\N	\N	Intern	onsite	probation	\N	General (09:30 - 18:30)	\N	monthly	\N	\N	fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	\N	\N	kavya.joshi@example.com	\N	2026-06-15	15	90	2026-09-13	\N	\N	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	\N	\N	f4eae34b-3b36-4b1e-8204-153b0a4858a8	20e2d2ba-c0f3-45b1-81dc-f1c4b43519ab	\N	cf59bdc6-9902-4bea-98af-d86a639976c8	f3f1ca9e-88ed-4fcb-a987-44b1c7658b75	a9ca7089-2883-4a56-9388-2927a3b5ca73	e7c39302-304c-45da-8776-a79a3e34fd52	\N	cd012dbc-a9dc-4bb7-b9ad-40ae0c683431	4624c050-5b03-4910-890e-ba7b94f27c20	\N	5f7a65ab-f28a-474f-8bf3-caa56056e7ea	\N	\N	edb5f971-5c50-42cd-bf74-a75f08b98102
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, mobile_number, password_hash, status, role_id, last_login_at, created_by, updated_by, created_at, updated_at, deleted_at, organization_id, is_super_admin, profile_picture_id, ip_address, device_name, is_tablet, device_unique_id) FROM stdin;
c22fb54f-db68-45f6-a203-a66103741b2e	manish.solanki@example.com	9000010009	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
3a77a62c-363f-41e5-b446-8a7aad3d7b9f	test@example.com	8866110128	$2b$12$S4XXnHrVAs.QKRBC9R2OOOi8HyaqfIy77EHkhG0M6Fqv1G6x3boA.	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	2026-10-27 04:50:53.054+00	\N	test@example.com	2026-10-12 05:29:24.806352+00	2026-10-27 04:50:53.057473+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	362e1696-e248-4e8d-a1fe-887fd7ff1714	202.131.96.18	\N	\N	\N
1b3e765c-f4b6-4263-994b-b7221c34f75c	dev@example.com	9876543210	$2b$12$YBW8b7F8yRGDXJREnlDqEeyR8X3O4wwG5PKyFD8odxY21/pCil5eC	ACTIVE	\N	2026-10-15 05:18:02.326+00	\N	dev@example.com	2026-10-09 12:01:31.404549+00	2026-10-15 05:18:02.331005+00	\N	\N	t	\N	\N	\N	\N	\N
03816039-249c-462d-a1a2-7a1b855c07ab	prince.h@shreemaruti.com	9876543221	$2b$12$9QupW7BY6v/pXnEmywzc5OECaRAsAZMRIGv7U7LE.A.EU9bLpO6A.	ACTIVE	5c89fb68-b65c-4598-9682-16de4bcaccb2	2026-10-27 06:16:55.561+00	\N	prince.h@shreemaruti.com	2026-10-10 06:46:54.190229+00	2026-10-27 06:16:55.571923+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	202.131.96.18	Samsung Galaxy Tab S9	f	3f2a9c1e-7b4d-4e8a-9f60-1c2d3e4f5a6b
a4acc004-9d12-4dec-a1f4-6b89175b85e1	rutvik.s@shreemaruti.com	9876523210	$2b$12$doJ1NWhXzWe1H1CMl/gFi.sGtndjGwzy7yy2A7EbnY/iZ7jzmf/gq	ACTIVE	5c89fb68-b65c-4598-9682-16de4bcaccb2	2026-10-14 07:06:11.528+00	devyansh.solanki@shreemaruti.com	\N	2026-10-14 07:04:36.359269+00	2026-10-14 07:06:11.532217+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
2d88ee2a-b305-4919-b1f4-5ff29adfa86b	roshni.thakor@shreemaruti.com	9876573210	$2b$12$CCIyDhV5pCt1HkQ8asX7HOJkYVq7aS8rj7ccplhe27tpSQtGdWjq6	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	2026-10-27 06:17:55.569+00	devyansh.solanki@shreemaruti.com	roshni.thakor@shreemaruti.com	2026-10-13 07:21:39.010968+00	2026-10-27 06:17:55.577478+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	56df70ae-e30a-4683-bf97-1211b1cc0c2c	202.131.96.18	Samsung Galaxy Tab S9	f	3f2a9c1e-7b4d-4e8a-9f60-1c2d3e4f5a6b
d5a7b6c9-27fa-4ed7-8284-bbd72ca34c1b	john.doe@acme.com	5252525252	$2b$12$Sty9uk1FAyTKAns0E5TQKeDvw7sT8hRmbcLxJ8BNUHlY1vd1IIRc6	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	2026-10-23 11:53:36.619+00	devyansh.solanki@shreemaruti.com	john.doe@acme.com	2026-10-12 20:00:32.155042+00	2026-10-23 11:53:36.62682+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	202.131.96.18	Samsung Galaxy Tab S9	f	3f2a9c1e-7b4d-4e8a-9f60-1c2d3e4f5a6b
470ed31a-9262-4c40-81c9-a03f0ebcd840	riya.bhatt@example.com	9000010010	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
3f4e5e52-6d48-4266-86c5-03f57e2947e6	rohan.mehta@example.com	9000010001	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	2026-10-28 12:30:45.861+00	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-28 12:30:45.86347+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	202.131.96.18	\N	\N	\N
df1a3122-0d91-4e5d-a27c-20ac5d74f9f9	sneha.shah@example.com	9000010002	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
eb8b78dd-5692-4f65-8c5b-a82418b707d8	aarav.desai@example.com	9000010003	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
5fd7de3b-afa2-4483-9039-5e6bd4d12dcf	vikram.chauhan@example.com	9000010005	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
63853727-011a-432b-9746-3857ac429456	pooja.rathod@example.com	9000010008	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
76fdfa62-7cda-433d-aebf-1ec9959abf40	yash.thakkar@example.com	9000010011	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
8beb9ae0-7e13-4a01-8201-88703a800bad	dhruvi.vyas@example.com	9000010012	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
5c3245b2-f884-4d4f-98b4-23fb0a156853	jay.prajapati@example.com	9000010013	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
e97cfeee-196e-4d68-9f33-93abf8216cb6	mitali.dave@example.com	9000010014	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
d2f4e22d-e94d-444f-8810-1ec598a3d98f	kunal.pandya@example.com	9000010015	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
4f855c59-60da-487a-b8ad-0330af959bb5	prapti.gadhiya@shreemaruti.com	8866110127	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
99415aeb-b341-414a-8828-67eea46d98d1	toral.patel@shreemaruti.com	8866110126	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
da8f6a78-2d00-42f7-b08e-c0c149678c0d	anu.pandey@shreemaruti.com	8866110125	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
e446d2d7-75a5-406a-b182-b0c8c5a29bb3	bhavesh.katariya@shreemaruti.com	8866110124	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
3b8f35c7-e4f0-4b99-b03b-ece14c2ab086	nidhi.trivedi@example.com	9000010006	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	2026-10-28 12:24:46.721+00	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-28 12:24:46.723437+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	202.131.96.18	\N	\N	\N
fd1238ac-0e04-47b9-acf1-ab9e5931cfb5	krunal.katariya@shreemaruti.com	8866110123	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	\N	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-27 11:55:33.338012+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	\N	\N	\N	\N
f80816b4-1585-4a4b-9cf2-d284a81c8458	harsh.shah@shreemaruti.com	8866110245	$2b$12$sZvu3eAtkUiomcOTEqFdz.Ak95M01HrG//6/ChsrGlnQnopFVnggm	ACTIVE	5c89fb68-b65c-4598-9682-16de4bcaccb2	2026-11-04 09:55:31.209+00	devyansh.solanki@shreemaruti.com	harsh.shah@shreemaruti.com	2026-10-19 06:11:45.152517+00	2026-11-04 09:55:31.212397+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	127.0.0.1	Samsung Galaxy Tab S9	f	3f2a9c1e-7b4d-4e8a-9f60-1c2d3e4f5a6b
24f04f5b-9007-4480-94cd-0556d4aef097	harsh.parmar@example.com	9000010007	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	2026-10-30 12:19:09.105+00	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-30 12:19:09.107192+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	127.0.0.1	Samsung Galaxy Tab S9	f	3f2a9c1e-7b4d-4e8a-9f60-1c2d3e4f5a6b
0e9621c5-c42a-47de-9520-4f3da89600d7	kavya.joshi@example.com	9000010004	$2b$12$ezT8MO1WDqHx3/BJYW2r1.4Vx2QUH7RRrASm.glAIBFvdt./ap0Au	ACTIVE	43d5d30e-eb8a-4c2b-b79a-4cf2b8398723	2026-10-30 12:05:11.024+00	seed	\N	2026-10-27 11:55:33.338012+00	2026-10-30 12:05:11.027404+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	\N	127.0.0.1	Samsung Galaxy Tab S9	f	3f2a9c1e-7b4d-4e8a-9f60-1c2d3e4f5a6b
50a74013-21fd-4641-8c73-369507b8b7c2	devyansh.solanki@shreemaruti.com	8866118866	$2b$12$V2/Wxf09Yc.asgRbS6Wp7uwxLvuTCXnlxUvFx6ERhcATR9ulqxxTC	ACTIVE	5c89fb68-b65c-4598-9682-16de4bcaccb2	2026-11-02 08:47:43.018+00	\N	devyansh.solanki@shreemaruti.com	2026-10-10 03:16:37.48705+00	2026-11-02 08:47:43.019858+00	\N	9edca853-7860-4925-b81b-1206dc4298cb	f	abde00d9-40a3-463b-a12d-079ee0a8f3d9	127.0.0.1	Samsung Galaxy Tab S9	f	3f2a9c1e-7b4d-4e8a-9f60-1c2d3e4f5a6b
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 82, true);


--
-- Name: user_work_details_employee_code_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_work_details_employee_code_seq', 32, true);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: access_audit_logs PK_access_audit_logs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_audit_logs
    ADD CONSTRAINT "PK_access_audit_logs" PRIMARY KEY (id);


--
-- Name: app_menus PK_app_menus; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_menus
    ADD CONSTRAINT "PK_app_menus" PRIMARY KEY (menu_id);


--
-- Name: app_modules PK_app_modules; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_modules
    ADD CONSTRAINT "PK_app_modules" PRIMARY KEY (app_id);


--
-- Name: banks PK_banks; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT "PK_banks" PRIMARY KEY (id);


--
-- Name: branches PK_branches; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT "PK_branches" PRIMARY KEY (id);


--
-- Name: candidate_portal_links PK_candidate_portal_links; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidate_portal_links
    ADD CONSTRAINT "PK_candidate_portal_links" PRIMARY KEY (id);


--
-- Name: candidates PK_candidates; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "PK_candidates" PRIMARY KEY (id);


--
-- Name: cities PK_cities; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT "PK_cities" PRIMARY KEY (id);


--
-- Name: countries PK_countries; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "PK_countries" PRIMARY KEY (id);


--
-- Name: currencies PK_currencies; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT "PK_currencies" PRIMARY KEY (id);


--
-- Name: data_permission_groups PK_data_permission_groups; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_permission_groups
    ADD CONSTRAINT "PK_data_permission_groups" PRIMARY KEY (id);


--
-- Name: departments PK_departments; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT "PK_departments" PRIMARY KEY (id);


--
-- Name: designations PK_designations; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT "PK_designations" PRIMARY KEY (id);


--
-- Name: entities PK_entities; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT "PK_entities" PRIMARY KEY (id);


--
-- Name: expense_policy_documents PK_expense_policy_documents; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_policy_documents
    ADD CONSTRAINT "PK_expense_policy_documents" PRIMARY KEY (id);


--
-- Name: expense_request_events PK_expense_request_events; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_events
    ADD CONSTRAINT "PK_expense_request_events" PRIMARY KEY (id);


--
-- Name: expense_request_item_receipts PK_expense_request_item_receipts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_item_receipts
    ADD CONSTRAINT "PK_expense_request_item_receipts" PRIMARY KEY (item_id, file_id);


--
-- Name: expense_request_items PK_expense_request_items; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_items
    ADD CONSTRAINT "PK_expense_request_items" PRIMARY KEY (id);


--
-- Name: expense_requests PK_expense_requests; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_requests
    ADD CONSTRAINT "PK_expense_requests" PRIMARY KEY (id);


--
-- Name: files PK_files; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT "PK_files" PRIMARY KEY (id);


--
-- Name: holidays PK_holidays; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT "PK_holidays" PRIMARY KEY (id);


--
-- Name: leave_balances PK_leave_balances; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_balances
    ADD CONSTRAINT "PK_leave_balances" PRIMARY KEY (id);


--
-- Name: leave_guidelines PK_leave_guidelines; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_guidelines
    ADD CONSTRAINT "PK_leave_guidelines" PRIMARY KEY (id);


--
-- Name: leave_request_events PK_leave_request_events; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_request_events
    ADD CONSTRAINT "PK_leave_request_events" PRIMARY KEY (id);


--
-- Name: leave_requests PK_leave_requests; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_requests
    ADD CONSTRAINT "PK_leave_requests" PRIMARY KEY (id);


--
-- Name: leave_settings PK_leave_settings; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_settings
    ADD CONSTRAINT "PK_leave_settings" PRIMARY KEY (id);


--
-- Name: leave_type_policies PK_leave_type_policies; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_type_policies
    ADD CONSTRAINT "PK_leave_type_policies" PRIMARY KEY (id);


--
-- Name: leave_types PK_leave_types; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_types
    ADD CONSTRAINT "PK_leave_types" PRIMARY KEY (id);


--
-- Name: master_items PK_master_items; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_items
    ADD CONSTRAINT "PK_master_items" PRIMARY KEY (id);


--
-- Name: master_types PK_master_types; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_types
    ADD CONSTRAINT "PK_master_types" PRIMARY KEY (id);


--
-- Name: offer_letter_attachments PK_offer_letter_attachments; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letter_attachments
    ADD CONSTRAINT "PK_offer_letter_attachments" PRIMARY KEY (offer_letter_id, file_id);


--
-- Name: offer_letter_templates PK_offer_letter_templates; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letter_templates
    ADD CONSTRAINT "PK_offer_letter_templates" PRIMARY KEY (id);


--
-- Name: offer_letters PK_offer_letters; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letters
    ADD CONSTRAINT "PK_offer_letters" PRIMARY KEY (id);


--
-- Name: onboarding_candidate_events PK_onboarding_candidate_events; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_candidate_events
    ADD CONSTRAINT "PK_onboarding_candidate_events" PRIMARY KEY (id);


--
-- Name: onboarding_candidate_stages PK_onboarding_candidate_stages; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_candidate_stages
    ADD CONSTRAINT "PK_onboarding_candidate_stages" PRIMARY KEY (id);


--
-- Name: onboarding_stages PK_onboarding_stages; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_stages
    ADD CONSTRAINT "PK_onboarding_stages" PRIMARY KEY (id);


--
-- Name: onboarding_workflows PK_onboarding_workflows; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_workflows
    ADD CONSTRAINT "PK_onboarding_workflows" PRIMARY KEY (id);


--
-- Name: organization_currencies PK_organization_currencies; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_currencies
    ADD CONSTRAINT "PK_organization_currencies" PRIMARY KEY (id);


--
-- Name: organizations PK_organizations; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT "PK_organizations" PRIMARY KEY (id);


--
-- Name: otp_logs PK_otp_logs; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.otp_logs
    ADD CONSTRAINT "PK_otp_logs" PRIMARY KEY (id);


--
-- Name: password_reset_tokens PK_password_reset_tokens; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT "PK_password_reset_tokens" PRIMARY KEY (id);


--
-- Name: permissions PK_permissions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT "PK_permissions" PRIMARY KEY (id);


--
-- Name: policy_info PK_policy_info; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.policy_info
    ADD CONSTRAINT "PK_policy_info" PRIMARY KEY (id);


--
-- Name: profile_change_requests PK_profile_change_requests; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profile_change_requests
    ADD CONSTRAINT "PK_profile_change_requests" PRIMARY KEY (id);


--
-- Name: role_permissions PK_role_permissions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT "PK_role_permissions" PRIMARY KEY (role_id, permission_id);


--
-- Name: roles PK_roles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "PK_roles" PRIMARY KEY (id);


--
-- Name: salary_structures PK_salary_structures; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salary_structures
    ADD CONSTRAINT "PK_salary_structures" PRIMARY KEY (id);


--
-- Name: states PK_states; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT "PK_states" PRIMARY KEY (id);


--
-- Name: user_addresses PK_user_addresses; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "PK_user_addresses" PRIMARY KEY (id);


--
-- Name: user_bank_details PK_user_bank_details; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_bank_details
    ADD CONSTRAINT "PK_user_bank_details" PRIMARY KEY (id);


--
-- Name: user_emergency_contacts PK_user_emergency_contacts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_emergency_contacts
    ADD CONSTRAINT "PK_user_emergency_contacts" PRIMARY KEY (id);


--
-- Name: user_family_details PK_user_family_details; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_family_details
    ADD CONSTRAINT "PK_user_family_details" PRIMARY KEY (id);


--
-- Name: user_module_access PK_user_module_access; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_module_access
    ADD CONSTRAINT "PK_user_module_access" PRIMARY KEY (id);


--
-- Name: user_personal_details PK_user_personal_details; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_personal_details
    ADD CONSTRAINT "PK_user_personal_details" PRIMARY KEY (id);


--
-- Name: user_previous_experiences PK_user_previous_experiences; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_previous_experiences
    ADD CONSTRAINT "PK_user_previous_experiences" PRIMARY KEY (id);


--
-- Name: user_qualifications PK_user_qualifications; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_qualifications
    ADD CONSTRAINT "PK_user_qualifications" PRIMARY KEY (id);


--
-- Name: user_sessions PK_user_sessions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT "PK_user_sessions" PRIMARY KEY (id);


--
-- Name: user_work_details PK_user_work_details; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "PK_user_work_details" PRIMARY KEY (id);


--
-- Name: users PK_users; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_users" PRIMARY KEY (id);


--
-- Name: app_menus UQ_app_menus_app_code; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_menus
    ADD CONSTRAINT "UQ_app_menus_app_code" UNIQUE (app_id, code);


--
-- Name: app_menus UQ_app_menus_menu_id_app_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_menus
    ADD CONSTRAINT "UQ_app_menus_menu_id_app_id" UNIQUE (menu_id, app_id);


--
-- Name: app_modules UQ_app_modules_code; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_modules
    ADD CONSTRAINT "UQ_app_modules_code" UNIQUE (code);


--
-- Name: branches UQ_branches_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT "UQ_branches_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: candidate_portal_links UQ_candidate_portal_links_token_hash; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidate_portal_links
    ADD CONSTRAINT "UQ_candidate_portal_links_token_hash" UNIQUE (token_hash);


--
-- Name: data_permission_groups UQ_data_permission_groups_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_permission_groups
    ADD CONSTRAINT "UQ_data_permission_groups_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: departments UQ_departments_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT "UQ_departments_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: designations UQ_designations_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT "UQ_designations_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: entities UQ_entities_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT "UQ_entities_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: expense_policy_documents UQ_expense_policy_documents_file_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_policy_documents
    ADD CONSTRAINT "UQ_expense_policy_documents_file_id" UNIQUE (file_id);


--
-- Name: expense_request_item_receipts UQ_expense_request_item_receipts_file_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_item_receipts
    ADD CONSTRAINT "UQ_expense_request_item_receipts_file_id" UNIQUE (file_id);


--
-- Name: expense_request_items UQ_expense_request_items_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_items
    ADD CONSTRAINT "UQ_expense_request_items_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: expense_requests UQ_expense_requests_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_requests
    ADD CONSTRAINT "UQ_expense_requests_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: files UQ_files_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT "UQ_files_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: files UQ_files_storage_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT "UQ_files_storage_key" UNIQUE (storage_key);


--
-- Name: leave_balances UQ_leave_balances_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_balances
    ADD CONSTRAINT "UQ_leave_balances_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: leave_requests UQ_leave_requests_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_requests
    ADD CONSTRAINT "UQ_leave_requests_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: leave_types UQ_leave_types_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_types
    ADD CONSTRAINT "UQ_leave_types_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: master_items UQ_master_items_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_items
    ADD CONSTRAINT "UQ_master_items_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: offer_letter_templates UQ_offer_letter_templates_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letter_templates
    ADD CONSTRAINT "UQ_offer_letter_templates_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: offer_letters UQ_offer_letters_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letters
    ADD CONSTRAINT "UQ_offer_letters_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: offer_letters UQ_offer_letters_pdf_file_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letters
    ADD CONSTRAINT "UQ_offer_letters_pdf_file_id" UNIQUE (pdf_file_id);


--
-- Name: onboarding_stages UQ_onboarding_stages_workflow_type; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_stages
    ADD CONSTRAINT "UQ_onboarding_stages_workflow_type" UNIQUE (workflow_id, stage_type);


--
-- Name: organization_currencies UQ_organization_currencies_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_currencies
    ADD CONSTRAINT "UQ_organization_currencies_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: organization_currencies UQ_organization_currencies_organization_currency; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_currencies
    ADD CONSTRAINT "UQ_organization_currencies_organization_currency" UNIQUE (organization_id, currency_id);


--
-- Name: roles UQ_roles_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "UQ_roles_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: salary_structures UQ_salary_structures_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salary_structures
    ADD CONSTRAINT "UQ_salary_structures_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: user_addresses UQ_user_addresses_user_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "UQ_user_addresses_user_id" UNIQUE (user_id);


--
-- Name: user_bank_details UQ_user_bank_details_user_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_bank_details
    ADD CONSTRAINT "UQ_user_bank_details_user_id" UNIQUE (user_id);


--
-- Name: user_emergency_contacts UQ_user_emergency_contacts_user_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_emergency_contacts
    ADD CONSTRAINT "UQ_user_emergency_contacts_user_id" UNIQUE (user_id);


--
-- Name: user_personal_details UQ_user_personal_details_user_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_personal_details
    ADD CONSTRAINT "UQ_user_personal_details_user_id" UNIQUE (user_id);


--
-- Name: user_work_details UQ_user_work_details_user_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "UQ_user_work_details_user_id" UNIQUE (user_id);


--
-- Name: users UQ_users_id_organization_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_users_id_organization_id" UNIQUE (id, organization_id);


--
-- Name: IDX_access_audit_logs_org_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_access_audit_logs_org_created" ON public.access_audit_logs USING btree (organization_id, created_at);


--
-- Name: IDX_access_audit_logs_target_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_access_audit_logs_target_user_id" ON public.access_audit_logs USING btree (target_user_id);


--
-- Name: IDX_banks_type_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_banks_type_active" ON public.banks USING btree (bank_type, is_active);


--
-- Name: IDX_branches_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_branches_country_id" ON public.branches USING btree (country_id);


--
-- Name: IDX_branches_org_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_branches_org_active" ON public.branches USING btree (organization_id, is_active);


--
-- Name: IDX_branches_state_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_branches_state_id" ON public.branches USING btree (state_id);


--
-- Name: IDX_candidate_portal_links_candidate_open; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_candidate_portal_links_candidate_open" ON public.candidate_portal_links USING btree (candidate_id, purpose) WHERE (revoked_at IS NULL);


--
-- Name: IDX_candidates_branch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_candidates_branch_id" ON public.candidates USING btree (branch_id);


--
-- Name: IDX_candidates_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_candidates_department_id" ON public.candidates USING btree (department_id);


--
-- Name: IDX_candidates_designation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_candidates_designation_id" ON public.candidates USING btree (designation_id);


--
-- Name: IDX_candidates_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_candidates_entity_id" ON public.candidates USING btree (entity_id);


--
-- Name: IDX_candidates_org_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_candidates_org_created_at" ON public.candidates USING btree (organization_id, created_at) WHERE (deleted_at IS NULL);


--
-- Name: IDX_candidates_org_status_stage; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_candidates_org_status_stage" ON public.candidates USING btree (organization_id, status, current_stage_id);


--
-- Name: IDX_candidates_reporting_manager_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_candidates_reporting_manager_id" ON public.candidates USING btree (reporting_manager_id);


--
-- Name: IDX_candidates_salary_structure_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_candidates_salary_structure_id" ON public.candidates USING btree (salary_structure_id);


--
-- Name: IDX_cities_state_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_cities_state_active" ON public.cities USING btree (state_id, is_active);


--
-- Name: IDX_data_permission_groups_org_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_data_permission_groups_org_active" ON public.data_permission_groups USING btree (organization_id, is_active);


--
-- Name: IDX_departments_head_employee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_departments_head_employee_id" ON public.departments USING btree (head_employee_id);


--
-- Name: IDX_departments_org_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_departments_org_active" ON public.departments USING btree (organization_id, is_active);


--
-- Name: IDX_departments_parent_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_departments_parent_department_id" ON public.departments USING btree (parent_department_id);


--
-- Name: IDX_designations_org_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_designations_org_active" ON public.designations USING btree (organization_id, is_active);


--
-- Name: IDX_entities_org_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_entities_org_active" ON public.entities USING btree (organization_id, is_active);


--
-- Name: IDX_expense_policy_documents_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_expense_policy_documents_category_id" ON public.expense_policy_documents USING btree (category_id);


--
-- Name: IDX_expense_policy_documents_org_active_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_expense_policy_documents_org_active_sort" ON public.expense_policy_documents USING btree (organization_id, is_active, sort_order) WHERE (deleted_at IS NULL);


--
-- Name: IDX_expense_request_events_request_id_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_expense_request_events_request_id_created_at" ON public.expense_request_events USING btree (request_id, created_at);


--
-- Name: IDX_expense_request_items_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_expense_request_items_category_id" ON public.expense_request_items USING btree (category_id);


--
-- Name: IDX_expense_request_items_request_id_sort_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_expense_request_items_request_id_sort_order" ON public.expense_request_items USING btree (request_id, sort_order);


--
-- Name: IDX_expense_requests_approver_id_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_expense_requests_approver_id_status" ON public.expense_requests USING btree (approver_id, status);


--
-- Name: IDX_expense_requests_decided_by; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_expense_requests_decided_by" ON public.expense_requests USING btree (decided_by);


--
-- Name: IDX_expense_requests_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_expense_requests_organization_id" ON public.expense_requests USING btree (organization_id);


--
-- Name: IDX_expense_requests_user_id_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_expense_requests_user_id_status" ON public.expense_requests USING btree (user_id, status);


--
-- Name: IDX_files_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_files_organization_id" ON public.files USING btree (organization_id);


--
-- Name: IDX_files_uploaded_by; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_files_uploaded_by" ON public.files USING btree (uploaded_by);


--
-- Name: IDX_holidays_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_holidays_date" ON public.holidays USING btree (date);


--
-- Name: IDX_holidays_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_holidays_organization_id" ON public.holidays USING btree (organization_id);


--
-- Name: IDX_leave_balances_leave_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_balances_leave_type_id" ON public.leave_balances USING btree (leave_type_id);


--
-- Name: IDX_leave_balances_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_balances_organization_id" ON public.leave_balances USING btree (organization_id);


--
-- Name: IDX_leave_balances_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_balances_user_id" ON public.leave_balances USING btree (user_id);


--
-- Name: IDX_leave_guidelines_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_guidelines_is_active" ON public.leave_guidelines USING btree (is_active);


--
-- Name: IDX_leave_guidelines_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_guidelines_organization_id" ON public.leave_guidelines USING btree (organization_id);


--
-- Name: IDX_leave_guidelines_sort_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_guidelines_sort_order" ON public.leave_guidelines USING btree (sort_order);


--
-- Name: IDX_leave_request_events_request_id_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_request_events_request_id_created_at" ON public.leave_request_events USING btree (request_id, created_at);


--
-- Name: IDX_leave_requests_approver_id_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_requests_approver_id_status" ON public.leave_requests USING btree (approver_id, status);


--
-- Name: IDX_leave_requests_balance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_requests_balance_id" ON public.leave_requests USING btree (balance_id);


--
-- Name: IDX_leave_requests_decided_by; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_requests_decided_by" ON public.leave_requests USING btree (decided_by);


--
-- Name: IDX_leave_requests_leave_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_requests_leave_type_id" ON public.leave_requests USING btree (leave_type_id);


--
-- Name: IDX_leave_requests_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_requests_organization_id" ON public.leave_requests USING btree (organization_id);


--
-- Name: IDX_leave_requests_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_requests_status" ON public.leave_requests USING btree (status);


--
-- Name: IDX_leave_requests_user_id_dates; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_requests_user_id_dates" ON public.leave_requests USING btree (user_id, from_date, to_date);


--
-- Name: IDX_leave_type_policies_leave_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_type_policies_leave_type_id" ON public.leave_type_policies USING btree (leave_type_id);


--
-- Name: IDX_leave_type_policies_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_type_policies_organization_id" ON public.leave_type_policies USING btree (organization_id);


--
-- Name: IDX_leave_types_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_types_is_active" ON public.leave_types USING btree (is_active);


--
-- Name: IDX_leave_types_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_leave_types_organization_id" ON public.leave_types USING btree (organization_id);


--
-- Name: IDX_master_items_org_type_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_master_items_org_type_active" ON public.master_items USING btree (organization_id, master_type_id, is_active);


--
-- Name: IDX_offer_letter_attachments_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_offer_letter_attachments_file_id" ON public.offer_letter_attachments USING btree (file_id);


--
-- Name: IDX_offer_letter_templates_org_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_offer_letter_templates_org_active" ON public.offer_letter_templates USING btree (organization_id, is_active);


--
-- Name: IDX_offer_letters_candidate_sent_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_offer_letters_candidate_sent_at" ON public.offer_letters USING btree (candidate_id, sent_at);


--
-- Name: IDX_onboarding_candidate_events_candidate; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_onboarding_candidate_events_candidate" ON public.onboarding_candidate_events USING btree (candidate_id, created_at);


--
-- Name: IDX_onboarding_candidate_stages_candidate; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_onboarding_candidate_stages_candidate" ON public.onboarding_candidate_stages USING btree (candidate_id, entered_at);


--
-- Name: IDX_onboarding_stages_workflow_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_onboarding_stages_workflow_sort" ON public.onboarding_stages USING btree (workflow_id, sort_order);


--
-- Name: IDX_organization_currencies_currency_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_organization_currencies_currency_id" ON public.organization_currencies USING btree (currency_id);


--
-- Name: IDX_organizations_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_organizations_name" ON public.organizations USING btree (name);


--
-- Name: IDX_organizations_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_organizations_status" ON public.organizations USING btree (status);


--
-- Name: IDX_otp_logs_expires_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_otp_logs_expires_at" ON public.otp_logs USING btree (expires_at);


--
-- Name: IDX_otp_logs_is_verified; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_otp_logs_is_verified" ON public.otp_logs USING btree (is_verified);


--
-- Name: IDX_otp_logs_mobile_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_otp_logs_mobile_number" ON public.otp_logs USING btree (mobile_number);


--
-- Name: IDX_password_reset_tokens_expires_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_password_reset_tokens_expires_at" ON public.password_reset_tokens USING btree (expires_at);


--
-- Name: IDX_password_reset_tokens_token_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_password_reset_tokens_token_hash" ON public.password_reset_tokens USING btree (token_hash);


--
-- Name: IDX_password_reset_tokens_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_password_reset_tokens_user_id" ON public.password_reset_tokens USING btree (user_id);


--
-- Name: IDX_permissions_action; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_permissions_action" ON public.permissions USING btree (action);


--
-- Name: IDX_permissions_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_permissions_code" ON public.permissions USING btree (code);


--
-- Name: IDX_permissions_module; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_permissions_module" ON public.permissions USING btree (module);


--
-- Name: IDX_permissions_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_permissions_name" ON public.permissions USING btree (name);


--
-- Name: IDX_permissions_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_permissions_status" ON public.permissions USING btree (status);


--
-- Name: IDX_policy_info_org_active_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_policy_info_org_active_sort" ON public.policy_info USING btree (organization_id, is_active, sort_order);


--
-- Name: IDX_profile_change_requests_employee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_profile_change_requests_employee_id" ON public.profile_change_requests USING btree (employee_id);


--
-- Name: IDX_profile_change_requests_org_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_profile_change_requests_org_status" ON public.profile_change_requests USING btree (organization_id, status);


--
-- Name: IDX_role_permissions_permission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_role_permissions_permission_id" ON public.role_permissions USING btree (permission_id);


--
-- Name: IDX_role_permissions_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_role_permissions_role_id" ON public.role_permissions USING btree (role_id);


--
-- Name: IDX_roles_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_roles_name" ON public.roles USING btree (name);


--
-- Name: IDX_roles_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_roles_organization_id" ON public.roles USING btree (organization_id);


--
-- Name: IDX_roles_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_roles_slug" ON public.roles USING btree (slug);


--
-- Name: IDX_roles_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_roles_status" ON public.roles USING btree (status);


--
-- Name: IDX_salary_structures_org_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_salary_structures_org_active" ON public.salary_structures USING btree (organization_id, is_active);


--
-- Name: IDX_states_country_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_states_country_active" ON public.states USING btree (country_id, is_active);


--
-- Name: IDX_user_addresses_city_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_addresses_city_type_id" ON public.user_addresses USING btree (city_type_id);


--
-- Name: IDX_user_addresses_current_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_addresses_current_city_id" ON public.user_addresses USING btree (current_city_id);


--
-- Name: IDX_user_addresses_permanent_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_addresses_permanent_city_id" ON public.user_addresses USING btree (permanent_city_id);


--
-- Name: IDX_user_family_details_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_family_details_user_id" ON public.user_family_details USING btree (user_id);


--
-- Name: IDX_user_module_access_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_module_access_group_id" ON public.user_module_access USING btree (data_permission_group_id);


--
-- Name: IDX_user_module_access_menu_ids; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_module_access_menu_ids" ON public.user_module_access USING gin (menu_ids);


--
-- Name: IDX_user_module_access_org_app; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_module_access_org_app" ON public.user_module_access USING btree (organization_id, app_id);


--
-- Name: IDX_user_personal_details_blood_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_personal_details_blood_group_id" ON public.user_personal_details USING btree (blood_group_id);


--
-- Name: IDX_user_personal_details_full_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_personal_details_full_name" ON public.user_personal_details USING btree (full_name);


--
-- Name: IDX_user_personal_details_gender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_personal_details_gender_id" ON public.user_personal_details USING btree (gender_id);


--
-- Name: IDX_user_personal_details_marital_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_personal_details_marital_status_id" ON public.user_personal_details USING btree (marital_status_id);


--
-- Name: IDX_user_personal_details_religion_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_personal_details_religion_id" ON public.user_personal_details USING btree (religion_id);


--
-- Name: IDX_user_previous_experiences_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_previous_experiences_user_id" ON public.user_previous_experiences USING btree (user_id);


--
-- Name: IDX_user_qualifications_diploma_degree_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_qualifications_diploma_degree_id" ON public.user_qualifications USING btree (diploma_degree_id);


--
-- Name: IDX_user_qualifications_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_qualifications_user_id" ON public.user_qualifications USING btree (user_id);


--
-- Name: IDX_user_sessions_device_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_sessions_device_id" ON public.user_sessions USING btree (device_id);


--
-- Name: IDX_user_sessions_expires_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_sessions_expires_at" ON public.user_sessions USING btree (expires_at);


--
-- Name: IDX_user_sessions_is_revoked; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_sessions_is_revoked" ON public.user_sessions USING btree (is_revoked);


--
-- Name: IDX_user_sessions_last_activity; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_sessions_last_activity" ON public.user_sessions USING btree (last_activity);


--
-- Name: IDX_user_sessions_refresh_token_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_user_sessions_refresh_token_hash" ON public.user_sessions USING btree (refresh_token_hash);


--
-- Name: IDX_user_sessions_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_sessions_user_id" ON public.user_sessions USING btree (user_id);


--
-- Name: IDX_user_work_details_branch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_branch_id" ON public.user_work_details USING btree (branch_id);


--
-- Name: IDX_user_work_details_department; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_department" ON public.user_work_details USING btree (department);


--
-- Name: IDX_user_work_details_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_department_id" ON public.user_work_details USING btree (department_id);


--
-- Name: IDX_user_work_details_designation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_designation_id" ON public.user_work_details USING btree (designation_id);


--
-- Name: IDX_user_work_details_employee_code_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_user_work_details_employee_code_unique" ON public.user_work_details USING btree (lower((employee_code)::text)) WHERE ((deleted_at IS NULL) AND (employee_code IS NOT NULL));


--
-- Name: IDX_user_work_details_employee_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_employee_status" ON public.user_work_details USING btree (employee_status);


--
-- Name: IDX_user_work_details_employee_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_employee_status_id" ON public.user_work_details USING btree (employee_status_id);


--
-- Name: IDX_user_work_details_employee_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_employee_type_id" ON public.user_work_details USING btree (employee_type_id);


--
-- Name: IDX_user_work_details_employment_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_employment_type_id" ON public.user_work_details USING btree (employment_type_id);


--
-- Name: IDX_user_work_details_entity_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_entity_id" ON public.user_work_details USING btree (entity_id);


--
-- Name: IDX_user_work_details_functional_head_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_functional_head_id" ON public.user_work_details USING btree (functional_head_id);


--
-- Name: IDX_user_work_details_hrbp_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_hrbp_id" ON public.user_work_details USING btree (hrbp_id);


--
-- Name: IDX_user_work_details_payroll_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_payroll_type_id" ON public.user_work_details USING btree (payroll_type_id);


--
-- Name: IDX_user_work_details_reporting_manager_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_reporting_manager_id" ON public.user_work_details USING btree (reporting_manager_id);


--
-- Name: IDX_user_work_details_sub_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_user_work_details_sub_department_id" ON public.user_work_details USING btree (sub_department_id);


--
-- Name: IDX_users_email_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_users_email_unique" ON public.users USING btree (lower((email)::text)) WHERE (deleted_at IS NULL);


--
-- Name: IDX_users_mobile_number_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "IDX_users_mobile_number_unique" ON public.users USING btree (mobile_number) WHERE ((mobile_number IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: IDX_users_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_users_organization_id" ON public.users USING btree (organization_id);


--
-- Name: IDX_users_profile_picture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_users_profile_picture_id" ON public.users USING btree (profile_picture_id);


--
-- Name: IDX_users_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_users_role_id" ON public.users USING btree (role_id);


--
-- Name: IDX_users_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_users_status" ON public.users USING btree (status);


--
-- Name: UQ_banks_ifsc_prefix; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_banks_ifsc_prefix" ON public.banks USING btree (ifsc_prefix);


--
-- Name: UQ_banks_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_banks_name" ON public.banks USING btree (lower((name)::text));


--
-- Name: UQ_branches_org_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_branches_org_code" ON public.branches USING btree (organization_id, code) WHERE (code IS NOT NULL);


--
-- Name: UQ_branches_org_head_office; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_branches_org_head_office" ON public.branches USING btree (organization_id) WHERE (is_head_office = true);


--
-- Name: UQ_branches_org_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_branches_org_name" ON public.branches USING btree (organization_id, lower((name)::text));


--
-- Name: UQ_candidates_org_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_candidates_org_email" ON public.candidates USING btree (organization_id, lower((email)::text)) WHERE (deleted_at IS NULL);


--
-- Name: UQ_candidates_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_candidates_user_id" ON public.candidates USING btree (user_id) WHERE (user_id IS NOT NULL);


--
-- Name: UQ_cities_state_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_cities_state_name" ON public.cities USING btree (state_id, lower((name)::text));


--
-- Name: UQ_countries_iso_code_2; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_countries_iso_code_2" ON public.countries USING btree (iso_code_2);


--
-- Name: UQ_countries_iso_code_3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_countries_iso_code_3" ON public.countries USING btree (iso_code_3);


--
-- Name: UQ_countries_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_countries_name" ON public.countries USING btree (lower((name)::text));


--
-- Name: UQ_currencies_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_currencies_code" ON public.currencies USING btree (code) WHERE (deleted_at IS NULL);


--
-- Name: UQ_currencies_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_currencies_name" ON public.currencies USING btree (lower((name)::text)) WHERE (deleted_at IS NULL);


--
-- Name: UQ_data_permission_groups_org_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_data_permission_groups_org_name" ON public.data_permission_groups USING btree (organization_id, lower((name)::text));


--
-- Name: UQ_data_permission_groups_org_system; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_data_permission_groups_org_system" ON public.data_permission_groups USING btree (organization_id) WHERE (is_system = true);


--
-- Name: UQ_departments_org_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_departments_org_code" ON public.departments USING btree (organization_id, code) WHERE (code IS NOT NULL);


--
-- Name: UQ_departments_org_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_departments_org_name" ON public.departments USING btree (organization_id, lower((name)::text));


--
-- Name: UQ_designations_org_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_designations_org_code" ON public.designations USING btree (organization_id, code) WHERE (code IS NOT NULL);


--
-- Name: UQ_designations_org_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_designations_org_name" ON public.designations USING btree (organization_id, lower((name)::text));


--
-- Name: UQ_entities_org_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_entities_org_code" ON public.entities USING btree (organization_id, code) WHERE (code IS NOT NULL);


--
-- Name: UQ_entities_org_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_entities_org_name" ON public.entities USING btree (organization_id, lower((name)::text));


--
-- Name: UQ_expense_policy_documents_org_title; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_expense_policy_documents_org_title" ON public.expense_policy_documents USING btree (organization_id, lower((title)::text)) WHERE (deleted_at IS NULL);


--
-- Name: UQ_holidays_organization_date_location_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_holidays_organization_date_location_active" ON public.holidays USING btree (organization_id, date, location) WHERE (deleted_at IS NULL);


--
-- Name: UQ_leave_balances_user_type_status_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_leave_balances_user_type_status_active" ON public.leave_balances USING btree (user_id, leave_type_id, employment_status) NULLS NOT DISTINCT WHERE ((quota_period = 'STATUS_PERIOD'::public.leave_type_policies_quota_period_enum) AND (deleted_at IS NULL));


--
-- Name: UQ_leave_balances_user_type_year_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_leave_balances_user_type_year_active" ON public.leave_balances USING btree (user_id, leave_type_id, cycle_year) WHERE ((quota_period = 'YEARLY'::public.leave_type_policies_quota_period_enum) AND (deleted_at IS NULL));


--
-- Name: UQ_leave_settings_organization_id_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_leave_settings_organization_id_active" ON public.leave_settings USING btree (organization_id) WHERE (deleted_at IS NULL);


--
-- Name: UQ_leave_type_policies_combination_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_leave_type_policies_combination_active" ON public.leave_type_policies USING btree (leave_type_id, employee_type, employment_status) NULLS NOT DISTINCT WHERE (deleted_at IS NULL);


--
-- Name: UQ_leave_types_organization_code_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_leave_types_organization_code_active" ON public.leave_types USING btree (organization_id, lower((code)::text)) WHERE (deleted_at IS NULL);


--
-- Name: UQ_master_items_org_type_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_master_items_org_type_name" ON public.master_items USING btree (organization_id, master_type_id, lower((name)::text));


--
-- Name: UQ_master_types_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_master_types_code" ON public.master_types USING btree (code);


--
-- Name: UQ_offer_letter_templates_org_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_offer_letter_templates_org_code" ON public.offer_letter_templates USING btree (organization_id, code) WHERE (code IS NOT NULL);


--
-- Name: UQ_offer_letter_templates_org_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_offer_letter_templates_org_name" ON public.offer_letter_templates USING btree (organization_id, lower((name)::text));


--
-- Name: UQ_offer_letters_response_token_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_offer_letters_response_token_hash" ON public.offer_letters USING btree (response_token_hash) WHERE (response_token_hash IS NOT NULL);


--
-- Name: UQ_onboarding_candidate_stages_open; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_onboarding_candidate_stages_open" ON public.onboarding_candidate_stages USING btree (candidate_id) WHERE (completed_at IS NULL);


--
-- Name: UQ_onboarding_workflows_org_default; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_onboarding_workflows_org_default" ON public.onboarding_workflows USING btree (organization_id) WHERE (is_default AND (deleted_at IS NULL));


--
-- Name: UQ_organizations_slug_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_organizations_slug_active" ON public.organizations USING btree (lower((slug)::text)) WHERE (deleted_at IS NULL);


--
-- Name: UQ_permissions_code_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_permissions_code_active" ON public.permissions USING btree (lower((code)::text)) WHERE (deleted_at IS NULL);


--
-- Name: UQ_policy_info_org_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_policy_info_org_code" ON public.policy_info USING btree (organization_id, code);


--
-- Name: UQ_roles_organization_slug_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_roles_organization_slug_active" ON public.roles USING btree (organization_id, lower((slug)::text)) WHERE (deleted_at IS NULL);


--
-- Name: UQ_salary_structures_org_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_salary_structures_org_code" ON public.salary_structures USING btree (organization_id, code) WHERE (code IS NOT NULL);


--
-- Name: UQ_salary_structures_org_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_salary_structures_org_name" ON public.salary_structures USING btree (organization_id, lower((name)::text));


--
-- Name: UQ_states_country_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_states_country_code" ON public.states USING btree (country_id, code) WHERE (code IS NOT NULL);


--
-- Name: UQ_states_country_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_states_country_name" ON public.states USING btree (country_id, lower((name)::text));


--
-- Name: UQ_user_module_access_user_app; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "UQ_user_module_access_user_app" ON public.user_module_access USING btree (user_id, app_id);


--
-- Name: access_audit_logs FK_access_audit_logs_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.access_audit_logs
    ADD CONSTRAINT "FK_access_audit_logs_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: app_menus FK_app_menus_app_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_menus
    ADD CONSTRAINT "FK_app_menus_app_id" FOREIGN KEY (app_id) REFERENCES public.app_modules(app_id) ON DELETE RESTRICT;


--
-- Name: app_menus FK_app_menus_parent; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_menus
    ADD CONSTRAINT "FK_app_menus_parent" FOREIGN KEY (parent_id, app_id) REFERENCES public.app_menus(menu_id, app_id) ON DELETE RESTRICT;


--
-- Name: branches FK_branches_country_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT "FK_branches_country_id" FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE RESTRICT;


--
-- Name: branches FK_branches_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT "FK_branches_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: branches FK_branches_state_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT "FK_branches_state_id" FOREIGN KEY (state_id) REFERENCES public.states(id) ON DELETE RESTRICT;


--
-- Name: candidate_portal_links FK_candidate_portal_links_candidate_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidate_portal_links
    ADD CONSTRAINT "FK_candidate_portal_links_candidate_id" FOREIGN KEY (candidate_id) REFERENCES public.candidates(id) ON DELETE CASCADE;


--
-- Name: candidate_portal_links FK_candidate_portal_links_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidate_portal_links
    ADD CONSTRAINT "FK_candidate_portal_links_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: candidate_portal_links FK_candidate_portal_links_stage_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidate_portal_links
    ADD CONSTRAINT "FK_candidate_portal_links_stage_id" FOREIGN KEY (stage_id) REFERENCES public.onboarding_stages(id) ON DELETE RESTRICT;


--
-- Name: candidates FK_candidates_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_branch_id" FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON DELETE RESTRICT;


--
-- Name: candidates FK_candidates_current_stage_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_current_stage_id" FOREIGN KEY (current_stage_id) REFERENCES public.onboarding_stages(id) ON DELETE RESTRICT;


--
-- Name: candidates FK_candidates_department_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_department_id" FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE RESTRICT;


--
-- Name: candidates FK_candidates_designation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_designation_id" FOREIGN KEY (designation_id) REFERENCES public.designations(id) ON DELETE RESTRICT;


--
-- Name: candidates FK_candidates_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_entity_id" FOREIGN KEY (entity_id) REFERENCES public.entities(id) ON DELETE RESTRICT;


--
-- Name: candidates FK_candidates_gender_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_gender_id_organization_id" FOREIGN KEY (gender_id, organization_id) REFERENCES public.master_items(id, organization_id) ON DELETE RESTRICT;


--
-- Name: candidates FK_candidates_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: candidates FK_candidates_reporting_manager_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_reporting_manager_id" FOREIGN KEY (reporting_manager_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: candidates FK_candidates_salary_structure_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_salary_structure_id_organization_id" FOREIGN KEY (salary_structure_id, organization_id) REFERENCES public.salary_structures(id, organization_id) ON DELETE RESTRICT;


--
-- Name: candidates FK_candidates_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: candidates FK_candidates_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT "FK_candidates_workflow_id" FOREIGN KEY (workflow_id) REFERENCES public.onboarding_workflows(id) ON DELETE RESTRICT;


--
-- Name: cities FK_cities_state_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT "FK_cities_state_id" FOREIGN KEY (state_id) REFERENCES public.states(id) ON DELETE RESTRICT;


--
-- Name: data_permission_groups FK_data_permission_groups_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.data_permission_groups
    ADD CONSTRAINT "FK_data_permission_groups_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: departments FK_departments_head_employee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT "FK_departments_head_employee" FOREIGN KEY (head_employee_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE RESTRICT;


--
-- Name: departments FK_departments_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT "FK_departments_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: departments FK_departments_parent_department; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT "FK_departments_parent_department" FOREIGN KEY (parent_department_id, organization_id) REFERENCES public.departments(id, organization_id) ON DELETE RESTRICT;


--
-- Name: designations FK_designations_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designations
    ADD CONSTRAINT "FK_designations_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: entities FK_entities_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entities
    ADD CONSTRAINT "FK_entities_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: expense_policy_documents FK_expense_policy_documents_category_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_policy_documents
    ADD CONSTRAINT "FK_expense_policy_documents_category_id_organization_id" FOREIGN KEY (category_id, organization_id) REFERENCES public.master_items(id, organization_id) ON DELETE RESTRICT;


--
-- Name: expense_policy_documents FK_expense_policy_documents_file_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_policy_documents
    ADD CONSTRAINT "FK_expense_policy_documents_file_id_organization_id" FOREIGN KEY (file_id, organization_id) REFERENCES public.files(id, organization_id) ON DELETE RESTRICT;


--
-- Name: expense_policy_documents FK_expense_policy_documents_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_policy_documents
    ADD CONSTRAINT "FK_expense_policy_documents_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: expense_request_events FK_expense_request_events_actor_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_events
    ADD CONSTRAINT "FK_expense_request_events_actor_id_organization_id" FOREIGN KEY (actor_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE SET NULL (actor_id);


--
-- Name: expense_request_events FK_expense_request_events_request_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_events
    ADD CONSTRAINT "FK_expense_request_events_request_id_organization_id" FOREIGN KEY (request_id, organization_id) REFERENCES public.expense_requests(id, organization_id) ON DELETE CASCADE;


--
-- Name: expense_request_item_receipts FK_expense_request_item_receipts_file_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_item_receipts
    ADD CONSTRAINT "FK_expense_request_item_receipts_file_id_organization_id" FOREIGN KEY (file_id, organization_id) REFERENCES public.files(id, organization_id) ON DELETE RESTRICT;


--
-- Name: expense_request_item_receipts FK_expense_request_item_receipts_item_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_item_receipts
    ADD CONSTRAINT "FK_expense_request_item_receipts_item_id_organization_id" FOREIGN KEY (item_id, organization_id) REFERENCES public.expense_request_items(id, organization_id) ON DELETE CASCADE;


--
-- Name: expense_request_items FK_expense_request_items_category_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_items
    ADD CONSTRAINT "FK_expense_request_items_category_id_organization_id" FOREIGN KEY (category_id, organization_id) REFERENCES public.master_items(id, organization_id) ON DELETE RESTRICT;


--
-- Name: expense_request_items FK_expense_request_items_request_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_request_items
    ADD CONSTRAINT "FK_expense_request_items_request_id_organization_id" FOREIGN KEY (request_id, organization_id) REFERENCES public.expense_requests(id, organization_id) ON DELETE CASCADE;


--
-- Name: expense_requests FK_expense_requests_approver_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_requests
    ADD CONSTRAINT "FK_expense_requests_approver_id_organization_id" FOREIGN KEY (approver_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE SET NULL (approver_id);


--
-- Name: expense_requests FK_expense_requests_base_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_requests
    ADD CONSTRAINT "FK_expense_requests_base_currency_id" FOREIGN KEY (base_currency_id) REFERENCES public.currencies(id) ON DELETE RESTRICT;


--
-- Name: expense_requests FK_expense_requests_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_requests
    ADD CONSTRAINT "FK_expense_requests_currency_id" FOREIGN KEY (currency_id) REFERENCES public.currencies(id) ON DELETE RESTRICT;


--
-- Name: expense_requests FK_expense_requests_decided_by_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_requests
    ADD CONSTRAINT "FK_expense_requests_decided_by_organization_id" FOREIGN KEY (decided_by, organization_id) REFERENCES public.users(id, organization_id) ON DELETE SET NULL (decided_by);


--
-- Name: expense_requests FK_expense_requests_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_requests
    ADD CONSTRAINT "FK_expense_requests_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: expense_requests FK_expense_requests_user_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.expense_requests
    ADD CONSTRAINT "FK_expense_requests_user_id_organization_id" FOREIGN KEY (user_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE CASCADE;


--
-- Name: files FK_files_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT "FK_files_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: files FK_files_uploaded_by; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT "FK_files_uploaded_by" FOREIGN KEY (uploaded_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: holidays FK_holidays_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT "FK_holidays_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: leave_balances FK_leave_balances_leave_type_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_balances
    ADD CONSTRAINT "FK_leave_balances_leave_type_id_organization_id" FOREIGN KEY (leave_type_id, organization_id) REFERENCES public.leave_types(id, organization_id) ON DELETE RESTRICT;


--
-- Name: leave_balances FK_leave_balances_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_balances
    ADD CONSTRAINT "FK_leave_balances_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: leave_balances FK_leave_balances_user_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_balances
    ADD CONSTRAINT "FK_leave_balances_user_id_organization_id" FOREIGN KEY (user_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE CASCADE;


--
-- Name: leave_guidelines FK_leave_guidelines_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_guidelines
    ADD CONSTRAINT "FK_leave_guidelines_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: leave_request_events FK_leave_request_events_actor_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_request_events
    ADD CONSTRAINT "FK_leave_request_events_actor_id_organization_id" FOREIGN KEY (actor_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE SET NULL (actor_id);


--
-- Name: leave_request_events FK_leave_request_events_request_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_request_events
    ADD CONSTRAINT "FK_leave_request_events_request_id_organization_id" FOREIGN KEY (request_id, organization_id) REFERENCES public.leave_requests(id, organization_id) ON DELETE CASCADE;


--
-- Name: leave_requests FK_leave_requests_approver_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_requests
    ADD CONSTRAINT "FK_leave_requests_approver_id_organization_id" FOREIGN KEY (approver_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE SET NULL (approver_id);


--
-- Name: leave_requests FK_leave_requests_balance_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_requests
    ADD CONSTRAINT "FK_leave_requests_balance_id_organization_id" FOREIGN KEY (balance_id, organization_id) REFERENCES public.leave_balances(id, organization_id);


--
-- Name: leave_requests FK_leave_requests_decided_by_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_requests
    ADD CONSTRAINT "FK_leave_requests_decided_by_organization_id" FOREIGN KEY (decided_by, organization_id) REFERENCES public.users(id, organization_id) ON DELETE SET NULL (decided_by);


--
-- Name: leave_requests FK_leave_requests_leave_type_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_requests
    ADD CONSTRAINT "FK_leave_requests_leave_type_id_organization_id" FOREIGN KEY (leave_type_id, organization_id) REFERENCES public.leave_types(id, organization_id) ON DELETE RESTRICT;


--
-- Name: leave_requests FK_leave_requests_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_requests
    ADD CONSTRAINT "FK_leave_requests_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: leave_requests FK_leave_requests_user_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_requests
    ADD CONSTRAINT "FK_leave_requests_user_id_organization_id" FOREIGN KEY (user_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE CASCADE;


--
-- Name: leave_settings FK_leave_settings_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_settings
    ADD CONSTRAINT "FK_leave_settings_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: leave_type_policies FK_leave_type_policies_leave_type_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_type_policies
    ADD CONSTRAINT "FK_leave_type_policies_leave_type_id_organization_id" FOREIGN KEY (leave_type_id, organization_id) REFERENCES public.leave_types(id, organization_id) ON DELETE RESTRICT;


--
-- Name: leave_type_policies FK_leave_type_policies_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_type_policies
    ADD CONSTRAINT "FK_leave_type_policies_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: leave_types FK_leave_types_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leave_types
    ADD CONSTRAINT "FK_leave_types_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: master_items FK_master_items_master_type_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_items
    ADD CONSTRAINT "FK_master_items_master_type_code" FOREIGN KEY (master_type_code) REFERENCES public.master_types(code) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: master_items FK_master_items_master_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_items
    ADD CONSTRAINT "FK_master_items_master_type_id" FOREIGN KEY (master_type_id) REFERENCES public.master_types(id) ON DELETE RESTRICT;


--
-- Name: master_items FK_master_items_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.master_items
    ADD CONSTRAINT "FK_master_items_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: offer_letter_attachments FK_offer_letter_attachments_file_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letter_attachments
    ADD CONSTRAINT "FK_offer_letter_attachments_file_id_organization_id" FOREIGN KEY (file_id, organization_id) REFERENCES public.files(id, organization_id) ON DELETE RESTRICT;


--
-- Name: offer_letter_attachments FK_offer_letter_attachments_offer_letter_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letter_attachments
    ADD CONSTRAINT "FK_offer_letter_attachments_offer_letter_id_organization_id" FOREIGN KEY (offer_letter_id, organization_id) REFERENCES public.offer_letters(id, organization_id) ON DELETE CASCADE;


--
-- Name: offer_letter_templates FK_offer_letter_templates_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letter_templates
    ADD CONSTRAINT "FK_offer_letter_templates_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: offer_letters FK_offer_letters_candidate_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letters
    ADD CONSTRAINT "FK_offer_letters_candidate_id" FOREIGN KEY (candidate_id) REFERENCES public.candidates(id) ON DELETE RESTRICT;


--
-- Name: offer_letters FK_offer_letters_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letters
    ADD CONSTRAINT "FK_offer_letters_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: offer_letters FK_offer_letters_pdf_file_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letters
    ADD CONSTRAINT "FK_offer_letters_pdf_file_id_organization_id" FOREIGN KEY (pdf_file_id, organization_id) REFERENCES public.files(id, organization_id) ON DELETE RESTRICT;


--
-- Name: offer_letters FK_offer_letters_sent_by_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letters
    ADD CONSTRAINT "FK_offer_letters_sent_by_user_id" FOREIGN KEY (sent_by_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: offer_letters FK_offer_letters_stage_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letters
    ADD CONSTRAINT "FK_offer_letters_stage_id" FOREIGN KEY (stage_id) REFERENCES public.onboarding_stages(id) ON DELETE RESTRICT;


--
-- Name: offer_letters FK_offer_letters_template_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.offer_letters
    ADD CONSTRAINT "FK_offer_letters_template_id_organization_id" FOREIGN KEY (template_id, organization_id) REFERENCES public.offer_letter_templates(id, organization_id) ON DELETE RESTRICT;


--
-- Name: onboarding_candidate_events FK_onboarding_candidate_events_candidate_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_candidate_events
    ADD CONSTRAINT "FK_onboarding_candidate_events_candidate_id" FOREIGN KEY (candidate_id) REFERENCES public.candidates(id) ON DELETE CASCADE;


--
-- Name: onboarding_candidate_events FK_onboarding_candidate_events_from_stage_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_candidate_events
    ADD CONSTRAINT "FK_onboarding_candidate_events_from_stage_id" FOREIGN KEY (from_stage_id) REFERENCES public.onboarding_stages(id) ON DELETE SET NULL;


--
-- Name: onboarding_candidate_events FK_onboarding_candidate_events_to_stage_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_candidate_events
    ADD CONSTRAINT "FK_onboarding_candidate_events_to_stage_id" FOREIGN KEY (to_stage_id) REFERENCES public.onboarding_stages(id) ON DELETE SET NULL;


--
-- Name: onboarding_candidate_stages FK_onboarding_candidate_stages_candidate_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_candidate_stages
    ADD CONSTRAINT "FK_onboarding_candidate_stages_candidate_id" FOREIGN KEY (candidate_id) REFERENCES public.candidates(id) ON DELETE CASCADE;


--
-- Name: onboarding_candidate_stages FK_onboarding_candidate_stages_stage_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_candidate_stages
    ADD CONSTRAINT "FK_onboarding_candidate_stages_stage_id" FOREIGN KEY (stage_id) REFERENCES public.onboarding_stages(id) ON DELETE RESTRICT;


--
-- Name: onboarding_stages FK_onboarding_stages_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_stages
    ADD CONSTRAINT "FK_onboarding_stages_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: onboarding_stages FK_onboarding_stages_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_stages
    ADD CONSTRAINT "FK_onboarding_stages_workflow_id" FOREIGN KEY (workflow_id) REFERENCES public.onboarding_workflows(id) ON DELETE CASCADE;


--
-- Name: onboarding_workflows FK_onboarding_workflows_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.onboarding_workflows
    ADD CONSTRAINT "FK_onboarding_workflows_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_currencies FK_organization_currencies_currency_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_currencies
    ADD CONSTRAINT "FK_organization_currencies_currency_id" FOREIGN KEY (currency_id) REFERENCES public.currencies(id) ON DELETE RESTRICT;


--
-- Name: organization_currencies FK_organization_currencies_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_currencies
    ADD CONSTRAINT "FK_organization_currencies_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: password_reset_tokens FK_password_reset_tokens_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT "FK_password_reset_tokens_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: policy_info FK_policy_info_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.policy_info
    ADD CONSTRAINT "FK_policy_info_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: profile_change_requests FK_profile_change_requests_employee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profile_change_requests
    ADD CONSTRAINT "FK_profile_change_requests_employee" FOREIGN KEY (employee_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE CASCADE;


--
-- Name: profile_change_requests FK_profile_change_requests_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profile_change_requests
    ADD CONSTRAINT "FK_profile_change_requests_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: profile_change_requests FK_profile_change_requests_reviewed_by; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profile_change_requests
    ADD CONSTRAINT "FK_profile_change_requests_reviewed_by" FOREIGN KEY (reviewed_by, organization_id) REFERENCES public.users(id, organization_id) ON DELETE SET NULL (reviewed_by);


--
-- Name: role_permissions FK_role_permissions_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT "FK_role_permissions_permission_id" FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_permissions FK_role_permissions_role_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT "FK_role_permissions_role_id" FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: roles FK_roles_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT "FK_roles_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: salary_structures FK_salary_structures_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salary_structures
    ADD CONSTRAINT "FK_salary_structures_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: states FK_states_country_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT "FK_states_country_id" FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE RESTRICT;


--
-- Name: user_addresses FK_user_addresses_city_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "FK_user_addresses_city_type_id" FOREIGN KEY (city_type_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_addresses FK_user_addresses_current_city_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "FK_user_addresses_current_city_id" FOREIGN KEY (current_city_id) REFERENCES public.cities(id) ON DELETE RESTRICT;


--
-- Name: user_addresses FK_user_addresses_current_country_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "FK_user_addresses_current_country_id" FOREIGN KEY (current_country_id) REFERENCES public.countries(id) ON DELETE RESTRICT;


--
-- Name: user_addresses FK_user_addresses_current_state_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "FK_user_addresses_current_state_id" FOREIGN KEY (current_state_id) REFERENCES public.states(id) ON DELETE RESTRICT;


--
-- Name: user_addresses FK_user_addresses_permanent_city_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "FK_user_addresses_permanent_city_id" FOREIGN KEY (permanent_city_id) REFERENCES public.cities(id) ON DELETE RESTRICT;


--
-- Name: user_addresses FK_user_addresses_permanent_country_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "FK_user_addresses_permanent_country_id" FOREIGN KEY (permanent_country_id) REFERENCES public.countries(id) ON DELETE RESTRICT;


--
-- Name: user_addresses FK_user_addresses_permanent_state_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "FK_user_addresses_permanent_state_id" FOREIGN KEY (permanent_state_id) REFERENCES public.states(id) ON DELETE RESTRICT;


--
-- Name: user_addresses FK_user_addresses_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_addresses
    ADD CONSTRAINT "FK_user_addresses_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_bank_details FK_user_bank_details_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_bank_details
    ADD CONSTRAINT "FK_user_bank_details_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_emergency_contacts FK_user_emergency_contacts_relationship_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_emergency_contacts
    ADD CONSTRAINT "FK_user_emergency_contacts_relationship_id" FOREIGN KEY (relationship_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_emergency_contacts FK_user_emergency_contacts_secondary_relationship_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_emergency_contacts
    ADD CONSTRAINT "FK_user_emergency_contacts_secondary_relationship_id" FOREIGN KEY (secondary_relationship_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_emergency_contacts FK_user_emergency_contacts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_emergency_contacts
    ADD CONSTRAINT "FK_user_emergency_contacts_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_family_details FK_user_family_details_nominee_relationship_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_family_details
    ADD CONSTRAINT "FK_user_family_details_nominee_relationship_id" FOREIGN KEY (nominee_relationship_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_family_details FK_user_family_details_relationship_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_family_details
    ADD CONSTRAINT "FK_user_family_details_relationship_id" FOREIGN KEY (relationship_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_family_details FK_user_family_details_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_family_details
    ADD CONSTRAINT "FK_user_family_details_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_module_access FK_user_module_access_app_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_module_access
    ADD CONSTRAINT "FK_user_module_access_app_id" FOREIGN KEY (app_id) REFERENCES public.app_modules(app_id) ON DELETE RESTRICT;


--
-- Name: user_module_access FK_user_module_access_group; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_module_access
    ADD CONSTRAINT "FK_user_module_access_group" FOREIGN KEY (data_permission_group_id, organization_id) REFERENCES public.data_permission_groups(id, organization_id) ON DELETE RESTRICT;


--
-- Name: user_module_access FK_user_module_access_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_module_access
    ADD CONSTRAINT "FK_user_module_access_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: user_module_access FK_user_module_access_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_module_access
    ADD CONSTRAINT "FK_user_module_access_user" FOREIGN KEY (user_id, organization_id) REFERENCES public.users(id, organization_id) ON DELETE CASCADE;


--
-- Name: user_personal_details FK_user_personal_details_blood_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_personal_details
    ADD CONSTRAINT "FK_user_personal_details_blood_group_id" FOREIGN KEY (blood_group_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_personal_details FK_user_personal_details_gender_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_personal_details
    ADD CONSTRAINT "FK_user_personal_details_gender_id" FOREIGN KEY (gender_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_personal_details FK_user_personal_details_marital_status_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_personal_details
    ADD CONSTRAINT "FK_user_personal_details_marital_status_id" FOREIGN KEY (marital_status_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_personal_details FK_user_personal_details_nationality_country_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_personal_details
    ADD CONSTRAINT "FK_user_personal_details_nationality_country_id" FOREIGN KEY (nationality_country_id) REFERENCES public.countries(id) ON DELETE RESTRICT;


--
-- Name: user_personal_details FK_user_personal_details_religion_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_personal_details
    ADD CONSTRAINT "FK_user_personal_details_religion_id" FOREIGN KEY (religion_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_personal_details FK_user_personal_details_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_personal_details
    ADD CONSTRAINT "FK_user_personal_details_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_previous_experiences FK_user_previous_experiences_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_previous_experiences
    ADD CONSTRAINT "FK_user_previous_experiences_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_qualifications FK_user_qualifications_diploma_degree_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_qualifications
    ADD CONSTRAINT "FK_user_qualifications_diploma_degree_id" FOREIGN KEY (diploma_degree_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_qualifications FK_user_qualifications_qualification_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_qualifications
    ADD CONSTRAINT "FK_user_qualifications_qualification_id" FOREIGN KEY (qualification_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_qualifications FK_user_qualifications_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_qualifications
    ADD CONSTRAINT "FK_user_qualifications_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_sessions FK_user_sessions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT "FK_user_sessions_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_work_details FK_user_work_details_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_branch_id" FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_cost_center_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_cost_center_id" FOREIGN KEY (cost_center_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_department_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_department_id" FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_designation_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_designation_id" FOREIGN KEY (designation_id) REFERENCES public.designations(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_employee_status_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_employee_status_id" FOREIGN KEY (employee_status_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_employee_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_employee_type_id" FOREIGN KEY (employee_type_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_employment_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_employment_type_id" FOREIGN KEY (employment_type_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_entity_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_entity_id" FOREIGN KEY (entity_id) REFERENCES public.entities(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_functional_head_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_functional_head_id" FOREIGN KEY (functional_head_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: user_work_details FK_user_work_details_grade_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_grade_id" FOREIGN KEY (grade_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_hiring_source_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_hiring_source_id" FOREIGN KEY (hiring_source_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_hrbp_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_hrbp_id" FOREIGN KEY (hrbp_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: user_work_details FK_user_work_details_location_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_location_type_id" FOREIGN KEY (location_type_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_payroll_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_payroll_type_id" FOREIGN KEY (payroll_type_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_reporting_manager_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_reporting_manager_id" FOREIGN KEY (reporting_manager_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: user_work_details FK_user_work_details_sub_department_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_sub_department_id" FOREIGN KEY (sub_department_id) REFERENCES public.departments(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_work_details FK_user_work_details_verification_source_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_verification_source_id" FOREIGN KEY (verification_source_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: user_work_details FK_user_work_details_zone_item_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_work_details
    ADD CONSTRAINT "FK_user_work_details_zone_item_id" FOREIGN KEY (zone_item_id) REFERENCES public.master_items(id) ON DELETE RESTRICT;


--
-- Name: users FK_users_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_users_organization_id" FOREIGN KEY (organization_id) REFERENCES public.organizations(id) ON DELETE RESTRICT;


--
-- Name: users FK_users_profile_picture_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_users_profile_picture_id_organization_id" FOREIGN KEY (profile_picture_id, organization_id) REFERENCES public.files(id, organization_id);


--
-- Name: users FK_users_role_id_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_users_role_id_organization_id" FOREIGN KEY (role_id, organization_id) REFERENCES public.roles(id, organization_id) ON DELETE SET NULL (role_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 60SV49FSh8fRT8C2kVHqIYFVwMBbgtgeh4jwQEg5M2w1TopuW8IDeCXt6TcVYdt

