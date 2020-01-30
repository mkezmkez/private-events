require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to render_template('new')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq(user)
    end

    it 'returns http success' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }
      expect(response).to render_template('show')
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'redirects to users show path' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to(user_path(User.last))
      end
    end
  end
end
