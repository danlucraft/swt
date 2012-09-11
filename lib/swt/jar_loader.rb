require 'rbconfig'

module Swt
  def self.jar_path
    File.expand_path(relative_jar_path, __FILE__)
  end
  
  def self.relative_jar_path
    case Config::CONFIG["host_os"]
    when /darwin/i
      if %w(amd64 x84_64).include? Config::CONFIG["host_cpu"]
        '../../../vendor/swt/swt-osx64'
      else
        '../../../vendor/swt/swt-osx32'
      end
    when /linux/i
      if %w(amd64 x84_64).include? Config::CONFIG["host_cpu"]
        '../../../vendor/swt/swt-linux64'
      else
        '../../../vendor/swt/swt-linux32'
      end
    when /windows|mswin/i
      if %w(amd64 x84_64).include? Config::CONFIG["host_cpu"]
        '../../../vendor/swt/swt-win64'
      else
        '../../../vendor/swt/swt-win32'
      end
    end
  end

  if File.exist?(jar_path + ".jar")
    require jar_path
  else
    raise "swt jar file required: #{jar_path}.jar"
  end
end
