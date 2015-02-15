require 'sqlite3'

class DataParser

	def initialize(database)
		@database = database
	end

	def get_employees
		keys = [:key, :first, :last, :username, :type]
		open_employees.collect {|row| Hash[*keys.zip(row).flatten ] }
	end

	def get_clients
		keys = [:key, :name, :type]
		open_clients.collect {|row| Hash[*keys.zip(row).flatten ] }
	end
	def get_projects
		keys = [:key, :username, :year, :month, :day, :hours, :project_type]
		open_projects.collect {|row| Hash[*keys.zip(row).flatten ] }
	end

  private

  def open_employees
  		@database.execute("select * from employee_table")
  end

  def open_clients
		@database.execute("select * from client_table")
  end

  def open_projects
		@database.execute("select * from timesheet_table")
  end
end