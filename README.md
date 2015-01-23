#Time Logger Application

An application for employees to log their time or run reports. Written in Ruby version 2.1.2.

##Instructions to run the program

Clone the repository to your computer. Navigate into the ```time_logger/bin``` directory via the Terminal. Type ```ruby run_time_logger.rb``` to begin the program.

##Overview of the program

After typing ```ruby run_time_logger.rb``` into Terminal, the program will run and prompt for employee login information. The employee can then choose which actions they would like to perform.

* All employees can log their time for several projects and can view their own monthly time
* Employees with administrative privileges can, in addition, add clients and employees into the database
* Admin employees can run a report with information about all employees

The program will terminate once the employee has chosen to log out.

##Instructions to run the test suite

In the main ```time_logger``` directory, type ```rspec spec/``` to run all tests simultaneously.

