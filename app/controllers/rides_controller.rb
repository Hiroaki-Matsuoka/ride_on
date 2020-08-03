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
      redirect_to "/user_rides/#{current_user.id}"
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
    flash[:notice] = "User deleted"
    redirect_to rides_path
  end

  def user_rides
    @user = User.find(current_user.id)
    @rides = Ride.all
    @microposts = @user.microposts.paginate(page: params[:page])
    @micropost = current_user.microposts.build
  end

  private

  def ride_params
    params.require(:ride).permit(:title, :message, :address, :latitude, :longitude)
  end

end
