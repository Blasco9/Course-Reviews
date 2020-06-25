class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(session_params)

    if @user
      login @user
      redirect_to @user, notice: 'Logged in successfuly'
    else
      render :new, notice: 'Invalid user name'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'You logged out'
  end

  private

  def session_params
    params.require(:user).permit(:username)
  end
end
