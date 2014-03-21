require 'yaml'

module Settings
  def self.load()
    app_settings_filename = File.realpath("#{File.dirname(__FILE__)}/../../config/app_settings.yml")
    app_settings = YAML.load_file(app_settings_filename)
  end
end

SETTINGS = Settings::load()