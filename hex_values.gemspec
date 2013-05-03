# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hex_values/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sergio Rafael Gianazza"]
  gem.email         = ["sgianazza@gmail.com"]
  gem.description   = %q{Add functionality to get hexadecimal values from float and float from a string hexadecimal}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hex_values"
  gem.require_paths = ["lib"]
  gem.version       = HexValues::VERSION

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "minitest-reporters"
end
