# Start project
The start of the project was created with the following command:
```yaml
rails new {nombre_del_proyecto} --database=postgresql
```

# Creation models
The creation of the models was done using the `rails generate` command, this command created the CRUD automatically, the commands used were the following:


```yaml
rails generate model Author name:string date_of_birth:date country_of_origin:string short_description:text
rails generate model Book name:string summary:text date_of_publication:date number_of_sales:integer
rails generate model Review book:references review:text score:integer:number_of_up_votes:integer
rails generate model Sale book:references year:integer sales:integer

```

# Ruby version 
For this project the last recommended version of ruby for windows was used, this is:
```yaml
ruby: 3.2.2
```
# Postgres version
For this project the last recommended version of Postgres for windows was used, this is:
```yaml
Postgres: 15
```


# Database Connection

To connect Ruby on Rails with PostgreSQL, you'll need to modify the `config/database.yml` file. In this file, locate and modify the variables on lines 21 and 22:

```yaml
username: your_username
password: your_password
```

By default, these are set to the PostgreSQL superuser (postgres default user) with the password "admin". However, you should update these variables according to your own PostgreSQL user credentials.


# Start project
To start the project it is necessary to run the following commands in the given order
```yaml
bundle install
rails db:reset
rails db:migrate
rails db:seed
rails s
```

# Enter the website
When starting the project, it will be running on port 3000. In order to view the web page, you must enter your preferred browser and enter the following link:

```yaml
http://localhost:3000/
```
Although there are links within the web page, the views of interest are the following:

```yaml
http://localhost:3000/authors
http://localhost:3000/books/search
http://localhost:3000/books
http://localhost:3000/sales
```

# Search by words

For some reason that we still do not understand, the fake data is generated in Latin, to facilitate the review, some Latin words will be included that can be searched:

```yaml
voluptatibus
velit
Enim
```


