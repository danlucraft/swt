
require 'swt/jar'
require 'swt/event_loop'
require 'swt/cucumber_runner'

module Swt
  VERSION = "0.8"
  
  import org.eclipse.swt.SWT
  
  module Widgets
    import org.eclipse.swt.widgets.Display
    import org.eclipse.swt.widgets.Label
    import org.eclipse.swt.widgets.ProgressBar
    import org.eclipse.swt.widgets.Shell
  end
  
  module Custom
  end
  
  module DND
  end
  
  module Layout
    import org.eclipse.swt.layout.FormAttachment
    import org.eclipse.swt.layout.FormData
    import org.eclipse.swt.layout.FormLayout
  end
  
  module Graphics
    import org.eclipse.swt.graphics.Image
  end
  
  module Events
  end
  
  class RRunnable
    include java.lang.Runnable

    def initialize(&block)
      @block = block
    end

    def run
      @block.call
    end
  end

  # Runs the given block in the SWT Event thread
  def self.sync_exec(&block)
    runnable = Swt::RRunnable.new do
      begin
        block.call
      rescue => e
        puts "error in sync exec"
        puts e.message
        puts e.backtrace
      end
    end
    unless display.is_disposed
      display.syncExec(runnable)
    end
  end
  
  # Runs the given block in the SWT Event thread after
  # the given number of milliseconds
  def self.timer_exec(ms, &block)
    runnable = Swt::RRunnable.new(&block)
    display.timerExec(ms, runnable)
  end

  def self.display
    if defined?(SWT_APP_NAME)
      Swt::Widgets::Display.app_name = SWT_APP_NAME
    end
    @display ||= (Swt::Widgets::Display.getCurrent || Swt::Widgets::Display.new)
  end

  display # must be created before we import the Clipboard class.
  
  def self.event_loop(&stop_condition)
    stop_conditions << stop_condition
    run_event_loop
  end
  
  def self.stop_conditions
    @stop_conditions ||= []
  end
  
  def self.event_loop_running?
    @event_loop_running
  end
  
  def self.run_event_loop
    return if event_loop_running?
    @event_loop_running = true
    display = Swt::Widgets::Display.current
    
    until stop_conditions.any? {|c| c[] }
      unless display.read_and_dispatch
        display.sleep
      end
    end
    
    display.dispose
  end
  
  def self.bot
    @bot ||= begin
      Dir[File.expand_path("../../../vendor/swtbot", __FILE__) + "/*.jar"].each do |fn|
        require fn
      end
      org.eclipse.swtbot.swt.finder.SWTBot.new
    end
  end
end



