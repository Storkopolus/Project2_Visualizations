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

CREATE TABLE "county_votes" (
    "county_ID" INTEGER   NOT NULL,
    "candidate_ID" INTEGER   NOT NULL,
    "candidate_votes" INTEGER   NOT NULL,
    "year" INTEGER   NOT NULL
);

ALTER TABLE "county_state" ADD CONSTRAINT "fk_county_state_county_ID" FOREIGN KEY("county_ID")
REFERENCES "county" ("county_ID");

ALTER TABLE "county_state" ADD CONSTRAINT "fk_county_state_state_ID" FOREIGN KEY("state_ID")
REFERENCES "state" ("state_ID");

ALTER TABLE "candidates" ADD CONSTRAINT "fk_candidates_party_ID" FOREIGN KEY("party_ID")
REFERENCES "parties" ("party_ID");

ALTER TABLE "county_votes" ADD CONSTRAINT "fk_county_votes_county_ID" FOREIGN KEY("county_ID")
REFERENCES "county_state" ("county_ID");

ALTER TABLE "county_votes" ADD CONSTRAINT "fk_county_votes_candidate_ID" FOREIGN KEY("candidate_ID")
REFERENCES "candidates" ("candidate_ID");

