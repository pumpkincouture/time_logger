require_relative 'spec_helper'

describe ProjectFactory do 

	before :each do
		@project_f = ProjectFactory.new(@code)
	end

	it "creates a billable project" do
		@project_f.code = "Billable"
		expect(@project_f.create_projects("2014", "09", "14", "3").hours).to eq("3")
	end

	it "creates a non-billable project" do
		@project_f.code = "Non-billable"
		expect(@project_f.create_projects("2014", "09", "14", "3").month).to eq("09")
		expect(@project_f.create_projects("2014", "09", "14", "7").hours).to eq("7")
	end

	it "creates a PTO project" do
	  @project_f.code = "PTO"
		expect(@project_f.create_projects("2012", "01", "14", "5").hours).to eq("5")
		expect(@project_f.create_projects("2012", "01", "14", "5").day).to eq("14")
	end
end