#Dependencies
import numpy as np
import sqlalchemy
import psycopg2
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func
from flask import Flask, jsonify
from flask import render_template

#################################################
# Database Setup
#################################################

#Connection String
database_path = "postgres:fpEl1620@database-73.cgiopwhezyby.us-east-2.rds.amazonaws.com/Election_db"

#Engine Creation
engine = create_engine(f"postgresql+psycopg2://{database_path}")
#session=Session(engine)

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(engine, reflect=True)

# Save reference to the
County_votes = Base.classes.county_votes
Candidates = Base.classes.candidates
County_state = Base.classes.county_state
Parties = Base.classes.parties

#################################################
# Flask Setup
#################################################
app = Flask(__name__)

#################################################
# Flask Routes
#################################################

@app.route("/")
def welcome():
    """List all available api routes."""
    return (
        f"Available Routes:<br/>"
        f"/api/v1.0/county_votes<br/>"
        f"/api/v1.0/candidates<br/>"
        f"/api/v1.0/county_state<br/>"
        f"/api/v1.0/parties"
    )


@app.route("/api/v1.0/county_votes")
def county_votes():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    # Query all county_votes info
    results = session.query(County_votes.ID, County_votes.year, County_votes.candidate_ID, County_votes.candidate_votes, County_votes.total_votes, County_votes.county_state_ID).all()
    
    session.close()

    # Create a dictionary from the row data and append to a list of county_votes_list
    county_votes_list = []
    for ID, year, candidate_ID, candidate_votes, total_votes, county_state_ID in results:
        county_votes_dict = {}
        county_votes_dict['ID']= ID
        county_votes_dict['year']= year
        county_votes_dict['candidate_ID']= candidate_ID
        county_votes_dict['candidate_votes']= candidate_votes
        county_votes_dict['total_votes']= total_votes
        county_votes_dict['county_state_ID']= county_state_ID
        county_votes_list.append(county_votes_dict)
    return(jsonify(county_votes_list))  

@app.route("/api/v1.0/candidates")
def candidates():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    # Query all county_votes info
    results = session.query(Candidates.candidate_ID, Candidates.candidate_name, Candidates.party_ID).all()
    
    session.close()

    # Create a dictionary from the row data and append to a list of county_votes_list
    candidates_list = []
    for candidate_ID, candidate_name, party_ID in results:
        candidates_dict = {}
        candidates_dict['candidate_ID']= candidate_ID
        candidates_dict['candidate_name']= candidate_name
        candidates_dict['party_ID']= party_ID
        candidates_list.append(candidates_dict)
    return(jsonify(candidates_list)) 

@app.route("/api/v1.0/county_state")
def county_state():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    # Query all county_votes info
    results = session.query(County_state.county_state_ID, County_state.county_state).all()
    
    session.close()

    # Create a dictionary from the row data and append to a list of county_votes_list
    county_state_list = []
    for county_state_ID, county_state in results:
        county_state_dict = {}
        county_state_dict['county_state_ID']= county_state_ID
        county_state_dict['county_state']= county_state
        county_state_list.append(county_state_dict)
    return(jsonify(county_state_list)) 

@app.route("/api/v1.0/parties")
def parties():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    # Query all county_votes info
    results = session.query(Parties.party_ID, Parties.party_name).all()
    
    session.close()

    # Create a dictionary from the row data and append to a list of county_votes_list
    parties_list = []
    for party_ID, party_name in results:
        parties_dict = {}
        parties_dict['party_ID']= party_ID
        parties_dict['party_name']= party_name
        parties_list.append(parties_dict)
    return(jsonify(parties_list)) 

if __name__ == '__main__':
    app.run(debug=True)
