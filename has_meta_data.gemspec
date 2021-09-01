# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_meta_data/version"

Gem::Specification.new do |s|
  s.name        = "has_meta_data"
  s.version     = HasMetaData::VERSION
  s.author      = "Ben Hughes"
  s.email       = "ben@railsgarden.com"
  s.homepage    = "http://github.com/rubiety/has_meta_data"
  s.summary     = "Extended attributes in an attached meta table."
  s.description = "Create one model backed by a primary table and a supplementary 'meta' table."
  
  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"]
  s.require_path = "lib"
  
  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
  
  s.add_dependency("activesupport", [">= 3.0.0"])
  s.add_dependency("activerecord", [">= 3.0.0"])
  s.add_development_dependency("rspec", ["~> 2.0"])
  s.add_development_dependency("factory_girl", ["~> 2.6.2"])
  s.add_development_dependency("faker", ["~> 1.0.0"])
  s.add_development_dependency("sqlite3", ["~> 1.3.4"])
  s.add_development_dependency('appraisal', ["~> 0.4.0"])
  s.add_development_dependency("rdoc", "~> 6.3")
  s.add_development_dependency "rake"
end
