module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    reset_session
  end
end
