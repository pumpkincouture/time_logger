require_relative 'spec_helper'

describe EmployeeFactory do

	before :each do 
		@employee_f = EmployeeFactory.new
	end	

	it "creates an admin employee" do
		expect(@employee_f.create_employee({:first=>"Damien", :last=>"Rice", :username=>"drice", :type=>"admin"}).first).to eq("Damien") 
	end

	it "creates a standard employee" do
		expect(@employee_f.create_employee({:first=>"William", :last=>"Corgan", :username=>"wcorgan", :type=>"non-admin"}).first).to eq("William") 
	end
end