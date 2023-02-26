from flask import Flask, request, jsonify
from flask.logging import create_logger
import logging

import pandas as pd
import joblib

app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)


@app.route("/")
def home():
    html = (
        "<h3>Sklearn Prediction Iris: From Azure Pipelines (Continuous Delivery)</h3>"
    )
    return html.format(format)


# TO DO:  Log out the prediction value
@app.route("/predict", methods=["POST"])
def predict():
    """Performs an sklearn prediction on iris dataset"""

    try:
        clf = joblib.load("model_treeclf.joblib")
    except:
        LOG.info(f"JSON payload: {json_payload}")
        return "Model not loaded"

    json_payload = request.json
    LOG.info("JSON payload: %s json_payload")
    inference_payload = pd.DataFrame(json_payload)
    print(inference_payload, '\n\n\n')
    LOG.info("inference payload DataFrame: %s inference_payload")
    prediction = str(list(clf.predict(inference_payload))[0])
    return jsonify({"prediction": prediction})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
