require_relative 'validate_input'
require_relative 'logger_constants'
require_relative 'report'
require_relative 'file_writer'
require_relative 'report_interface'

class UserChoices
	include LoggerConstants

	def initialize(clients, employees, projects, current_employee, ui)
		@clients = clients
		@employees = employees
		@projects = projects
		@current_employee = current_employee
		@ui = ui
		@validator = ValidateInput.new(@ui, @clients, @employees)
		@report = Report.new(@projects)
		@file_writer = FileWriter.new
		@report_interface = ReportInterface.new
	end

	def choose_action(employee_choice)
		case employee_choice
		when CHOICE_1
			log_time
			create_project
			add_project
		when CHOICE_2
			request_report
		when CHOICE_3
			add_employee
	  when CHOICE_4
	  	add_client
	  when CHOICE_5
	  	employee_report
	  end
	end

	private

	def log_time
		@validator.input_billcode
	end

	def create_project
		@validator.create_chosen_project(@validator.pick_date, @validator.pick_hours)
		@validator.input_client_choice
	end

	def add_project
		@file_writer.add_project(@current_employee.username, @validator.project)
	end

	def add_employee
		@validator.pick_type(@ui.get_employee_type)
		@validator.pick_username(@ui.get_employee_username)
		@file_writer.add_employee(@ui.get_employee_first, @ui.get_employee_last, @validator.username, @validator.employee_choice)
	end

	def add_client
		@validator.pick_client_type(@ui.get_client_type)
		@validator.pick_client_name(@ui.get_client_name)
		@file_writer.add_client(@validator.client_name, @validator.client_type_choice)
	end

	def request_report
		@report_interface.print_employee_projects(@report.employee_monthly_projects(@current_employee.username))
		@report_interface.print_details(@report.get_employee_details(@current_employee.username))
	end

	def employee_report
		@report_interface.print_client_totals(@report.monthly_client_total)
		@report_interface.print_details(@report.get_all_monthly_projects)
		@report_interface.print_all_employee_details(@report.get_months_projects)
	end
end