require_relative 'logger_constants'
require 'sqlite3'

class FileWriter
  include LoggerConstants
    attr_reader :database

    def initialize
      @database = SQLite3::Database.open "time_logger.db"
    end

  def add_project(employee_username, project)
    if project.class.name == BILLABLE_PROJECT_TYPE
      database.execute ( "insert into timesheet_table (username, year, month, day, hours, project_type) values ('#{employee_username}', '#{project.year}', '#{project.month}', '#{project.day}', '#{project.hours}', '#{project.client.name}')" )
    else
      database.execute( "insert into timesheet_table (username, year, month, day, hours, project_type) values ('#{employee_username}', '#{project.year}', '#{project.month}', '#{project.day}', '#{project.hours}', '#{project.class}')" )
    end
  end

  def add_employee(first, last, username, type)
    database.execute( "insert into employee_table (first, last, username, type) values ('#{first.capitalize}', '#{last.capitalize}', '#{username}', '#{type}')" )
  end

  def add_client(name, type)
    database.execute( "insert into client_table (name, type) values ('#{name}', '#{type}')" )
  end
end