# -*- encoding: utf-8 -*-
# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'pronto/mutant/version'
require 'English'

Gem::Specification.new do |s|
  s.name = 'pronto-mutant'
  s.version = Pronto::MutantVersion::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = 'Michał Knapik'
  s.email = 'mmk.knapik@gmail.com'
  s.homepage = 'http://github.org/mknapik/pronto-mutant'
  s.summary = 'Pronto runner for Mutant, ruby mutation testing tool'

  s.licenses = ['MIT']
  s.required_ruby_version = '>= 2.1'
  s.rubygems_version = '1.8.23'

  s.files = `git ls-files`.split($RS).reject do |file|
    file =~ %r{^(?:
    spec/.*
    |Gemfile
    |Rakefile
    |\.rspec
    |\.gitignore
    |\.travis.yml
    )$}x
  end
  s.test_files = []
  s.extra_rdoc_files = %w[LICENSE README.md]
  s.require_paths = ['lib']

  s.add_runtime_dependency('pronto', '~> 0.9')
  s.add_runtime_dependency('mutant', '~> 0.8')
  s.add_runtime_dependency('mutant-rspec', '~> 0.8')

  s.add_development_dependency('rake', '~> 10.4')
  s.add_development_dependency('rspec', '~> 3.3')
  s.add_development_dependency('rspec-its', '~> 1.2')
  s.add_development_dependency('rubocop', '~> 0.48')
  s.add_development_dependency('rubocop-rspec')
  s.add_development_dependency('guard', '~> 2.14')
  s.add_development_dependency('guard-rspec', '~> 4.6')
  s.add_development_dependency('guard-rubocop', '~> 1.2')
end
