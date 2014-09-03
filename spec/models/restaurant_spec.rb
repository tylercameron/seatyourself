require 'rails_helper'

describe Restaurant do
	let!(:restaurant) { Restaurant.create }

	it "must be invalid without a name" do
		restaurant.name.should == nil
		restaurant.should_not be_valid
	end

	it "must be valid with a name" do
		restaurant.name = "some name"
		restaurant.should be_valid
	end

	it "must have an positive integer capacity" do
		restaurant.capacity.should be_kind_of Integer
		restaurant.capacity.should be >= 1
	end

end
