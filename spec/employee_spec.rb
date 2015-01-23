require_relative 'spec_helper'

describe Employee do 
	
	before :each do
		@employee = Employee.new({:first=>"Elena", :last=>"Goulding", :username=>"egoulding", :type=>"admin"})
	end

  it "creates employee with first name" do
	  expect(@employee.first).to eq("Elena")
	end

  it "creates employee with last name" do
	  expect(@employee.last).to eq("Goulding")
	end

  it "creates employee with username" do
	  expect(@employee.username).to eq("egoulding")
	end

  it "creates employee with type" do
	  expect(@employee.type).to eq("admin")
	end
end