class PagesController < ApplicationController

  def home
  	if current_user
    	@client=Soundcloud.new(:access_token => current_user.authentification_token)
      page_size=10000
  		@list_followings=@client.get("/me/followings",:limit=>page_size).to_json
       @soundclound_target=@list_followings

    data = ActiveSupport::JSON.decode(@list_followings)




    end

  end


  def create_soundcloud
    omniauth = request.env['omniauth.auth']
    user = User.get_or_create_from_omniauth(omniauth)
    sign_in user
    redirect_to root_path 
  end


  

end
