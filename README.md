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
