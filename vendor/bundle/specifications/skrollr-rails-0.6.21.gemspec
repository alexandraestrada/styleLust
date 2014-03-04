# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "skrollr-rails"
  s.version = "0.6.21"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Reed"]
  s.date = "2014-01-07"
  s.description = "Integrates the skrollr javascript library with the Rails asset pipeline"
  s.email = ["reednj77@gmail.com"]
  s.homepage = "https://github.com/reed/skrollr-rails"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Skrollr is a stand-alone parallax scrolling library for mobile and desktop.  This gem integrates skrollr with the Rails asset pipeline for ease of use and version control."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.1.0"])
    else
      s.add_dependency(%q<rails>, [">= 3.1.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.1.0"])
  end
end
