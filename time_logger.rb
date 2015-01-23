require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/time_logger.db")

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
  @employees = Employee.all 
  @title = "Time Logger"
  erb :home
end

post '/form' do
	@employees = Employee.all(username: params[:username])
	p "found: #{ @employees.map { |e| e.first + e.last }}"
	if @employees.empty?
		"You're not an employee, '#{params[:username]}'"
	else
	  erb :form
	end
end

