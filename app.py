from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Python! Deployment was successful!!!!"

if __name__ == '__main__':
    # ポート8000でリッスン
    app.run(host='0.0.0.0', port=8000)
