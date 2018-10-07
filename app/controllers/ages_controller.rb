class AgesController < ApplicationController
  def show
    @age = Age.find(params[:id])
    @age_games = @age.age_games.all
    games_ids = []
    @age_games.find_each do |age_game|
      games_ids << age_game.game_id
    end
    @games = Game.where(id: games_ids).all.order(created_at: :desc)
  end

  def baby
    games_ids =[]
    Age.where(old: 0..2).all.find_each do |age|
      age.suitable_games.find_each do |suitable_game|
        games_ids << suitable_game.id
      end
    end
    games_ids.uniq
    @games = Game.where(id: games_ids).all.order(created_at: :desc)
   end
  

  def kidergarten
    games_ids =[]
    Age.where(old: 3..5).all.find_each do |age|
      age.suitable_games.find_each do |suitable_game|
        games_ids << suitable_game.id
      end
    end
    games_ids.uniq
    @games = Game.where(id: games_ids).all.order(created_at: :desc)
  end

  def junior
    games_ids =[]
    Age.where(old: 6..7).all.find_each do |age|
      age.suitable_games.find_each do |suitable_game|
        games_ids << suitable_game.id
      end
    end
    games_ids.uniq
    @games = Game.where(id: games_ids).all.order(created_at: :desc)
  end

  def middle
    games_ids =[]
    Age.where(old: 8..9).all.find_each do |age|
      age.suitable_games.find_each do |suitable_game|
        games_ids << suitable_game.id
      end
    end
    games_ids.uniq
    @games = Game.where(id: games_ids).all.order(created_at: :desc)
  end

  def senior
    games_ids =[]
    Age.where(old: 10..12).all.find_each do |age|
      age.suitable_games.find_each do |suitable_game|
        games_ids << suitable_game.id
      end
    end
    games_ids.uniq
    @games = Game.where(id: games_ids).all.order(created_at: :desc)
  end
end
