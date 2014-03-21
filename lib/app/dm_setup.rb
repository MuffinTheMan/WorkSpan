require 'data_mapper'
require 'dm-migrations'
require 'dm-serializer'

model_dir = File.realpath("#{ROOT}/app/models/")
Dir["#{model_dir}/*.rb"].each do |file|
  require file
end

module DMSetup

  def self.connect

    env = SETTINGS['env']

    db_type = SETTINGS[env]['db']['type']
    db_url = SETTINGS[env]['db']['url']

    if db_type === "mysql"
      db_name = SETTINGS[env]['db']['name']
      db_user = SETTINGS[env]['db']['user']
      db_password = SETTINGS[env]['db']['password']
      DataMapper.setup(:default, "#{db_type}://#{db_user}:#{db_password}@#{db_url}/#{db_name}")
    elsif db_type === "sqlite"
      DataMapper.setup(:default, "#{db_type}:///#{ROOT}/#{db_url}")
    else
      raise "Invalid db_type #{db_type}"
    end

    DataMapper.finalize
    # reset_db # TODO: eventually remove this--this just resets the DB every time we run the application

  end

  def self.reset_db
    DataMapper.auto_migrate! # This will create proper tables in DB
  end

end

unless defined? DM
  DM = DataMapperSetup.connect
end