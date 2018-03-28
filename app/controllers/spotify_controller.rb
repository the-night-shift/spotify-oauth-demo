class SpotifyController < ApplicationController
  def callback
    render json: {message: "hello"}
  end
end
