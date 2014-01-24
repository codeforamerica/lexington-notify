# CivicRails App Template

This app template aims to be simple, beautiful, and easy to use. No fancy app generators here - just a Heroku ready Rails application with minimal dependencies, designed to encourage and enable collaboration.

## Install

```console
$ git clone https://github.com/invisiblefunnel/civic-rails my-civic-app
$ cd my-civic-app
$ rake rename[MyCivicApp]
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
$ rails s
```
