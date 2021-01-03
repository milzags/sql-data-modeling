-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GrfiS5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "region" (
    "id" INTEGER   NOT NULL,
    "region_name" TEXT   NOT NULL,
    CONSTRAINT "pk_region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "users" (
    "id" SERIAL   NOT NULL,
    "username" TEXT   NOT NULL,
    "preferred_region" TEXT   NOT NULL,
    CONSTRAINT "pk_users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "posts" (
    "id" SERIAL   NOT NULL,
    "title" TEXT   NOT NULL,
    "content" TEXT   NOT NULL,
    "user_id" INTEGER   NOT NULL,
    "location" TEXT   NOT NULL,
    "region_id" INTEGER   NOT NULL,
    "category_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_posts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "categories" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    CONSTRAINT "pk_categories" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "region" ADD CONSTRAINT "fk_region_id" FOREIGN KEY("id")
REFERENCES "posts" ("region_id");

ALTER TABLE "users" ADD CONSTRAINT "fk_users_id" FOREIGN KEY("id")
REFERENCES "posts" ("region_id");

ALTER TABLE "posts" ADD CONSTRAINT "fk_posts_category_id" FOREIGN KEY("category_id")
REFERENCES "categories" ("id");

