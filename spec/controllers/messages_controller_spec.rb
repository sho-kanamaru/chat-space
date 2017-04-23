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

    describe 'with valid attribute' do
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
        expect(flash[:notice]).to eq "メッセージ送信成功"
      end
    end

    describe 'with invalid attribute' do

      subject {
        Proc.new { post :create, params: { message: attributes_for(:message, body: ""), group_id: group.id } }
      }

      it "can't save the new message in the database" do
        expect{
          subject.call
        }.not_to change(Message, :count)
      end

      it "renders the messages#index" do
        subject.call
        expect(response).to render_template :index
      end

      it "makes error message when body of message is nil" do
        subject.call
        expect(flash[:alert]).to eq "メッセージ送信失敗"
      end
    end
  end
end
