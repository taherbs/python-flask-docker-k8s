from flask import Flask,jsonify
from classes.data import Data
from classes.getusers import GetUsers

app = Flask(__name__)

@app.route('/')
def index():
    response = Data().data
    print("--------------")
    print(response)
    print("--------------")
    return jsonify(response)

@app.route('/user/<string:id>')
def user(id: str):
    object = GetUsers(id)
    response = object.returnUserWelcomeMessage()
    print("--------------")
    print(response)
    print("--------------")
    return jsonify(response)

# main entry point
if __name__ == "__main__":
    app.run(host='0.0.0.0')