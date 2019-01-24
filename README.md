# Rails API Template

Rails Api Base is a boilerplate project for JSON RESTful APIs.

## Features

This template comes with:
- Schema
  - Users table
  - Admin users table
- Endpoints
  - Sign up with user credentials
  - Sign in with user credentials
  - Sign out
  - Email confirmation
  - Reset password
  - Get and update user profile
- Administration panel for users
- Rspec tests
- Code quality tools
- Swagger API documentation

## How to use (TODO: change this)

1. Clone this repo
2. Install PostgreSQL in case you don't have it
3. Create your `database.yml` and `application.yml` file
4. `bundle install`
5. Generate a secret key with `rake secret` and paste this value into the `application.yml`.
6. `rake db:create`
7. `rake db:migrate`
8. `rspec` and make sure all tests pass
9. `rails s`
10. You can now try your REST services!

## Gems

- [ActiveAdmin](https://github.com/activeadmin/activeadmin) for easy administration
- [Annotate](https://github.com/ctran/annotate_models) for doc the schema in the classes
- [Better Errors](https://github.com/charliesome/better_errors) for a better error page
- [Brakeman](https://github.com/presidentbeef/brakeman) for static analysis security
- [Bullet](https://github.com/flyerhzm/bullet) help to kill N+1
- [Byebug](https://github.com/deivid-rodriguez/byebug) for debugging
- [Sidekiq](https://github.com/mperham/sidekiq) for background processing
- [Devise](https://github.com/plataformatec/devise) for basic auth
- [Devise Token Auth](https://github.com/lynndylanhurley/devise_token_auth) for api auth
- [Draper](https://github.com/drapergem/draper) for decorators
- [Factory Bot](https://github.com/thoughtbot/factory_bot) for testing data
- [Faker](https://github.com/stympy/faker) for generating test data
- [Figaro](https://github.com/laserlemon/figaro) for handling environment variables
- [Haml](https://github.com/haml/haml) for the template engine
- [Jbuilder](https://github.com/rails/jbuilder) for json views
- [Letter Opener](https://github.com/ryanb/letter_opener) for previewing a mail in the browser
- [Oj](https://github.com/ohler55/oj) for optimized json
- [Pry](https://github.com/pry/pry) for enhancing the ruby shell
- [Puma](https://github.com/puma/puma) for the server
- [Rack CORS](https://github.com/cyu/rack-cors) for handling CORS
- [RSpec](https://github.com/rspec/rspec) for testing
- [Rubocop](https://github.com/bbatsov/rubocop/) for ruby linting
- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) adds other testing matchers
- [Simplecov](https://github.com/colszowka/simplecov) for code coverage

## Optional configuration

- Set your [frontend URL](https://github.com/cyu/rack-cors#origin) in `config/initializers/rack_cors.rb`
- Set your mail sender in `config/initializers/devise.rb`
- Config your timezone accordingly in `application.rb`.

## Code quality

With `rake code_analysis` you can run the code analysis tools, you can omit some rules with:

- [Rubocop](https://github.com/bbatsov/rubocop/blob/master/config/default.yml) Edit `.rubocop.yml`
- [Brakeman](https://github.com/presidentbeef/brakeman) Run `brakeman -I` to generate `config/brakeman.ignore`

## Guidance

### Node.js installation

1. `sudo apt update`
2. `sudo apt install nodejs`

### PostgreSQL setup

1. Install PostgreSQL:\
    `sudo apt update`\
    `sudo apt install postgresql postgresql-contrib libpq-dev`

2. Switch over to postgres account and access PostgreSQL prompt:\
    `sudo -i -u postgres`\
    `psql`

3. Give postgres user a new password:\
    `\password postgres`

4. Create a new role named 'your_username':\
    `create role your_username with createdb login password 'your_password';`

5. Check that the role has been created:\
    `\du`

6. Exit from PostgreSQL prompt and postgres account:\
    `\q`\
    `exit`

Now PostgreSQL should be ready for your rails app.\
In your `database.yml` file you need to use the username and the password you created on the step 4.

Useful links:
  - https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04
  - https://www.howtoforge.com/tutorial/ruby-on-rails-ror-with-postgresql-on-ubuntu-16-04/
