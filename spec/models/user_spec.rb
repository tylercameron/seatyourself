require 'rails_helper'

describe User do
	let!(:user) { FactoryGirl.create(:user) }

	it "must be invalid without a name" do
		user.name = ""
		expect(user).to_not be_valid
	end

	it "must be invalid without an email" do
		user.email = ""
		expect(user).to_not be_valid
	end

	it "must be invalid without a password and confirmation" do
		user.password = ""
		user.password_confirmation = ""
		expect(user).to_not be_valid
	end

	it "must be invalid without password confirmation matching" do
		user.password = "one"
		user.password_confirmation = "two"
		expect(user).to_not be_valid
	end

	it "must authenticate with a matching password" do
		user.password = "a_password"
		user.password_confirmation ="a_password"
		expect(user.authenticate("a_password")).to eq(user)
	end

	it "must not authenticate without password confirmation matching" do
		user.password_confirmation = "two"
		expect(user.authenticate("one")).to be false
	end

	it "must not allow two users to have the same email" do
		user2 = FactoryGirl.build(:user)
		expect(user2).to_not be_valid
	end

end
