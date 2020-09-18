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
Submitted on Thursday Sept 17, 2020

### Location of deployed application
API server: https://ancient-forest-97451.herokuapp.com/

examples:

curl -d "email=connor1@gmail.com" -d "password=password" https://ancient-forest-97451.herokuapp.com/users/sign_up

curl -d "email=connor1@gmail.com" -d "password=password" https://ancient-forest-97451.herokuapp.com/users/sign_in

curl https://ancient-forest-97451.herokuapp.com/v1/current -H "Authorization: Bearer 1SZ7y555Q2hpta9r68Qzt94k"

curl https://ancient-forest-97451.herokuapp.com/v1/next -H "Authorization: Bearer 1SZ7y555Q2hpta9r68Qzt94k"

curl -X "PUT" https://ancient-forest-97451.herokuapp.com/v1/reset --data "number=100" -H "Authorization: Bearer 1SZ7y555Q2hpta9r68Qzt94k"

Frontend:

https://secure-cove-78788.herokuapp.com/

valid urls:

https://secure-cove-78788.herokuapp.com/login

https://secure-cove-78788.herokuapp.com/signup

https://secure-cove-78788.herokuapp.com/number (requires being logged in, has all 3 actions to handle the user's number)


### Time spent
backend ~6 hours

frontend ~8 hours

### Assumptions made
I didn't put a upper bound on the number, assuming the user will not reset the number to a really
high number (2,147,483,647, limit on the sql column).

### Shortcuts/Compromises made
-There are libraries I should use for user authentication (Devise), but since I have no used that library before,
I opted for a simpler approach (following a tutorial)

-Number should probably be it's own table if there are more info associated to it, but to keep things simple,
I put the number on the user (easier to generate a default value when a user is created)

-The fetch calls in Number.js should be extracted out (easier to write unit test to mock these api calls when test rendering the component)

### Stretch goals attempted
-Deploying to a live environment for both backend and frontend

-Created a frontend app to use the API

### Instructions to run assignment locally
#### backend
requires ruby 2.7.1

bundle install

rake db:setup

rails s (see localhost:3000)


#### frontend

yarn install

PORT=3300 yarn start

go to localhost:3300 (connects to the production backend server, I couldn't figure how to connect locally)

### What did you not include in your solution that you want us to know about?
I didn't have time to add unit tests for the frontend, spent alot of time prototyping approaches.
To take a step further, I could add browser testing on the frontend (using a library like Cypress)

### Other information about your submission that you feel it's important that we know if applicable.
-there's unit tests for the backend portion of the code challenge

-Used a higher order component to handle if a user is authenticated (an api token is stored in the browser)

-because the apps are deployed on Heroku free tier, the initial request may take a few seconds

### Your feedback on this technical challenge
I haven't set up an authentication system (frontend or backend) before, I thought it was a learning experience.
It's good the project has many ways to be added to.