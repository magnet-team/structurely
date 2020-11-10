# Structurely

[![Gem Version](https://badge.fury.io/rb/structurely.svg)](https://badge.fury.io/rb/structurely)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

![Tests](https://github.com/magnet-team/structurely/workflows/Tests/badge.svg)
![Linters](https://github.com/magnet-team/structurely/workflows/Linters/badge.svg)

Unofficial Structurely Ruby Client

This gem lets you interface with the Structurely V1 API.

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [API](#api)
  - [Conversations](#conversations)
    - [Get Conversation](#get-conversation)
    - [Create Conversation](#create-conversation)
- [Development](#development)
  - [Setup](#setup)
  - [Code Style](#code-style)
    - [Lint](#lint)
    - [Format](#format)
- [Releasing](#releasing)
- [Code of Conduct](#code-of-conduct)
- [License](#license)

## Install

Adding to a gem:

```ruby
# my-cool-gem.gemspec
Gem::Specification.new do |spec|
  # ...
  spec.add_dependency "structurely", "~> 0.1.0"
  # ...
end
```

Or adding to your project:

```ruby
# Gemfile
gem "structurely", "~> 0.1.0"
```

## Usage

The easiest way to use this gem is to create an initializer.

```ruby
# ./config/structurely.rb
Structurely::Settings.configure do |config|
  config.api_key = 'your_api_key'
  config.api_endpoint = 'https://api.structurely.com/v1'
end
```

## API

### Conversations

#### Get Conversation

[Structurely Get Conversation Documentation](https://docs.structurely.com/#conversations-get-conversation)

```ruby
Structurely::Conversation.show("12345")
```

Sample output:

```ruby
{
  "id" => "12345",
  "muted" => true,
  "settings" =>
  {
    "allowedDomains" => [
      "real_estate"
    ],
    "dripCampaignEnabled" => false,
    "holmesName" => "Aisa",
    "leadTypes" => [
      "buyer",
      "seller"
    ],
    "reDripsEnabled" => false,
    "timeZone" => "America/Chicago"
  },
  "slots" => [
    {"name" => "email", "value" => "jdoe@example.com"},
    {"name" => "name", "value" => "John"},
    {"name" => "agent_name", "value" => "Eric Berry"}
  ],
  "stages" => [
    "responded",
    "interested"
  ]
}
```

#### Create Conversation

[Structurely Create Conversation Documentation](https://docs.structurely.com/#conversations-create-conversation)

```ruby
Structurely::Conversation.create(
  muted: false,
  settings: Structurely::Entity::ConversationSettings.new(time_zone: "America/Chicago")
  slots: [
    Structurely::Entity::ConversationSlot.new(
      name: "email",
      value: "jdoe@example.com"
    )
  ],
  messages: [
    Structurely::Entity::ConversationItem.new(
      response: Structurely::Entity::ConversationMessage.new(
        text: "Hello, what is your name?",
        received: "2018-12-08T15:20:00.000Z"
      ),
      context: "expect_name",
      message: Structurely::Entity::ConversationMessage.new(
        text: "John",
        received: "2018-12-08T16:34:00.000Z"
      )
    )
  ]
)
```

Sample output:

```ruby
{
  "id" => "5f90958f9db94200311614a2",
  "muted" => false,
  "settings" => {
    "allowedDomains" => [
      "real_estate"
    ],
    "dripCampaignEnabled" => false,
    "holmesName" => "Aisa",
    "leadTypes" => [
      "buyer", "seller"
    ],
    "reDripsEnabled" => false,
    "timeZone" => "America/Chicago"
  },
  "slots" => [
    {"name" => "email", "value" => "jdoe@example.com"}
  ],
  "stages" => [
    "not_responded"
  ]
}
```

## Development

### Setup

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

### Guard

Guard provides a nice development experience by automatically running tests for you.

To start, run the following command in your terminal:

```sh
bin/guard
```

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

## Releasing

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Code of Conduct

Everyone interacting in the Structurely project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/magnet-team/structurely/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
