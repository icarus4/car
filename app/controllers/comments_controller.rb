class CommentsController < ApplicationController

  def create
    if current_user
      c = Comment.new(comment_params)
      c.user_id = current_user.id
      @model = Model.find(params[:model_id])
      c.model_id = @model.id
      c.comment_on = "MODEL"

      if c.save
        flash[:success] = '留言成功'
      else
        flash[:warning] = '留言失敗'
      end
    else
      # TODO: if user doesn't login
    end

    redirect_to model_path(@model)
  end

  def destroy
    @model = Model.find(params[:model_id])
    @comment = @model.comments.find(params[:id])
    @comment.destroy
    redirect_to model_path(@model)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
