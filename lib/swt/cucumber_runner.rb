module Swt
  class CucumberRunner
    START_DELAY = 1
    
    def tests_finished?
      @tests_finished
    end
    
    def run_features(args)
      require "cucumber/cli/main"
      require "cucumber"
      require "cucumber/rb_support/rb_language"
      require "swt/cucumber_patches"
      Thread.new do
        begin
          sleep START_DELAY
          main = Cucumber::Cli::Main.new(args)
          main.execute!
          @tests_finished = true
        rescue Object => e
          puts e.message
          puts e.backtrace
        end
      end
    end
  end
end