require_relative 'spec_helper'

describe DataParser do

	before :each do
	  @database = SQLite3::Database.open "time_logger.db"
	  @parser = DataParser.new(@database)
	end

	after :each do
		@database.execute("drop sample_employees")
	end

	it "returns employees" do
		@database.execute( "create table sample_employees (id INTEGER PRIMARY KEY, first TEXT, last TEXT, username TEXT, type TEXT);" )
		@database.execute( "insert into sample_employees (first, last, username, type) values ('James', 'Krause', 'jkrause', 'non-admin')" )
		expect(@parser.get_employees.last).to eq([ {:first => "James",
       																					:key => 7,
       																					:last => "Krause",
       																					:type => "non-admin",
       																					:username => "jkrause"} ])
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