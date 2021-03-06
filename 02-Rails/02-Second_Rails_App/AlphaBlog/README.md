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


## Complete HomePage - Text Directions and Code:

  - After completion of the prior video, below is what the application.html.erb looks like:
```
<!DOCTYPE html>

<html>

<head>

<title>AlphaBlog</title>

<%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track' => true %>

<%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>

<%= csrf_meta_tags %>

</head>

<body>

<%= render 'layouts/navigation' %>

<%= render 'layouts/messages' %>

<div class="container">

<%= yield %>

</div>

<%= render 'layouts/footer' %>

</body>

</html>
```
  - The image to be added as background for the jumbotron should be added in the app/assets/images folder

  - Below is what the custom.css.scss file looks like:
```
$navbar-default-bg: black;

@import "bootstrap-sprockets";

@import "bootstrap";

#logo {

float: left;

font-size: 1.7em;

color: #fff;

text-transform: uppercase;

letter-spacing: -1px;

font-weight: bold;

}

#logo:hover {

color: #fff;

text-decoration: none;

}

.center {

text-align: center;

}

.jumbotron {

background-image: asset-url('new_cover_page.png');

background-size: cover;

height: 550px;

}

.jumbotron h1 {

color: #fff;

text-align: center;

margin-bottom: 30px;

letter-spacing: -1px;

font-weight: bold;

}

.btn-xlarge {

font-size: 1.7em;

background-color: black;

}

footer {

margin-top: 45px;

padding-top: 5px;

border-top: 1px solid #eaeaea;

color: #777;

}

footer a:hover {

color: #222;

}

footer small {

float: left;

}

footer ul {

float: right;

list-style: none;

}

footer ul li {

float: left;

margin-left: 15px;

}
```

  - Below is what the _navigation.html.erb file looks like:
```
<nav class="navbar navbar-default">

<div class="container-fluid">

<!-- Brand and toggle get grouped for better mobile display -->

<div class="navbar-header">

<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">

<span class="sr-only">Toggle navigation</span>

<span class="icon-bar"></span>

<span class="icon-bar"></span>

<span class="icon-bar"></span>

</button>

<%= link_to "Alpha blog", root_path, class: "navbar-brand", id: "logo" %>

</div>

<!-- Collect the nav links, forms, and other content for toggling -->

<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

<ul class="nav navbar-nav">

<li><%= link_to "Articles", articles_path %></li>

<li><a href="#">Link</a></li>

<li class="dropdown">

<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Actions <span class="caret"></span></a>

<ul class="dropdown-menu">

<li><%= link_to "New Article", new_article_path %></li>

<li><a href="#">Another action</a></li>

<li><a href="#">Something else here</a></li>

<li role="separator" class="divider"></li>

<li><a href="#">Separated link</a></li>

<li role="separator" class="divider"></li>

<li><a href="#">One more separated link</a></li>

</ul>

</li>

</ul>

<form class="navbar-form navbar-left" role="search">

<div class="form-group">

<input type="text" class="form-control" placeholder="Search">

</div>

<button type="submit" class="btn btn-default">Submit</button>

</form>

<ul class="nav navbar-nav navbar-right">

<li><a href="#">Link</a></li>

<li class="dropdown">

<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>

<ul class="dropdown-menu">

<li><a href="#">Action</a></li>

<li><a href="#">Another action</a></li>

<li><a href="#">Something else here</a></li>

<li role="separator" class="divider"></li>

<li><a href="#">Separated link</a></li>

</ul>

</li>

</ul>

</div><!-- /.navbar-collapse -->

</div><!-- /.container-fluid -->

</nav>

Below is what the _footer.html.erb file looks like:

<div class="container">

<footer class="footer">

<small>

Copyright © <a href="enter in a link here">The Complete Ruby on Rails Developer</a>

by <a href="enter in a link here">Mashrur Hossain</a>

</small>

<nav>

<ul>

<li><%= link_to "About", about_path %></li>

</ul>

</nav>

</footer>

</div>
```


## Style Form template

  - In the new and edit.html.erb files in the app/views/articles folder add the align center to h1 tags:
```
<h1 align="center">Edit existing article</h1>

<h1 align="center">Create new article</h1>
```

  - Below is the current state of the _form.html.erb partial after styling the form portion:
