module SessionsHelper
  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout!(user)
    session[:session_token] = nil
    user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_current_user
    redirect_to new_session_url unless logged_in?
  end

  def require_user_to_be_owner
    current_cat = Cat.find_by_id(params[:id])

    unless current_cat.user_id == current_user.id
      flash[:errors] = ["Sorry, You Can't Update This Cat"]
      redirect_to cat_url(current_cat)
    end
  end
end
