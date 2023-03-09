class ApplicationController < ActionController::Base

  def home

   render({ :template => "home/home.html.erb" })
  end 

  def home_1

    render({ :template => "home/home_1.html.erb" })
   end 

   def home_2

    render({ :template => "home/home_2.html.erb" })
   end 

   def home_3

    render({ :template => "home/home_3.html.erb" })
   end 

   def home_4

    render({ :template => "home/home_4.html.erb" })
   end 
end
