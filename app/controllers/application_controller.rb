class ApplicationController < ActionController::Base

  def home

    render({ :template => "home/home_1.html.erb" })
   end 

end
