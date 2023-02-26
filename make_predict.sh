#!/usr/bin/env bash

PORT=5000
echo "Port: $PORT"

# POST method predict
curl -d '{  
   "sepal_length":{  
      "0":7.2
   },
   "sepal_width":{  
      "0":3.6
   },
   "petal_length":{  
      "0":6.1
   },
   "petal_width":{  
      "0":2.5
   }
}'\
     -H "Content-Type: application/json" \
     -X POST http://localhost:$PORT/predict