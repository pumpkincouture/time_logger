
require_relative 'logger_constants'

class Report
	require 'date'
	include LoggerConstants
	
	attr_accessor :projects
	
	def initialize(projects)
		@projects = projects
	end

	def get_months_projects
		projects_this_month
	end

	def get_employee_projects(employee)
		filter_projects_by_employee(employee)
	end

	def get_employee_details(employee)
		projects_and_details = []
		projects_and_details << employee_pto_projects(employee)
		projects_and_details << employee_billable_projects(employee)
		projects_and_details << employee_nonbillable_projects(employee)
		projects_and_details
	end

	def monthly_client_total
		get_specific_client
	end


	def employee_monthly_projects(employee)
		get_employee_monthly_totals(employee)
	end

	def get_all_monthly_projects
		monthly_projects = []
		monthly_projects << monthly_pto_projects
		monthly_projects << monthly_billable_projects
		monthly_projects << monthly_non_billable_projects
		monthly_projects
	end

	private

	def projects_this_month
		@projects.select{|project| project[:month] == get_month && project[:year] == get_year}
	end

	def filter_projects_by_employee(employee)
	  projects_this_month.select{|project| project[:username] == employee}
	end

	def get_month
		Date.today.month.to_s
	end

	def get_year
		Date.today.year.to_s
	end

	def employee_pto_projects(employee)
		filter_projects_by_employee(employee).select{|project| project[:project_type] == PTO_PROJECT_TYPE}
	end

	def employee_billable_projects(employee)
	  filter_projects_by_employee(employee).select{|project| project[:project_type] != BILLABLE_PROJECT_TYPE && project[:project_type] != PTO_PROJECT_TYPE && project[:project_type] != NON_BILLABLE_PROJECT_TYPE }
	end

	def employee_nonbillable_projects(employee)
  	filter_projects_by_employee(employee).select{|project| project[:project_type] == NON_BILLABLE_PROJECT_TYPE}
	end

	def get_employee_monthly_totals(employee)
		totals = Hash.new

		filter_projects_by_employee(employee).each do |project|
			totals[get_type(project)] = get_hours_worked(project)
		end
		totals
	end

	def monthly_pto_projects
		projects_this_month.select{|project| project[:project_type] == PTO_PROJECT_TYPE}
	end

	def monthly_billable_projects
		projects_this_month.select{|project| project[:project_type] != BILLABLE_PROJECT_TYPE && project[:project_type] != PTO_PROJECT_TYPE && project[:project_type] != NON_BILLABLE_PROJECT_TYPE }
	end

	def monthly_non_billable_projects
		projects_this_month.select{|project| project[:project_type] == NON_BILLABLE_PROJECT_TYPE}
	end

	def get_hours_worked(project)
		project[:hours].to_i
	end
	
	def get_specific_client
		clients = Hash.new

		monthly_billable_projects.each do |project|
			clients[get_type(project)] = get_hours_worked(project)
		end
		clients
	end

	def get_type(project)
		project[:project_type]
	end
end