```
<% if @article.errors.any? %>

<h2>The following errors prevented the article from getting created</h2>

<ul>

<% @article.errors.full_messages.each do |msg| %>

<li><%= msg %></li>

<% end %>

</ul>

<% end %>

<div class='row'>

<div class='col-xs-12'>

<%= form_for(@article, :html => {class: "form-horizontal", role: "form"}) do |f| %>

<div class="form-group">

<div class="control-label col-sm-2">

<%= f.label :title %>

</div>

<div class="col-sm-8">

<%= f.text_field :title, class: "form-control", placeholder: "Title of article", autofocus: true %>

</div>

</div>

<div class="form-group">

<div class="control-label col-sm-2">

<%= f.label :description %>

</div>

<div class="col-sm-8">

<%= f.text_area :description, rows: 10, class: "form-control", placeholder: "Body of article" %>

</div>

</div>

<div class="form-group">

<div class="col-sm-offset-2 col-sm-10">

<%= f.submit class: 'btn btn-primary btn-lg' %>

</div>

</div>

<% end %>

<div class="col-xs-4 col-xs-offset-4">

[ <%= link_to "Cancel request and return to articles listing", articles_path %> ]

</div>

</div>

</div>
```


## Style Messages

   - In your articles_controller.rb file change the flash[:notice] to be flash[:success], there should be 3 such occurances in that file

   - Update your _messages.html.erb file with the following code:
```
<div class="row">

<div class="col-xs-10 col-xs-offset-1">

<% flash.each do |name, msg| %>

<div class='alert alert-<%="#{name}" %>'>

<a href="#" class="close" data-dismiss="alert">×</a>

<%= content_tag :div, msg, :id => "flash_#{name}" if msg.is_a?(String) %>

</div>

<% end %>

</div>

</div>
```

  - Update your _form.html.erb at the top to remove the error portion and replace it with the following:
```
<%= render 'shared/errors', obj: @article %>
```

  - Create a folder called shared under app/views/ folder. Then within the shared folder file named _errors.html.erb to create the errors partial, then fill it in with the following code:
```
<% if obj.errors.any? %>

<div class="row">

<div class="col-xs-8 col-xs-offset-2">

<div class="panel panel-danger">

<div class="panel-heading">

<h2 class="panel-title">

<%= pluralize(obj.errors.count, "error") %>

prohibited this article from being saved:

</h2>

<div class="panel-body">

<ul>

<% obj.errors.full_messages.each do |msg| %>

<li><%= msg %></li>

<% end %>

</ul>

</div>

</div>

</div>

</div>

</div>

<% end %>
```

## Style Show View

  - Articles show page, show.html.erb:
```
<h2 align="center">Title: <%= @article.title %></h2>

<div class="well col-xs-8 col-xs-offset-2">

<h4 class="center description"><strong>Description:</strong></h4>

<hr>

<%= simple_format(@article.description) %>

<div class="article-actions">

<%= link_to "Edit this article", edit_article_path(@article), class: "btn btn-xs btn-primary" %>

<%= link_to "Delete this article", article_path(@article), method: :delete,

data: { confirm: "Are you sure you want to delete the article?"},

class: "btn btn-xs btn-danger" %>

<%= link_to "View all articles", articles_path, class: "btn btn-xs btn-success" %>

</div>

</div>

Add the following classes to custom.css.scss page:

.article-actions {

border-top: 1px solid #eaeaea;

padding-top: 5px;

}

.description {

margin-top: 0;

}

```


## Create Users

   - To create a feature branch:
```
git checkout -b nameofbranch
```
  - To create a feature branch named create-users:
```
git checkout -b create-users
```
  - To view list of branches:
```
git branch
```
  - To move to master branch:
```
git checkout master
```
  - To move to already created feature branch:
```
git checkout nameofbranch
```
  - Important to remember is to always have master branch deployable to production and work on all new features and additions in feature branches

### To create a migration to create users table:
```
rails generate migration create_users
```
  - Then within the migration file add in the following within the create_table block to add the username, email and timestamps columns (created_at and updated_at):
```
t.string :username

t.string :email

t.timestamps
```
  - To run the migration file and create the users table:
