class Admin::KidsController < ApplicationController
  before_action :if_not_admin
  before_action :set_kid, only: [:show, :edit, :destroy]


  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_kid
    @kid = Restaurant.find(params[:id])
  end
end
