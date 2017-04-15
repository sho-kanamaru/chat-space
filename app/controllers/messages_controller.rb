class MessagesController < ApplicationController
  def index
    @groups = current_user.groups.order("id ASC")
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @groups = current_user.groups.order("id ASC")
    @group = Group.find(params[:group_id])
    @message = Message.create(message_params)
    redirect_to group_messages_path
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

end
