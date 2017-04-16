class MessagesController < ApplicationController
  
  before_action :set_groups, :set_messages, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    redirect_to group_messages_path
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_groups
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages
  end

end
