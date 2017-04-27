class MessagesController < ApplicationController
  
  before_action :set_groups, :set_messages, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
    flash[:notice] = "メッセージ送信成功"
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージ送信成功"}
        format.json
      end
    else
      flash.now[:alert] = "メッセージ送信失敗"
      render "index"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_groups
    @groups = current_user.groups.includes(:messages)
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages.includes(:user)
  end

end
