#!/usr/bin/ruby

gem 'rake-builder', '~> 2.0', '>= 2.0.8'

require 'rake-builder'
require 'rake/testtask'

desc 'Runs unit tests'
C8.task(:test => Names['generated:default']) { |t|
  files = Dir['tests/**/*_spec.rb']
  sh 'rspec', *files
}

gemTasks = Dir['*.gemspec'].collect { |fn|
  "#{File.basename(fn).chomp(File.extname(fn))}:default"
}

desc 'Runs unit tests and creates gem file'
C8.task(:default => Names['test', gemTasks])
