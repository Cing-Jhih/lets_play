class RepliesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @game = Game.find(params[:game_id])
    @reply = @game.replies.build(reply_params)
    @reply.user = current_user
    @reply.save!
  end

  def destroy
    @game = Game.find(params[:game_id])
    @reply = Reply.find(params[:id])
    if @reply.user == current_user || current_user.role == "admin"
      @reply.destroy
    end
  end

private
  def reply_params
    params.require(:reply).permit(:content)
  end

end
