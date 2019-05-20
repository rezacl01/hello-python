#!/usr/bin/env python

import os
APP_DIR = os.path.dirname(os.path.abspath(__file__))
os.sys.path.append(os.path.join(APP_DIR, 'vendor'))

from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)


class HelloWorld(Resource):
    def get(self):
        # get files
        return {'hello': 'world'}


api.add_resource(HelloWorld, '/')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
