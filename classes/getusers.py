import json

class GetUsers():
    def __init__(self, user_id, json_file="templates/users_list.json"):

        # Parse the JSON data
        json_data = open(json_file)
        # returns JSON object as 
        # a dictionary
        self.data = json.load(json_data)
        self.user_id = user_id
    
    def returnUserWelcomeMessage(self):
        for user in self.data["users"]:
            if int(user['id']) == int(self.user_id):
                return { "message": "user with id {} firstname is: {} and lastname is: {}".format(self.user_id, user["firstName"], user["lastName"]) }
        return { "message": "user with id {} does not exist".format(self.user_id) }

    