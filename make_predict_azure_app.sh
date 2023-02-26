#!/usr/bin/env bash

PORT=443
echo "Port: $PORT"

# POST method predict
curl -d '{  
   "sepal length (cm)":{  
      "0":7.2
   },
   "sepal width (cm)":{  
      "0":3.6
   },
   "petal length (cm)":{  
      "0":6.1
   },
   "petal width (cm)":{  
      "0":2.5
   }
}'\
     -H "Content-Type: application/json" \
     -X POST https://flask-ml-service.azurewebsites.net:$PORT/predict 
     #your application name <yourappname>goes here == flask-ml-service