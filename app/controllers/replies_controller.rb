class RepliesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_reply!, only: [:edit, :update, :destroy]
  before_action :authorize_reply!
  after_action :verify_authorized

  def create
    # render plain: params.to_yaml
    # @comment = current_user.comments.find params[:comment_id]
    @comment = Comment.find params[:comment_id]
    @reply = @comment.replies.build(reply_params)
    if @reply.save
      flash[:notice] = "Reply was successfully created."
      redirect_to comments_path
    else
      redirect_to root_path
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:text)
  end

  def set_reply!
    @reply = current_user.replies.find(params[:id])
  end

  def authorize_reply!
    authorize(@reply || Reply)
  end
end
