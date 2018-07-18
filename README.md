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
gem 'graphiql-rails'

# do
rails generate rspec:install
rails generate devise:install
rails generate graphql:install

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
