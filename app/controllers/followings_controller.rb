class FollowingsController < ApplicationController

  def index 
  	  if params[:id_donne] 
  	  	if current_user
    	   @client=Soundcloud.new(:access_token => current_user.authentification_token)
    	   end

          page_size = 200
          index=1

          followings_count=@client.get("/users/#{params[:id_donne]}/").followings_count
  	  	  @followings_target = @client.get("/users/#{params[:id_donne]}/followings/",:limit=>page_size)
	       
          while followings_count-(page_size*index)>200
             @followingssuite=@client.get("/users/#{params[:id_donne]}/followings",:limit=>page_size,:offset =>page_size*index)
             index=index+1
             @followingssuite.each do|n| 
             @followings_target.push(n)
            end
          end

          respond_to do |format|
          format.html # show.html.erb
          format.json  { render :json => {children:@followings_target} }

          end

      	  else
      	  	  @followings_target = @client.get('/me/followings')
      		end


  end
 
end

