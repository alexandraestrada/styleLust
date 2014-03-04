require 'spec_helper'


describe UsersController do
	describe 'GET' do 
		context 'index' do
			it 'returns http success' do				
				User.should_receive(:new).and_return("blah")
				get 'index'
				expect(assigns(:user)).to eq "blah"				
				response.should be_success

			end

		end
		context 'new' do
			it 'returns http success' do
				User.should_receive(:new).and_return("blah")
				get 'new'
				expect(assigns(:user)).to eq "blah"
				expect(response).to redirect_to(root_path)
			end
		end

		context 'show' do
			it 'returns http success' do
				User.should_receive(:find).with("5").and_return("qellieg")
				get 'show', {id:5} 
				expect(assigns(:user)).to eq "qellieg"
				response.should be_success
			end
		end

		context 'edit' do
			it 'returns http success' do
				User.should_receive(:find).with("5").and_return("waffles")
				get 'edit', {id:5}
				expect(assigns(:user)).to eq "waffles"
				response.should be_success
			end
		end
	end 



	describe "POST 'create'" do 
		context 'when user is valid' do
			it 'saves the athlete with the params given, sets flash notice, and redirects to the root_path' do
				User.any_instance.stub(:valid?).and_return(validity: true)
				post 'create', {user: {email: "example@example.com"}}
				expect(flash[:notice]).to eq "account created"
				expect(response).to redirect_to root_path
				expect(assigns(:user)).to be_persisted
			end
		end

		context 'when user is invalid' do
			it 'sets a flash error and renders the template new' do
				User.any_instance.stub(:valid?).and_return(validity: false)
				post 'create', {user: {email: "example@example.com"}}
				expect(flash[:error]).to eq "account could not be created"
				expect(response).to render_template('new')
			end
		end

		context 'when every possible welcome param is present' do
			let(:valid_params) do
				{
					user: {
						first_name: "Ellie",
						last_name: "Hoshizaki",
						email: "elena.hoshizaki@gmail.com",
						password: "anystring"
					}
				}
			end

			it 'the controller lets them all through' do
				post 'create', valid_params

				expect(assigns(:user).first_name).to eq "Ellie"
				expect(assigns(:user).last_name).to eq "Hoshizaki"
				expect(assigns(:user).email).to eq "elena.hoshizaki@gmail.com"
				expect(assigns(:user).password).to eq "anystring"
			end
		end

		context 'when extra params are present' do
			it 'the extra params are dropped' do
				User.should_receive(:new).with({}).and_call_original
				post 'create', { user: { backpack: 'thing'}}
			end
		end
	end






	# do crud: index, new, show, edit, create, update, destroy
	# make 4 describes one for each action
		


	# 	describing get
	# 		context 'new'
	# 	describing post
	# 	describing patch
	# 	describing delete


end
