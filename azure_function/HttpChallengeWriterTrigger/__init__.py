import logging
import re
import uuid
import json
import azure.functions as func
from datetime import datetime

def main(req: func.HttpRequest, doc: func.Out[func.Document]) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    inputDict = {
        'title': req.route_params.get('title'),
        'startDate': datetime.fromisoformat(req.route_params.get('startDate')),
        'endDate': datetime.fromisoformat(req.route_params.get('endDate')),
        'description': req.route_params.get('description'),
        'difficulty': req.route_params.get('difficulty'),
        'points': int(req.route_params.get('points')),
    }

    if req.route_params.get('tags[]') is None:
        inputDict['tags'] = ""
    else:
        inputDict['tags'] = req.route_params.get('tags[]').lower().strip().split(",")
    
    if req.route_params.get('image') is None:
        inputDict['image'] = ""
    else:
        inputDict['image'] = req.route_params.get('image')

    checkInput = True

    for inputKey in inputDict.keys():
        if not inputDict[inputKey] and inputKey != 'tags' and inputKey != 'image' :
            try:
                req_body = req.get_json()
            except ValueError:
                checkInput = False
                pass
            else:
                inputDict[inputKey] = req_body.get(inputKey)


    if checkInput:
        newdocs = func.DocumentList() 
        newChallengeDict = {
            "id": str(uuid.uuid4()),
            "title": inputDict['title'],
            "startDate": datetime.isoformat(inputDict['startDate']),
            "endDate": datetime.isoformat(inputDict['endDate']),
            "description": inputDict['description'],
            "difficulty": inputDict['difficulty'],
            "points": inputDict['points'],
            "tags": inputDict['tags'],
            "image": inputDict['image']
        }
        newdocs.append(func.Document.from_dict(newChallengeDict))
        doc.set(newdocs)

        return func.HttpResponse(
            json.dumps(newChallengeDict),
            status_code=200,
            mimetype="application/json"
            )
    else:
        return func.HttpResponse(
             "The challenge could not be posted.",
             status_code=200
        )