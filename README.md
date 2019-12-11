# BIMS API Client

Allows your project to connect to the BIMS platform and perform integration operations using your account.
 
Please visit http://www.getbims.com/ for more information

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bims_api_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bims_api_client

## Requirements

* Ruby 2.x.x
* Redis

## Usage

Just `include` it :)

```
include BimsApiClient
```

And initialize the configuration

```
  BimsApiClient.configure do |config|
    config.redis_url = ENV['BAC_REDIS_URL'] #Your Redis instance URL
    config.username = ENV['BAC_USERNAME'] #Your BIMS username
    config.password = ENV['BAC_PASSWORD']#Your BIMS password
    config.instance_name = ENV['BAC_INSTANCE_NAME'] #Your BIMS Instance name
    config.instance_url = ENV['BAC_INSTANCE_URL'] #Your BIMS Instance URL (Include the /api)
  end
  #And initialize the client
  BimsApiClient.init
```

Then use the methods: 
```
BimsApiClient.login
BimsApiClient.logout
(more to come...)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cmelgarejo/bims_api_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

