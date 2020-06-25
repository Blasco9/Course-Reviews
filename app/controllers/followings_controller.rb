class FollowingsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user.followeds << @user
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    user = User.find(params[:id])
    current_user.followeds.delete(user)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
