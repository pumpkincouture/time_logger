class Project
	attr_reader :year, :month, :day, :hours
	
	def initialize(*project)
		@year = project[0]
		@month = project[1]
		@day = project[2]
		@hours = project[-1]
	end
end