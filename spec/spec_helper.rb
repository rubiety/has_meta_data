require "rubygems"
require "rspec"
require "factory_girl"
require "faker"
require "active_record"
require "active_support"

# Establish DB Connection
config = YAML::load(IO.read(File.join(File.dirname(__FILE__), 'db', 'database.yml')))
ActiveRecord::Base.configurations = {'test' => config[ENV['DB'] || 'sqlite3']}
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])

# Load Test Schema into the Database
load(File.dirname(__FILE__) + "/db/schema.rb")

require File.dirname(__FILE__) + '/../init'

ActiveSupport::Deprecation.silenced = true

# Example has_meta_data Model:
class Article < ActiveRecord::Base
  has_meta_data
end

# Load Factories:
Dir[File.join(File.dirname(__FILE__), "factories/**/*.rb")].each {|f| require f}
