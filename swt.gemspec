
Gem::Specification.new do |s|
  s.name        = "swt"
  s.version     = "4.6.1" # also change in lib/swt/minimal.rb
  s.platform    = "ruby"
  s.authors     = ["Daniel Lucraft", "Tobias Pfeiffer"]
  s.email       = ["dan@lucraft.me", "pragtob@gmail.com"]
  s.homepage    = "http://github.com/danlucraft/swt"
  s.summary     = "The SWT toolkit for JRuby."
  s.description = "Contains everything required to write cross-platform desktop applications with JRuby and SWT."
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md) +
                     Dir.glob("vendor/**/*")
  s.executables  = ["swt_cucumber"]
  s.require_path = 'lib'
  s.license      = "See https://github.com/danlucraft/swt/blob/master/LICENSE"
end
