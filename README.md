# url-shortener project

The goal was create a web project to shorten urls.

I tried to maintain the structure as simple as I can, because it's a very small project.

I used Foreman for the application lifecycle management.

## Dependencies

* ruby@2.4.0
* sinatra@2.2.0
* redis@4.0.1
* bootstrap@4.0.0
* foreman@0.84.0

## Run Application
   ```
   $ bundle install
   
   $ foreman start &
   
   $ open http://localhost:9292/
   ```

## Run Application Tests
   ```
   $ brew install chromedriver
   
   $ rspec spec/
   ```
----

Leticia Fernandes (leticiacf.fernandes@gmail.com)
