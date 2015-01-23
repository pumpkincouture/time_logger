require 'sqlite3'

class SqlDatabaseCreator

	def initialize
		@database_in_use = SQLite3::Database.open ("time_logger.db")
	end

	def create_sample_database
		database = SQLite3::Database.new ("time_logger.db")
		database.execute( "create table sample_table (id INTEGER PRIMARY KEY, sample_text TEXT, sample_number NUMERIC);" )
 
		database.execute( "insert into sample_table (sample_text,sample_number) values ('Sample Text1', 123)")
		database.execute( "insert into sample_table (sample_text,sample_number) values ('Sample Text2', 456)")
 
		rows = database.execute( "select * from sample_table" )
	end

	def create_client_table
		database_in_use.execute( "create table if not exists client_table (id INTEGER PRIMARY KEY, name TEXT, type TEXT);" )
	end

	def insert_clients
		database.execute( "insert into client_table (name, type) values ('Autodesk', 'standard')" )
		database.execute( "insert into client_table (name, type) values ('Praxair', 'standard')" )
		database.execute( "insert into client_table (name, type) values ('Aflac', 'standard')" )
	end

	def create_employee_table
		database_in_use.execute( "create table if not exists employee_table (id INTEGER PRIMARY KEY, first TEXT, last TEXT, username TEXT, type TEXT);" )
	end

	def insert_employees
		database_in_use.execute( "insert into employee_table (first, last, username, type) values ('Ryan', 'Adams', 'radams', 'non-admin')" )
		database_in_use.execute( "insert into employee_table (first, last, username, type) values ('Thomas', 'Yorke', 'tyorke', 'non-admin')" )
		database_in_use.execute( "insert into employee_table (first, last, username, type) values ('William', 'Corgan', 'wcorgan', 'admin')" )
	end

	def create_timesheet_table
		database_in_use.execute("create table if not exists timesheet_table (id INTEGER PRIMARY KEY, username TEXT, year TEXT, month TEXT, day TEXT, hours TEXT, project_type TEXT);" )
	end

	def insert_timesheet_projects
		database_in_use.execute( "insert into timesheet_table (username, year, month, day, hours, project_type) values ('radams','2014','11','15','5','Adobe')" )
		database_in_use.execute( "insert into timesheet_table (username, year, month, day, hours, project_type) values ('tyorke','2014','11','26','5','PTOProject')" )
		database_in_use.execute( "insert into timesheet_table (username, year, month, day, hours, project_type) values ('jlewis','2014','11','3','6','Praxair')" )

	end
end