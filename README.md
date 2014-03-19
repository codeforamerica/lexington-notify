# Notification application

This is an example of a simple application that

* Allows admins to select a subset of users to send sms and email notifications.
* Allows users to select sms or email notifications


## Install

Based on the the [civic rails template](https://github.com/invisiblefunnel/civic-rails), optimized for heroku.

```console
$ git clone git@github.com:eeeschwartz/notify.git
$ cd notify
$ bundle install
$ cp .env.test-sample .env.test
$ vim .env.test # set twilio credentials
$ RAILS_ENV=test rake db:create db:migrate
$ rspec spec
$ cp .env.development-sample .env.development
$ rake db:create db:migrate
$ rails server
```

## Deploy

See the [Getting Started](https://devcenter.heroku.com/articles/quickstart) guide if you haven't used Heroku before.

```console
$ heroku create <app name>
$ heroku addons:add pgbackups:auto-month # recommended
$ heroku config:set SECRET_KEY_BASE=`bundle exec rake secret`
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```
