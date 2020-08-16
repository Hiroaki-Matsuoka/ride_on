class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    # @micropost = current_user.microposts.build(micropost_params)
    # if @micropost.save
    #   flash[:notice] = "Micropost created!"
    #   redirect_to user_path(current_user.id)
    # else
    #   redirect_to root_url
    # end
    ride = Ride.find(params[:ride_id])
    @micropost = ride.microposts.build(micropost_params)
    @micropost.user_id = current_user.id
    if @micropost.save
      flash[:notice] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    micropost = Micropost.find(params[:id]).destroy
    ride = Ride.find_by(id: micropost.ride.id)
    redirect_to ride_path(ride.id)
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

end
