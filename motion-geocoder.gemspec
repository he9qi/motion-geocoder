require File.expand_path('../lib/motion-geocoder/version.rb', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'motion-geocoder'
  s.version     = MotionGeocoder::VERSION
  s.date        = '2014-09-18'
  s.summary     = "Geocoder wrapper for rubymotion."
  s.description = <<-DESC
    Yet another rubymotion geocoder wrapper.
  DESC
  s.authors     = ["Qi He"]
  s.email       = 'qhe@heyook.com'
  s.homepage    = 'http://github.com/he9qi/motion-geocoder'
  s.license     = 'MIT'

  s.files         = Dir.glob('lib/**/*.rb')
  s.files         << 'README.md'
  s.require_paths = ['lib']
  s.test_files    = Dir.glob('spec/**/*.rb')

  s.add_runtime_dependency "afmotion", '~> 2.4.1'

end
