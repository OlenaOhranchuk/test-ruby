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

## Setup

1. Clone this repository
2. Go to the root of the project
3. Set git hooks folder: `git config core.hooksPath hooks`
4. Install [Node.js](#nodejs)
5. Install [PostgreSQL](#postgresql)
6. Install [Redis](#redis)
7. Install [Ruby using Rbenv](#ruby_rbenv) if you don't already use RVM
8. Install bundler: `gem install bundler`
9. Bundle gems: `bundle install --path vendor/bundle`
10. Create your `database.yml` and `application.yml` files using examples in `config` folder
11. Generate a secret key with `bundle exec rake secret` and paste this value into the `application.yml`
12. Create databases: `bundle exec rake db:create`
13. Migrate databases: `bundle exec rake db:migrate`
14. Run seeds: `bundle exec rake db:seed`
15. Run tests to make sure they all pass: `bundle exec rspec`
16. Run the server: `bundle exec rails s`
17. You can now try your REST services!

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

## Code quality

With `rake code_analysis` you can run the code analysis tools, you can omit some rules with:

- [Rubocop](https://github.com/bbatsov/rubocop/blob/master/config/default.yml) Edit `.rubocop.yml`
- [Brakeman](https://github.com/presidentbeef/brakeman) Run `brakeman -I` to generate `config/brakeman.ignore`

## Guidance

### <a name="nodejs"></a> Node.js setup

1. `sudo apt update`
2. `sudo apt install nodejs`

### <a name="postgresql"></a> PostgreSQL setup

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

### <a name="redis"></a> Redis setup

1. Install redis-server:\
    `sudo apt update`\
    `sudo apt install redis-server`

2. Verify that the server is running using the following command:\
    `sudo systemctl status redis`

### <a name="ruby_rbenv"></a> Ruby / Rbenv setup

1. Install rbenv and ruby-build:\
    `sudo apt update`\
    `sudo apt install rbenv ruby-build`

2. Initialize rbenv when terminal starts:\
    `rbenv init`

3. The previous command should output something like this:\
    `# Load rbenv automatically by appending`\
    `# the following to ~/.bashrc:`\
    \
    `eval "$(rbenv init -)"`

4. You need to copy the last line (eval...) and past it at the end of your `.bashrc` file

5. Rbenv should be ready after reopening the terminal

6. (optional) Install ruby-build as a plugin if you need to get the latest versions of ruby:\
    `mkdir -p "$(rbenv root)"/plugins`\
    `git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build`

7. Install ruby version which is specified in `.ruby-version` file:\
    `rbenv install 2.x.x`

Some Rbenv commands:
- List available ruby versions: `rbenv versions`
- Show current ruby version set by rbenv: `rbenv version`
- List available for installation ruby versions: `rbenv install -l`
- Install a new ruby version: `rbenv install 2.4.1`
- List other rbenv commands: `rbenv help`
- Set a ruby version for a shell session (for a current open terminal tab): `rbenv shell 2.4.1`

Ruby version can be set by `.ruby-version` file in the root of a project.

Useful links:
- https://github.com/rbenv/rbenv
- https://github.com/rbenv/ruby-build

## Swagger API documentation (if you need to setup it in another project)

1. Download Swagger UI at https://github.com/swagger-api/swagger-ui
2. Copy `dist` folder from Swagger UI project to `publinc/swagger/` in your project
3. Add this route to your `config/routes.rb` file:\
    `get 'api' => redirect('/swagger/dist/index.html?url=/api/open_api.json')`
4. Install RSpec API documentation gem: https://github.com/zipmark/rspec_api_documentation
5. Set these configuration options in your `spec/spec_helper.rb` file:
    ```
    RspecApiDocumentation.configure do |config|
      config.docs_dir = Rails.root.join("public", "api")
      config.format = :open_api
      config.request_body_formatter = Proc.new { |params| params.to_json }
      config.client_method = :api_client
    end
    ```
6. Add a few tests to spec/acceptance folder.
7. Generate JSON file for Swagger: `bundle exec rake docs:generate`
8. Check if swagger works correctly by visiting http://localhost:3000/api
