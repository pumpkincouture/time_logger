require_relative 'spec_helper'

describe ValidateInput do

	let (:employee) {@employee_f.create_employee({:first=>"Ryan", :last=>"Adams", :username=>"radams", :type=>"non-admin"})}

	def create_clients
		client_list = []
		client_list << @client_f.create_client({:name=>"Praxair", :type=>"standard"})
		client_list << @client_f.create_client({:name=>"Aflac", :type=>"standard"})
		client_list << @client_f.create_client({:name=>"Autodesk", :type=>"standard"})
		client_list
	end

	def create_employees
		employees = []
		employees << @employee_f.create_employee({:first=>"Ryan", :last=>"Adams", :username=>"radams", :type=>"non-admin"})
		employees << @employee_f.create_employee({:first=>"Thomas", :last=>"Yorke", :username=>"tyorke", :type=>"admin"})
		employees << @employee_f.create_employee({:first=>"William", :last=>"Corgan", :username=>"wcorgan", :type=>"non-admin"})
		employees
	end

	before :each do
	  @employee_f = EmployeeFactory.new
	  @client_f = ClientFactory.new
	  @database = SQLite3::Database.open "time_logger.db"
	  @parser = DataParser.new(@database)
	  @data_object_setup = DataObjectSetup.new(@parser.get_employees, @parser.get_clients)
	  @ui = UserInterface.new
	  @validator = ValidateInput.new(@ui, create_clients, create_employees)
	  @project_factory = ProjectFactory.new(@code)
	end

	it "validates bill code" do
		@validator.validate_bill_code("2")
		expect(@validator.bill_code).to eq("Non-billable")
	end

	it "validates date input" do
		@validator.validate_bill_code("3")
		@validator.validate_date_string("2014/11/2")
		@project_factory.code = @validator.bill_code
		project = @project_factory.create_projects("2014","11","02","6")
		@validator.project = project
		expect(@validator.project.class).to eq(PTOProject)
	end

	it "validates client choice" do
		@validator.validate_client("praxair")
		expect(@validator.client_choice.name).to eq("Praxair")
	end

	it "checks if project is billable" do
		@validator.validate_bill_code("2")
		@project_factory.code = @validator.bill_code
		project = @project_factory.create_projects("2014","11","01","6")
		@validator.project = project
		expect(@validator.check_for_billable).to be false
	end

	it "validates type of employee currently available" do
		@validator.pick_type("admin")
		expect(@validator.employee_choice).to eq("admin")
	end

	it "checks if user already exists" do
		@validator.pick_username("yokel")
		expect(@validator.username).to eq("yokel")
	end

	it "validates type of client currently available" do
		@validator.pick_client_type("standard")
		expect(@validator.client_type_choice).to eq("standard")
	end

	it "checks for client duplicate" do
		@validator.pick_client_name("Pfizer")
		expect(@validator.client_name).to eq("Pfizer")
	end
end