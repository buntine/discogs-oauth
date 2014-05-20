class ImagesController < ApplicationController

  def index
  end

  def authenticate
    @discogs = Discogs::Wrapper.new("Test OAuth")

    app_key      = "nLPklPRYpykkjycrkunw"
    app_secret   = "fjshPFKjzHUQeFqsjyeWBnmLAnOixRgJ"
    request_data = @discogs.get_request_token(app_key, app_secret,
                     "http://127.0.0.1:3000/images/callback")

    session[:request_token] = request_data[:request_token]
 
    redirect_to request_data[:authorize_url]
  end

  def callback
    @discogs = Discogs::Wrapper.new("Test OAuth")

    request_token = session[:request_token]
    verifier = params[:oauth_verifier]

    access_data = @discogs.authenticate(request_token, verifier)

    session[:request_token] = nil
    session[:access_token] = access_data[:access_token]
  end

  def show
    @discogs = Discogs::Wrapper.new("Test OAuth", session[:access_token])
    @image = @discogs.get_image(params[:id] + ".png")

    send_data(@image,
      :disposition => "inline",
      :type => "image/jpeg")
  end

end
