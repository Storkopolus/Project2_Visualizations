-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/4wVRHO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "county_state" (
    "county_state_ID" INTEGER   NOT NULL,
    "county_state_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_county_state" PRIMARY KEY (
        "county_state_ID"
     )
);

CREATE TABLE "parties" (
    "party_ID" INTEGER   NOT NULL,
    "party_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_parties" PRIMARY KEY (
        "party_ID"
     )
);

CREATE TABLE "candidates" (
    "candidate_ID" INTEGER   NOT NULL,
    "candidate_name" VARCHAR   NOT NULL,
    "party_ID" INTEGER   NOT NULL,
    CONSTRAINT "pk_candidates" PRIMARY KEY (
        "candidate_ID"
     )
);

CREATE TABLE "county_votes" (
    "ID" INTEGER   NOT NULL,
    "county_state_ID" INTEGER   NOT NULL,
    "candidate_ID" INTEGER   NOT NULL,
    "candidate_votes" INTEGER   NOT NULL,
    "total_votes" INTEGER   NOT NULL,
    "year" INTEGER   NOT NULL,
    CONSTRAINT "pk_county_votes" PRIMARY KEY (
        "ID"
     )
);

ALTER TABLE "candidates" ADD CONSTRAINT "fk_candidates_party_ID" FOREIGN KEY("party_ID")
REFERENCES "parties" ("party_ID");

ALTER TABLE "county_votes" ADD CONSTRAINT "fk_county_votes_county_state_ID" FOREIGN KEY("county_state_ID")
REFERENCES "county_state" ("county_state_ID");

ALTER TABLE "county_votes" ADD CONSTRAINT "fk_county_votes_candidate_ID" FOREIGN KEY("candidate_ID")
REFERENCES "candidates" ("candidate_ID");

