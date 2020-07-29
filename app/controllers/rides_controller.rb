class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(title: ride_params[:title], message: ride_params[:message], address: ride_params[:address], user_id: current_user.id)
    if @ride.save
      redirect_to root_path
    else

    end
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def update
    ride = Ride.find(params[:id])
    ride.update(ride_params)
    redirect_to current_user
  end

  def destroy
    Ride.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end

  def user_rides
    @user = User.find_by(id: params[:id])
  end

  private

  def ride_params
    params.require(:ride).permit(:title, :message, :address, :latitude, :longitude)
  end

end
