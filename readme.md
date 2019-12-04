Front page of the site is http://localhost:4567/
To run this file you require sinatra and to run the seeds file you require pry.
Instructions
Clone the project1_the_gym directory
Open the project1_the_gym directory in terminal
Within terminal run-
1. “createdb spending_tracker” to create the database
2. “psql -d spending_tracker -f db/spending_tracker.sql” - to create the tables etc.
3. “ruby db/seeds.rb” to add test data.
4. “ruby controller.rb” to start the sinatra server
5. Enter localhost:4567 into the address bar of your browser.
