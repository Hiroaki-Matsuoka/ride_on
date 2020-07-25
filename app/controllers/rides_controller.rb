class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.new
  end

  def create
    Ride.create(title: ride_params[:name], message: ride_params[:message], user_id: current_user.id)
    if @ride.save
      redirect_to ride_path
    else

    end
  end

  private

  def ride_params
    params.require(:ride).permit(:title, :message)
  end

end
