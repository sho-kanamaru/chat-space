class MessagesController < ApplicationController
  def index
    @groups = current_user.groups.order("id ASC")
    @group = Group.find(params[:group_id])
  end
end
