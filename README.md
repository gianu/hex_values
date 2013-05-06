# HexValues

[![Gem Version](https://badge.fury.io/rb/hex_values.png)](http://badge.fury.io/rb/hex_values)
[![Code Climate](https://codeclimate.com/github/gianu/hex_values.png)](https://codeclimate.com/github/gianu/hex_values)
[![Build Status](https://travis-ci.org/gianu/hex_values.png)](https://travis-ci.org/gianu/hex_values)
[![Coverage Status](https://coveralls.io/repos/gianu/hex_values/badge.png?branch=master)](https://coveralls.io/r/gianu/hex_values)

Transform your float to hexadecimals and viceversa!

## Installation

Add this line to your application's Gemfile:

    gem 'hex_values'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hex_values

## Usage

require the gem:

     require 'hex_values'

And then transform any float to a hexadecimal:

     irb> 234.25.to_hex
     => "EA.4"

Or transform any hexadecimal to the corresponding float:

     irb> "EA.4".to_float
     => 234.25


## Contributing

### Forking the project

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Creating an issue

Go to the issue tab and create a new issue explaining what is happening and what it the expected behaviour.
