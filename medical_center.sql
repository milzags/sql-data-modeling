-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GrfiS5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "doctors" (
    "id" serial   NOT NULL,
    "name" TEXT   NOT NULL,
    "type" TEXT   NOT NULL,
    CONSTRAINT "pk_doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "patients" (
    "id" SERIAL   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "visits" (
    "visit_id" SERIAL   NOT NULL,
    "doctor_id" INTEGER   NOT NULL,
    "date" TEXT   NOT NULL,
    "patient_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_visits" PRIMARY KEY (
        "visit_id"
     )
);

CREATE TABLE "diagnosed" (
    "id" INTEGER   NOT NULL,
    "visit_id" INTEGER   NOT NULL,
    "has_disease" BOOLEAN   NOT NULL,
    CONSTRAINT "pk_diagnosed" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "diseases" (
    "id" TEXT   NOT NULL,
    "description" TEXT   NOT NULL
);

ALTER TABLE "doctors" ADD CONSTRAINT "fk_doctors_id" FOREIGN KEY("id")
REFERENCES "visits" ("doctor_id");

ALTER TABLE "patients" ADD CONSTRAINT "fk_patients_id" FOREIGN KEY("id")
REFERENCES "visits" ("patient_id");

ALTER TABLE "visits" ADD CONSTRAINT "fk_visits_visit_id" FOREIGN KEY("visit_id")
REFERENCES "diagnosed" ("id");

ALTER TABLE "diagnosed" ADD CONSTRAINT "fk_diagnosed_has_disease" FOREIGN KEY("has_disease")
REFERENCES "diseases" ("id");

