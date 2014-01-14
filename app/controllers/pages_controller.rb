class PagesController < ApplicationController
  def home
  	if current_user
    	@client=Soundcloud.new(:access_token => current_user.authentification_token)
  		@soundcloud_account=@client.get("/me/followings").to_json
      @soundcloud_search = @client.get('/users', :q => 'Rat Cheum').to_json

    data = ActiveSupport::JSON.decode(@soundcloud_account)

    end

    

      File.open("public/event.json","w") do |f|
        f << '{
            "name": "blabla",
            "children": '
        f.write(@soundcloud_account)
        f << "}"
      end


  #  data.each do |datum|
  #    @soundcloud_test = @client.get("/users/#{datum['id']}/followings/").to_json
  #    File.open("public/event.json","a") do |f|
  #      f << '{
  #          "name": "flare",
  #          "children": '
  #      f.write(@soundcloud_test)
  #      f << "}"
  #   end
  #    File.open("public/event.json","a") do |f|
  #      f << "}"
  #    end
  #  end

  end


  def create_soundcloud
    omniauth = request.env['omniauth.auth']
    user = User.get_or_create_from_omniauth(omniauth)
    sign_in user
    redirect_to root_path

   
  end


end
