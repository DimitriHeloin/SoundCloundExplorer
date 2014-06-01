class FollowingsController < ApplicationController

  def index 
  	  if params[:id_donne] 
  	  	if current_user
    	   @client=Soundcloud.new(:access_token => current_user.authentification_token)
    	   end

          @urltracks=@client.get("/users/#{params[:id_donne]}/tracks")

  	  	  @followings_target = @client.get("/users/#{params[:id_donne]}/followings/",:limit=>5000)
	         respond_to do |format|
          format.html # show.html.erb
          format.json  { render :json => {children:@followings_target} }

          end

      	  else
      	  	  @followings_target = @client.get('/me/followings')
      		end


  end
 
end

