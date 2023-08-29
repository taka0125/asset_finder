# AssetFinder

Find javascripts and stylesheets for `rake asset:precompile`.

## Build Status

### main
[![Build Status](https://github.com/taka0125/asset_finder/workflows/Ruby/badge.svg)](https://github.com/taka0125/asset_finder/actions)



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'asset_finder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install asset_finder

## config file

`config/initializers/asset_finder.rb`

### Sprockets

```ruby
Rails.application.config.to_prepare do
  Rails.application.config.assets.precompile += AssetFinder::SprocketsConfigGenerator.new.execute
end
```

### dartsass-rails

```ruby
Rails.application.config.to_prepare do
  Rails.application.config.dartsass.builds = AssetFinder::Stylesheet::DartsassConfigGenerator.new.execute
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/asset_finder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
