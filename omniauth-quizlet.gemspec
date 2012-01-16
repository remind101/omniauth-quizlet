# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-quizlet/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["dongbin.li"]
  gem.email         = ["mike.d.1984@gmail.com"]
  gem.description   = %q{quizlet omniauth strategy}
  gem.summary       = %q{quizlet omniauth strategy}
  gem.homepage      = ""

	gem.rubyforge_project = "omniauth-quizlet"
  gem.add_dependency 'omniauth', '~> 1.0.0.rc2'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0.0.rc2'
	

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-quizlet"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Quizlet::VERSION
end
