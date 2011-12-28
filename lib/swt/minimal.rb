
require 'swt/jar_loader'
require 'swt/event_loop'
require 'swt/cucumber_runner'

module Swt
  VERSION = "0.12" # also change in swt.gemspec
  
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
    error, throwable = nil, false
    result = nil
    runnable = Swt::RRunnable.new do
      begin
        result = block.call
      rescue Object => e
        error = e
      end
    end

    unless display.is_disposed
      display.syncExec(runnable)
      if error
        raise error
      end
    end
    result
  end
  
  # Runs the given block in the SWT Event thread after
  # the given number of milliseconds
  def self.timer_exec(ms, &block)
    runnable = Swt::RRunnable.new(&block)
    display.timerExec(ms, runnable)
  end

  def self.display
    @display ||= begin
      if defined?(SWT_APP_NAME)
        Swt::Widgets::Display.app_name = SWT_APP_NAME
      end
      display ||= (Swt::Widgets::Display.getCurrent || Swt::Widgets::Display.new)
      
      # clipboard class must be imported after the display is created
      Swt::DND.send(:import, org.eclipse.swt.dnd.Clipboard)
      display
    end
  end

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
    this_display = display
    
    until stop_conditions.any? {|c| c[] }
      unless this_display.read_and_dispatch
        this_display.sleep
      end
    end
    
    this_display.dispose
  end
end



