class GroupsController < ApplicationController

  def index
    @groups = Group.order("id ASC")
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to root_path
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
