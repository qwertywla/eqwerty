require 'rails_helper'

describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @user3 = FactoryBot.create(:admin)
  end

  describe 'GET #show' do
     context 'when a user is logged in' do
        before do
          sign_in @user
        end

        it 'loads correct user details' do
          get :show, params: {id: @user.id}
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq @user
        end
     end

     context 'when a user is not logged in' do
       it 'redirects to login' do
         get :show, params: { id: @user.id }
         expect(response).to redirect_to(root_path)
       end
     end
  end
end
