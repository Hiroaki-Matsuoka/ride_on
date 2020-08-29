class StaticpagesController < ApplicationController

  def home
    if user_signed_in?
      @q = Ride.ransack(params[:q])
      @rides = @q.result(distinct: true)
      @user = User.find(current_user.id)
    end
  end

end
