class MessagesController < ApplicationController

  before_action :set_groups, :set_messages, only: [:index, :create]

  before_action :reject_user_not_belongs_to_group, only: :index

  def index
    @message = Message.new
    @users = User.where.not(id: current_user)
    @message.message_recipients.build
    group_message = MessageRecipient.where(group_id: @group, user_id: current_user)
    group_message.update_all(read_flg: "read")
    respond_to do |format|
      format.html
      format.json {@update_message = @group.messages.where('id > ?', params[:last_message_id])}
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    group_message = MessageRecipient.where(group_id: @group, user_id: current_user)
    group_message.update_all(read_flg: "read")
    @unread_count_messages = unread_message_count(@group, @group.users.where.not(id: current_user))
    if @message.save
    flash[:notice] = "メッセージ送信成功"
      respond_to do |format|
        format.html
        format.json
      end
    else
      flash.now[:alert] = "メッセージ送信失敗"
      respond_to do |format|
        format.html
        format.json { render 'alert', handlers: 'jbuilder' }
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image, message_recipients_attributes: [:group_id, :user_id, :message_id, :read_flg]).merge(group_id: params[:group_id])
  end

  def set_groups
    @groups = current_user.groups.includes(:messages)
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages.includes(:user)
  end

  def unread_message_count(group,users)
    unread_message_count_hash = {}
    users.each do |user|
      unread_message_count_hash["#{user.id}"] = group.message_recipients.where(user_id: user.id).unread.size
    end
    return unread_message_count_hash
  end

end
