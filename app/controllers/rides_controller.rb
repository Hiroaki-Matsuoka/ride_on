class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(title: ride_params[:title], message: ride_params[:message],
       address: ride_params[:address], sch_datetime: ride_params[:sch_datetime],
       distance: ride_params[:distance], rank: ride_params[:rank], user_id: current_user.id)
    if @ride.save
      redirect_to "/rides"
    else

    end
  end

  def show
    @ride = Ride.find(params[:id])
    @microposts = @ride.microposts
    @micropost = @ride.microposts.build

    case @ride.rank
    when 1
      @rank = "誰でもOK"
    when 2
      @rank = "初心者向け"
    when 3
      @rank = "中級者向け"
    when 4
      @rank = "上級者向け"
    else
      @rank = "相互フォローのみ"
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
    params.require(:ride).permit(:title, :message, :address, :latitude, :longitude, :sch_datetime, :distance, :rank)
  end

end
