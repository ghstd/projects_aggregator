class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment!, only: [:edit, :update, :destroy]
  before_action :authorize_comment!
  after_action :verify_authorized

  def index
    @comments = current_user.comments.includes(:replies)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      notify_admin

      respond_to do |format|
        format.html do
          flash[:notice] = t("controllers.comments.create.success")
          redirect_to comments_path
        end

        format.turbo_stream do
          flash.now[:notice] = t("controllers.comments.create.success")
        end
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      respond_to do |format|
        format.html do
          flash[:notice] = t("controllers.comments.update.success")
          redirect_to comments_path
        end

        format.turbo_stream do
          flash.now[:notice] = t("controllers.comments.update.success")
        end
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html do
        flash[:notice] = t("controllers.comments.destroy.success")
        redirect_to comments_path
      end

      format.turbo_stream do
        flash.now[:notice] = t("controllers.comments.destroy.success")
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_comment!
    @comment = Comment.find(params[:id])
  end

  def authorize_comment!
    authorize(@comment || Comment)
  end
end
