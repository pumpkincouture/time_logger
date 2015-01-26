require 'sinatra'
require 'data_mapper'
require_relative 'lib/logger_constants.rb'
require 'date'

configure :development do
    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/time_logger.db")
end

configure :production do
    DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_RED_URL'])
end

# DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/time_logger.db")
include LoggerConstants

class Employee
  include DataMapper::Resource
  storage_names[:default] = "employee_table"
  property :id, Serial
  property :first, String
  property :last, String
  property :username, String
  property :type, String
end

class Client
	include DataMapper::Resource
	storage_names[:default] = "client_table"
	property :id, Serial
	property :name, String
	property :type, String
end

class TimeSheet
	include DataMapper::Resource
	storage_names[:default] = "timesheet_table"
	property :id, Serial
	property :username, String
	property :year, String
	property :month, String
	property :day, String
	property :hours, String
	property :project_type, String
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  @title = "Time Logger"
  erb :home
end

post '/options' do
	return_employee
	if return_employee.empty?
		erb :home_username_failed
	elsif return_employee.first(:type => 'admin') 
		erb :admin_form
	else 
		erb :non_admin_form
	end
end

post '/selection' do
   @clients = Client.all
   if params[:admin]
   	 	choice = call_constants(params[:admin])
   		choose_form(choice)
   elsif params[:nonadmin]
   		choice = call_constants(params[:nonadmin])
   		choose_form(choice)
   end
end

get '/add_employee' do
	erb :add_employee
end

get '/add_client' do
	erb :add_client
end

post '/add_employee' do 
	until verify_fields([params[:first], params[:last], params[:username], params[:employee_type]])
		redirect '/add_employee'
	end
	erb :add_employee_success
end

post '/add_client' do
	until verify_fields([params[:client_name], params[:client_type]])
		redirect '/add_client'
	end
	erb :add_client_success
end

private

def choose_form(choice)
  case choice
  when CHOICE_1
  	erb :log_time
  when CHOICE_2
  	@time_sheet= TimeSheet.all(:month => get_month) & TimeSheet.all(:year =>get_year)
  	erb :time_report
  when CHOICE_3
  	erb :add_employee
  when CHOICE_4
  	erb :add_client
  when CHOICE_5
  	erb :employee_report
  end
end

def return_employee
 @employees = Employee.all(username: params[:username])
end

def verify_fields(params)
	params.each do |param|
		if param == nil || param.empty? 
			return false		
		end
	end
end

def call_constants(params)
	ADMIN_OPTIONS.each {|number, option| return number.to_s if params == number.to_s}
end

def get_month
	Date.today.month.to_s
end

def get_year
	Date.today.year.to_s
end




