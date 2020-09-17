# README

### Notes
#### To create a user

curl -d "email=connor1@gmail.com" -d "password=password" http://localhost:3000/users/sign_up
example response: {"data":{"id":"3","type":"user","attributes":{"api_token":"NDDYqTGcU83dReqZLYKXodaP","email":"connor1@gmail.com"}}}

#### To retrieve an existing user

curl -d "email=connor1@gmail.com" -d "password=password" http://localhost:3000/users/sign_in
example response: {"data":{"id":"3","type":"user","attributes":{"api_token":"NDDYqTGcU83dReqZLYKXodaP","email":"connor1@gmail.com"}}}

#### To get the current number for a certain user (based on the api token)

curl http://localhost:3000/v1/current -H "Authorization: Bearer [user_api_token]"
example response: {"data":{"id":"2","type":"user","attributes":{"number":0}}}

#### To increment number for a certain user (based on the api token)

curl http://localhost:3000/v1/next -H "Authorization: Bearer [user_api_token]"
example response: {"data":{"id":"2","type":"user","attributes":{"number":1}}}

#### To reset number for a certain user (based on the api token)

curl -X "PUT" http://localhost:3000/v1/reset --data "number=100" -H "Authorization: Bearer [user_api_token]"
example response: {"data":{"id":"2","type":"user","attributes":{"number":100}}}
or if number is invalid {"errors":{"status":"400","title":"Invalid number","detail":"Need to be a number from 0 and above"}}

### Date

### Location of deployed application
https://ancient-forest-97451.herokuapp.com/
examples:
curl -d "email=connor1@gmail.com" -d "password=password" https://ancient-forest-97451.herokuapp.com/users/sign_up
curl -d "email=connor1@gmail.com" -d "password=password" https://ancient-forest-97451.herokuapp.com/users/sign_in
curl https://ancient-forest-97451.herokuapp.com/v1/current -H "Authorization: Bearer 1SZ7y555Q2hpta9r68Qzt94k"
curl https://ancient-forest-97451.herokuapp.com/v1/next -H "Authorization: Bearer 1SZ7y555Q2hpta9r68Qzt94k"
curl -X "PUT" https://ancient-forest-97451.herokuapp.com/v1/reset --data "number=100" -H "Authorization: Bearer 1SZ7y555Q2hpta9r68Qzt94k"


### Time spent

### Assumptions made

### Shortcuts/Compromises made

### Stretch goals attempted

### Instructions to run assignment locally

### What did you not include in your solution that you want us to know about?

### Other information about your submission that you feel it's important that we know if applicable.

### Your feedback on this technical challenge