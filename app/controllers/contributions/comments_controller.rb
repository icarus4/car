class Contributions::CommentsController < ApplicationController
  def create
    if current_user
      c = Comment.new(comment_params)
      c.user_id = current_user.id
      c.comment_on = "CONTRIBUTIONS"

      if c.save
        flash[:info] = '留言成功'
      else
        flash[:warning] = '留言失敗'
      end
    else
      raise "should login before posting a comment"
    end

    redirect_to contributions_path
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
