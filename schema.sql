-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4wVRHO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "state" (
    "state_ID" INTEGER   NOT NULL,
    "state" VARCHAR   NOT NULL
);

CREATE TABLE "county" (
    "county_ID" INTEGER   NOT NULL,
    "county" VARCHAR   NOT NULL
);

CREATE TABLE "county_state" (
    "county_ID" INTEGER   NOT NULL,
    "state_ID" INTEGER   NOT NULL
);

CREATE TABLE "parties" (
    "party_ID" INTEGER   NOT NULL,
    "party_name" VARCHAR   NOT NULL
);

CREATE TABLE "candidates" (
    "candidate_ID" INTEGER   NOT NULL,
    "candidate_name" VARCHAR   NOT NULL,
    "party_ID" VARCHAR   NOT NULL
);

CREATE TABLE "county_votes_2016" (
    "county_ID" INTEGER   NOT NULL,
    "candidate_ID" INTEGER   NOT NULL,
    "candidate_county_votes_2016" INTEGER   NOT NULL,
    "total_county_votes_2016" INTEGER   NOT NULL,
    "percent_county_votes_2016" INTEGER   NOT NULL
);

CREATE TABLE "county_votes_2020" (
    "county_ID" INTEGER   NOT NULL,
    "candidate_ID" INTEGER   NOT NULL,
    "candidate_county_votes_2020" INTEGER   NOT NULL,
    "total_county_votes_2020" INTEGER   NOT NULL,
    "percent_county_votes_2020" INTEGER   NOT NULL
);

CREATE TABLE "state_votes_2016" (
    "state_ID" INTEGER   NOT NULL,
    "candidate_ID" INTEGER   NOT NULL,
    "candidate_state_votes_2016" INTEGER   NOT NULL,
    "total_state_votes_2016" INTEGER   NOT NULL,
    "percent_state_votes_2016" INTEGER   NOT NULL
);

CREATE TABLE "state_votes_2020" (
    "state_ID" INTEGER   NOT NULL,
    "candidate_ID" INTEGER   NOT NULL,
    "candidate_state_votes_2020" INTEGER   NOT NULL,
    "total_state_votes_2020" INTEGER   NOT NULL,
    "percent_state_votes_2020" INTEGER   NOT NULL
);

ALTER TABLE "county_state" ADD CONSTRAINT "fk_county_state_county_ID" FOREIGN KEY("county_ID")
REFERENCES "county" ("county_ID");

ALTER TABLE "county_state" ADD CONSTRAINT "fk_county_state_state_ID" FOREIGN KEY("state_ID")
REFERENCES "state" ("state_ID");

ALTER TABLE "candidates" ADD CONSTRAINT "fk_candidates_party_ID" FOREIGN KEY("party_ID")
REFERENCES "parties" ("party_ID");

ALTER TABLE "county_votes_2016" ADD CONSTRAINT "fk_county_votes_2016_county_ID" FOREIGN KEY("county_ID")
REFERENCES "county_state" ("county_ID");

ALTER TABLE "county_votes_2016" ADD CONSTRAINT "fk_county_votes_2016_candidate_ID" FOREIGN KEY("candidate_ID")
REFERENCES "candidates" ("candidate_ID");

ALTER TABLE "county_votes_2020" ADD CONSTRAINT "fk_county_votes_2020_county_ID" FOREIGN KEY("county_ID")
REFERENCES "county_state" ("county_ID");

ALTER TABLE "county_votes_2020" ADD CONSTRAINT "fk_county_votes_2020_candidate_ID" FOREIGN KEY("candidate_ID")
REFERENCES "candidates" ("candidate_ID");

ALTER TABLE "state_votes_2016" ADD CONSTRAINT "fk_state_votes_2016_state_ID" FOREIGN KEY("state_ID")
REFERENCES "county_state" ("state_ID");

ALTER TABLE "state_votes_2016" ADD CONSTRAINT "fk_state_votes_2016_candidate_ID" FOREIGN KEY("candidate_ID")
REFERENCES "candidates" ("candidate_ID");

ALTER TABLE "state_votes_2020" ADD CONSTRAINT "fk_state_votes_2020_state_ID" FOREIGN KEY("state_ID")
REFERENCES "county_state" ("state_ID");

ALTER TABLE "state_votes_2020" ADD CONSTRAINT "fk_state_votes_2020_candidate_ID" FOREIGN KEY("candidate_ID")
REFERENCES "candidates" ("candidate_ID");

