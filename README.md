# AmbientSpec

AmbientSpec turns your long-running RSpec specs into ambient music. Sweet sounds come from
passing examples, and gongs signal failing tests.

(Note that you won't hear anything unless your test suite run is longer than 5 seconds. Silence is
the most pleasing sound of all.)

## Dependencies

Requires RSpec 3.x.

## Installation

Add this line to your application's Gemfile:

    gem 'ambient_spec'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ambient_spec

## Usage

Simply run rspec as you normally would.

To disable AmbientSpec, set `ENV['AMBIENT_SPEC_DISABLED']=true`

## Contributing

Please note that this project is released with a [Contributor Code of Conduct](https://raw.githubusercontent.com/Bantik/ambient_spec/master/CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request