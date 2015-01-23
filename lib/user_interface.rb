require_relative 'logger_constants'

class UserInterface
	include LoggerConstants

  def get_username
    puts "Please enter your unique username."
  end

  def welcome(employee)
  	puts "Welcome #{employee}!"
  end

  def choose_action
    puts "Please select what you'd like to do."
  end

  def display_standard_options
  	STANDARD_OPTIONS.each {|number, option| puts "#{number} : #{option}"}
  end
  
  def display_admin_options
  	ADMIN_OPTIONS.each {|number, option| puts "#{number} : #{option}"}
  end

  def prompt_for_bill_code
    puts "Please choose your billcode."
  end

  def print_choice_error
    puts "That is not a valid choice, please try again."
  end

  def display_bill_code
    BILL_OPTIONS.each {|number, option| puts "#{number} : #{option}"}
  end

  def prompt_for_client
    puts "Please input the name of the client."
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
    puts "Please enter employee first name."
    capture_selection
  end

  def get_employee_last
    puts "Please enter employee last name."
    capture_selection
  end

  def get_employee_username
    puts "Please enter employee username."
    capture_and_downcase
  end

  def get_employee_type
    puts "Please enter employee type (admin or non-admin)."
    capture_and_downcase
  end

  def no_client_info
    puts "No monthly information available for client." 
  end

  def get_client_name
    puts "Please enter client name."
    gets.chomp.capitalize
  end

  def get_client_type
    puts "Please enter client type (if regular client, please enter 'standard')."
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
    puts "Please input the project date using this format : YYYY/MM/DD"
  end

  def print_time_error
    puts "You cannot log time for the future, please select a different date."
  end

  def prompt_for_hours
    puts "Please input hours worked"
  end

  def print_client_error
    puts "Client not found, please try again."
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
