require 'rbconfig'

module Swt
  def self.jar_path
    File.expand_path(relative_jar_path, __FILE__)
  end
  
  def self.relative_jar_path
    case Config::CONFIG["host_os"]
    when /darwin/i
      if Config::CONFIG["host_cpu"] == "x86_64"
        '../../../vendor/swt_osx64'
      else
        '../../../vendor/swt_osx'
      end
    when /linux/i
      if %w(amd64 x84_64).include? Config::CONFIG["host_cpu"]
        '../../../vendor/swt_linux64'
      else
        '../../../vendor/swt_linux'
      end
    when /windows|mswin/i
      '../../../vendor/swt_win32'
    end
  end

  if File.exist?(jar_path + ".jar")
    require jar_path
  else
    raise "swt jar file required: #{jar_path}.jar"
  end
end