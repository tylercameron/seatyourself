require 'spec_helper'

describe UsersController do

	# without this, won't render views and so can't test them
	# perhaps should move to a separate view test?
	render_views

	describe "what to call this" do

		it "shows validation errors when password not provided" do
		    params = {
		      name: "Example",
		      email: "example@example.org",
		      password: "",
		      password_confirmation: ""
		    }    
		    post :create, user: params
			expect(response.status).to eq(200)
			expect(response.body).to match 'Password can&#x27;t be blank'
			expect(response.body).to match 'Password confirmation can&#x27;t be blank'
		end

		it "creates a user" do
		    params = {
		      name: "Sample Diner",
		      email: "sample@example.org",
		      password: "def456",
		      password_confirmation: "def456"
		    }
		    assert_difference('User.count', 1) do
		    	post :create, user: params
    		end
    		expect(response).to redirect_to root_path
		end

		it "dislays a new user form" do
			get :new
			# the old test checked that these were within <label>s, so this is not quite as good as that
			expect(response.body).to match 'Name'
			expect(response.body).to match 'Email'
			expect(response.body).to match 'Password'
			expect(response.body).to match 'Password confirmation'
		end

	end

end