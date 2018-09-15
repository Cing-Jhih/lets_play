class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @favorited_games = @user.favorited_games
  end

  def edit
    unless @user == current_user
      flash[:alert] = "非本人，無法編輯!"
      redirect_to user_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "profile was successfully updated"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "profile was failed to update"
      render :edit
    end
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
