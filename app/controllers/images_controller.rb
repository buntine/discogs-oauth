class ImagesController < ApplicationController

  before_filter do
    @discogs = Discogs::Wrapper.new("Test OAuth")
  end

  def authenticate
    @request_token = @discogs.get_request_token("nLPklPRYpykkjycrkunw",
                       "fjshPFKjzHUQeFqsjyeWBnmLAnOixRgJ",
                       "http://127.0.0.1:3000/images/callback")
  end

  def callback
  end

  def show

  end

end
