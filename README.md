# Ndhash

N-dimension hash creation and utilities. Good for testing multi-level hash and JSON processing.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ndhash'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ndhash

## Usage

```ruby
require 'ndhash'

# Generate hash with custom number of levels, number of key-value pairs and hashes per level
NDHash.generate(levels:2, values_per_level:2, hashes_per_level:2)
# =>
```
```json
{"level_1_key_1":"level_1_value_1","level_1_key_2":"level_1_value_2","level_1_pointer_1":{"level_2_key_1":"level_2_value_1","level_2_key_2":"level_2_value_2"},"level_1_pointer_2":{"level_2_key_1":"level_2_value_1","level_2_key_2":"level_2_value_2"}}

```ruby
# Count number of nested levels per hash
NDHash.count_levels({key:{}}})
# => 2
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ndhash. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
