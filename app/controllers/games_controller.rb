class GamesController < ApplicationController
  def home
    
  end

  def random
    if params[:age_game][:age_id]
      @age_games = AgeGame.where(age_id: params[:age_game][:age_id]).all
      age_game_ids = []
      @age_games.each do |age_game|
        age_game_ids << age_game.game_id
      end

      if params[:situation_game][:situation_id]
        @game = games.find_by(id: params[:situation_game][:situation_id]).all.sample

      else
        @game = Game.find_by(id: @age_games.sample.game_id)
      end

    elsif
      params[:situation_game][:situation_id]
      @situation_games = SituationGame.where(id: params[:situation_game][:situation_id]).all
      @game = Game.find_by(id: @situation_games.sample.game_id)
    else  
      @game = Game.all.sample
    end
  end

end
  def show
    @game = Game.find(params[:id])
  end
end
