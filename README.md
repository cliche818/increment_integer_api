# README

### Notes
To create a user

curl -d "email=connor1@gmail.com" -d "password=password" http://localhost:3000/users/sign_up
example response: {"data":{"id":"3","type":"user","attributes":{"api_token":"NDDYqTGcU83dReqZLYKXodaP","email":"connor1@gmail.com"}}}

curl http://localhost:3000/v1/current -H "Authorization: Bearer [user_api_token]"
example response: {"data":{"id":"2","type":"user","attributes":{"number":0}}}

curl http://localhost:3000/v1/next -H "Authorization: Bearer [user_api_token]"
example response: {"data":{"id":"2","type":"user","attributes":{"number":1}}}

curl -X "PUT" http://localhost:3000/v1/reset --data "number=100" -H "Authorization: Bearer [user_api_token]"
example response: {"data":{"id":"2","type":"user","attributes":{"number":100}}}
or if number is invalid {"errors":{"status":"400","title":"Invalid number","detail":"Need to be a number from 0 and above"}}

### Date

### Location of deployed application

### Time spent

### Assumptions made

### Shortcuts/Compromises made

### Stretch goals attempted

### Instructions to run assignment locally

### What did you not include in your solution that you want us to know about?

### Other information about your submission that you feel it's important that we know if applicable.

### Your feedback on this technical challenge