# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "modernizr-rails"
  s.version = "2.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Russ Frisch"]
  s.date = "2014-01-15"
  s.description = "This Modernizr.js was built using the at http://www.modernizr.com/download/ with all options enabled."
  s.email = ["russfrisch@shortmail.com"]
  s.homepage = "http://rubygems.org/gems/modernizr-rails"
  s.require_paths = ["lib"]
  s.rubyforge_project = "modernizr-rails"
  s.rubygems_version = "2.0.14"
  s.summary = "Gem wrapper to include the Modernizr.js library via the asset pipeline."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, [">= 3.1.0"])
    else
      s.add_dependency(%q<rails>, [">= 3.1.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1.0"])
  end
end
