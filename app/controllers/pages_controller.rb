class PagesController < ApplicationController

  def about
    @users = User.all
  end

end
