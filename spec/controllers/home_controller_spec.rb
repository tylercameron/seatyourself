require 'rails_helper'

describe HomeController do

	# without this, won't render views and so can't test them
	# perhaps should move to a separate view test?
	render_views

	it "shows sign up/in links when not signed in" do
		get :home
		expect(response.status).to eq(200)
		expect(response.body).to match 'Sign up'
		expect(response.body).to match 'Sign in'
	end

	it "shows sign out link when signed in" do
		User.count.should eql 0
	    FactoryGirl.create(:user)
	    # Note: The 3rd parameter to "get" is the session.
	    # See http://guides.rubyonrails.org/testing.html
	    get :home, {}, { :user_id => 1 }
		expect(response.status).to eq(200)
		expect(response.body).to match 'Sign out'
	end

end