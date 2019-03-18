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
