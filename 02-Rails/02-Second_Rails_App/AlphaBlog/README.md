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


### Create New Articles from UI

  - config/routes.rb file => add ```resources :articles```
      - gives us a new article path, a post to create articles, an edit article path, patch to update articles, delete article path, show article path and index article path. All by using that line above.

   ```
      - routes path HTTP verb link controller#action

      - articles index articles GET /articles         articles#index

      - new article new_article GET /articles/new articles#new  
      create article POST /articles articles#create

      - edit article edit_article GET /articles/:id
      articles#edit
      update article PATCH /articles/:id articles#update

      - show article article GET /articles/:id articles#show

      - delete article DELETE /articles/:id articles#destroy

  ```

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



### Complete New and Show Actions :
```
def create

  @article = Article.new(article_params)

  if @article.save

    flash[:notice] = "Article was successfully created"

    redirect_to article_path(@article)

  else

    render 'new'

  end

end
```
  - Flash message code added to application.html.erb under app/views/layouts folder (right under <body> and above <%= yield %>:
```
<% flash.each do |name, msg| %>

  <ul>
    <li><%= msg %></li>
  </ul>

<% end %>
```
  - Code added to display errors in the new.html.erb template under app/views/articles folder:
```
<% if @article.errors.any? %>

<h2>The following errors prevented the article from getting created</h2>

<ul>

  <% @article.errors.full_messages.each do |msg| %>

    <li><%= msg %></li>

  <% end %>

</ul>

<% end %>
```
  - To create the show action, add the following show method to articles_controller.rb file:
```
def show
  @article = Article.find(params[:id])
end
```

  - To create the show view, add a show.html.erb file under the app/views/articles folder and fill in the code:
```
<h1>Showing selected article</h1>

  <p>
    Title: <%= @article.title %>
  </p>
  <p>
    Description: <%= @article.description %>
  </p>
```

### Edit Articles
  - Route for editing articles takes the form ->

```/articles/:id/edit```

  - Edit action in the articles controller:
```
  def edit

    @article = Article.find(params[:id])

  end
```
  - Update action in the articles controller:
```
def update

  @article = Article.find(params[:id])

  if @article.update(article_params)

    flash[:notice] = "Article was successfully updated"

    redirect_to article_path(@article)

  else

    render 'edit'

  end

end
```
  - To create edit template, create a file named edit.html.erb under the app/views/articles folder and fill in the following code:
```
<h1>Edit existing article</h1>

<% if @article.errors.any? %>

<h2>The following errors prevented the article from getting created</h2>

<ul>
  <% @article.errors.full_messages.each do |msg| %>

    <li><%= msg %></li>

  <% end %>
</ul>

<% end %>

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

### List Articles and Layout Links

  - To create listings index first add the index action to acticles controller:
```
def index

@articles = Article.all

end
```

  - Create the view file index.html.erb under app/views/articles folder:
```
<h1>Listing all articles</h1>

<p>

<%= link_to "Create new article", new_article_path %>

</p>

<table>

<tr>

<th>Title</th>

<th>Description</th>

</tr>

<% @articles.each do |article| %>

<tr>

<td><%= article.title %></td>

<td><%= article.description %></td>

<td><%= link_to 'Edit', edit_article_path(article) %></td>

<td><%= link_to 'Show', article_path(article) %></td>

</tr>

<% end %>

</table>
```
  - Then update the views with links ->

      - show.html.erb:

```
<h1>Showing selected article</h1>

  <p>
    Title: <%= @article.title %>
  </p>

  <p>
    Description: <%= @article.description %>
  </p>

<%= link_to "Edit this article", edit_article_path(@article) %> |

<%= link_to "Back to articles listing", articles_path %>
```

  - Add the back to articles listing path to the bottom of both new.html.erb and edit.html.erb pages:
```
<%= link_to "Back to articles listing", articles_path %>
```

### Destroy and Partials

   - Add this link to the homepage (root route) so you can access the blog from the homepage:

  ```
  <%= link_to "Alpha Blog", articles_path %>
  ```

  - Under app/views/layouts folder create a _messages.html.erb file (messages partial) and remove the following code from application.html.erb to this file:
```
<% flash.each do |name, msg| %>

  <ul>

    <li><%= msg %></li>

  </ul>

<% end %>
```

  - In place of this code in the application.html.erb add the following code:
```
<%= render 'layouts/messages' %>
```

  - Create a file under app/views/articles folder called _form.html.erb and fill it in with the following code (copied from the new or edit.html.erb page):
```
<% if @article.errors.any? %>

<h2>The following errors prevented the article from getting created</h2>

  <ul>

  <% @article.errors.full_messages.each do |msg| %>

  <li><%= msg %></li>

  <% end %>

  </ul>

<% end %>

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

<%= link_to "Back to articles listing", articles_path %>
```

  - Then remove the code above from both new.html.erb and edit.html.erb files and in it's place add the following code:
```
<%= render 'form' %>
```

#### To add the destroy method, first add the following to the articles controller:
```
def destroy

  @article = Article.find(params[:id])

  @article.destroy

  flash[:notice] = "Article was successfully deleted"

  redirect_to articles_path

end
```

  - Then in the index.html.erb (listings page) add the following link as one of the <td> items under the show article link:
```
<td><%= link_to 'Delete', article_path(article), method: :delete, data: {confirm: "Are you sure?"} %></td>
```

### Install Bootstrap

  - Bootstrap sass gem page:

```https://github.com/twbs/bootstrap-sass```

   - Add the following gem to your gemfile above the gem 'sass-rails':
```
gem 'bootstrap-sass', '~> 3.3.5'
```
  - To install the gem to your app run:
```
bundle install --without production
```
  - Create a file called custom.css.scss under app/assets/stylesheets folder

  - Add the following lines to the file:
```
@import "bootstrap-sprockets";

@import "bootstrap";
```
  - Add the following line to your application.js file in the app/assets/javascripts folder under the line that says //= require jquery_ujs:
```
require bootstrap-sprockets
```
