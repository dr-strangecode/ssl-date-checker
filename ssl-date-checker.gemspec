# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'valkyrie-client/version'

Gem::Specification.new do |gem|
  gem.authors       = ["Tim Ray"]
  gem.email         = ["tim.ray2005@gmail.com"]
  gem.description   = %q{checks dates on ssl certs for a given url}
  gem.summary       = %q{seems like everyone always forgets to check ssl certs...}
  gem.homepage      = "https://github.com/dr-strangecode/ssl-date-checker"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ssl-date-checker"
  gem.require_paths = ["lib"]
  gem.version       = SslDateChecker::VERSION

  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "rspec"
end
