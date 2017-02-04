class StaticPagesController < ApplicationController
  def home
  	@test_variable = 'Peter'
  	@count = User.count
  	@users_name = User.select(:name)
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end 
  end

  def help
  end

  def contact
  end

  def about
  end

  def impressum
  end
end
