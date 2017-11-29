# Book Tracking

 An application that tracks books I own. Runs on Ruby 2.0.0-p648, Rails 3.2.6,
 and sqlite3.

## The Mission at Hand

After setting this initial design we realized the denormalization
of our `books` table and the duplication issues it causes. Please
do the following (spend no more than a couple hours, please):

* Extract the `author` field into its own table/model with fields
that make sense.
* Add the relevant associations.
* Update the `#index` action of the `books_controller` to
include `Author` information.
* Write/update relevant specs.
* Write up your thought process: why'd you do what you did,
any changes you'd make to the controllers, design, specs, etc.

## Submitting

Create a private fork, then submit a PR against master.

### Thought process

* Because there isn't any existing data in the seed.rb; we can modify the existing books table by dropping it and not have to worry about preserving data

* This allows us to drop the Books table in 20171128211826_drop_books migration

* Next we create a new authors table and re-create the books table with a reference to the new Authors table via the author's id in 20171128211937_create_authors migration

* Next we need to edit the books model by adding a __belongs_to :author__ near the top of class.

Now we can check the development db migration status:

$ ```bundle exec rake db:migrate:status```

db/development.sqlite3`

|Status |  Migration ID    |Migration Name  |
|-------|------------------|----------------|
|   up  | 20171123185902   | Create book    |
|   up  |   20171128211826 |  Drop books    |
|   up  |  20171128211937  | Create authors |


* Now we need to update the books#index method that returns the json response to include the from ```render  json: books``` to ```render  json: books.as_json(include: :author, only: [:name])```; __:include__ allows us to load nested relationships in a hash that can provided in the render phase of the instance variable.

* In the spec folder modified models/book_spec.rb, a new models/author.rb and revise version of books_controller.rb. 
