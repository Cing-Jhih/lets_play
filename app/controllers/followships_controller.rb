class FollowshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @followship = current_user.followships.build(following_id: params[:following_id])
    if @followship.save
      flash[:notice] = "Successfully followed"
    else
      flash[:alert] = @followship.errors.full_messages.to_sentence
    end
  end

  def destroy
    @followship = current_user.followships.where(following_id: params[:id]).first
    @followship.destroy
    flash[:alert] = "Followship destroyed"
  end
  
end
