##1st thing we need to do to start our rails app is:
    - rails new "name of the app"
      - this does the following:
          - creates a bunch of folders and files
          - runs bundle install:
            - bundler is a gem that grabs all the gems out of the box that comes with a default rails app and installs them => creates a sandbox and later on we can add gems as needed.
      - now we should have a full app with a ton of folders.
      - Rails follows the MVC framework
      - User makes req received by the router
      - Router handles the request and directs it to the appropriate controller
      - The controller either renders a view OR reaches out to the Model layer of your app, which communicates with the DB and gets info or adds info
      - The the model reaches back out to the controller with the rendered info in the view which the client finally sees

      - Important folders: App and config
