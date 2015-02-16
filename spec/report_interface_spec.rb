require_relative 'spec_helper'

describe ReportInterface do

	before :each do
	  @database = SQLite3::Database.open "time_logger.db"
	  @parser = DataParser.new(@database)
	  @data_object_setup = DataObjectSetup.new(@parser.get_employees, @parser.get_clients)
	  @report = Report.new(@parser.get_projects)
	  @ri = ReportInterface.new
	end

	it "prints employee projects" do
		expect { @ri.print_employee_projects(@report.employee_monthly_projects("radams")) }.to output("Project: NonBillableProject, Hours: 6\n").to_stdout
	end

	it "prints all employee activity for the month" do
		expect { @ri.print_all_employee_details(@report.get_months_projects) }.to output("Employee: radams, Project: NonBillableProject, Hours: 6, Date: 2015/2/13\n").to_stdout
	end

	it "prints details for project argument" do
		expect { @ri.print_details(@report.get_employee_details("tyorke"))}.to output("No billed time for this month.\n").to_stdout

	end

	it "prints client totals for the month" do
		expect { @ri.print_client_totals(@report.monthly_client_total) }.to output("No billed time for this month.\n").to_stdout
	end
end
