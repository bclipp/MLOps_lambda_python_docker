import sys
import pickle5 as pickle
import sklearn
import numpy as np


def handler(event, context):
    loaded_model = pickle.load(open("model.pkl", 'rb'))
    X = np.array([event["data"]]).reshape(-1, 1)
    prediction = loaded_model.predict(X)
    print(type(prediction))
    message = {
        '0' : prediction[0],
        '1': prediction[1],
        '2': prediction[2],
        '3': prediction[3],
    }
    return message
