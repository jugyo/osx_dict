# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "osx_dict/version"

Gem::Specification.new do |s|
  s.name        = "osx_dict"
  s.version     = OSXDict::VERSION
  s.authors     = ["jugyo"]
  s.email       = ["jugyo.org@gmail.com"]
  s.homepage    = "https://github.com/jugyo/osx_dict"
  s.summary     = %q{Make your own dictionary for MacOSX!}
  s.description = %q{Dictionary maker for MacOSX Dictionary.app}

  s.rubyforge_project = "osx_dict"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
