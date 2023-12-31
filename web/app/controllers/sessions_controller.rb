require "googleauth/id_tokens/verifier"

class SessionsController < ApplicationController
  protect_from_forgery except: :create
  before_action :verify_g_csrf_token, only: :create

  def create
    payload = Google::Auth::IDTokens.verify_oidc(
      params[:credential],
      aud: Rails.application.credentials.google_auth_app.client_id
    )
    user = User.find_or_initialize_by(email: payload["email"])
    user.name = payload["email"].split("@").first
    user.icon_url = payload["picture"]
    user.save

    log_in(user)
    redirect_to root_path, notice: "ログインしました"
  end

  def destroy
    log_out
    redirect_to root_path, notice: "ログアウトしました"
  end

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to root_path, notice: "不正なアクセスです"
    end
  end
end
