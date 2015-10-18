# Fluent::Plugin::TerminalNotifier

A fluentd plugin to notify notification center with terminal-notifier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fluent-plugin-terminal_notifier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-terminal_notifier

## Configuration Example

For example, add `terminal-notifier` configuration section like this:

```
<match terminal-notifier.**>
  type terminal-notifier
  title test
  sub_title sub
</match>
```

Also you can specify app ID to activate like this:

This example is activating Terminal.app.

```
<match terminal-notifier.**>
  type terminal-notifier
  title test
  sub_title sub
  activate com.apple.Terminal
</match>
```

In more detail about activatation, please refer to the [TerminalNotifier document](https://github.com/julienXX/terminal-notifier/blob/f727ffdb19c91bd4f87d30274c12044ccea47fe2/README.markdown).

## Parameters

- **title** (String. Optional) This key is used in Notification title.
- **sub_title** (String. Optional) This key is used in Notification sub title.
- **activate** (String. Optional) This key is used in OS X application activating.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cosmo0920/fluent-plugin-terminal_notifier.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
