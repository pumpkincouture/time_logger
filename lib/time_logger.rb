require_relative 'logger_constants'
require_relative 'user_choices'
require_relative 'user_interface'

class TimeLogger
	include LoggerConstants

	attr_reader :logged_out

	def initialize(current_employee, clients, projects, employees)
		@current_employee = current_employee
		@clients = clients
		@projects = projects
		@employees = employees
		@ui = UserInterface.new
		@user_choices = UserChoices.new(@clients, @employees, @projects, @current_employee, @ui)
	end

	def run!
		@current_employee.welcome(@ui)
		until logged_out
			logged_in
		end
		@ui.logout_success
	end

	def logged_in
	  @current_employee.get_choice(@ui)
	  @user_choices.choose_action(@current_employee.action)
	  @ui.print_log_out_message
	  get_logout_choice
	end

	def get_logout_choice
		validate_log_out(log_out)
	end

  private

	def log_out
		@ui.capture_and_downcase
	end

	def validate_log_out(logout)
		logout == YES_LOG_OUT ? @logged_out = true : @logged_out = false
	end
end