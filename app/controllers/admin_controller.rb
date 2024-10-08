class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @users = User.all
    @logs = RequestLogger.all
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.includes(:replies)
    render "comments/index"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User was successfully destroyed."
    redirect_to admin_index_path
  end

  private

  def admin_required
    if !current_user.admin?
      flash[:alert] = "Access denied, you are not an admin."
      redirect_to root_path
    end
  end

end
