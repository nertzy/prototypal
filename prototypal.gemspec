# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prototypal/version'

Gem::Specification.new do |spec|
  spec.name          = "prototypal"
  spec.version       = Prototypal::VERSION
  spec.authors       = ["Grant Hutchins"]
  spec.email         = ["nertzy@gmail.com"]
  spec.description   = %q{Prototypal Ruby objects}
  spec.summary       = %q{An experiment in making Protypal Ruby objects}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
