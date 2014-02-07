# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "userbin"
  s.version = "0.4.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Johan"]
  s.date = "2013-09-17"
  s.description = "Drop-in user login for mobile and web apps. Add a full user authentication stack to your application in minutes. Userbin is easily customized to fit your current design and infrastructure."
  s.email = "johan@userbin.com"
  s.homepage = "https://userbin.com"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Userbin"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<her>, ["~> 0.6.8"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_runtime_dependency(%q<jwt>, ["~> 0.1.8"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
    else
      s.add_dependency(%q<her>, ["~> 0.6.8"])
      s.add_dependency(%q<multi_json>, ["~> 1.0"])
      s.add_dependency(%q<jwt>, ["~> 0.1.8"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
    end
  else
    s.add_dependency(%q<her>, ["~> 0.6.8"])
    s.add_dependency(%q<multi_json>, ["~> 1.0"])
    s.add_dependency(%q<jwt>, ["~> 0.1.8"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
  end
end
