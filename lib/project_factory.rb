require_relative 'billable_project'
require_relative 'non_billable_project'
require_relative 'pto_project'
require_relative 'logger_constants'

class ProjectFactory
  include LoggerConstants

  attr_accessor :code

  def initialize(code)
  	@code = code
  end

	def create_projects(*project)
		case @code
		when BILLABLE
            BillableProject.new(*project)
		when NONBILLABLE
			NonBillableProject.new(*project)
		when PTO
			PTOProject.new(*project)
		end
	end
end