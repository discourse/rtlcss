# Rtlcss

A wrapper gem for the `rtlcss` [npm package](https://www.npmjs.com/package/rtlcss) to flip CSS direction in ruby. For example, given the following CSS that's designed to work with LTR (Left To Right) layouts:

```css
a {
  left: 5px;
  padding-right: 5px;
  margin: 1px 2px 3px 4px;
}
```

You can use this gem to produce the following CSS which is suitable for RTL (Right To Left) layouts:

```css
a {
  right: 5px;
  padding-left: 5px;
  margin: 1px 4px 3px 2px;
}
```

This gem uses [`mini_racer`](https://github.com/rubyjs/mini_racer) to call the `rtlcss` npm package.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rtlcss

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rtlcss

## Usage

```ruby
require "rtlcss"

Rtlcss.flip_css("a { right: 1px; }") # => "a { left: 1px; }"
```

Syntactically-broken CSS will raise a `Rtlcss::FlipError` exception.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, update the `CHANGELOG.md` file, and commit the changes and push to GitHub. Our GitHub Action will then take care of pushing the new versio to rubygems.org.

Instructions for updating the distributed copy of `rtlcss` that's included with this gem (i.e. the `dist/main.js` file) can be found in the README in the `rtlcss-miniracer` directory.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/discourse/rtlcss. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/discourse/rtlcss/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rtlcss project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/discourse/rtlcss/blob/main/CODE_OF_CONDUCT.md).
