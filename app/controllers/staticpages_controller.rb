class StaticpagesController < ApplicationController

  def home
    if user_signed_in?
      # @micropost = current_user.microposts.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
      @q = Ride.ransack(params[:q])
      @rides = @q.result(distinct: true)
      @user = User.find(current_user.id)
      # @user.joins = User.paginate(page: params[:page], per_page: 3)
    end
  end

end
