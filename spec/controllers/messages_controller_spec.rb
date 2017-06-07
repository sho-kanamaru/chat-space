require 'rails_helper'

describe MessagesController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }
    let(:group) { user.groups.first }

    context 'with logged in user' do
      before do
        login_user user
        get :index, params: { group_id: group }
      end

      context 'when current_user belongs to group' do

        it 'renders the :index template' do
          expect(response).to render_template :index
        end

        it "assigns the requested contact to @groups" do
          groups = user.groups
          expect(assigns(:groups)).to eq groups
        end

        it 'assigns the requested group to @group' do
          expect(assigns(:group)).to eq group
         end

        it 'assigns the requested message to @message' do
          expect(assigns(:message)).to be_a_new(Message)
        end

        it 'assigns the requested messages to @messages' do
          messages = group.messages
          expect(assigns(:messages)).to eq messages
        end
      end

      context 'when current_user does not belong_to group' do
        it 'redirects to root_path' do
          group = create(:group)
          get :index, params: { group_id: group }
          expect(response).to redirect_to root_path
        end
      end
    end

    context 'without logged in user' do
      it 'redirects to new_user_session_path' do
        group = create(:group)
        get :index, params: { group_id: group }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:group) { user.groups.first }

    before do
      login_user user
    end

    context 'with valid attribute' do
      subject {
        Proc.new { post :create, params: { message: attributes_for(:message), group_id: group } }
      }

      it 'redirects_to messages#index' do
        subject.call
        expect(response).to redirect_to group_messages_path(group)
      end

      it 'saves the new message in the database' do
        expect{ subject.call }.to change(Message, :count).by(1)
      end

      it 'shows flash message to success to send message' do
        subject.call
        expect(flash[:notice]).to eq 'メッセージ送信成功'
      end

      it 'does not contain alert flash message' do
        subject.call
        expect(flash[:alert]).to be_nil
      end

      it "assigns the requested contact to @groups" do
        subject.call
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

      it 'assigns the requested group to @group' do
        subject.call
        expect(assigns(:group)).to eq group
      end
    end

    context 'with invalid attribute' do
      let(:group) { user.groups.first }

      subject {
        Proc.new { post :create, params: { message: attributes_for(:message, body: ""), group_id: group } }
      }

      it 're-renders the :index template' do
        subject.call
        expect(response).to render_template :index
      end

      it "doesn't save the new message in the database" do
        expect{ subject.call }.not_to change(Message, :count)
      end

      it 'makes error message to fail to send message' do
        subject.call
        expect(flash[:alert]).to eq 'メッセージ送信失敗'
      end

      it 'does not contain notice flash message' do
        subject.call
        expect(flash[:notice]).to be_nil
      end
    end
  end
end
