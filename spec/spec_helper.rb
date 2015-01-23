require './lib/employee.rb'
require './lib/employee_factory.rb'
require './lib/data_parser.rb'
require './lib/user_interface.rb'
require './lib/project_factory.rb'
require './lib/project.rb'
require './lib/client_factory.rb'
require './lib/client.rb'
require './lib/user_choices.rb'
require './lib/report.rb'
require './lib/data_object_setup.rb'
require './lib/report_interface.rb'
require './lib/validate_input.rb'
require './lib/sql_data_reader.rb'
require './lib/sql_database_creator.rb'

RSpec.configure do |config|
  config.failure_color = :red
  config.success_color = :green
  config.detail_color = :yellow
  config.tty = true
  config.color = true
  config.formatter = :documentation
end
