class AgesController < ApplicationController
  def show
    @age = Age.find(params[:id])
    @age_games = @age.age_games.all  
    games_ids = []  
    @age_games.find_each do |age_game|
      games_ids << age_game.game
    end  
    @games = Game.where(id: games_ids).all.order(created_at: :desc)
  end

  def baby
    
  end

  def kidergarten
    
  end

  def junior
    
  end

  def middle
    
  end

  def senior
    
  end
end
