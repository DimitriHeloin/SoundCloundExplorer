class PagesController < ApplicationController
  def home

  	if current_user
    	@client=Soundcloud.new(:access_token => current_user.authentification_token)
      page_size=500

  		@soundcloud_account=@client.get("/me/followings",:limit=>page_size).to_json
       @soundclound_target=@soundcloud_account

    data = ActiveSupport::JSON.decode(@soundcloud_account)

    end

  end


  def create_soundcloud
    omniauth = request.env['omniauth.auth']
    user = User.get_or_create_from_omniauth(omniauth)
    sign_in user
    redirect_to root_path 
  end


  

end
