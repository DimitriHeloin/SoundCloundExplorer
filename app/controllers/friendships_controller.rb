class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
    
  end

  def getFriendshipsPerUser
    @friendships=Friendship.where(user_id:params[:id_donne])

    respond_to do |format|
          format.html # show.html.erb
          format.json  { render :json => {children:@friendships} }
        end    
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit

  end

  # POST /friendships
  # POST /friendships.json
  def create

    @user=User.where(uid: params[:friend_id])
    @test_deja_ami=false;
    if @user.length==1

      current_user.friends.each do |t|
        if t.uid==params[:friend_id]
          @test_deja_ami=true;
        else
        end
      end
      if @test_deja_ami==false
        
        @friendship = current_user.friendships.build(:friend_id=>User.where(uid: params[:friend_id]).take.id)
        if @friendship.save
          @notif = Notification.new
          @notif.user_id=User.where(uid: params[:friend_id]).take.id
          @notif.content="L'utilisateur <a href='javascript:void(0)' id='"+current_user.uid.to_s+"' onclick='changeRoot(this.id);'> "+current_user.username+" </a> vous a ajouté en ami"
          User.where(uid: params[:friend_id]).take.notifications << @notif
          respond_to do |format|
          format.html # show.html.erb
          format.json  { render :json => {result:true} }    end
          # flash[:notice]="Added friend."
          # redirect_to root_url
        else
          # flash[:notice]="Unable to add friend."
          # redirect_to root_url
        end
      end
      
    else
      respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => {result:false} }    end
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "successfully destroyed friendship."
    redirect_to root_url
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end
