class Client
	attr_reader :name, :type
	
	def initialize(client)
		@name = client[:name]
		@type = client[:type]
	end
end