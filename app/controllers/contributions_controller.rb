class ContributionsController < ApplicationController

  # before_action :authenticate_user!

  def index
    if current_user
      @brands = Brand.all.order(:name)
    end
  end
end
