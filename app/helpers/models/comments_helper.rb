module Models::CommentsHelper
  def render_user_comment_preview(comment, max_character = 30)
    if comment.content.size > max_character
      "#{comment.content.first(max_character)} ..."
    else
      "#{comment.content}"
    end
  end
end
