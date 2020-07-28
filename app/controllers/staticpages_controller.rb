class StaticpagesController < ApplicationController

  def home
    @micropost = current_user.microposts.build if user_signed_in?
  end

end
