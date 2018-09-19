class SituationsController < ApplicationController
  def show
    @situation = Situation.find(params[:id])
    @situation_games = @situation.situation_games.all.order(game_id: :asc)
  end
end
