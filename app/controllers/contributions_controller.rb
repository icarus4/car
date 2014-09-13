class ContributionsController < ApplicationController

  def index
    if current_user
      @brands = Brand.all.order(:name)
      @new_comment = Comment.new
    end
    @comments = Comment.where(comment_on: 'CONTRIBUTIONS').limit(100).order(created_at: :desc)
  end
end
