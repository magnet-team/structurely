# Structurely

[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/structurely`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'structurely'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install structurely

## Usage

```rb
Structurely::Settings.configure do |config|
  config.api_key = 'your_api_key'
  config.api_endpoint = 'https://api.structurely.com/v1'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Code Style

Ruby linting and formatting is handled via [standard](https://github.com/testdouble/standard).

#### Lint

```sh
bin/lint
```

#### Format

```sh
bin/format
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/structurely. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Structurely project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/structurely/blob/master/CODE_OF_CONDUCT.md).
