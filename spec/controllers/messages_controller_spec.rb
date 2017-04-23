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

    subject {
      Proc.new { get :index, params: { group_id: group } }
    }

    it "assigns the requested group to @group" do
      subject.call
      expect(assigns(:group)).to eq group
     end

    it "assigns the requested messages to @messages" do
      subject.call
      expect(assigns(:messages)).to match(messages)
    end

    it "renders the :index template" do
      subject.call
      expect(response).to render_template :index
    end

  end

  describe 'POST #create' do

    subject {
      Proc.new { post :create, params: { message: attributes_for(:message), group_id: group.id } }
    }

    it "saves the new message in the database" do
      expect{
        subject.call
      }.to change(Message, :count).by(1)
    end

    it "redirects_to messages#index" do
      subject.call
      expect(response).to redirect_to group_messages_path
    end

    it "shows flash message to success to send message" do
      subject.call
      expect(flash[:notice]).not_to be_empty
    end

    it "is invalid without a body" do
      message.body = ""
      expect(message).not_to be_valid
      expect(message.errors[:body]).to include("を入力してください。")
    end
  end
end
