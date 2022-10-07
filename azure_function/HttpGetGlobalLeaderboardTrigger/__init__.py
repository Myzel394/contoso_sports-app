import logging
import json
import azure.functions as func

def main(req: func.HttpRequest, doc:func.DocumentList) -> func.HttpResponse:
    
    logging.info('Python HTTP trigger function processed a request.')

    pointsDict = {}
    usersDict = {}

    for user in doc:
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
        }
        usersDict[user['id']] = userDict
        pointsDict[user['id']] = user['points']

    board = []
    for i in range(0,3):
        id = max(pointsDict, key=pointsDict.get)
        board.append(id)
        del pointsDict[id]

    ranking = {
        "First": usersDict[board[0]],
        "Second": usersDict[board[1]],
        "Third": usersDict[board[2]]
    }

    return func.HttpResponse(
            json.dumps(ranking),
            status_code=200,
            mimetype="application/json"            
    )