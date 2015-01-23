class Employee
	attr_reader :first, :last, :username, :type

	def initialize(employee)
		@first = employee[:first]
		@last = employee[:last]
		@username = employee[:username]
		@type = employee[:type]
	end
end