import logging
import re
import uuid
import json
import azure.functions as func
from datetime import datetime

def main(req: func.HttpRequest, doc: func.Out[func.Document]) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    inputDict = {
        'firstName': req.route_params.get('firstName'),
        'lastName': req.route_params.get('lastName'),
        'nickName': req.route_params.get('nickName'),
        'password': req.route_params.get('password'),
        'gender': req.route_params.get('gender'),
        'birthDate': datetime.fromisoformat(req.route_params.get('birthDate')),
    }

    checkInput = True

    for inputKey in inputDict.keys():
        if not inputDict[inputKey] and inputKey != 'points':
            try:
                req_body = req.get_json()
            except ValueError:
                checkInput = False
                pass
            else:
                inputDict[inputKey] = req_body.get(inputKey)


    if checkInput:
        newdocs = func.DocumentList() 
        newUserDict = {
            "id": str(uuid.uuid4()),
            "firstName": inputDict['firstName'],
            "lastName": inputDict['lastName'],
            "nickName": inputDict['nickName'],
            "password": inputDict['password'],
            "gender": inputDict['gender'],
            "birthDate": datetime.isoformat(inputDict['birthDate']),
            "nChallenges": 0,
            "points": 0,
            "rivalID": "",
            "pointsToRival": 0
        }
        newdocs.append(func.Document.from_dict(newUserDict))
        doc.set(newdocs)
        
        return func.HttpResponse(
            json.dumps(newUserDict),
            status_code=200,
            mimetype="application/json"
            )
                
    else:
        return func.HttpResponse(
             "The user could not be registered.",
             status_code=200
        )