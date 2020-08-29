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
      @ride = @join.ride_id
      @join.save
      if request.referer&.include?("/rides/#{@ride}")
        #前のページが指定したURLだった場合のリンク先
         redirect_to("/rides/#{@ride}")
      else
        #その他のリンク先
          redirect_to("/rides")
      end
    end

    def destroy
      @join = Join.find_by(
        user_id: current_user.id,
        ride_id: params[:ride_id]
      )
      @join.destroy
      @ride = @join.ride_id
      @join.save
      if request.referer&.include?("/rides/#{@ride}")
        #前のページが指定したURLだった場合のリンク先
         redirect_to("/rides/#{@ride}")
      else
        #その他のリンク先
          redirect_to("/rides")
      end

    end

end
