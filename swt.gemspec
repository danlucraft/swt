
Gem::Specification.new do |s|
  s.name        = "swt"
  s.version     = "0.5"
  s.platform    = "java"
  s.authors     = ["Daniel Lucraft"]
  s.email       = ["dan@fluentradical.com"]
  s.homepage    = "http://github.com/danlucraft/swt"
  s.summary     = "The SWT library available to JRuby."
  s.description = "Includes SWT jars and imports SWT classes into Ruby."
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md) + 
                     Dir.glob("vendor/jface/*.jar") + Dir.glob("vendor/*.jar")
  s.executables  = []
  s.require_path = 'lib'
end