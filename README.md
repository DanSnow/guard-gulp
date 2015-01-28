# Guard::Gulp

A plugin for guard to run gulp.

After a couple time of thinking. I found it to be useless.

Because gulp have `gulp.watch()`. But I have finished this....

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guard-gulp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-gulp

## Usage

Example:

```ruby
guard :Gulp do
  watch(/Gulpfile\..*/)
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/guard-gulp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
