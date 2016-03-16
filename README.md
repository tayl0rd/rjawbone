# Rjawbone

<dl>
  <dt>Homepage</dt><dd><a href="#">homepage</a></dd>
  <dt>Author</dt><dd><a href="">Taylor Daugherty</a></dd>
  <dt>Documentation</dt><dd><a href="#">Ruby Gems</a></dd>
</dl>

[![Build Status](https://travis-ci.org/tylrd/rjawbone.svg?branch=master)](https://travis-ci.org/tylrd/rjawbone)
[![Code Climate](https://codeclimate.com/github/tylrd/rjawbone/badges/gpa.svg)](https://codeclimate.com/github/tylrd/rjawbone)
[![Test Coverage](https://codeclimate.com/github/tylrd/rjawbone/badges/coverage.svg)](https://codeclimate.com/github/tylrd/rjawbone/coverage)
[![Inline docs](http://inch-ci.org/github/tylrd/rjawbone.svg?branch=master)](http://inch-ci.org/github/tylrd/rjawbone)
[![Dependency Status](https://gemnasium.com/tylrd/rjawbone.svg)](https://gemnasium.com/tylrd/rjawbone)

## Installation

```ruby
gem install rjawbone
```


## Configuration

```ruby
Rjawbone.configure do |config|
  config.client_id = ENV['JAWBONE_CLIENT']
  config.client_secret = ENV['JAWBONE_SECRET']
  config.redirect_uri = redirect_uri
  config.scope = %w(basic_read sleep_read move_read) # any scope you need here
end
```

For a rails project, you can put this in `config/initializers/rjawbone.rb`.


## Authentication

This gem provides two helper methods for following the OAuth 2.0 flow.

```ruby
# Returns a url for your configured jawbone application
Rjawbone::Oauth.authorization_url 

# Exchanges the authorization code for an access token
Rjawbone::Oauth.exchange_code(code)
```

After obtaining an access token, you will need to persist it.

[Here](https://jawbone.com/up/developer/authentication) you can read about the authorization flow.

## Client

The API calls are made by initializing a Rjawbone client object. 

```ruby
Rjawbone::Client.new(access_token: ACCESS_TOKEN, refresh_token: REFRESH)

# OR

Rjawbone::Client.new do |config|
  config.access_token = TOKEN
  config.refresh_token = REFRESH
end
```

After initializing the client object, you can retrieve any object allowed by your configured scope.

## Resources

```ruby
# Returns a Rjawbone::Model::List object
list = client.move_list

# The list object has methods that assist in retrieving information:

# Pagination
list.next_page

# Enumerability
list.map {|move| move.ticks}
list.select {|move| move.details.distance >= 5000}
```

## TODO


