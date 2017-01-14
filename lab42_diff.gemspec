# frozen_string_literal: true
$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
require 'lab42/diff/version'
version = Lab42::Diff::VERSION
Gem::Specification.new do |s|
  s.name        = "Lab42::Diff"
  s.version     = version
  s.summary     = "Lab42::Diff a clone of Elixir's ExUnit.Diff "
  s.description = %(ALlows to have a detailed diff of complex datastructures which yields very clear diffs as in ExUnit)
  s.authors     = ['Robert Dober']
  s.email       = 'robert.dober@gmail.com'
  s.files       = Dir.glob('lib/**/*.rb')
  s.files      += %w(LICENSE README.md)
  s.homepage    = 'https://github.com/RobertDober/lab42_diff'
  s.licenses    = %w(Apache 2)

  s.required_ruby_version = '>= 2.3.1'

  s.add_development_dependency 'pry-byebug', '~> 3.4'
  s.add_development_dependency 'rspec', '~> 3.5'
end
