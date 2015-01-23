require_relative 'client'
require_relative 'logger_constants'

class ClientFactory
	include LoggerConstants

	def create_client(client = {})
		case client[:type]
		when STANDARD_CLIENT
			Client.new(client)
		end
	end
end