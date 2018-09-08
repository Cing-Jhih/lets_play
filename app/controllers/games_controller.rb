class GamesController < ApplicationController
  def home  
  end

  def show
    @game = Game.find(params[:id])
  end

  def random
    age_game_ids = []
    AgeGame.where(age_id: params[:age_game][:age_id]).find_each do |age_game|
      age_game_ids << age_game.game_id
    end

    situation_game_ids = []
    SituationGame.where("situation_id = ?", params[:situation_game][:situation_id]).find_each do |situation_game|
      situation_game_ids << situation_game.game_id
    end

    if params[:age_game][:age_id] == "" && params[:situation_game][:situation_id] == ""
      @game = Game.all.sample

    elsif params[:situation_game][:situation_id] == ""
      @game = Game.where(id: age_game_ids).all.sample
    
    elsif params[:age_game][:age_id] == ""
      @game = Game.where(id: situation_game_ids).all.sample
    
    else
      @game = Game.where(id: situation_game_ids & age_game_ids).all.sample
    end
  end
end
