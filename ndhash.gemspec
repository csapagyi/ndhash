# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ndhash/version'

Gem::Specification.new do |spec|
  spec.name          = "ndhash"
  spec.version       = NDHash::VERSION
  spec.authors       = ["Csaba Apagyi"]
  spec.email         = ["csapagyi@users.noreply.github.com"]

  spec.summary       = %q{N-dimension hash creation and utilities. Useful for testing multi-level hash and JSON processing.}
  spec.homepage      = "https://github.com/csapagyi/ndhash"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
