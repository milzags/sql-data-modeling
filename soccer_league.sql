-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GrfiS5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "teams" (
    "id" INTEGER   NOT NULL,
    "team_name" TEXT   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" INTEGER   NOT NULL,
    "name" TEXT   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "league_season" (
    "id" INTEGER   NOT NULL,
    "game_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_league_season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referees" (
    "id" INTEGER   NOT NULL,
    "ref_name" TEXT   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals_scored_all_matches" (
    "id" SERIAL   NOT NULL,
    "player_id" INTEGER   NOT NULL,
    "match_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_goals_scored_all_matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "all_matches" (
    "id" INTEGER   NOT NULL,
    "team1_id" INTEGER   NOT NULL,
    "team2_id" INTEGER   NOT NULL,
    "referees_id" INTEGER   NOT NULL,
    "season_id" INT   NOT NULL,
    CONSTRAINT "pk_all_matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "match_results" (
    "id" INTEGER   NOT NULL,
    "team_id" INT   NOT NULL,
    "match_id" INT   NOT NULL,
    "result" TEXT   NOT NULL,
    CONSTRAINT "pk_match_results" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "teams" ADD CONSTRAINT "fk_teams_id" FOREIGN KEY("id")
REFERENCES "players" ("team_id");

ALTER TABLE "players" ADD CONSTRAINT "fk_players_id" FOREIGN KEY("id")
REFERENCES "goals_scored_all_matches" ("player_id");

ALTER TABLE "referees" ADD CONSTRAINT "fk_referees_id" FOREIGN KEY("id")
REFERENCES "all_matches" ("referees_id");

ALTER TABLE "all_matches" ADD CONSTRAINT "fk_all_matches_id" FOREIGN KEY("id")
REFERENCES "match_results" ("match_id");

ALTER TABLE "all_matches" ADD CONSTRAINT "fk_all_matches_team1_id" FOREIGN KEY("team1_id")
REFERENCES "teams" ("id");

ALTER TABLE "all_matches" ADD CONSTRAINT "fk_all_matches_team2_id" FOREIGN KEY("team2_id")
REFERENCES "teams" ("id");

ALTER TABLE "all_matches" ADD CONSTRAINT "fk_all_matches_season_id" FOREIGN KEY("season_id")
REFERENCES "league_season" ("id");

ALTER TABLE "match_results" ADD CONSTRAINT "fk_match_results_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

