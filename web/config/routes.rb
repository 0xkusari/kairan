Rails.application.routes.draw do
  root "welcome#index"

  post "/google_auth_callback", to: "sessions#create"
  delete "/session", to: "sessions#destroy", as: "session"

  get "/channels/:channel_id", to: "channels#show", as: "channel"
  post "/channels", to: "channels#create"
end
