class WelcomeController < ApplicationController
  def index
    @new_cars = Car.where("created_at >= :one_month_ago", :one_month_ago => Time.now - 30.days).order(created_at: :desc).limit(15)
  end
end
