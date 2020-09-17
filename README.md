# README

### Notes
To create a user

curl -d "email=connor1@gmail.com" -d "password=password" http://localhost:3000/users/sign_up
example response: {"data":{"id":"3","type":"user","attributes":{"api_token":"NDDYqTGcU83dReqZLYKXodaP","email":"connor1@gmail.com"}}}

curl http://localhost:3000/v1/current -H "Authorization: Bearer [user_api_token]"
example response: {"data":{"id":"2","type":"user","attributes":{"number":0}}}

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