require 'sqlite3'
require 'csv'

class SqlDataReader

	def query_sample
		db = SQLite3::Database.open "time_logger.db"
		db.execute ("select id from sample_table where sample_number > 200")
	end

	def query_client
		db = SQLite3::Database.open "time_logger.db"
		db.execute("select name from client_table where name = 'Autodesk'")
	end

	def query_employee
		db = SQLite3::Database.open "time_logger.db"
		db.execute("select first, last from employee_table where type = 'admin'")
	end

	def query_project
		db = SQLite3::Database.open "time_logger.db"
		db.execute("select username from timesheet_table where project_type = 'PTOProject'")
	end
end