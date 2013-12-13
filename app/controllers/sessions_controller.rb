class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name],
                                     params[:user][:password])
    if @user
      login!(@user)
      flash[:messages] = ["Login Successful!"]
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid login information"]
      render :new
    end
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
  end

end
