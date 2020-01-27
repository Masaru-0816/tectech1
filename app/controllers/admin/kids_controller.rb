class Admin::KidsController < ApplicationController
  before_action :if_not_admin
  before_action :set_kid, only: [:show, :edit, :destroy]
  
  def index
    @kids = Kids.all
  end

  def new
    @kid = Group.new
  end

  def create
    @kid = Kid.new(kid_params)
    if @kid.save
      redirect_to admin_kids_path, notice: "児童情報を登録しました"
    else
      render :new
    end
  end

  def edit
    @kid = Kid.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:id])
    if @kid.update(kid_params)
      redirect_to kid_messages_path(@kid), notice: "児童情報を更新しました"
    else
      render :edit
    end
  end

  def destory
    Kid.destroy(params[:id])
    redirect_to admin_kid_path, notice: "児童情報を削除しました"
  end
  
  private
  def kid_params
    params.require(:kid).permit(:name, user_ids: [])
  end
  
  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_kid
    @kid = Restaurant.find(params[:id])
  end
end
