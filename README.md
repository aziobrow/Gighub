# GigHub Application

## About

This is an application done as part of the [Little Shop Project for Turing](http://backend.turing.io/module2/projects/little_shop). The purpose is to provide a site where users can connect with contractors for various services. 

Functionality of the site is defined through [User Stories](http://backend.turing.io/module2/projects/little_user_stories).

## Getting Started

This project uses the Ruby on Rails framework, which can be installed from [here](http://installrails.com/). 
[Bundler](http://bundler.io/) is used to install the gems needed for this application.

In order to run this appication in the development environment, perform the following in the CLI:

```
bundle install
rake db:create db:migrate db:seed
```

In order to spin-up the server, run: `rails s`

If data is seeded, the following credentials are available:

  Default User:
  
    *username: user
    
    *password: 1234
    
  Admin User:
  
    *username: user
    
    *password: 1234

## Testing

[Rspec-Rails](https://github.com/rspec/rspec-rails) is used for testing with [Capybara](https://github.com/teamcapybara/capybara) for feature tests. 
[Factory_Bot](https://github.com/thoughtbot/factory_bot) is used to create test data.

In order to run tests, perform the following:

`rake db:test:prepare`

`rspec`

[Launchy](https://github.com/copiousfreetime/launchy) will allow you to run `save_and_open_page` in any feature test in order to view an unstyled instance of the specific page when rspec is run.

## Contributers

Anna Lewis (@anlewi5), 
Aurora Ziobrowski (@aziobrow), 
Josi McClellan (@JosiMcClellan)
