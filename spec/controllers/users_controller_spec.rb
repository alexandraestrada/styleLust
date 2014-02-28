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
		# context 'new' do
		# 	#it 'returns http success' do
		# 	end
		# end
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
