# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bims_api_client/version'

Gem::Specification.new do |spec|
  spec.name = 'bims_api_client'
  spec.version = BimsApiClient::VERSION
  spec.authors = ['Christian Melgarejo']
  spec.email = ['cmelgarejo@centralgps.net']

  spec.summary = 'Allows your project to connect to the BIMS platform and perform integration operations using your account.'
  spec.description = 'Allows your project to connect to the BIMS platform and perform integration operations using your account.'
  spec.homepage = 'https://github.com/cmelgarejo/bims_api_client'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13.a'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'dotenv'
  spec.add_runtime_dependency 'httparty', '~> 0.13.7'
  spec.add_runtime_dependency 'redis', '~> 3.2'

end