```
rake db:migrate
```
  - Add a user.rb model file under app/models folder and fill in the following:
```
class User < ActiveRecord::Base

end
```

  - Then start rails console and test out connections:
```
rails console

User.all

User

user = User.create(username: "Seif", email: "test@example.com")

user = User.create(username: "test2", email: "test2@example.com")

To grab first user and update their email address:

user = User.find(1)

OR

user = User.first

user.email = "test3@example.com"

user.save

To destroy user with id = 2:

user = User.find(2)

user.destroy
```

```

To make a commit of the changes made in the feature branch:

git add -A

git commit -m "create users table and user model"

To merge the changes in the feature branch to the master branch first switch to master branch:

git checkout master

git merge nameofbranch

git push to push code to repository

To delete a feature branch that is no longer needed and has been merged to master already:

git branch -d nameofbranch

To delete a feature branch that is no longer needed but has NOT been merged to master:

git branch -D nameofbranch

```


## Add User Validations

Validations for User class:

- username must be present and unique

- email must be present and unique

- validate email format using regex

  - user.rb model file after validations added:
```
class User < ActiveRecord::Base

validates :username, presence: true,

uniqueness: { case_sensitive: false },

length: { minimum: 3, maximum: 25 }

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

validates :email, presence: true, length: { maximum: 105 },

uniqueness: { case_sensitive: false },

format: { with: VALID_EMAIL_REGEX }

end
```


## One to Many Association

  - To generate a migration to add user_id column to articles table:
```
rails generate migration add_user_id_to_articles
```

  - Then within the change method:
```
add_column :articles, :user_id, :integer
```

  - Then run the migration file to effect the change:
```
rails db:migrate
```

  - Add the following line to article.rb model file:
```
belongs_to :user
```

  - Add the following line to user.rb model file:
```
has_many :articles
```

  - Also add the following line to user.rb model file(this has nothing to do with the association):
```
before_save { self.email = email.downcase }
```

  - Ensure you have a couple of users created by using the rails console. Then add in 1 line to grab a user to the create action to temporarily hardcode a user to articles:
```
def create

@article = Article.new(article_params)

@article.user = User.first

if @article.save

flash[:success] = "Article was successfully created"

redirect_to article_path(@article)

else

render 'new'

end

end
```

  - Ensure you get rid of the debugger line if you no londer need it within the create action, you can add that line as you need to your actions if you want to pause execution of a request

  - You can add in the following line to display the debug(params) to your development environment UI output:
```
(this will be in the app/views/layouts/application.html.erb file under render footer and above </body>)

<%= debug(params) if Rails.env.development? %>

```


## Show User Info in Articles

  - Add the following code to the index.html.erb file under app/views/articles folder within the div for article-body and under the article.description:
```
<div class="article-meta-details">

<small>Created by: <%= article.user.username if article.user%>,

<%= time_ago_in_words(article.created_at) %> ago,

last updated: <%= time_ago_in_words(article.updated_at) %> ago</small>

</div>
```

  - And then add styling to a new article-meta-details class in the custom.css.scss page under the app/assets/stylesheets folder:

```
.article-meta-details {

border-top: 1px solid #eaeaea;

margin-top: 15px;

}
```


## Add Secure Password

![Test Image 1](user_auth.png)

  - To create a migration to add password_digest column to users table:
```
rails generate migration add_password_digest_to_users
```

  - Then pull up the migration file and fill in the column details within the def change block:
```
add_column :users, :password_digest, :string
```

  - Then save the file and run rake db:migrate to make the change to the table

  - In the model file (user.rb) add the following method:
```
has_secure_password
```

  - In the gemfile add the gem:
```
gem 'bcrypt', '~> 3.1.12'
```

  - Run the following from the command line:
```
bundle install
```

  - Test it out from the rails console by creating a couple of test users and updating password for an existing user

  - To authenticate and test password for a user, first grab the user:
```
user = User.last # (or User.find(enter id of user here))

user.authenticate("providecorrectpassword") # This will return the user object

user.authenticate("enterincorrectpassword") # This will return false

```

## New User Signup

  - To add the route for the new form add the following two lines to the routes.rb file:
