from flask import Flask, jsonify, request
#from flask_cors import CORS

app = Flask(__name__)
#CORS(app)

@app.route('/', methods=['GET'])
def get_api():
    return "<h1>Modelo de API Flask containerizada", 200

@app.route('/health', methods=['GET'])
def get_health():
    return "Healthy", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=80,debug=True)