class UsersController < ApplicationController


  def show
    @user=User.where(id: params[:id_donne])

    respond_to do |format|
          format.html # show.html.erb
          format.json  { render :json => {children:@user} }
        end    
  end

  def destroy
  end

  


end
