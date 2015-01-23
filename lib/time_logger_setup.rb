
require_relative 'data_parser'
require_relative 'data_object_setup'
require_relative 'user_interface'

class TimeLoggerSetup

	attr_reader :employees, :clients, :projects, :current_employee, :ui

	def initialize(database)
		@database = database
		@parser = DataParser.new(@database)
		@object_setup = DataObjectSetup.new(@parser.get_employees, @parser.get_clients)
		@ui = UserInterface.new
	end

	def perform_setup
		get_all_data 
		get_current_employee
	end

	def get_all_data
		assign_time_logger_objects
	end

	def get_current_employee
		get_employee(prompt_for_username)
	end

	def prompt_for_username
		@ui.get_username
        @ui.capture_selection
	end

	def get_employee(employee_username)
		@current_employee = verify_employee(employee_username)
		until @current_employee
			@ui.print_choice_error
			self.get_employee(prompt_for_username)
		end
	end

	private

	def assign_time_logger_objects
		@object_setup.create_objects
		@clients = @object_setup.clients
		@employees = @object_setup.employees
		@projects = @parser.get_projects
	end

	def verify_employee(username)
		@employees.each do |employee|
			return employee if employee.username == username
		end
		false
	end
end