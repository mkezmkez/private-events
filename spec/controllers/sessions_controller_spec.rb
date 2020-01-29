require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #New' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the New template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'with valid information' do
      it 'redirect to root path' do
        user = FactoryBot.create(:user)
        post :create, params: { session: {name: user.name}}
        expect(response).to redirect_to root_path
      end
      it 'saves the user to the session' do
        user = FactoryBot.create(:user)
        post :create, params: { session: {name: user.name}}
        expect(session[:user_id]).to eql(user.id)
      end
    end
    context 'with invalid information' do
      it 're renders the #new' do
        user = FactoryBot.build(:user, name: "")
        post :create, params: { session: {name: user.name}}
        expect(response).to render_template :new
      end
        
      it 'does not save the user to the session' do
        #user = FactoryBot.build(:user)
        post :create, params: { session: FactoryBot.attributes_for(:user, name: '')}
        expect(session[:user_id]).to be_nil
      end
    end
     
  end
end
