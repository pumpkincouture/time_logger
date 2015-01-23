require_relative 'spec_helper'

describe Client do 
	
	before :each do
		@client = Client.new({:name=>"Aflac", :type=>"standard"})
	end

  it "creates client with name" do
	  expect(@client.name).to eq("Aflac")
	end

  it "creates client with type" do
	  expect(@client.type).to eq("standard")
	end
end