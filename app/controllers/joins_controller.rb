class JoinsController < ApplicationController

  def index
      @user = User.find(params[:id])
    end
    def new
      @join = Join.new
    end

    def create
      @join = Join.create(
        user_id: current_user.id,
        ride_id: params[:ride_id]
      )
        @join.save
        redirect_to("/rides")
    end

    def destroy
      @join = Join.find_by(
        user_id: current_user.id,
        ride_id: params[:ride_id]
      )
      @join.destroy
      redirect_to("/rides")
    end

end
