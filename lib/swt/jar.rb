require 'rbconfig'

module Swt
  def self.jar_path
    case Config::CONFIG["host_os"]
    when /darwin/i
      if Config::CONFIG["host_cpu"] == "x86_64"
        '../vendor/swt_osx64'
      else
        '../vendor/swt_osx'
      end
    when /linux/i
      if %w(amd64 x84_64).include? Config::CONFIG["host_cpu"]
        '../vendor/swt_linux64'
      else
        '../vendor/swt_linux'
      end
    when /windows|mswin/i
      '../vendor/swt_win32'
    end
  end

  path = File.expand_path(File.dirname(__FILE__) + "/../" + Swt.jar_path)
  if File.exist?(path + ".jar")
    puts "loading #{Swt.jar_path}"
    require path
  else
    puts "SWT jar file required: #{path}.jar"
    exit
  end
end