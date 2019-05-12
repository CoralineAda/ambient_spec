# AmbientSpec

AmbientSpec turns your RSpec suite into soothing, ambient music. Harmonious sounds come from passing examples, and a gong signals a failing spec.

## Dependencies

Requires RSpec 3.x and only runs on Mac OS (sorry!)

## Installation

Add this line to your application's Gemfile:

    gem 'ambient_spec'

And then execute:

    $ bundle

## Command-line Usage

For documentation-style formatting:

    rspec -r ambient_spec -f AmbientDocumentationFormatter spec/

For progress-style formatting:

    rspec -r ambient_spec -f AmbientProgressFormatter spec/

Or best of all, in your `.rspec` file in your project root:

```
--require spec_helper
--require ambient_spec
--format AmbientDocumentationFormatter
```

## Contributing

Please note that this project adheres to the [Contributor Covenant Code of Conduct](https://raw.githubusercontent.com/CoralineAda/ambient_spec/master/CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
