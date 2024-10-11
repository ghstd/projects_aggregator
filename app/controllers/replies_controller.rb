class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment!, only: [:create, :edit, :update, :destroy]
  before_action :set_reply!, only: [:edit, :update, :destroy]
  before_action :authorize_reply!
  after_action :verify_authorized

  def create
    @reply = @comment.replies.build(reply_params)
    @reply.user = current_user
    if @reply.save

      if current_user.admin?
        notify_user @comment.user
      else
        notify_admin
      end

      respond_to do |format|
        format.html do
          flash[:notice] = "Reply was successfully created."
          redirect_to comments_path
        end

        format.turbo_stream do
          flash.now[:notice] = "Reply was successfully created."
        end
      end
    else
      flash[:alert] = "Reply was not created."
      redirect_to comments_path
    end
  end

  def edit
  end

  def update
    if @reply.update(reply_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Reply was successfully updated."
          redirect_to comments_path
        end

        format.turbo_stream do
          flash.now[:notice] = "Reply was successfully updated."
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reply.destroy

    respond_to do |format|
      format.html do
        flash[:notice] = "Reply was successfully destroyed."
        redirect_to comments_path
      end

      format.turbo_stream do
        flash.now[:notice] = "Reply was successfully destroyed."
      end
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:text)
  end

  def set_reply!
    @reply = @comment.replies.find(params[:id])
  end

  def set_comment!
    @comment = Comment.find(params[:comment_id])
  end

  def authorize_reply!
    authorize(@reply || Reply)
  end
end
