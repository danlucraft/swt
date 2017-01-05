module Swt
  def self.bot
    @bot ||= begin
      Dir[File.expand_path("../../../vendor/swtbot", __FILE__) + "/*.jar"].each do |fn|
        require fn
      end
      bot = org.eclipse.swtbot.swt.finder.SWTBot.new
      bot.extend SwtBotExtensions
      bot
    end
  end
end
