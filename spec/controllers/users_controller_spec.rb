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

		# context 'edit' do
		# 	it 'returns http success' do
		# 	end
		# end
		# context 'show' do
		# 	it 'returns http success' do
		# 	end
		# end

	end 








	# do crud: index, new, show, edit, create, update, destroy
	# make 4 describes one for each action
		


	# 	describing get
	# 		context 'new'
	# 	describing post
	# 	describing patch
	# 	describing delete


end
