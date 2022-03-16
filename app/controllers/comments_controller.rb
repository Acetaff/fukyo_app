class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
    redirect_to "/fukyos/#{@comment.fukyo.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:c_text).merge(user_id: current_user.id, fukyo_id: params[:fukyo_id])
  end
end
