
case ENV["SWT_PLATFORM"]
when "darwin"
  swt_jars = Dir.glob("vendor/swt_osx*.jar")
  platform = "darwin"
when "linux"
  swt_jars = Dir.glob("vendor/swt_linux*.jar")
  platform = "linux"
when "win"
  swt_jars = Dir.glob("vendor/swt_win*.jar")
  platform = "mswin32"
else
  puts "set SWT_PLATFORM to darwin|linux|windows"
  exit
end

Gem::Specification.new do |s|
  s.name        = "swt"
  s.version     = "0.1"
  s.platform    = platform
  s.authors     = ["Daniel Lucraft"]
  s.email       = ["dan@fluentradical.com"]
  s.homepage    = "http://github.com/danlucraft/swt"
  s.summary     = "The SWT library available to JRuby."
  s.description = "Includes SWT jars and imports SWT classes into Ruby."
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md) + 
                     Dir.glob("vendor/jface/*.jar") + swt_jars
  s.executables  = []
  s.require_path = 'lib'
end