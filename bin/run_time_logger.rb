
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sqlite3'
require 'time_logger'
require 'time_logger_setup'

database = SQLite3::Database.open "time_logger.db"

time_logger_setup = TimeLoggerSetup.new(database)
time_logger_setup.perform_setup

time_logger = TimeLogger.new(time_logger_setup.current_employee, time_logger_setup.clients, time_logger_setup.projects, time_logger_setup.employees)
time_logger.run!