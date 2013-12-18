class PagesController < ApplicationController
  def home
  	if current_user
  	@client=Soundcloud.new(:access_token => current_user.authentification_token)
  		@soundcloud_account=@client.get('/me')
  	end
  end

  def create_soundcloud
    omniauth = request.env['omniauth.auth']
    user = User.get_or_create_from_omniauth(omniauth)
    sign_in user
    redirect_to root_path

   
  end


end
