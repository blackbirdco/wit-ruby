wit-ruby2
========

Easy interface for interacting with the [Wit.ai](http://wit.ai) natural language parsing API.

Initially a fork of: [wit-ruby](https://github.com/modeset/wit-ruby)

This project will expand as the Wit.ai API expands, but as it stands there's a single endpoint. You can hit this
endpoint easily with `Wit.message([your message])`, which uses Wit.ai to convert that phrase or sentence into an object
with an intent, and entities if any are available.

You will need to create a Wit.ai account and begin training it.

## Installation

```ruby
gem 'wit-ruby2', '>= 0.0.3'
```

## Usage

```ruby
require 'wit-ruby2'

client = Wit::Client.new("WIT_TOKEN")

result = client.classify_message('Hi')

result.intent # will be Hello with the default Wit instance.
result.confidence # the confidence score of the classification
result.entities # A hash of entity types
result.entities["location"].first.value # the value of the first location extracted
```

### Result properties/methods

* **id** The unique message id provided back from Wit.
* **text** The original message sent.
* **intent** The intent, as determined by Wit.
* **confidence** The confidence level that Wit determined.
* **entities** Hash of entities, which contains an array of n extracted entities

### Entity properties/methods

* **value**: the value extracted by wit

## License

Licensed under the [MIT License](http://creativecommons.org/licenses/MIT/)
