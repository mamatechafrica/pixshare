class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @photo, notice: "Comment added."
    else
      redirect_to @photo, alert: "Comment could not be saved."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    photo = @comment.photo
    if @comment.user == current_user
      @comment.destroy
      redirect_to photo, notice: "Comment deleted."
    else
      redirect_to photo, alert: "Not authorized to delete."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
