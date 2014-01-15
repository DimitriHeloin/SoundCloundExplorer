class FollowingsController < ApplicationController


  def index 
  	  if params[:id_donne] 
  	  	if current_user
    	@client=Soundcloud.new(:access_token => current_user.authentification_token)
    	end

  	  	 @followings_target = @client.get("/users/#{params[:id_donne]}/followings/",:limit=>500)
	respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => {children:@followings_target} }

File.open("public/event.json","a") do |f|
        f << 
        @followings_target
        
      end

  end
  	  else
  	  	  @followings_target = @client.get('/me/followings')
  		end

      
  end
 
end













      # File.open("public/event.json","a") do |f|
     #    f << '{
     #        "name": "flare",
     #        "children": '
     #    f.write(@soundcloud_test)
     #    f << "}"
     # end
     #  File.open("public/event.json","a") do |f|
     #    f << "}"
     #  end
