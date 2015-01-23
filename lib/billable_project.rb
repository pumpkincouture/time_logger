require_relative 'project'

class BillableProject < Project 
	attr_accessor :client

	def get_client(client_choice)
		@client = client_choice
	end
end