require 'rbconfig'

module Swt

  X64_BIT_CPUS = %w(amd64 x86_64)

  def self.jar_path
    @jar_path ||= File.expand_path(relative_jar_path, __FILE__)
  end

  def self.relative_jar_path
    case RbConfig::CONFIG["host_os"]
    when /darwin/i
      if x64_bit_cpu?
        '../../../vendor/swt/swt-osx64'
      else
        '../../../vendor/swt/swt-osx32'
      end
    when /linux/i
      if x64_bit_cpu?
        '../../../vendor/swt/swt-linux64'
      else
        '../../../vendor/swt/swt-linux32'
      end
    when /windows|mswin/i
      if x64_bit_cpu?
        '../../../vendor/swt/swt-win64'
      else
        '../../../vendor/swt/swt-win32'
      end
    end
  end

  def self.x64_bit_cpu?
    X64_BIT_CPUS.include? RbConfig::CONFIG["host_cpu"]
  end

  if File.exist?(jar_path + ".jar")
    require jar_path
  else
    raise "swt jar file required: #{jar_path}.jar"
  end
end