```
get 'signup', to: 'users#new'

resources :users, except: [:new]
```
  - Create a file under app/controllers folder called users_controller.rb and fill in the following:
```
class UsersController < ApplicationController

def new

@user = User.new

end

def create

@user = User.new(user_params)

if @user.save

flash[:success] = "Welcome to the alpha blog #{@user.username}"

redirect_to articles_path

else

render 'new'

end

end

private

def user_params

params.require(:user).permit(:username, :email, :password)

end

end
```

  - To create a view, first create a folder called users under the app/views directory, then within it create a new file called new.html.erb and fill in the following code:
```
<h1 align="center">Signup for Alpha Blog</h1>

<%= render 'shared/errors', obj: @user %>

<div class='row'>

<div class='col-xs-12'>

<%= form_for(@user, :html => {class: "form-horizontal", role: "form"}) do |f| %>

<div class="form-group">

<div class="control-label col-sm-2">

<%= f.label :username %>

</div>

<div class="col-sm-8">

<%= f.text_field :username, class: "form-control", placeholder: "Enter username", autofocus: true %>

</div>

</div>

<div class="form-group">

<div class="control-label col-sm-2">

<%= f.label :email %>

</div>

<div class="col-sm-8">

<%= f.email_field :email, class: "form-control", placeholder: "Enter email" %>

</div>

</div>

<div class="form-group">

<div class="control-label col-sm-2">

<%= f.label :password %>

</div>

<div class="col-sm-8">

<%= f.password_field :password, class: "form-control", placeholder: "Enter password" %>

</div>

</div>

<div class="form-group">

<div class="col-sm-offset-2 col-sm-10">

<%= f.submit "Sign up", class: 'btn btn-primary btn-lg' %>

</div>

</div>

<% end %>

<div class="col-xs-4 col-xs-offset-4">

[ <%= link_to "Cancel request and return to articles listing", articles_path %> ]

</div>

</div>

</div>
```

  - Now test out signing up a couple of users from the UI (sign up a couple of invalid ones too to ensure the validations are working and displaying correctly)

  - Then you can test them out from the rails console

## Edit Users

  - First add the following two actions in the users_controller.rb file:
```
def edit

@user = User.find(params[:id])

end
```

```
def update

@user = User.find(params[:id])

if @user.update(user_params)

flash[:success] = "Your account was updated successfully"

redirect_to articles_path

else

render 'edit'

end

end
```
  - Then create a _form.html.erb form partial file under the app/views/users folder and fill it in with the following code:

```
<%= render 'shared/errors', obj: @user %>

<div class='row'>

<div class='col-xs-12'>

<%= form_for(@user, :html => {class: "form-horizontal", role: "form"}) do |f| %>

<div class="form-group">

<div class="control-label col-sm-2">

<%= f.label :username %>

</div>

<div class="col-sm-8">

<%= f.text_field :username, class: "form-control", placeholder: "Enter username", autofocus: true %>

</div>

</div>

<div class="form-group">

<div class="control-label col-sm-2">

<%= f.label :email %>

</div>

<div class="col-sm-8">

<%= f.email_field :email, class: "form-control", placeholder: "Enter email" %>

</div>

</div>

<div class="form-group">

<div class="control-label col-sm-2">

<%= f.label :password %>

</div>

<div class="col-sm-8">

<%= f.password_field :password, class: "form-control", placeholder: "Enter password" %>

</div>

</div>

<div class="form-group">

<div class="col-sm-offset-2 col-sm-10">

<%= f.submit(@user.new_record? ? "Sign up" : "Update account", class: 'btn btn-primary btn-lg') %>

</div>

</div>

<% end %>

<div class="col-xs-4 col-xs-offset-4">

[ <%= link_to "Cancel request and return to articles listing", articles_path %> ]

</div>

</div>

</div>
```

  - The updated new.html.erb file under app/views/users folder should look like below:
```
<h1 align="center">Sign up for Alpha Blog</h1>

<%= render 'form' %>
```

  - Create a new file under app/views/users called edit.html.erb and fill it in with the following code:
```
<h1 align="center">Edit your account</h1>

<%= render 'form' %>
```

  - Test out creating and editing a couple of users from the browser
