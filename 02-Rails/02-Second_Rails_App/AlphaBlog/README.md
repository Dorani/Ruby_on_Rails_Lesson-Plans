# README


## Database creation

  - Articles table will have a title and description
  - to build it:
    - we generate a migration:
        - rails generate migration create_articles
        - go into the db directory
        - check out the migrate directory
        - take a look at the migration file and add:
            - t.string :title
            - this is ultimately a column in the table called title that is type of string
        - once saved, go into the console and type in:
            - rails db:migrate to initiate migration of the new database attributes

        - this creates a schema and seeds file:
          - we have an articles table with string title

  - if you want to start from scratch and update the migration file just type in "rails db:rollback"

  - added columms without using rails db:rollback and essentially used "rails generate migration add_description_to_articles" and then manually added the changes in the migration file before running "rails db migrate"

  - now the schema should have all correct info

## Communicate with the DB
### Creating and Reading

  - we need to be able to get and set info to the tables:
      - create the model
      - under app
      - models, right click new file, article.rb
        - create a class called Article that has a subclass from ApplicationRecord::Base
        - with the magic of rails, just because we created the model => rails gives us getters an setters for the table attributes ie the columnms
          - we can test it out from the rails console:
              - the console gives you direct access to the DB
              - can be used as a sandbox
              - so to test it out type in "Article":
                - you should all the data types associated with your attributes and details
                - now type "Article" and you should see all the attributes with null values
                - now to add to it we simple create a new instance article and make it equal to the Article model with the new method attached:
                      - article = Article.new
                      - article.title = "my first article"
                      - article.description = "my first review"
                - then you need to save this to the db:
                    - article.save:
                      - which generates a sql query which handles this transaction, injects all the values and commits it to the table.
                - now if you type Article.all you should see the single instances added.

            - another way would be like this:
                - article = Article.new(title: "new title alert", description: "new review alerts on deck")

            - another way:
                - Article.create(title: "one more for the mind", description: "new reviews are here!")
                  - this will create, insert and save all at once!

### Edit and Delete and Validation

  - in order to edit an article, we need to first grab it:
      - article = Article.find(2) => this grabs the second article
      - article.title = "updates to article" => here we specify which attribute of the article obj we want to edit
      - article.save => save the updates made for the particlular id of articles


 - in order to delete/destroy an article, we need to grab the article first:
    - article = Article.find(3)
    - article.destroy
      - this will delete from articles table where id = 3
