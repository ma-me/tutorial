class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include UserAgent

  def hello

    render html: "hello world!! and Heroku!! : #{request.user_agent}"
  end


end
