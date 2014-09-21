class WelcomeController < ApplicationController
  def index
    @recently_created_cars = Car.published.where("created_at >= :one_month_ago", :one_month_ago => Time.now - 30.days).order(created_at: :desc).limit(20)
    @recently_user_comments = Comment.recently_comments_on_model(last_n_days = 30, limit = 20)
  end
end
