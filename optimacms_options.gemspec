$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "optimacms_options/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "optimacms_options"
  s.version     = OptimacmsOptions::VERSION
  s.authors     = ["Max Ivak"]
  s.email       = ["max.ivak@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "Options for OptimaCMS."
  s.description = "Options(Settings) module for Optima CMS."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "optimacms"

  #s.add_development_dependency "sqlite3"
end
