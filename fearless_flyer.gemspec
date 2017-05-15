# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fearless_flyer/version'

Gem::Specification.new do |spec|
  spec.name          = "fearless_flyer"
  spec.version       = FearlessFlyer::VERSION
  spec.authors       = ["Camille Jackson"]
  spec.email         = ["cj@mail.co.de"]

  spec.summary       = %q{Trader Joe's Fearless Flyer Featured Products}
  spec.description   = %q{Provides information on the products featured on the Trader Joe's Fearless Flyer website}
  spec.homepage      = "https://github.com/cs-j/tj-fearless-flyer-cli-app"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|\.gem$)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency "nokogiri"
end
