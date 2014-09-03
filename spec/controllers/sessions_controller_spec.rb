require 'rails_helper'

describe SessionsController do

	# without this, won't render views and so can't test them
	# perhaps should move to a separate view test?
	render_views

    # AplicationController methods are not available here, so cannot use current_user

	it "destroys a session on signout" do
		delete :destroy, {:id => "current"}, {:user_id => 1}
	    expect(session[:user_id]).to be_nil
	end

	it "creates a session on sign in" do
	    expect(User.count).to eql 0
	    user = FactoryGirl.create(:user)
	    # params hash below works because it uses the same values as in factory
	    post :create, {
	      :email => "dinerone@example.org",
	      :password => "abc123"
	    }
	    expect(session[:user_id]).to eql 1
	end

	it "displays a login form" do
		get :new
		# the old test checked that these were within <label>s, so this is not quite as good as that
		expect(response.body).to match 'Email address'
		expect(response.body).to match 'Password'
	end

end