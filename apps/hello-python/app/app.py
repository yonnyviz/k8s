from flask import Flask
import math

app = Flask(__name__)


@app.route('/square/<int:post_id>')
def show_post(post_id):
    sqrtA = math.sqrt(post_id)
    return sqrtA


@app.route('/greetings')
def hello():
    name = "Hello World from"
    return name


if __name__ == "__main__":
    app.run()
