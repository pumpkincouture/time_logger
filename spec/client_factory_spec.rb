require_relative 'spec_helper'

describe ClientFactory do 

	before :each do 
		@client_f = ClientFactory.new
	end

	it "creates a client object" do
		expect(@client_f.create_client({:name=>"Autodesk", :type=>"standard"}).name).to eq("Autodesk")
	end

	it "creates a client object" do
		expect(@client_f.create_client({:name=>"Autodesk", :type=>"standard"}).type).to eq("standard")
	end
end