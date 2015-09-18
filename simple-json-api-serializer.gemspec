# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_api/version'

Gem::Specification.new do |spec|
  spec.name          = "simple-json-api-serializer"
  spec.version       = JSONApi::VERSION
  spec.authors       = ["Marten Schilstra"]
  spec.email         = ["mail@martenschilstra.nl"]

  spec.summary       = %q{An extremely simple JSON Api serializer}
  spec.description   = %q{
    It supports just plain Ruby objects. This serializer does not target any
    specific framework like ActiveRecord or anything like that.

    Does not (yet) have support for links and sideloading.
  }
  spec.homepage      = "https://github.com/martndemus/simple-json-api-serializer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rspec",   "~> 3.0"
end
