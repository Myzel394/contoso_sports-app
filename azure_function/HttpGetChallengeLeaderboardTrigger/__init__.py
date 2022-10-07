import logging
import json
import azure.functions as func

def main(req: func.HttpRequest, doc:func.DocumentList) -> func.HttpResponse:
    
    logging.info('Python HTTP trigger function processed a request.')

    challengeID = req.route_params.get('challengeid'),
    challengeResultsDict = {}
    ranking = {}
    board = ["id1", "id2", "id3"]

    for challengeResult in doc:
        if challengeResult['challengeid'] == id and challengeResult['ranking'] <= 3:
            challengeResultDict = {
                "id": challengeResult['id'],
                "challengeID": challengeResult['challengeid'],
                "userID": challengeResult['userid'],
                "ranking": challengeResult['ranking']
            }
            challengeResultsDict[challengeResult['id']] = challengeResultDict
            board[challengeResult['ranking']-1] = challengeResult['id']    

    ranking = {
        "First": challengeResultsDict[board[0]],
        "Second": challengeResultsDict[board[1]],
        "Third": challengeResultsDict[board[2]]
    }

    return func.HttpResponse(
            json.dumps(ranking),
            status_code=200,
            mimetype="application/json"            
    )