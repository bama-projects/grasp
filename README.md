# grasp #

## Travis, Codeclimate, Heroku
[![Build Status](https://travis-ci.org/bama-projects/grasp.svg?branch=master)](https://travis-ci.org/bama-projects/grasp)

[![Code Climate](https://codeclimate.com/github/bama-projects/grasp/badges/gpa.svg)](https://codeclimate.com/github/bama-projects/grasp)

[![Issue Count](https://codeclimate.com/github/bama-projects/grasp/badges/issue_count.svg)](https://codeclimate.com/github/bama-projects/grasp)

Heroku Staging: https://grasp-stage.herokuapp.com/

Current Heroku Production: http://grasp-ba.herokuapp.com

## Production configurations:
   - config.action_mailer has to be configured for the target host.
   - config/initializers/devise.rb : config.mailer_sender

## Database setup:
Grasps uses postgres in production.
As of Dec 2015, there was no setup (or test cases) for sqlite. Probably, only
the devise inet fields are needed for postgres. 

### Travis Database setup (test):
- Travis CI tests both with sqlite and postgres. For this, database.yml.travis is copied over database.yml. It has a switch on the DB env variable. See also .travis.yml for the scripts called.
- as the very first migration uses the postgres specific inet type, the database migrations will not run on sqlite. use
    rake db:schema:load
instead.

### Local Database setup (development, test):
- Currently only postgres. database.yml contains a switch to check for
config/database.yml.local, which can hold your local database configuration
wich is .gitignore'd .
Load the schema for sqlite; running all migrations from scratch won't work.
    ratom ake db:schema:load

### Heroku Database setup
Is handled by heroku.
