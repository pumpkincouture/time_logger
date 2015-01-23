
require_relative 'client_factory'
require_relative 'employee_factory'

class DataObjectSetup

	attr_reader :employees, :clients

	def initialize(employee_list, client_list)
		@employee_list = employee_list
		@client_list = client_list
		@employee_factory = EmployeeFactory.new
		@client_factory = ClientFactory.new 
	end

	def create_objects
		create_employees
		create_clients
	end

	private

	def create_employees
		@employees = @employee_list.map {|employee| @employee_factory.create_employee(employee)}
	end

	def create_clients
		@clients = @client_list.map {|client| @client_factory.create_client(client)}
	end
end