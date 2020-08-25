class RidesController < ApplicationController

  def index
    @rides = Ride.all
    @q = Ride.ransack(params[:q])
    @rides = @q.result(distinct: true)
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(title: ride_params[:title], message: ride_params[:message],
       address: ride_params[:address], sch_datetime: ride_params[:sch_datetime],
       distance: ride_params[:distance], rank: ride_params[:rank], prefecture: ride_params[:prefecture], city: ride_params[:city], user_id: current_user.id)
    if @ride.save
      redirect_to "/rides"
    else
      render "/rides/new"
    end
  end

  def show
    @ride = Ride.find(params[:id])
    @microposts = @ride.microposts
    @micropost = @ride.microposts.build

    case @ride.distance
    when 1
      @distance = "0~50km"
    when 2
      @distance = "51~100km"
    when 3
      @distance = "101~200km"
    else
      @distance = "201km~"
    end

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
    params.require(:ride).permit(:title, :message, :address, :latitude, :longitude, :sch_datetime, :distance, :rank, :prefecture, :city)
  end

end
