$:.push File.expand_path("../lib", __FILE__)

require "fake_dwolla/version"

Gem::Specification.new do |s|
  s.name        = "fake_dwolla"
  s.version     = FakeDwolla::VERSION
  s.authors     = ["Joe"]
  s.email       = ["wangjoe1105@gmail.com"]
  s.homepage    = "https://github.com/joe11051105"
  s.summary     = "A fake Dwolla server."
  s.description = "An implementation of the Dwolla ACH processing service to run during your integration tests."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'sinatra'
  s.add_dependency 'webmock'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'dwolla_v2'
end
