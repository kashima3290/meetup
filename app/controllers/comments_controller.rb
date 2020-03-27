class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to board_path(params[:board_id]) }
      format.json
    end
    # redirect_to board_path(comment.board.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, board_id: params[:board_id])
  end
end
