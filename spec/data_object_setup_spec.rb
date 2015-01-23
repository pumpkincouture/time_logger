require_relative 'spec_helper'

describe DataObjectSetup do

	before :each do 
	  @database = SQLite3::Database.open "time_logger.db"
	  @parser = DataParser.new(@database)
	  @data_object_setup = DataObjectSetup.new(@parser.get_employees, @parser.get_clients)
	end	

	it "creates employees" do
		@data_object_setup.create_objects
		expect(@data_object_setup.employees[0].first).to eq("Ryan")
		expect(@data_object_setup.employees[0].type).to eq("non-admin")
		expect(@data_object_setup.employees[0].username).to eq("radams")
	end

	it "creates clients" do
		@data_object_setup.create_objects
		expect(@data_object_setup.clients[0].name).to eq("Autodesk") 
		expect(@data_object_setup.clients[0].type).to eq("standard")
	end
end