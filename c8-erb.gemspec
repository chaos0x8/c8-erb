Gem::Specification.new { |s|
  s.name = 'c8-erb'
  s.version = '0.1.0'
  s.date = '2021-05-24'
  s.summary = "#{s.name} library"
  s.description = 'Small helper for erb templates'
  s.authors = ['chaos0x8']
  s.files  = Dir['Gemfile', 'Gemfile.lock', '*.gemspec']
  s.files += Dir['lib/c8-erb.rb', 'lib/c8-erb/**/*.rb']

  s.add_development_dependency 'rspec'
}
