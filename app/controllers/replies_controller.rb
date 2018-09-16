class RepliesController < ApplicationController
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
  end

private
  def reply_params
    params.require(:reply).permit(:content)
  end

end
