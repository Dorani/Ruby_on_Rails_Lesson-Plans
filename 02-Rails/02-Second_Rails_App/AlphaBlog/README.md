# README

# Backend Data Creation and Manipulation Actions from the Rails Console

## Database creation

  - Articles table will have a title and description
  - to build it:
    - we generate a migration:
        - ```rails generate migration create_articles```
        - go into the db directory
        - check out the migrate directory
        - take a look at the migration file and add:
            ``` t.string :title```
            - this is ultimately a column in the table called title that is type of string
        - once saved, go into the console and type in:
            ``` rails db:migrate``` to initiate migration of the new database attributes

        - this creates a schema and seeds file:
          - we have an articles table with string title

  - if you want to start from scratch and update the migration file just type in ```"rails db:rollback"```

  - added columms without using rails db:rollback and essentially used ```"rails generate migration add_description_to_articles"``` and then manually added the changes in the migration file before running "rails db migrate"

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
                      ```- article = Article.new
                      - article.title = "my first article"
                      - article.description = "my first review"```
                - then you need to save this to the db:
                    ```- article.save:```
                      - which generates a sql query which handles this transaction, injects all the values and commits it to the table.
                - now if you type Article.all you should see the single instances added.

            - another way would be like this:
              ```  - article = Article.new(title: "new title alert", description: "new review alerts on deck")```

            - another way:
              ```  - Article.create(title: "one more for the mind", description: "new reviews are here!")```
                  - this will create, insert and save all at once!

### Editing and Deleting

  - in order to edit an article, we need to first grab it:
      ```
      - article = Article.find(2) => this grabs the second article
      - article.title = "updates to article" => here we specify which attribute of the article obj we want to edit
      - article.save => save the updates made for the particlular id of articles

      ```


 - in order to delete/destroy an article, we need to grab the article first:
 ```
    - article = Article.find(3)
    - article.destroy
```
      - this will delete from articles table where id = 3

## Data Integrity

### Validation That Enforce Constraints:

 - In our article.rb file in the model directory we need to force a Validation on all the attributes that require inputs. So before the object I create hits the DB, it will ensure that it is in fact a tilte. Otherwise it will not save:
    ```- validates :title, presence: true```
        - if incorrect inputs were initiated then we get an error code => articles.errors.any? this will give you true
        - to know what those errors are you need to type the following:
          - article.erros.full_message and it will say "title can't be blank"
    - you can add more validation with amount of characters that are required to be inputed to really enforce:

        ```- length: {minimum: 10, maximum: 300}```



# CRUD On The Browser

## Lifecyle of an Article

  - 1st we need to initiate an instance variable with the @ sign and it takes place in article controller
  ```@ article = Article.new ```
  - 2nd add the attributes like the title and description which we will be getting from our form,  at a particlular path, then a submit button
  - 3rd once submit button is pushed that will go back to the controller and handled by the create action
    - the create action will take the attributes and white list them ie strong parameters
      - once white listed the creaet action will need to create a new instance varible with these tile and description values, then gets validated, then gets pushed to the DB and creates a new row


### Add a Route

  - config/routes.rb file => add ```resources :articles```
      - gives us a new article path, a post to create articles, an edit article path, patch to update articles, delete article path, show article path and index article path. All by using that line above.

      - ```routes path HTTP verb link controller#action
      articles index articles GET /articles articles#index
      new article new_article GET /articles/new articles#new
      create article POST /articles articles#create
      edit article edit_article GET /articles/:id articles#edit
      update article PATCH /articles/:id articles#update
      show article article GET /articles/:id articles#show
      delete article DELETE /articles/:id articles#destroy```

  - then we build articles controller
    - controllers, create => articles_controller.rb
    - articles_controller.rb where ```ArticlesController < ApplicationController```
  - then we need to build an article view:
    - views/new folder and call it articles
      - new file, new.html.erb
      - create an article h1 tag
      - and now the articles/new page should work


- To create articles controller with a new action, under app/controllers create a file named articles_controller.rb (snake case):

```
    class ArticlesController < ApplicationController

    def new

    @article = Article.new

    end

    end
```
- To create a view, under app/views create a folder named articles and within it create a file named new.html.erb then fill in the following:

```
    <h1>Create an article</h1>

    <%= form_for @article do |f| %>

    <p>

    <%= f.label :title %><br/>

    <%= f.text_field :title %>

    </p>

    <p>

    <%= f.label :description %><br/>

    <%= f.text_area :description %>

    </p>

    <p>

    <%= f.submit %>

    </p>

    <% end %>
```
- Create action and private article_params method for string parameters in the articles controller (Note: This is not complete):
```
    def create

    @article = Article.new(article_params)

    @article.save

    redirect_to article_path(@article)

    end

    private

    def article_params

    params.require(:article).permit(:title, :description)

    end
```
