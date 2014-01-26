# CivicRails App Template

This app template aims to be simple, beautiful, and easy to use. No fancy app generators here - just a Heroku ready Rails application with minimal dependencies, designed to encourage and enable collaboration.

## Install

```console
$ git clone https://github.com/invisiblefunnel/civic-rails my-civic-app
$ cd my-civic-app
$ bundle install
$ rake db:create db:schema:load db:test:prepare
$ rake # run the complete test suite
$ rails s
```

## Customize

Renaming the application is easy with the provided rake task. Pass the desired name as an argument and all of the constants and database names will be updated.

```console
$ rake rename[MyCivicApp]
$ rake db:create db:schema:load db:test:prepare # setup new databases
$ rake # confirm that the test suite passes
$ git add .
$ git commit -m "Rename to MyCivicApp"
```

## Deploy

See the [Getting Started](https://devcenter.heroku.com/articles/quickstart) guide if you haven't used Heroku before.

```console
$ heroku create <app name>
$ heroku labs:enable user-env-compile
$ heroku addons:add pgbackups:auto-month # recommended
$ heroku config:set SECRET_KEY_BASE=`rake secret`
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```
