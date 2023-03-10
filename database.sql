/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.6.84
 Source Server Type    : PostgreSQL
 Source Server Version : 110010
 Source Host           : 192.168.6.84:5432
 Source Catalog        : app_platform
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110010
 File Encoding         : 65001

 Date: 15/12/2022 17:50:02
*/


-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_lock_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_lock_index_seq";
CREATE SEQUENCE "public"."migrations_lock_index_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permissions_id_seq";
CREATE SEQUENCE "public"."permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_permissions_id_seq";
CREATE SEQUENCE "public"."role_permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."roles_id_seq";
CREATE SEQUENCE "public"."roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "batch" int4,
  "migration_time" timestamptz(6)
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (1, '20220609064429_create_roles_table.js', 1, '2022-12-07 11:37:16.977+07');
INSERT INTO "public"."migrations" VALUES (2, '20220609064908_create_users_table.js', 1, '2022-12-07 11:37:17.304+07');
INSERT INTO "public"."migrations" VALUES (3, '20220609072939_create_permissions_table.js', 1, '2022-12-07 11:37:17.481+07');
INSERT INTO "public"."migrations" VALUES (4, '20220609073000_create_role_permissions_table.js', 1, '2022-12-07 11:37:17.733+07');
INSERT INTO "public"."migrations" VALUES (5, '20221213024147_add_col_code_to_role.js', 2, '2022-12-13 16:29:21.353+07');
INSERT INTO "public"."migrations" VALUES (6, '20221213024556_add_col_code_to_used.js', 2, '2022-12-13 16:29:21.436+07');

-- ----------------------------
-- Table structure for migrations_lock
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations_lock";
CREATE TABLE "public"."migrations_lock" (
  "index" int4 NOT NULL DEFAULT nextval('migrations_lock_index_seq'::regclass),
  "is_locked" int4
)
;

-- ----------------------------
-- Records of migrations_lock
-- ----------------------------
INSERT INTO "public"."migrations_lock" VALUES (1, 0);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."permissions";
CREATE TABLE "public"."permissions" (
  "id" int4 NOT NULL DEFAULT nextval('permissions_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "value" int4 DEFAULT 0,
  "key" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4
)
;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO "public"."permissions" VALUES (1, 'root', 'root', 15, 'root', '2022-12-13 16:29:53.270446+07', '2022-12-13 16:29:53.270446+07', NULL);
INSERT INTO "public"."permissions" VALUES (2, 'users', 'users', 15, 'users', '2022-12-13 16:29:53.270446+07', '2022-12-13 16:29:53.270446+07', NULL);
INSERT INTO "public"."permissions" VALUES (3, 'roles', 'roles', 15, 'roles', '2022-12-13 16:29:53.270446+07', '2022-12-13 16:29:53.270446+07', NULL);
INSERT INTO "public"."permissions" VALUES (4, 'adminDecentralization', 'adminDecentralization', 2, 'adminDecentralization', '2022-12-13 16:29:53.270446+07', '2022-12-13 16:29:53.270446+07', NULL);
INSERT INTO "public"."permissions" VALUES (5, 'dashboard', 'dashboard', 1, 'dashboard', '2022-12-13 16:29:53.270446+07', '2022-12-13 16:29:53.270446+07', NULL);

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_permissions";
CREATE TABLE "public"."role_permissions" (
  "id" int4 NOT NULL DEFAULT nextval('role_permissions_id_seq'::regclass),
  "roleId" int4 NOT NULL,
  "permissionId" int4,
  "value" int4 DEFAULT 0,
  "key" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4
)
;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------
INSERT INTO "public"."role_permissions" VALUES (1, 1, 1, 15, 'root', '2022-12-13 16:29:53.288639+07', NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
  "id" int4 NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "parentId" int4,
  "key" varchar(255) COLLATE "pg_catalog"."default",
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4,
  "updatedBy" int4,
  "code" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."roles"."code" IS 'code generated from id';

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles" VALUES (1, 'Root', 'Root', NULL, 'root', '2022-12-13 16:29:53.230593+07', '2022-12-13 16:29:53.230593+07', NULL, NULL, '5c5652e878449245a480bb2ded80fadd');
INSERT INTO "public"."roles" VALUES (2, 'Islam admin', 'Permission admin roles system', 1, 'islam_admin', '2022-12-15 13:17:56.786316+07', '2022-12-15 13:17:56.786316+07', 1, 1, '5a52a09382ba69e234694a3d08f05688');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "username" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "firstName" varchar(255) COLLATE "pg_catalog"."default",
  "lastName" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "roleId" int4,
  "createdAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "updatedAt" timestamptz(6) DEFAULT CURRENT_TIMESTAMP,
  "createdBy" int4,
  "updatedBy" int4,
  "code" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."users"."code" IS 'code generated from id';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (1, 'root', '$2b$10$iNT.d38.rdsRvRMU95WTSu0ZMUBi/Dbwsrzw7yu0vT60T9EPu8eNi', 'root', '', NULL, 1, '2022-12-13 16:29:53.248164+07', '2022-12-13 16:29:53.248164+07', NULL, NULL, '5c5652e878449245a480bb2ded80fadd');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq"', 7, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_lock_index_seq"
OWNED BY "public"."migrations_lock"."index";
SELECT setval('"public"."migrations_lock_index_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permissions_id_seq"
OWNED BY "public"."permissions"."id";
SELECT setval('"public"."permissions_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."role_permissions_id_seq"
OWNED BY "public"."role_permissions"."id";
SELECT setval('"public"."role_permissions_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."roles_id_seq"
OWNED BY "public"."roles"."id";
SELECT setval('"public"."roles_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 2, true);

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations_lock
-- ----------------------------
ALTER TABLE "public"."migrations_lock" ADD CONSTRAINT "migrations_lock_pkey" PRIMARY KEY ("index");

-- ----------------------------
-- Indexes structure for table permissions
-- ----------------------------
CREATE INDEX "permissions_createdby_index" ON "public"."permissions" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table role_permissions
-- ----------------------------
CREATE INDEX "role_permissions_createdby_index" ON "public"."role_permissions" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "role_permissions_permissionid_index" ON "public"."role_permissions" USING btree (
  "permissionId" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "role_permissions_roleid_index" ON "public"."role_permissions" USING btree (
  "roleId" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table role_permissions
-- ----------------------------
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table roles
-- ----------------------------
CREATE INDEX "roles_createdby_index" ON "public"."roles" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "roles_updatedby_index" ON "public"."roles" USING btree (
  "updatedBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE INDEX "users_createdby_index" ON "public"."users" USING btree (
  "createdBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "users_roleid_index" ON "public"."users" USING btree (
  "roleId" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "users_updatedby_index" ON "public"."users" USING btree (
  "updatedBy" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table role_permissions
-- ----------------------------
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_permissionid_foreign" FOREIGN KEY ("permissionId") REFERENCES "public"."permissions" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_roleid_foreign" FOREIGN KEY ("roleId") REFERENCES "public"."roles" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."roles" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_updatedby_foreign" FOREIGN KEY ("updatedBy") REFERENCES "public"."roles" ("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_createdby_foreign" FOREIGN KEY ("createdBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."users" ADD CONSTRAINT "users_roleid_foreign" FOREIGN KEY ("roleId") REFERENCES "public"."roles" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."users" ADD CONSTRAINT "users_updatedby_foreign" FOREIGN KEY ("updatedBy") REFERENCES "public"."users" ("id") ON DELETE SET NULL ON UPDATE CASCADE;
