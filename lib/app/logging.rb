require 'logger'

# This module makes use of Ruby's 'logger' library to set up our
# own logging framework.
module Logging

  # Creates a new instance of the Logger class and sets it up with
  # our default settings (level -> debug, location -> tmp/app.log)
  #
  # @return [Logger] an instance of the Logger class.
  def self.load()
    logger = Logger.new('tmp/app.log')
    logger.formatter = proc { |severity, datetime, progname, msg|
      formatted_time = datetime.strftime("%I:%M%p")
      "#{formatted_time}: #{severity} -- #{msg}\n"
    }
    logger.level = Logger::DEBUG
    logger
  end

end

# The constant `LOG` will hold the instance of our Logger class.
# If it's not defined when this file is executed, it will call `Logging:load()`
# and set `LOG` to the returned instance.
unless defined? LOG
  LOG = Logging::load()
end