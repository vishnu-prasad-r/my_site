class ApplicationController < ActionController::Base
  #include ControllerAuthentication
  
   
  protect_from_forgery
   #before_filter :authenticate_user!

   rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  
   def toboolean(string)
  return false if string.nil?
  string= string.downcase
  return true if string== true || string =~ (/(true|t|yes|y|1)$/i)
  return false if string== false || string.nil? || string =~ (/(false|f|no|n|0)$/i)
  #raise ArgumentError.new("invalid value for Boolean: \"#{string}\"")
  return false
  end
end
