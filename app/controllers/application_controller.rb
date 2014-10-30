class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def urltracks 
    page_size = 200
    index=1

  	  if params[:id_donne] 
  	  	if current_user
    	   @client=Soundcloud.new(:access_token => current_user.authentification_token)
    	   end
        track_count=@client.get("/users/#{params[:id_donne]}/").track_count
        @urltracks=@client.get("/users/#{params[:id_donne]}/tracks",:limit=>page_size)

        while track_count-(page_size*index)>200
           @urltracksuite=@client.get("/users/#{params[:id_donne]}/tracks",:limit=>page_size,:offset =>page_size*index)
           index=index+1
           @urltracks.push(@urltracksuite)
        end
          
           
    
  	  	 
	     respond_to do |format|
        format.html # show.html.erb
        format.json  { render :json => {children:@urltracks} }

          end

      	  else
      end


  end
  
  def urllikes 

    page_size = 200
    index=1

      if params[:id_donne] 
        if current_user
         @client=Soundcloud.new(:access_token => current_user.authentification_token)
         end
          favorites_count=@client.get("/users/#{params[:id_donne]}/").public_favorites_count
          @urllikes=@client.get("/users/#{params[:id_donne]}/favorites",:limit=>page_size)

          while favorites_count-(page_size*index)>200
             @urllikessuite=@client.get("/users/#{params[:id_donne]}/favorites",:limit=>page_size,:offset =>page_size*index)
             index=index+1
             @urllikessuite.each do|n| 
             @urllikes.push(n)
            end
          end
         
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

      def search
          if params[:username] 
              if current_user
               @client=Soundcloud.new(:access_token => current_user.authentification_token)
               end
                @resultat=@client.get("/users",:q=>"#{params[:username]}")[0]
               
                 respond_to do |format|
                format.html # show.html.erb
                format.json  { render :json => {children:@resultat} }

                end

                else
            end      
      end  

      def changeRoot
          if params[:id_donne] 
              if current_user
               @client=Soundcloud.new(:access_token => current_user.authentification_token)
               end
               @guy=@client.get("/users/#{params[:id_donne]}")
                @children=@client.get("/users/#{params[:id_donne]}/followings",:limit=>500)
                @myJson = { :children => @children,
                 :id => @guy.id,
                 :kind=>"user",
                 :permalink=>@guy.permalink,
                 :avatar_url=>@guy.avatar_url,
                 :followings_count=>@guy.followings_count,
                 :followers_count=>@guy.followers_count,
                 :description=>@guy.description,
                 :username=>@guy.username
                             }



                 respond_to do |format|
                format.html # show.html.erb
                format.json  { render :json => @myJson }

                end

                else
            end      
      end  
  
end
