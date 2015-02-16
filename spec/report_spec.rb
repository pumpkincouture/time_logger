
require_relative 'spec_helper'

describe Report do

	before :each do
		@database = SQLite3::Database.open "time_logger.db"
	    @parser = DataParser.new(@database)
	    @data_object_setup = DataObjectSetup.new(@parser.get_employees, @parser.get_clients)
		@report = Report.new(@parser.get_projects)
	end

	it "returns all projects for a particular month" do
		expect(@report.get_months_projects.length).to eq(1)
	end

	it "returns an employee's monthly projects" do
		expect(@report.get_employee_projects("radams")).to eq(
			[{:key=>7, :username=>"radams", :year=>"2015", :month=>"2", :day=>"13", :hours=>"6", :project_type=>"NonBillableProject"}])
	end

	it "returns all of logged in employee's projects for current month" do
		expect(@report.get_employee_details("jlewis")).to eq([[], [], []])
	end

	it "returns monthly client total" do
		expect(@report.monthly_client_total).to eq({})
	end

	it "returns totals of logged in employee's projects for current month" do
		expect(@report.employee_monthly_projects("jlewis")).to eq({})
	end

	it "returns totals of all employee's projects for current month" do
		expect(@report.get_all_monthly_projects).to eq([[], [], [
																									{:key=>7, :username=>"radams", :year=>"2015", :month=>"2", :day=>"13", :hours=>"6", :project_type=>"NonBillableProject"}]])
	end
end