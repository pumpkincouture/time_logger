require_relative 'spec_helper'

describe Project do 

	before :each do
		@project = Project.new("2014", "10", "26", "5")
	end

	it "creates project with hours" do
		expect(@project.hours).to eq("5")
	end

	it "creates project with date" do
		expect(@project.month).to eq("10")
		expect(@project.day).to eq("26")
		expect(@project.year).to eq("2014")
	end
end
