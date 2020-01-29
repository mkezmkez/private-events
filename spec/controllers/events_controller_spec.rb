require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'populates an array of events' do
      user = create(:user)
      event = create(:event, id: user.id)
      get :index
      expect(assigns(:events)).to eq([event])
    end
  end

  describe "GET #show" do
    subject {create(:event, id: create(:user).id)}

    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested event to @event' do
      get :show, params: { id: subject }

      expect(assigns(:event)).to eql(subject)
    end

    it 'renders :show template' do
      get :show, params: { id: subject }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'creat an empty event @event' do
      get :new

      expect(assigns(:event).description).to be_nil
    end
    it 'renders :new template' do
      get :new

      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before(:all) do
        @user = create(:user, name: 'carlos')
      end

      it 'save an event to the database' do
        log_in(@user)
        expect {
          post :create, params: { event: FactoryBot.attributes_for(:event, id: @user.id) } }.to change(Event, :count).by(1)

      end
      it 'redirects to the #show event' do
        log_in @user
        post :create, params: { event: attributes_for(:event, id: @user.id)}
        expect(response).to redirect_to Event.last
      end
    end

    context 'with invalid params' do
      before(:all) do
        @user = create(:user, name: 'carlos')
      end
      it 'does not save the event to the DB' do
        log_in(@user)
        expect{
          post :create, params: { event: attributes_for(:event, id: nil, description: '')}
          }.to_not change(Event, :count)
      end
      it 'renders the :new template' do
        log_in(@user)
        post :create, params: { event: attributes_for(:event, id: nil, description: '')}
        expect(response).to render_template :new
      end
    end
  end

end
