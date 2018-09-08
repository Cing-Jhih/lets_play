class GamesController < ApplicationController
  def home
  end

  def show
    @game = Game.find(params[:id])
  end
end
