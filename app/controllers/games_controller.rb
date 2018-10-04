class GamesController < ApplicationController
before_action :set_game, only: [:edit, :update, :destroy]
before_action :validates_search_key, only: [:search]
before_action :authenticate_user!, only: [:new, :favorite]

  def index
    @popular_games_1 = Game.all.order(favorites_count: :desc).limit(4)
    @popular_games_2 = Game.all.order(favorites_count: :desc).limit(4).offset(4)
    @popular_games_3 = Game.all.order(favorites_count: :desc).limit(4).offset(8)
    @latest_games_1 = Game.all.order(favorites_count: :desc).limit(4)
    @latest_games_2 = Game.all.order(favorites_count: :desc).limit(4).offset(4)
    @latest_games_3 = Game.all.order(favorites_count: :desc).limit(4).offset(8)
  end


  def search
  	@games = Game.ransack({:title_or_tool_or_step_cont => @q}).result(distinct: true)
  end

  def hashtag
    if params[:search]
      tag = Tag.find_by(name: params[:search])
        if tag
          redirect_to "/games/hashtag/#{tag.name}"
          params[:name] = params[:search]
        else
          flash[:alert] = "Sorry! #{params[:search]} was not found. Here are all hashtags"
          redirect_to tag_all_path
       end
    else
      @tag = Tag.find_by(name: params[:name])
      @games = @tag.games.all.order(favorites_count: :asc)
    end
  end

  def show
    @game = Game.find(params[:id])
    @age_games = @game.age_games.all.order(age_id: :asc)
    @reply = Reply.new

    # transform youtube share url to embed url
    # ssl lets iframe tag can work on https site like heroku
    @youtube_url = YouTubeRails.youtube_embed_url_only(@game.url, ssl: true) 
    @url = request.protocol + request.host + (request.port ? ":#{request.port.to_s}" : nil) + "/games/" + @game.id.to_s
  end

  def popular
    # need to add a filer to limit games by age
    @games = Game.all.order(favorites_count: :desc)
  end

  def latest
    # need to add a filer to limit games by age
    @games = Game.all.order(created_at: :desc)
  end

  def random
    @speech = params[:speech] if params[:speech].present?
    @reply = Reply.new
    age_game_ids = [] # 存放所有符合選定年齡的game.id
    AgeGame.where(age_id: params[:age_game][:age_id]).find_each do |age_game|
      age_game_ids << age_game.game_id
    end

    situation_game_ids = [] # 存放所有符合選定情境的game.id
    SituationGame.where(situation_id: params[:situation_game][:situation_id]).find_each do |situation_game|
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

    @step_speech = @game.step.gsub(/[^\u4e00-\u9fa5_a-zA-Z0-9]/,' ')
    @title_speech = @game.title.gsub(/[^\u4e00-\u9fa5_a-zA-Z0-9]/,'')
    @youtube_url = YouTubeRails.youtube_embed_url_only(@game.url, ssl: true) 
    @url = 'https://kidgamebata.herokuapp.com/games/'+@game.id.to_s

    if @game == nil
      flash[:notice] = "糟糕！您指定的玩家年齡與情境，我們找不到遊戲推薦給您Q_Q 請重新設置或進來逛逛其他遊戲"
      redirect_to root_path
    end

    url = '/games/random??utf8=✓&age_game%5Bage_id%5D=#{params[:age_game][:age_id]}&situation_game%5Bsituation_id%5D=#{params[:situation_game][:situation_id]}&speech%5D=#{@speech}&commit=推薦遊戲'
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user

    if @game.save
       create_relationship
      redirect_to games_path #better to js:histroy.go(-2) or games_uer_path
      flash[:notice] = "成功張貼新遊戲"
    else
      render :new
      flash[:alert] = "糟糕！新遊戲有資料錯漏啦！"
    end
  end

  def edit
    unless @game.user == current_user || current_user.role == "admin"
      redirect_to game_path(@game)
      flash[:alert] = "You can not edit the game posted by other user"
    end
  end

  def update
    if @game.user == current_user || current_user.role == "admin"
      if @game.update(game_params)
        create_relationship
        redirect_to game_path(@game) #better to js:histroy.go(-2) or games_uer_path
        flash[:notice] = "成功編輯遊戲"
      else
        render :edit
        flash[:alert] = "糟糕！遊戲有資料錯漏啦！"
      end
    else
      redirect_to game_path(@game)
      flash[:alert] = "You can not edit the game posted by other user"
    end
  end

  def destroy
    @game.destroy
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
    flash[:alert] = "game was deleted"
  end

  def favorite
    @game = Game.find(params[:id])
    @game.favorites.create!(user: current_user)
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end

  def unfavorite
    @game = Game.find(params[:id])
    favorites = Favorite.where(game: @game, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end

private
  def game_params
    params.require(:game).permit(:title, :image, :tool, :step, :user_id, :url, :min_age, :max_age)
  end

  def set_game
    @game = Game.find(params[:id])
    @situation_games = @game.situation_games.all.order(situation_id: :asc)
    @game_situations = @situation_games.pluck(:situation_id)
  end

  def validates_search_key
  	@q = params[:query_string].gsub(/\\|\'|\/|\?/, "") if params[:query_string].present?
  end

  def create_relationship
      age_ids = [] # 存放所有符合選定年齡的game.id
      Age.where(old: (@game.min_age .. @game.max_age)).find_each do |age|
      age_ids << age.id
      @game.age_games.destroy_all
      age_ids.length.times do
        AgeGame.create!(
          age_id: age_ids.pop,
          game_id: @game.id,
          )
      end
    end

    unless params[:situation_game][:situation_id] == ""
      @game.situation_games.destroy_all
      situation_ids = params[:situation_game][:situation_id]
      # Why can not use arr.campact to remove ""??
      (situation_ids.length - 1).times do
        SituationGame.create!(
          situation_id: situation_ids.pop,
          game_id: @game.id,
          )
      end
    end
  end
end
