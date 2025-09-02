from flask import Flask, jsonify, request

app = Flask(__name__)


@app.route("/ping", methods=["GET"])
def ping():
    return {"message": "pong"}, 200


@app.route("/hello/<name>", methods=["GET"])
def hello(name):
    try:
        return jsonify({"message": f"Hello, {name}!"}), 200
    except Exception as e:
        print(f"Error : {e}")


@app.route("/fetch", methods=["GET"])
def fetch():
    try:
        with open(f"./files/data/data.txt", "r") as f:
            return {"data": f.read()}, 200
    except Exception as e:
        print(f"Got error: {e}")

        return {"error": str(e)}, 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
