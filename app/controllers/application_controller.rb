class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def urltracks 
  	  if params[:id_donne] 
  	  	if current_user
    	   @client=Soundcloud.new(:access_token => current_user.authentification_token)
    	   end

          @urltracks=@client.get("/users/#{params[:id_donne]}/tracks",:limit=>500)

  	  	 
	         respond_to do |format|
          format.html # show.html.erb
          format.json  { render :json => {children:@urltracks} }

          end

      	  else
      end


  end
  def urllikes 
      if params[:id_donne] 
        if current_user
         @client=Soundcloud.new(:access_token => current_user.authentification_token)
         end

          @urllikes=@client.get("/users/#{params[:id_donne]}/favorites",:limit=>500)

         
           respond_to do |format|
          format.html # show.html.erb
          format.json  { render :json => {children:@urllikes} }

          end

          else
      end


  end

  def ajouteFollow
      if params[:id_donne] 
          if current_user
           @client=Soundcloud.new(:access_token => current_user.authentification_token)
           end

            @client.put("/me/followings/#{params[:id_donne]}")
            @newFollow=@client.get("/me/followings",:limit=>500)

           
             respond_to do |format|
            format.html # show.html.erb
            format.json  { render :json => {children:@newFollow} }

            end

            else
        end      
  end

    def deleteFollow
          if params[:id_donne] 
              if current_user
               @client=Soundcloud.new(:access_token => current_user.authentification_token)
               end

                @client.delete("/me/followings/#{params[:id_donne]}")
                @newFollow=@client.get("/me/followings",:limit=>500)

               
                 respond_to do |format|
                format.html # show.html.erb
                format.json  { render :json => {children:@newFollow} }

                end

                else
            end      
      end  
  
end
