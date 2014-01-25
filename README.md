# CivicRails App Template

This app template aims to be simple, beautiful, and easy to use. No fancy app generators here - just a Heroku ready Rails application with minimal dependencies, designed to encourage and enable collaboration.

## Install

```console
$ git clone https://github.com/invisiblefunnel/civic-rails my-civic-app
$ cd my-civic-app
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
$ rake # run the complete test suite
$ rails s
```

## Customize

Renaming the application is easy with the provided rake task. Pass the desired name as an argument to the rake task and all of the constants and database names will be updated.

```console
$ rake rename[MyCivicApp]
$ git add .
$ git commit -m "Rename to MyCivicApp"
```
