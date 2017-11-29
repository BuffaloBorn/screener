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

* Because there isn't any existing data in the seed.rb; we can modify the existing books table by dropping it and not having to worry about preserving existing data

* In the 20171128211826_drop_books migration, allows us to drop the Books table in

* In the 20171128211937_create_authors migration, we create a new authors table and re-create the books table with a reference to the new Authors table via the author's id

* In the app/models/book.rb, we need to edit the books model by adding a __belongs_to :author__ near the top of class.

Now we can check the development db migration status:

$ ```bundle exec rake db:migrate:status```

db/development.sqlite3`

|Status |  Migration ID    |Migration Name  |
|-------|------------------|----------------|
|   up  | 20171123185902   | Create book    |
|   up  |   20171128211826 |  Drop books    |
|   up  |  20171128211937  | Create authors |


* Now we need to update the books#index method that returns the json response to include the from ```render  json: books``` to ```render :json => books.to_json(except: [:authors_id], :include => :author)```; __:include__ allows us to load nested relationships in a hash that can provided while the json rendering phase is de-referencing the ```books``` instance variable.

* In the spec folder, I've modified spec/models/book_spec.rb and spec/models/books_controller.rb plus added a new spec/models/author_spec.rb during author model generation. In the spec/models/book_spec.rb removed all references to author desired behaviors. And moved them to the spec/models/author_spec.rb and also made the necessary changes to spec/models/books_controller_spec.rb to use the new author model together with the modified book model.
