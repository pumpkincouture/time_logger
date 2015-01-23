require_relative 'employee'
require_relative 'logger_constants'

class AdminEmployee < Employee
	include LoggerConstants

	attr_reader :action

	def welcome(ui)
	  ui.welcome(@first)
	end

	def get_choice(ui)
		ui.choose_action
		validate_action_choice(prompt_for_options(ui), ui)
		ui.print_admin_choice(@action)
	end

	def prompt_for_options(ui)
	  ui.display_admin_options
	  ui.capture_selection
	end

	def validate_action_choice(choice, ui)
		@action = possible_actions(choice, ui)
		until @action
			ui.print_choice_error
			self.validate_action_choice(prompt_for_options(ui), ui)
		end
	end

  private 

	def possible_actions(choice, ui)
		ADMIN_OPTIONS.each {|number, option| return number.to_s if choice == number.to_s}
	  nil
	end
end