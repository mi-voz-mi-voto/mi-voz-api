# Mi Voz Mi Voto API 

This repo is the API created for the Mi Voz Mi Voto project. Contrubutors include Alex McConnell and Luis Arroyo. 

## Technologies 

1. Rails 5 
2. Ruby 2.7.2 
3. RSpec test suite 
4. Postgresql database 

## Endpoints 

Base URL for testing: ```http://localhost:3001/api/v1```
Base URL for production: ```TBD``` 

```POST /users``` 

Request: 
```
{ 
  "first_name": "Test", 
  "last_name": "Example", 
  "state_name": "Colorado", 
  "email": "test@example.com", 
  "language": "en" OR "es"
}
```
Creates a new user and subscribes them to email notifications. 
This request will also send a confirmation to the users email. 

```GET /elections``` 

Request: 
``` 
{ 
  "location": "Alaska" 
}
``` 
Returns election info for the provided state. Election info provided by Google Civic API. 

```DELETE /users```

Request: 
``` 
{ 
  "email": "test@example.com"  
}
``` 
Delete user by email. Will no longer receive email notifications. 

