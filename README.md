# SslDateChecker

This is a very simple ssl certificate date checker.  Intent is to give a heads-up of certificates that will expire within a given timeframe.

Very much a work in progress - consider it 'super-alpha'

This was written in 1.9.3 - YMMV as it's not tested in other versions.

## Installation

clone the repo

## Usage

Copy the default configuration file

  cp config/config.yml.default config/config.yml

Edit the config file, then run:

  ruby lib/ssl-date-checker/main.rb

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Again, Please note that this will probably radically change once I get around to it as this is pretty far from what I'd consider to be good code (though it *does* work...!)
