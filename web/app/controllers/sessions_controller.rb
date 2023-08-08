require "googleauth/id_tokens/verifier"

class SessionsController < ApplicationController
  protect_from_forgery except: :create
  before_action :verify_g_csrf_token

  def create
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: "195008300544-l5fjtt5i5dboisa5k09pe94dhu8c7gk1.apps.googleusercontent.com")
    user = User.find_or_initialize_by(email: payload["email"])
    user.name = payload["email"].split("@").first
    user.icon_url = payload["picture"]
    user.save
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  end

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to root_path, notice: "不正なアクセスです"
    end
  end
end