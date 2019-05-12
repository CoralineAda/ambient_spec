# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ambient_spec/version'

Gem::Specification.new do |spec|
  spec.name          = "ambient_spec"
  spec.version       = AmbientSpec::VERSION
  spec.authors       = ["Coraline Ada Ehmke"]
  spec.email         = ["coraline@idolhands.com"]
  spec.summary       = %q{Creates an ambient soundscape for your test suite.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/CoralineAda/ambient_spec"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_dependency "wavefile", "=0.6.0"

end
