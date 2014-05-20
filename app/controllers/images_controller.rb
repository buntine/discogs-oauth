class ImagesController < ApplicationController

  before_filter do
    @discogs = Discogs::Wrapper.new("Test OAuth")
  end

  def index
  end

  def authenticate
    @request_data = @discogs.get_request_token("nLPklPRYpykkjycrkunw",
                      "fjshPFKjzHUQeFqsjyeWBnmLAnOixRgJ",
                      "http://127.0.0.1:3000/images/callback")

    session[:request_token] = @request_data[:request_token]
 
    redirect_to @request_data[:authorize_url]
  end

  def callback
    @request_token = session[:request_token]
    @verifier = params[:oauth_verifier]

    @discogs.authenticate(@request_token, @verifier)
  end

  def show
    @image = @discogs.get_image(params[:id])

    send_data(@image,
      :disposition => "inline",
      :type => "image/jpeg")
  end

end
