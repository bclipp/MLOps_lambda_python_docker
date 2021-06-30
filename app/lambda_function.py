"""
This module is the main function that loads adn predicts the model
"""
import pickle5 as pickle
import numpy as np


def handler(event, _):
    """
    The main entry function
    :param event:
    :param _:
    :return:
    """
    loaded_model = pickle.load(open("model.pkl", 'rb'))
    X = np.array(event["data"])
    prediction = loaded_model.predict([X])
    message = {
        'prediction': float(prediction)
    }
    return message
