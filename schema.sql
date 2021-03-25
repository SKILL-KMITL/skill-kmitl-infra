CREATE TABLE IF NOT EXISTS "career_fields" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE IF NOT EXISTS "career_groups" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE,
  "career_field_id" SERIAL
);

CREATE TABLE IF NOT EXISTS "career_positions" (
  "id" SERIAL PRIMARY KEY,
  "career_group_id" SERIAL,
  "name" varchar,
  "name_th" varchar,
  "desc" text,
  "tasks" varchar [],
);

CREATE TABLE IF NOT EXISTS "position_m_skill" (
  "id" SERIAL PRIMARY KEY,
  "position_id" SERIAL,
  "skill_id" SERIAL,
  "amount" int DEFAULT 1
);

CREATE TABLE IF NOT EXISTS "skills" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "name_th" varchar,
  "desc" TEXT,
  "type" varchar
  "ability" varchar[]
);

CREATE TABLE IF NOT EXISTS "skill_abilities" (
  "id" SERIAL PRIMARY KEY,
  "skill_id" SERIAL,
  "name" varchar,
  "name_th" varchar,
  "level" int DEFAULT 0
);

CREATE TABLE IF NOT EXISTS "course_facultys" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE
);

CREATE TABLE IF NOT EXISTS "course_programs" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar UNIQUE,
  "course_faculty_id" SERIAL
);

CREATE TABLE IF NOT EXISTS "course_subjects" (
  "id" SERIAL PRIMARY KEY,
  "course_program_id" SERIAL,
  "name" varchar,
  "name_th" varchar,
  "desc" text,
  "subject_id" int UNIQUE
);

CREATE TABLE IF NOT EXISTS "subject_m_position" (
  "id" SERIAL PRIMARY KEY,
  "course_subject_id" SERIAL,
  "career_position_id" SERIAL
);

CREATE TABLE IF NOT EXISTS "subject_m_skill" (
  "id" SERIAL PRIMARY KEY,
  "subject_id" SERIAL,
  "skill_id" SERIAL
);

CREATE TABLE IF NOT EXISTS "profiles" (
  "id" SERIAL PRIMARY KEY,
  "url" varchar UNIQUE,
  "about" text,
  "exp" text,
  "skill_hard" varchar[],
  "skill_soft" varchar[],
  "career_position_id" SERIAL,
  "interest" varchar[],
  "education" varchar[]
);

ALTER TABLE "career_groups" ADD FOREIGN KEY ("career_field_id") REFERENCES "career_fields" ("id") ON DELETE CASCADE;

ALTER TABLE "career_positions" ADD FOREIGN KEY ("career_group_id") REFERENCES "career_groups" ("id") ON DELETE CASCADE;

ALTER TABLE "position_m_skill" ADD FOREIGN KEY ("position_id") REFERENCES "career_positions" ("id") ON DELETE CASCADE;

ALTER TABLE "position_m_skill" ADD FOREIGN KEY ("skill_id") REFERENCES "skills" ("id") 

ALTER TABLE "skill_abilities" ADD FOREIGN KEY ("skill_id") REFERENCES "skills" ("id");

ALTER TABLE "course_programs" ADD FOREIGN KEY ("course_faculty_id") REFERENCES "course_facultys" ("id") ON DELETE CASCADE;

ALTER TABLE "course_subjects" ADD FOREIGN KEY ("course_program_id") REFERENCES "course_programs" ("id") ON DELETE CASCADE;

ALTER TABLE "subject_m_position" ADD FOREIGN KEY ("course_subject_id") REFERENCES "course_subjects" ("id");

ALTER TABLE "subject_m_position" ADD FOREIGN KEY ("career_position_id") REFERENCES "career_positions" ("id");

ALTER TABLE "subject_m_skill" ADD FOREIGN KEY ("subject_id") REFERENCES "course_subjects" ("id") ON DELETE CASCADE;;

ALTER TABLE "subject_m_skill" ADD FOREIGN KEY ("skill_id") REFERENCES "skills" ("id");

ALTER TABLE "profiles" ADD FOREIGN KEY ("career_position_id") REFERENCES "career_positions" ("id");