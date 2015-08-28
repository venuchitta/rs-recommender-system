The heroku link for this app is http://rs-challenge.herokuapp.com

## Development setup
To install the gems
```
bundle install
```
To setup the database
```
bundle exec rake db:setup
```
To run database migrations
```
bundle exec rake db:migrate
```
To import CSV 
```
bundle exec rake app:import_csv_data
```
To run all the test cases
```
bundle exec rspec spec 
```
To run the Rails server
```
bundle exec rails s 
```
To drop the database
```
bundle exec rake db:drop
```

## Importing Records From CSV files

* The records are divided into chunks rather than loading the whole file and process them in batch using SmarterCSV and threads. The helper for the rake file is in ROOT/lib directory

## UI of Application
* The appplication would root a page where 500 users from database are displayed and an algorithm is chosen from the dropdown which would route to other page where the recommended items are displayed as table

## Database Scaling

* Created Indexes on Foreign Keys which speeded up the whole process 4X-5X times
* Active Record Caching - https://github.com/Shopify/identity_cache (memchached based which also keep track of modified objects in cache) which I think is another way to scale the database to a great extent. Didn't implement in this project because I need to change the schema as identity_cache doesnt support :through. So, I just tested the gem's functionality by creating memchached server using Dolli
* Can use NoSQL databases (Distributed) like Mongodb, Elasticsearch which would greatly improve the speed. 

## OOPS design

* Used Strategy Design pattern to design the recommender algorthm as they have same interface and the algorithm can be chosen at runtime based on the option user chooses in the view. The algorithms are in app/services directory
* Furthur, regarding the design all the algorithm classes can extend the base class and would have raised an error if they  didn't implement the base class method recommend. But to keep the design simple I didnt do that

## Some Other insights

* All the algorithms used are naive and can use algorithms like collobarative filtering and other statistics methods for accuracy
* I placed all the activerecord queries in algorithms as scopes in model to be reusable in future and readable, although it is an overkill at this stage of project
* Can have page caching to save time of rendering the page

