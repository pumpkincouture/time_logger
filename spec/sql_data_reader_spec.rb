
require_relative 'spec_helper'

describe SqlDataReader do

	before :each do
        @sql_reader = SqlDataReader.new
	end
 
    	it "returns the id of the entry with a number greater than 200" do 
      		expect(@sql_reader.query_sample).to eq([[2]])
      	end

     	it "returns the client name of the client whose name ends in 'desk.'" do
          	expect(@sql_reader.query_client).to eq([["Autodesk"]])
        end

        it "returns the employee whose type is 'admin'" do 
          	expect(@sql_reader.query_employee).to eq([["William", "Corgan"]])
        end

        it "returns usernames of people who billed to PTO for the month of November" do 
          	expect(@sql_reader.query_project).to eq([["tyorke"]])
        end
end 
