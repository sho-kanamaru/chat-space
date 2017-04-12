class MessagesController < ApplicationController
  def index
    @groups = Group.order("id ASC")
    @group = Group.find(params[:group_id])
  end
end
