# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  - Heroku does not support sqlite3, so we will need to move it down to group dev test area of our gemfile.
  - add a group for production and add the gems necessary for that
    - gem 'pg' and gem 'rails_12factor'
  - then run bundle install --without production

  - heroku login:
    - enter email and password
    - create an app in heroku for our local version
    - make sure you are in your directory and type the following: 'heroku create'
        - creates an app with a random app name

    - now push your app to heroku
        - git push heroku master
        - if you want to rename your app type in:
          - heroku rename 'app name'

* ...
