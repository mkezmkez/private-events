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
    it 'returns http success' do
      user = FactoryBot.create(:user)
      get :show, params: { id: user.id }

      expect(response).to render_template('show')
      expect(response).to have_http_status(:success)
    end
  end
end
