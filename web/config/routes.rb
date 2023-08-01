Rails.application.routes.draw do
  root "welcome#index"

  get "/channels/:channel_id", to: "channels#show", as: "channel"
  post "/channels", to: "channels#create"
end
