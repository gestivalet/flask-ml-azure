#!/usr/bin/env bash

PORT=5000
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
     -X POST http://localhost:$PORT/predict