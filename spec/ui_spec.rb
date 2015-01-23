
require_relative 'spec_helper'

describe UserInterface do

	let (:employee) {@employee_f.create_employee({:first=>"Ryan", :last=>"Adams", :username=>"radams", :type=>"non-admin"})}

	def create_clients
		client_list = []
		client_list << @client_f.create_client({:name=>"Praxair", :type=>"standard"})
		client_list << @client_f.create_client({:name=>"Aflac", :type=>"standard"})
		client_list << @client_f.create_client({:name=>"Autodesk", :type=>"standard"})	
		client_list
	end

	before :each do 
		@employee_f = EmployeeFactory.new
		@ui = UserInterface.new
		@client_f = ClientFactory.new
		@user_choices = UserChoices.new(@clients, @current_employee, @project_factory, @report, @ui)
		@validator = ValidateInput.new(@ui, @clients, @employees)
	end

	it "prompts for username" do
		expect { @ui.get_username }.to output("Please enter your unique username.\n").to_stdout
	end

	it "welcomes the employee to the program" do
		expect { @ui.welcome(employee.first) }.to output("Welcome Ryan!\n").to_stdout
	end

	it "displays standard employee options" do
		expect { @ui.display_standard_options }.to output("1 : Log time\n2 : Request time report\n").to_stdout
	end

	it "displays admin employee options" do
		expect { @ui.display_admin_options }.to output("1 : Log time\n2 : Request time report\n3 : Add employee\n4 : Add client\n5 : Request employee report\n").to_stdout
	end

	it "displays billing options" do
		expect { @ui.display_bill_code }.to output("1 : Billable\n2 : Non-billable\n3 : PTO\n").to_stdout
	end

	it "displays client options" do
		expect { @ui.display_clients(create_clients) }.to output("Praxair\nAflac\nAutodesk\n").to_stdout
	end

	it "prints chosen standard option" do
		expect { @ui.print_standard_choice("1") }.to output("You've chosen : Log time\n").to_stdout
	end

	it "prints chosen admin option" do
		expect { @ui.print_admin_choice("4") }.to output("You've chosen : Add client\n").to_stdout
	end

	it "prints chosen chosen billcode" do
		@validator.validate_bill_code("2")
		expect { @ui.print_billcode_choice(@validator.bill_code)}.to output("You've chosen : Non-billable\n").to_stdout
	end

	it "prints chosen client" do
		@validator.client_choice = "Pfizer"
		@validator.input_client_choice
		expect { @ui.print_client_choice(@validator.client_choice)}.to output("You've chosen to bill to : Pfizer\n").to_stdout
	end

	it "prints permission error" do
		expect { @ui.print_choice_error }.to output("That is not a valid choice, please try again.\n").to_stdout
	end

	it "prints time error" do
		expect { @ui.print_time_error }.to output("You cannot log time for the future, please select a different date.\n").to_stdout
	end
end