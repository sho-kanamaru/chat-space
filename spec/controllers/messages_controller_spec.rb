require 'rails_helper'

describe MessagesController, type: :controller do

  let(:user) { create(:user) }
  before do
    login_user user
  end
  let(:group) { create(:group) }
  let(:message) { create(:message, group_id: group.id, user_id: user.id) }
  let(:messages) { create_list(:message, 3, group_id: group.id, user_id: user.id) }

  describe 'GET #index' do

    it "assigns the requested group to @group" do
      get :index, params: { group_id: group }
      expect(assigns(:group)).to eq group
     end

    it "assigns the requested messages to @messages" do
      get :index, params: { group_id: group }
      expect(assigns(:messages)).to match(messages)
    end

    it "renders the :index template" do
      get :index, params: { group_id: group }
      expect(response).to render_template :index
    end

  end

  describe 'POST #create' do
    it "assigns the requested message to @message" do
      expect{
            post :create, params: { message: attributes_for(:message), group_id: group.id }
          }.to change(Message, :count).by(1)
    end

    it "renders the :create template" do
      post :create, params: { message: {body: message.body}, group_id: group, user_id: user }
      expect(response).to redirect_to group_messages_path
    end
  end

end
