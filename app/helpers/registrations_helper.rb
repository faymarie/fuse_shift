require 'digest'

module RegistrationsHelper
#   def registrations_path
#     "/registrations"
#   end
  
  def registration_path(registration)
    "/registrations/#{registration.hashedEmail}"
  end
  
  def registration_url(registration)
    path = registration_path(registration)
    "#{root_url}#{path[1,path.length-1]}"
  end
  
  def registration_confirm_url(registration)
    path = registration_path(registration)
    "#{root_url}#{path[1,path.length-1]}/confirm"
  end

end
