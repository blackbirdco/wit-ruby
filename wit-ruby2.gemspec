lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'wit/version'

Gem::Specification.new do |spec|
  spec.name        = 'wit-ruby2'
  spec.version     = Wit::VERSION
  spec.authors     = ['Jeremy Jackson', 'Zaratan']
  spec.email       = ['tech@hellojam.fr']
  spec.license     = 'MIT'
  spec.homepage    = 'https://github.com/blackbirdco/wit-ruby2'
  spec.summary     = %Q{wit-ruby: Easy interface for wit.ai}
  spec.description = %Q{A simple library for interacting with wit.ai -- will expand as the api does}

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 0.8.8"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
