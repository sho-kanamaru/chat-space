class GroupsController < ApplicationController

  def index
    @groups = current_user.groups.includes(:messages)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループ作成成功"
    else
      flash.now[:alert] = "グループ作成失敗"
      render "new"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
