class GamesController < ApplicationController
  def index
     @latest_games = Game.all.order(created_at: :desc)
     @popular_games = Game.all.order(favorites_count: :desc).limit(10)
   end

  def home
  end

  def show
    @game = Game.find(params[:id])
  end

  def random
    age_game_ids = [] # 存放所有符合選定年齡的game.id
    AgeGame.where(age_id: params[:age_game][:age_id]).find_each do |age_game|
      age_game_ids << age_game.game_id
    end

    situation_game_ids = [] # 存放所有符合選定情境的game.id
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

    if @game == nil
      flash[:notice] = "糟糕！您指定的玩家年齡與情境，我們找不到遊戲推薦給您Q_Q 請重新設置或進來逛逛其他遊戲"
      redirect_to root_path
    end
  end
end
