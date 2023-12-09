from django.core.files.storage import default_storage
from rest_framework.decorators import api_view
from rest_framework.response import Response
from joblib import load 
import os
from django.http import JsonResponse
import numpy as np
import cv2


@api_view(['POST'])
def predict_covid(request):
    print("Request received")
    if request.method == 'POST':
        print("Receiving....")
        scaler = load('myApp/scaler.pkl')
        model = load('myApp/svm_model.pkl')
        
        file = request.FILES['image']
        file_name = default_storage.save(file.name, file)
        file_path = os.path.join(default_storage.location, file_name)
        image = cv2.imread(file_path)
        image = cv2.resize(image, (500, 500))
        image = image / 255.0  # Normalize the image
        image = image.flatten().reshape(1, -1)
        image = scaler.transform(image)
        prediction = model.predict(image)
        print(prediction)
        if prediction[0] == 1:
            result = "Covid Negative"
        else:
            result = "Covid Positive"

        os.remove(file_path)
        return JsonResponse({'result': result})
    
    

@api_view(['POST'])
def predict_covid_DT(request):
    print("Request received")
    if request.method == 'POST':
        print("Receiving....")
        scaler = load('myApp/scaler_dt.pkl')
        model = load('myApp/dt_model.pkl')
        
        file = request.FILES['image']
        file_name = default_storage.save(file.name, file)
        file_path = os.path.join(default_storage.location, file_name)
        image = cv2.imread(file_path)
        image = cv2.resize(image, (500, 500))
        image = image / 255.0  # Normalize the image
        image = image.flatten().reshape(1, -1)
        image = scaler.transform(image)
        prediction = model.predict(image)
        prediction = prediction.flatten()
        print(prediction)
        if prediction[1] == 1:
            result = "Covid Negative"
        else:
            result = "Covid Positive"

        os.remove(file_path)
        return JsonResponse({'result': result})
    

@api_view(['POST'])
def predict_covid_RF(request):
    print("Request received")
    if request.method == 'POST':
        print("Receiving....")
        model = load('myApp/rf_model.pkl')
        scaler = load('myApp/scaler_dt.pkl')
        file = request.FILES['image']
        file_name = default_storage.save(file.name, file)
        file_path = os.path.join(default_storage.location, file_name)
        image = cv2.imread(file_path)
        image = cv2.resize(image, (500, 500))
        image = image / 255.0
        image = image.flatten().reshape(1, -1)
        image = scaler.transform(image)
        prediction = model.predict(image)
        prediction = prediction.flatten()
        print(prediction)
        if prediction[1] == 1:
            result = "Covid Negative"
        else:
            result = "Covid Positive"

        os.remove(file_path)
        return JsonResponse({'result': result})



