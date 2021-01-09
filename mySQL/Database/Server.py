from flask import Flask, request, jsonify
from HacknRoll import run, new

app = Flask(__name__)


@app.route('/api', methods=['GET'])
def api():
    d = {}

    test = str(request.args['Query'])
    login_success = run(test)
    d['Query'] = login_success
    return jsonify(d)


# http://10.0.2.2:5000/api?Query=


@app.route('/create', methods=['GET'])
def create():
    d = {}

    test = str(request.args['Query'])
    login_success = new(test)
    d['Query'] = login_success
    return jsonify(d)


if __name__ == '__main__':
    app.run()