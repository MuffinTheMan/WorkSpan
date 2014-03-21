require 'rubygems'

require_relative 'lib/app/logging'
require_relative 'lib/app/language_utility'
require_relative 'lib/app/settings'

ROOT = File.realpath(File.dirname(__FILE__))

# Need to require this after initializing the constants above
# require_relative 'lib/app/dm_setup'