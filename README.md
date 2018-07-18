# Envronment setup
# RVM install
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source /home/ubuntu/.rvm/scripts/rvm
```
If RVM is not a found command follow https://github.com/rvm/ubuntu_rvm

EB-CLI needs python 3.4

# Installing python 3.4 on Ubuntu

```
sudo apt-get install build-essential checkinstall
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
sudo apt-get install python3.4
```
Verify that 'python3 -V' returns '3.4.4' or higher

# Installing EB-CLI

```
sudo apt install python-pip
pip install awsebcli --upgrade --user
```

# Installing Ruby 2.5.1 and Rails 5.2, Node.js, Postgresql check versions with Ruby -v and Rails -v
```
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
rvm install 2.5.1
rvm use 2.5.1 --default
gem install rails
sudo apt-get -y install postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser -s YOUROWNUSERNAME
gem install aws-sdk

# Setup Postgres
https://www.howtoforge.com/tutorial/ruby-on-rails-ror-with-postgresql-on-ubuntu-16-04/

carencaren
```
sudo su - postgres
psql
\password postgres
(ENTER NEW PASSWORD)
create role rails_dev with createdb login password 'carencaren';
\du
```
verify new user rails_dev exists with create DB rights

ctrl+z, logout

# Create new rails project without defalt test suite, using postgresql database 



rails new api-only -T -d postgresql --api
rake db:create
rake db:migrate

## Gems
gem 'devise', '~>4.4.3'
gem 'devise-token_authenticatable', '<=1.0.1'
gem 'graphql', '~>1.8.5'
gem 'graphiql-rails

development group:
  gem 'faker'
gem 'rails-erd'
gem 'graphiql-rails', '1.4.4'

test group:
gem 'rspec-rails'
gem 'factory_bot_rails'
gem 'shoulda-matchers'

# to test
rake db:migrate && rake db:test:prepare
rspec



# do
bundle install
rails generate rspec:install
rails generate devise:install
rails g devise:views
rails generate devise User
rails generate mailer UserMailer

# Modify User
-remove comments in migration
-config actionmailer
-add :lockable, :confirmable to user.rb
rake db:migrate
rails g migration AddDetailstoUsers 
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string


add fields fname, lname, phone_number, address as strings
rails g migration add_authentication_token_to_users auth_token:string

  def change
    add_column :users, :auth_token, :string, default: ""
  end

rails generate graphql:install --batch
bundle install
rake db:migrate

# Make welcome page with
```
rails generate controller WelcomePage welcome
```
Page is stored at app/views/welcome_page/welcome.html.erb

add to config/routes.rb
```
Rails.application.routes.draw do
  get 'welcome_page/welcome'
  root 'welcome_page#welcome'
  end
 ```
 To make it the default landing

# DB seeds

add to seed.rb

User.create(email: "test@test.com", password: 'test', password_confirmation: 'test')
10.times do
User.create(email:  Faker::Internet.email, password: "password", password_confirmation: "password", fname: Faker::Name.first_name, lname: Faker::Name.last_name)

rake db:seed

rails g model Circle
rails g migration AddCircleRefToUsers circle:references

rails g graphql:object User fname:String lname:String email:String last_sign_in_at:String circle_id:Integer

# example test
make sure this is at the top of spec/spec_helper

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

see /spec/users.rb and /spec/models/user_spec.rb and /spec/helpers/users_helper_spec.rb for example tests

# to test
rake db:migrate && rake db:test:prepare && rspec