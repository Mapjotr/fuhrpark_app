class StaticPagesController < ApplicationController
  def home
  	@test_variable = 'Peter'
  	@count = User.count
  	@users_name = User.select(:name)
    @micropost = current_user.microposts.build if logged_in?
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
