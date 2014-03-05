require 'spec_helper'


describe UsersController do
	describe 'GET #index' do 
		before :each do
			controller.stub(:current_user).and_return(current_user)
		end

		context 'when someone is logged in' do
			let(:current_user) {User.create(email: "example@example.com")}
			it 'responds successfully with an HTTP 200 status code' do
				get "index"
				expect(response).to be_success
				expect(response.status).to eq(200)
			end
		end
		context 'when someone is not logged in' do
			let(:current_user) {nil}
			it 'redirect to root page and send flash alert' do
				get "index"
				expect(response).to redirect_to root_path
				expect(flash[:alert]).to eq "You must be logged in"
			end
		end
	end

	describe 'GET' do
		before :each do
			controller.stub(:current_user).and_return(current_user)
		end
		context 'index' do
			let(:current_user) {User.create(email: "example@example.com")}
			it 'returns http success' do				
				User.should_receive(:new).and_return("blah")
				get 'index'
				expect(assigns(:user)).to eq "blah"				
				response.should be_success
			end
		end

		context 'new' do
			let(:current_user) {User.create(email: "example@example.com")}
			it 'returns http success' do
				User.should_receive(:new).and_return("blah")
				get 'new'
				expect(assigns(:user)).to eq "blah"
			end
		end

		context 'show' do
			let(:current_user) {User.create(email: "example@example.com")}
			it 'returns http success' do
				User.should_receive(:find).with("5").and_return("qellieg")
				get 'show', {id:5} 
				expect(assigns(:user)).to eq "qellieg"
				response.should be_success
			end
		end

		context 'edit' do
			let(:current_user) {User.create(email: "example@example.com")}
			it 'returns http success' do
				User.should_receive(:find).with("5").and_return("waffles")
				get 'edit', {id:5}
				expect(assigns(:user)).to eq "waffles"
				response.should be_success
			end
		end
	end 



	describe "POST 'create'" do 
		let(:validity) {true}
		before :each do
			@valid_params = {
				user: {
					first_name: "Ellie",
					last_name: "Hoshizaki",
					email: "elena.hoshizaki@gmail.com",
					password: "anystring"
				}
			}
			User.any_instance.stub(:valid?).and_return(validity)

		end
		context 'when user is valid' do
			let(:validity) {true}
			it 'saves the athlete with the params given, sets flash notice, redirects to the root_path, and creates a session' do

				
				# session.should_receive(:[]).with(:user_id).and_return("1")
				post 'create', @valid_params.merge(user: {id: "1"})
				# session[:user_id].should be_nil
				expect(flash[:notice]).to eq "account created"
				expect(response).to redirect_to items_path
				expect(assigns(:user)).to be_persisted
			end
		end

		context 'when user is invalid' do
			let(:validity) {false}
			it 'sets a flash error and renders the template new' do
				post 'create', @valid_params
				expect(flash[:error]).to eq "account could not be created"
				expect(response).to redirect_to items_path
			end
		end

		context 'when every possible welcome param is present' do

			it 'the controller lets them all through' do
				post 'create', @valid_params

				expect(assigns(:user).first_name).to eq "Ellie"
				expect(assigns(:user).last_name).to eq "Hoshizaki"
				expect(assigns(:user).email).to eq "elena.hoshizaki@gmail.com"
				# expect(assigns(:user).password).to eq "anystring"
			end
		end

		context 'when extra params are present' do
			it 'the extra params are dropped' do
				User.should_receive(:new).with({}).and_call_original
				post 'create', { user: { backpack: 'thing'}}
			end
		end
	end






	# do crud: update, destroy
	# make 4 describes one for each action
		


	# 	describing patch
	# 	describing delete




end
