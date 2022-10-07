import logging
import re
import uuid
import json
import azure.functions as func
from datetime import datetime

def main(req: func.HttpRequest, docOut: func.Out[func.Document], docIn:func.DocumentList) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    userID = req.route_params.get('userID')
    rivalID = req.route_params.get('rivalID')

    for user in docIn:
        if user['id'] == userID:
            userDict = {
                "id": user['id'],
                "firstName": user['firstName'],
                "lastName": user['lastName'],
                "nickName": user['nickName'],
                "password": user['password'],
                "gender": user['gender'],
                "birthDate": user['birthDate'],
                "nChallenges": user['nChallenges'],
                "points": user['points'],
                "rivalID": user['rivalID'],
                "pointsToRival": user['pointsToRival']
            }
            userPoints = user['points']
        if user['id'] == rivalID:
            rivalPoints = user['points']

    pointsDiff = rivalPoints - userPoints

    if pointsDiff > 0:
        userDict['rivalID'] = rivalID
        userDict['pointsToRival'] = pointsDiff

    newdocs = func.DocumentList()
    newdocs.append(func.Document.from_dict(userDict))
    docOut.set(newdocs)
    return func.HttpResponse(
        json.dumps(userDict),
        status_code=200,
        mimetype="application/json"
        )

