class HomeController < ApplicationController
  def index
    render({ :template => "home/index.html.erb" })
  end
end
