require 'spec_helper'

describe AuthsController do
  describe "GET 'new'" do
    before :each do
      controller.stub(:current_user).and_return(current_user)
    end
    context 'when user is not logged in' do
      let(:current_user) {nil}
      it "returns http success" do
        User.should_receive(:new).and_return("test")
        get 'new'
        expect(assigns(:user)).to eq "test"
        expect(response).to redirect_to root_path
      end
    end
    context 'when user is logged in' do
      let(:current_user) {User.create(email: "example@example.com")}
      it 'redirect to edit_user_path' do
        get 'new'
        expect(response).to redirect_to items_path
      end
    end
  end

  # describe "GET 'create'" do
  #   it "returns http success" do
  #     get 'create'
  #     response.should be_success
  #   end
  # end

end
