Gem::Specification.new do |s|
  s.name        = 'minitest-snail'
  s.version     = "0.0.1"
  s.authors     = ['Adam Sanderson']
  s.email       = ['netghost@gmail.com']
  s.homepage    = 'https://github.com/adamsanderson/minitest-snail'
  
  s.summary     = 'Identify slow tests.'
  s.description = 'Summarizes minitest tests, printing out tests that take too long.'
  s.licenses    = 'MIT'

  s.files        = Dir.glob('lib/**/*') + ["README.markdown"]
  
  s.add_runtime_dependency "minitest", "~> 5.5"
end