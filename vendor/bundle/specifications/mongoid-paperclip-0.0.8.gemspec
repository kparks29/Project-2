# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mongoid-paperclip"
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael van Rooijen"]
  s.date = "2012-09-06"
  s.description = "Mongoid::Paperclip enables you to use Paperclip with the Mongoid ODM for MongoDB."
  s.email = "meskyanichi@gmail.com"
  s.homepage = "https://github.com/meskyanichi/mongoid-paperclip"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Mongoid::Paperclip enables you to use Paperclip with the Mongoid ODM for MongoDB."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<paperclip>, [">= 2.3.6"])
    else
      s.add_dependency(%q<paperclip>, [">= 2.3.6"])
    end
  else
    s.add_dependency(%q<paperclip>, [">= 2.3.6"])
  end
end
