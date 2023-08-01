class WelcomeController < ApplicationController
  def index
    @channels = Channel.order(id: :desc).limit(10)
    @items = Item.order(id: :desc).limit(20)
  end
end
