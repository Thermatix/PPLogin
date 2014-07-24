$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pp_login/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pp_login"
  s.version     = PpLogin::VERSION
  s.authors     = ["Thermatix"]
  s.email       = ["Mbeckerwork@gmail.com"]
  s.homepage    = "https://github.com/Thermatix/PPLogin"
  s.summary     = "TODO: Summary of PpLogin."
  s.description = "TODO: Description of PpLogin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency'paypal-sdk-rest', '~> 0.7.0'

  s.add_development_dependency "sqlite3"
end
