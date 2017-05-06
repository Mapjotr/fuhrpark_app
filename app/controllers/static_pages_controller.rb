class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user_cars = current_user.cars.paginate(page: params[:page])
    end 
  end

  def contact
  end

  def about
  end

  def impressum
  end
end
