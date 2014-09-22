# -*- encoding: utf-8 -*-

require 'find'

$:.unshift File.expand_path("./lib")
require 'yard-simplecov-method-report'

Gem::Specification.new do |s|
  s.name = "yard-simplecov-method-report.gemspec"
  s.version = '0.0.2'

  s.summary = "YARD plugin to report coverage of methods"
  s.description = %q{
    YARD plugin to report the percentage of coverage
    for each class and instance method tested or
    spec'd
  }
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["G. Allen Morris III"]
  s.date = "2014-09-21"
  s.email = "gam3@gam3.net"
  s.homepage = "https://github.com/gam3/yard-simplecov-method-report"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.files = 'ChangeLog'
  s.files += [ 'LICENSE' ]
  s.files += Dir['lib/*/*.rb'] + Dir['lib/*.rb']
  s.files += Dir['*.gemspec']
  s.files += Find.find('templates').select{ |f| f if FileTest.file?(f) }

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
