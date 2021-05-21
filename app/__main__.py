import sys
import pickle5 as pickle
import sklearn
import numpy as np


def handler(event, context):
    loaded_model = pickle.load(open("model.pkl", 'rb'))
    X = np.array([event]).reshape(-1, 1)
    prediction = loaded_model.predict(X)
    return {
        'statusCode': 200,
        'body': prediction
    }
