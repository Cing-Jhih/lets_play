class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by(name: params[:name])
    @games = @tag.games.all.order(favorites_count: :asc)
  end

  def search
    @tags = Tag.ransack({:name_cont => @q}).result(distinct: true)
    game_ids =[]
    @tags.find_each do |tag|
      tag.games.find_each do |game|
        game_ids << game.id
      end  
    end  
    @games = Game.where(id: game_ids).all.order(favorites_count: :asc)
    
  end
end
