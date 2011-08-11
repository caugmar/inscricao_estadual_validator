# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "inscricao_estadual_validator"
  s.version     = "0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Carlos Augusto Marcicano"]
  s.email       = ["caugmar@gmail.com"]
  s.homepage    = "https://github.com/caugmar/inscricao_estadual_validator"
  s.summary     = %q{Validação de inscrição estadual brasileira para o ActiveRecord}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activemodel', '>= 3.0'
  s.add_development_dependency 'rake', '>= 0.8.7'
end
