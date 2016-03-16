# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rjawbone/version'

Gem::Specification.new do |spec|
  spec.name          = "rjawbone"
  spec.version       = Rjawbone::VERSION
  spec.authors       = ["Taylor Daugherty"]
  spec.email         = ["mdaugherty6@gmail.com"]

  spec.summary       = %q{Ruby SDK for Jawbone API v1.1.1}
  spec.description   = %q{A Ruby API wrapper for the Jawbone API.}
  spec.homepage      = "https://mtaylord.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = spec.files.grep(/^spec\//)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client', '~> 1.7'
  spec.add_dependency 'json'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "webmock", "~> 1.24"
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency 'pry'

end
