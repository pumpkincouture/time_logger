require_relative 'spec_helper'

describe DataParser do

	before :each do
	  @database = SQLite3::Database.open "time_logger.db"
	  @parser = DataParser.new(@database)
	end

	it "returns employees" do
		expect(@parser.get_employees).to eq([{:key=> 1, :first=>"Ryan", :last=>"Adams", :username=>"radams", :type=>"non-admin"}, 
											 {:key=> 2, :first=>"Thomas", :last=>"Yorke", :username=>"tyorke", :type=>"non-admin"}, 
											 {:key=> 3, :first=>"William", :last=>"Corgan", :username=>"wcorgan", :type=>"admin"},
											 ])
	end

	it "returns clients" do
		expect(@parser.get_clients).to eq([{:key=> 1, :name=>"Autodesk", :type=>"standard"}, 
										   {:key=> 2, :name=>"Praxair", :type=>"standard"}, 
										   {:key=> 3, :name=>"Aflac", :type=>"standard"},
										   {:key=>4, :name=>"Sodexo", :type=>"standard"}])
	end

	it "returns projects" do
		expect(@parser.get_projects).to eq([{:key=>1, :username=>"radams", :year=>"2014", :month=>"11", :day=>"15", :hours=>"5", :project_type=>"Adobe"}, 
											{:key=>2, :username=>"tyorke", :year=>"2014", :month=>"11", :day=>"26", :hours=>"5", :project_type=>"PTOProject"}, 
											{:key=>3, :username=>"jlewis", :year=>"2014", :month=>"11", :day=>"3", :hours=>"6", :project_type=>"Praxair"},
											{:key=>4, :username=>"radams", :year=>"2015", :month=>"1", :day=>"16", :hours=>"6", :project_type=>"Aflac"}, 
											{:key=>5, :username=>"wcorgan", :year=>"2015", :month=>"1", :day=>"17", :hours=>"3", :project_type=>"Sodexo"}] )
	end
end