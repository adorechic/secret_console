# SecretConsole

SecretConsole is a GUI tool for CredStash.

![SecretConsole Top](https://raw.githubusercontent.com/adorechic/secret_console/doc_images/images/secret_console_top.png)
![SecretConsole Edit](https://raw.githubusercontent.com/adorechic/secret_console/doc_images/images/secret_console_edit.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'secret_console'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install secret_console

## Usage

    $ secret_console
    $ open http://localhost:4567

SecretConsole requires an aws credential such as AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/secret_console.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
