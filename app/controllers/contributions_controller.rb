class ContributionsController < ApplicationController

  def index
    if current_user
      @brands = Brand.all.order(:name)
    end
  end
end
