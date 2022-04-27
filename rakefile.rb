#!/usr/bin/ruby

gem 'rake-builder', '~> 3.0'

require 'rake-builder'
require 'rake/testtask'

desc 'Runs unit tests'
C8.task(test: Names['generated:default']) do |_t|
  files = Dir['tests/**/*_spec.rb']
  sh 'rspec', *files
end

gemTasks = Dir['*.gemspec'].collect do |fn|
  "#{File.basename(fn).chomp(File.extname(fn))}:default"
end

desc 'Runs unit tests and creates gem file'
C8.task(default: Names['test', gemTasks])
