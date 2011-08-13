
Gem::Specification.new do |s|
  s.name        = "swt"
  s.version     = "0.9" # also change in lib/swt/minimal.rb
  s.platform    = "java"
  s.authors     = ["Daniel Lucraft"]
  s.email       = ["dan@fluentradical.com"]
  s.homepage    = "http://github.com/danlucraft/swt"
  s.summary     = "The SWT library available to JRuby."
  s.description = "Includes SWT jars and imports SWT classes into Ruby."
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md) + 
                     Dir.glob("vendor/**/*")
  s.executables  = ["swt_cucumber"]
  s.require_path = 'lib'
end