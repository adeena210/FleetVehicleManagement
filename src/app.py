#! /usr/bin/python3

"""
Adeena Ahmed, Hafsah Shaik, Justin Wain
CSC 315 CAB Project
---

One-Time Installation

You must perform this one-time installation in the CSC 315 VM:

# install python pip and psycopg2 packages
sudo pacman -Syu
sudo pacman -S python-pip python-psycopg2

# install flask
pip install flask

----

Usage

To run the Flask application, simply execute:

export FLASK_APP=app.py 
flask run
# then browse to http://127.0.0.1:5000/

"""

import psycopg2
from config import config
from flask import Flask, render_template, request
import json

# Connect to the PostgreSQL database server
def connect(query):
    conn = None
    try:
        # read connection parameters
        params = config()
 
        # connect to the PostgreSQL server
        print('Connecting to the %s database...' % (params['database']))
        conn = psycopg2.connect(**params)
        print('Connected.')
      
        # create a cursor
        cur = conn.cursor()
        
        # execute a query using fetchall()
        cur.execute(query)
        rows = cur.fetchall()

        # close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')
    # return the query result from fetchall()
    return rows
 
# app.py
app = Flask(__name__)


# serve form web page
@app.route("/")
def home():
    return render_template('index.html')


@app.route("/cost", methods=['GET', 'POST'])
@app.route("/cost/", methods=['GET', 'POST'])
def cost():

    # queries to populate dropdowns on cost page
    query = "SELECT DISTINCT vehicle_type FROM VEHICLE;"
    vehicle_types = connect(query)
    query = "SELECT vehicle_type, emissions_type FROM VEHICLE;"
    emission_types = connect(query)

    types = {}
    for elem in vehicle_types:
        types[elem[0]] = []

    for elem in emission_types:
        types[elem[0]].append(elem[1])

    if request.method == 'POST':
        #query to select cost information for selected vehicle type and emissions type
        rows = connect("SELECT * FROM vehicle_costs WHERE vehicle_type = '" + request.form['vehicle_type']+"' AND emissions_type = '"+ request.form['emission_type']+"';")
        info = {}
        
        info["vehicle_type"] = rows[0][0]
        info["emissions_type"] = rows[0][1]
        info["initial_capital"] = rows[0][2]
        info["fuel_per_mile"] = rows[0][3]
        info["battery"] = rows[0][4]
        info["insurance"] = rows[0][5]
        info["repair"] = rows[0][6]
        info["maintenance_per_mile"] = rows[0][7]
        info["mileage"] = rows[0][8]
        info["mpg"] = rows[0][9]

        return render_template('cost.html', vehicle_types = vehicle_types, emission_types=json.dumps(types), info=json.dumps(info))
    else:
        return render_template('cost.html', vehicle_types = vehicle_types, emission_types=json.dumps(types))

@app.route('/emissions', methods=['GET','POST'])
@app.route('/emissions/', methods=['GET','POST'])
def emissions():
    # queries to populate dropdowns on cost page
    query = "SELECT DISTINCT vehicle_type FROM VEHICLE;"
    vehicle_types = connect(query)
    query = "SELECT vehicle_type, emissions_type FROM VEHICLE;"
    emission_types = connect(query)

    types = {}
    for elem in vehicle_types:
        types[elem[0]] = []

    for elem in emission_types:
        types[elem[0]].append(elem[1])

    if request.method == 'POST':
        #query to select emissions information for selected vehicle type and emission type
        rows = connect("SELECT * FROM vehicle_emissions WHERE vehicle_type = '" + request.form['vehicle_type']+"' AND emissions_type = '"+ request.form['emission_type']+"';")
        
        info = {}
        
        info["vehicle_type"] = rows[0][0]
        info["emissions_type"] = rows[0][1]
        info["ece"] = rows[0][2]
        info["mileage"] = rows[0][3]
        info["mpg"] = rows[0][4]

        return render_template('emissions.html', vehicle_types = vehicle_types, emission_types=json.dumps(types), info=json.dumps(info))
    else:
        return render_template('emissions.html', vehicle_types = vehicle_types, emission_types=json.dumps(types))

@app.route("/fleet",methods=['GET', 'POST'])
@app.route("/fleet/",methods=['GET', 'POST'])
def fleet():
    #queries to find all vehicle and emission types present in the database currently
    query = "SELECT DISTINCT vehicle_type FROM VEHICLE;"
    vehicle_types = connect(query)
    query = "SELECT vehicle_type, emissions_type FROM VEHICLE;"
    emission_types = connect(query)

    types = {}
    for elem in vehicle_types:
        types[elem[0]] = []

    for elem in emission_types:
        types[elem[0]].append(elem[1])


    if request.method == 'POST':
        # query to get all relevant cost and emissions information for a fleet
        query = "SELECT * FROM VEHICLE_COST_EMISSIONS;"
        rows = connect(query)

        all_info = {}
        for i in range(0, len(rows)):
            info = all_info[rows[i][0]+"_"+rows[i][1]] = {}
            info["vehicle_type"] = rows[i][0]
            info["emissions_type"] = rows[i][1]
            info["mileage"] = rows[i][2]
            info["mpg"] = rows[i][3]
            info["ece"] = rows[i][4]
            info["initial_capital"] = rows[i][5]
            info["fuel_per_mile"] = rows[i][6]
            info["battery"] = rows[i][7]
            info["insurance"] = rows[i][8]
            info["repair"] = rows[i][9]
            info["maintenance_per_mile"] = rows[i][10]
            if request.form[rows[i][0]+"_"+rows[i][1]] == "":
                info["quantity"] = 0
            else:
                info["quantity"] = request.form[rows[i][0]+"_"+rows[i][1]]
        print(all_info)
        return render_template('fleet.html', vehicle_types = vehicle_types, emission_types=json.dumps(types), info = json.dumps(all_info))
    else:
        return render_template('fleet.html', vehicle_types = vehicle_types, emission_types=json.dumps(types))

if __name__ == '__main__':
    app.run(debug = True)
