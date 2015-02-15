require_relative 'logger_constants'
require_relative 'project_factory'
require_relative 'file_writer'
require 'model_citizen'

class ValidateInput
	include LoggerConstants
	require 'date'

	attr_accessor :bill_code, :project, :client_choice, :employee_choice, :client_type_choice, :username, :client_name

	def initialize(ui, clients, employees)
		@ui = ui
		@clients = clients
		@employees = employees
		@project_factory = ProjectFactory.new(@code)
		@file_writer = FileWriter.new
	end

	def input_billcode
		create_project_billcode
		@project_factory.code = @bill_code
	end

	def create_project_billcode
		validate_bill_code(choose_bill_code)
		@ui.print_billcode_choice(@bill_code)
	end

	def validate_bill_code(choice)
		@bill_code = bill_code_choices(choice)
		until @bill_code
			@ui.print_choice_error
			self.validate_bill_code(choose_bill_code)
		end
	end

	def choose_bill_code
		@ui.prompt_for_bill_code
		@ui.display_bill_code
		@ui.capture_selection
	end

	def bill_code_choices(choice)
		BILL_OPTIONS.each do |number, option|
			return option if choice == number.to_s
		end
		nil
	end

	def create_chosen_project(date, hours)
		@project = @project_factory.create_projects(get_year(date), get_month(date), get_day(date), hours)
	end

	def pick_date
		validate_date_string(choose_project_date)
	end

	def pick_hours
		@ui.prompt_for_hours
		@ui.capture_selection
	end

	def choose_project_date
		@ui.prompt_for_date
		@ui.capture_selection
	end

	def validate_date_string(project_date)
		if ModelCitizen::Validations.new.valid_date?(project_date)
			return project_date
		else
			@ui.print_choice_error
			self.validate_date_string(choose_project_date)
		end
	end

	def input_client_choice
		unless check_for_billable == false
		  @project.get_client(@client_choice)
		  @ui.print_client_choice(@client_choice.name)
		end
	end

	def check_for_billable
	  @project.class.name == BILLABLE_PROJECT_TYPE ? validate_client(get_client_choice) : false
	end

	def get_client_choice
		@ui.prompt_for_client
		@ui.display_clients(@clients)
		@ui.capture_and_downcase
	end

	def validate_client(choice)
		@client_choice = client_choices(choice)
		until @client_choice
			@ui.print_choice_error
			self.validate_client(get_client_choice)
		end
	end

	def pick_type(employee_type_choice)
		@employee_choice = employee_type_options(employee_type_choice)
		until @employee_choice
			@ui.print_choice_error
			self.pick_type(@ui.get_employee_type)
		end
	end

	def pick_username(employee_username)
		@username = check_duplicate_employee(employee_username)
		if @username != nil
		  @ui.duplicate_exists
		  pick_type(@ui.get_employee_type)
		  pick_username(@ui.get_employee_username)
		else
		  @username = employee_username
		end
	end

	def pick_client_type(client_choice)
		@client_type_choice = client_type_options(client_choice)
		until @client_type_choice
			@ui.print_choice_error
			self.pick_client_type(@ui.get_client_type)
		end
	end

	def pick_client_name(client_name)
		@client_name = check_duplicate_client(client_name)
		if @client_name != nil
		  @ui.duplicate_exists
		  pick_client_type(@ui.get_client_type)
		  pick_client_name(@ui.get_client_name)
		else
		  @client_name = client_name
		end
	end

	private

	def get_month(project_date)
		Date.strptime(project_date, '%Y/%m/%d').mon.to_s
	end

	def get_day(project_date)
		Date.strptime(project_date, '%Y/%m/%d').day.to_s
	end

	def get_year(project_date)
	  Date.strptime(project_date, '%Y/%m/%d').year.to_s
	end

	def client_choices(choice)
		@clients.each {|client| return client if client.name.downcase == choice}
    nil
	end

	def employee_type_options(employee_type_choice)
		return employee_type_choice if employee_type_choice == NONADMIN
		return employee_type_choice if employee_type_choice == ADMIN
		nil
	end

	def check_duplicate_employee(employee_username)
		@employees.each {|employee| return employee.username if employee_username == employee.username}
		nil
	end

	def check_duplicate_client(client_name)
		@clients.each {|client| return client.name if client_name.capitalize == client.name}
		nil
	end

	def client_type_options(client_choice)
		return client_choice if client_choice == STANDARD
		nil
	end
end