class SituationsController < ApplicationController
  def show
    @situation = Situation.find(params[:id])
    @situation_games = @situation.situation_games.all
    games_ids = []  
    @situation_games.find_each do |situation_game|
      games_ids << situation_game.game
    end  
    @games = Game.where(id: games_ids).all.order(created_at: :desc)
  end
end
