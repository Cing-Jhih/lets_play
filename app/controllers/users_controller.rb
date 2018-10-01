class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :games, :replies, :followships, :messages]

  def index
    @users = User.all
  end

  def show
    @favorited_games = @user.favorited_games.order(created_at: :desc)
    @followings = @user.followings.all
    @followers = @user.followers.all
    @message = Message.new
    if session[:fb_first_login]
      session[:fb_first_login] = nil
      redirect_to session[:previous_url]
    end
  end

  def edit
    unless @user == current_user
      flash[:alert] = "非本人，無法編輯!"
      redirect_to user_path
    end
  end

  def update
    if @user.update(user_params)
      if session[:fb_first_login]
        session[:fb_first_login] = nil
        redirect_to session[:previous_url]
      else
        flash[:notice] = "profile was successfully updated"
        redirect_to user_path(@user)
      end
    else
      flash.now[:alert] = "profile was failed to update"
      render :edit
    end
  end

  def games
    @posted_games = @user.games.order(created_at: :desc)
  end

  def replies
    @replied_games = @user.replied_games.uniq
  end


  def messages
    unless @user == current_user
      flash[:alert] = "非本人不能看悄悄話!"
      redirect_to user_path
    end
    @msg_received = Message.where(receiver_id: @user.id)
    @msg_sent = Message.where(user_id: @user.id)
    Notification.all.where(user_id: @user.id).destroy_all
  end
    

  def followships
    @followings = @user.followings.all
    @followers = @user.followers.all
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :kid_birth, :intro, :avatar)
    end
end
