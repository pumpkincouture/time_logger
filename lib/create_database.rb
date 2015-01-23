
require 'sqlite3'
require_relative 'sql_database_creator'

new_creator = SqlDatabaseCreator.new
new_creator.create_timesheet_table
new_creator.insert_timesheet_projects