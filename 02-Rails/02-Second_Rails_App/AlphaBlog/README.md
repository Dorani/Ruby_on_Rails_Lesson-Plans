# README


* Database creation
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

  - now we need to communicate with the table:
      - create the model
      - under app
      - models, right click new file, article.rb
      - create a class called Article that has a subclass from ApplicationRecord::Base
      - with the magic of rails, just because we created the model => rails gives us getters an setters for the table attributes ie the columnms
      - we can test it out from the rails console:
          - the console gives you direct access to the DB
          - can be used as a sandbox
