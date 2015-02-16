require_relative 'logger_constants'
require 'model_citizen'

class UserInterface
	include LoggerConstants

  def get_username
    puts ModelCitizen::Messages.new.get_message("username_prompt")
  end

  def welcome(employee)
  	puts "Welcome #{employee}!"
  end

  def choose_action
    puts ModelCitizen::Messages.new.get_message("choose_action")
  end

  def display_standard_options
  	STANDARD_OPTIONS.each {|number, option| puts "#{number} : #{option}"}
  end

  def display_admin_options
  	ADMIN_OPTIONS.each {|number, option| puts "#{number} : #{option}"}
  end

  def prompt_for_bill_code
    puts ModelCitizen::Messages.new.get_message("enter_billing_type")
  end

  def print_choice_error
    puts ModelCitizen::Messages.new.get_message("invalid_choice")
  end

  def display_bill_code
    BILL_OPTIONS.each {|number, option| puts "#{number} : #{option}"}
  end

  def prompt_for_client
    puts ModelCitizen::Messages.new.get_message("enter_client_name")
  end

  def display_clients(client_list)
    client_list.each {|client| puts "#{client.name}"}
  end

  def capture_selection
   gets.chomp
  end

  def capture_and_downcase
    gets.chomp.downcase
  end

  def get_employee_first
    puts ModelCitizen::Messages.new.get_message("enter_employee_first")
    capture_selection
  end

  def get_employee_last
    puts ModelCitizen::Messages.new.get_message("enter_employee_last")
    capture_selection
  end

  def get_employee_username
    puts ModelCitizen::Messages.new.get_message("enter_employee_username")
    capture_and_downcase
  end

  def get_employee_type
    puts ModelCitizen::Messages.new.get_message("enter_employee_type")
    capture_and_downcase
  end

  def no_client_info
    puts "No monthly information available for client."
  end

  def get_client_name
    puts ModelCitizen::Messages.new.get_message("enter_client_name")
    gets.chomp.capitalize
  end

  def get_client_type
    puts ModelCitizen::Messages.new.get_message("enter_client_type")
    capture_selection
  end

  def print_standard_choice(choice)
    STANDARD_OPTIONS.each {|number, option| puts "You've chosen : #{option}" if number.to_s == choice}
  end

  def print_admin_choice(choice)
    ADMIN_OPTIONS.each {|number, option| puts "You've chosen : #{option}" if number.to_s == choice}
  end

  def print_billcode_choice(billcode)
    puts "You've chosen : #{billcode}"
  end

  def print_client_choice(client)
    puts "You've chosen to bill to : #{client}"
  end

  def prompt_for_date
    puts ModelCitizen::Messages.new.get_message("enter_date")
  end

  def print_time_error
    puts ModelCitizen::Messages.new.get_message("future_date_error")
  end

  def prompt_for_hours
    puts ModelCitizen::Messages.new.get_message("enter_hours")
  end

  def print_client_error
    puts ModelCitizen::Messages.new.get_message("invalid_client")
  end

  def duplicate_exists
    puts "This selection already exists. Please try again."
  end

  def print_log_out_message
    puts "Would you like to log out? Y/N"
  end

  def logout_success
    puts "You have successully logged out."
  end
end
