class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(session_params)

    if @user
      login @user
      redirect_to @user, notice: 'Logged in successfuly'
    else
      redirect_to login_path, alert: 'Invalid username'
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: 'You logged out'
  end

  private

  def session_params
    params.require(:user).permit(:username)
  end
end
