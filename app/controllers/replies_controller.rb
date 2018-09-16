class RepliesController < ApplicationController
  before_action :set_reply, only: [:edit, :update]

  def create
    @game = Game.find(params[:game_id])
    @reply = @game.replies.build(reply_params)
    @reply.user = current_user
    @reply.save!
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to game_path(@game)
    flash[:alert] = "reply was deleted"
  end

  def edit
    @game = Game.find(params[:game_id])
  end

  def update
    @game = Game.find(params[:game_id])
    @reply.update(reply_params)
    redirect_to game_path(@game)
  end

private
  def reply_params
    params.require(:reply).permit(:content)
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

end
