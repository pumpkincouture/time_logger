
require_relative 'admin_employee'
require_relative 'standard_employee'
require_relative 'logger_constants'

class EmployeeFactory
	include LoggerConstants

	def create_employee(employee = {})
		case employee[:type]
		when ADMIN
			AdminEmployee.new(employee)
		else
			StandardEmployee.new(employee)
		end
	end
end