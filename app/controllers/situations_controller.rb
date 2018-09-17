class SituationsController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @situation_games = @game.situation_games.all.order(situation_id: :asc)
  end
end
