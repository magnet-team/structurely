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
  - [Conversation Webhooks](#conversation-webhooks)
    - [List Conversation Webhooks](#list-conversation-webhooks)
    - [Create Conversation Webhook](#create-conversation-webhook)
    - [Get Conversation Webhooks](#get-conversation-webhook)
    - [Update Conversation Webhooks](#update-conversation-webhook)
    - [Delete Conversation Webhooks](#delete-conversation-webhook)
- [Development](#development)
  - [Setup](#setup)
  - [Code Style](#code-style)
    - [Lint](#lint)
    - [Format](#format)
- [Releasing](#releasing)
- [Helpful Links](#helpful-links)
  - [Gems](#gems)
  - [Blog Posts](#blog-post)
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
  settings: Structurely::Entities::ConversationSettings.new(
    time_zone: "America/Chicago"
  ),
  slots: [
    Structurely::Entities::ConversationSlot.new(
      name: "email",
      value: "jdoe@example.com"
    )
  ],
  messages: [
    Structurely::Entities::ConversationItem.new(
      response: Structurely::Entities::ConversationMessage.new(
        text: "Hello, what is your name?",
        received: "2018-12-08T15:20:00.000Z"
      ),
      context: "expect_name",
      message: Structurely::Entities::ConversationMessage.new(
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


### Conversation Webhooks

#### List Conversation Webhooks

[Structurely List Conversation Webhooks Documentation](https://docs.structurely.com/#conversation-webhooks-list-conversation-webhooks)

```ruby
Structurely::ConversationWebhook.index
```

Sample output:

```ruby
{
  "_metadata" => {
      "collection" => "conversationWebhooks",
      "limit" => 10,
      "offset" => 0,
      "total" => 0
  },
  "conversationWebhooks" => []
}
```

#### Create Conversation Webhook

[Structurely Create Conversation Webhook Documentation](https://docs.structurely.com/#conversation-webhooks-create-conversation-webhook)

```ruby
Structurely::ConversationWebhook.create(
  name: "conversations",
  target: "https://fp-local.ngrok.io",
  triggers: ["conversation:updated", "response:created"]
)
```

Sample output:

```ruby
{
  "created_at" => "Fri, 30 Jul 2021 20:19:42 GMT",
  "id" => "61045ede0566800108895968",
  "name" => "conversations",
  "secret" => "SECRET",
  "target" => "https://fp-local.ngrok.io",
  "triggers" => ["conversation:updated", "response:created"],
  "updated_at" => "Fri, 30 Jul 2021 20:19:42 GMT",
  "version" => "v1"
}
```

#### Get Conversation Webhook

[Structurely Get Conversation Webhook Documentation](https://docs.structurely.com/#conversation-webhooks-get-conversation-webhook)

```ruby
Structurely::ConversationWebhook.show("61045ede0566800108895968")
```

Sample output:

```ruby
{
  "created_at" => "Fri, 30 Jul 2021 20:19:42 GMT",
  "id" => "61045ede0566800108895968",
  "name" => "conversations",
  "secret" => "SECRET",
  "target" => "https://fp-local.ngrok.io",
  "triggers" => ["conversation:updated", "response:created"],
  "updated_at" => "Fri, 30 Jul 2021 20:19:42 GMT",
  "version" => "v1"
}
```

#### Update Conversation Webhook

[Structurely Update Conversation Webhook Documentation](https://docs.structurely.com/#conversation-webhooks-update-conversation-webhook)

```ruby
Structurely::ConversationWebhook.update("61045ede0566800108895968", {
  name: "my_conversations",
  triggers: ["conversation:updated"]
})
```

Sample output:

```ruby
{
  "created_at" => "Fri, 30 Jul 2021 20:19:42 GMT",
  "id" => "61045ede0566800108895968",
  "name" => "my_conversations",
  "secret" => "ynpKYihXaxBUfc16xHi8Dc7LZL7xYwajlPUnT3kgKCbKy3Ce",
  "target" => "https://fp-local.ngrok.io",
  "triggers" => ["conversation:updated"],
  "updated_at" => "Fri, 30 Jul 2021 20:25:11 GMT",
  "version" => "v1"
}
```

#### Delete Conversation Webhook

[Structurely Delete Conversation Webhook Documentation](https://docs.structurely.com/#conversation-webhooks-delete-conversation-webhook)

```ruby
Structurely::ConversationWebhook.delete("61045ede0566800108895968")
```

Sample output:

```ruby
Dry::Monads::Result::Success(nil)
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

## Helpful Links

Some resources for using [api_structs](https://github.com/rubygarage/api_struct).

### Gems

- [uploadcare-ruby-next](https://github.com/uploadcare/uploadcare-ruby-next)
- [yandex_kassa](https://github.com/sigra/yandex_kassa)
- [iubenda_api](https://github.com/raihan2006i/iubenda_api)

### Blog Posts

- [ApiStruct – A Library for Building API Wrappers in Ruby](https://rubygarage.org/blog/gem-for-api-wrapping)

## Code of Conduct

Everyone interacting in the Structurely project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/magnet-team/structurely/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
