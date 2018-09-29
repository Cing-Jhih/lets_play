class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @receiver = User.find(params[:user_id])
    @message = @receiver.messages.build(message_params)
    @message.receiver = @receiver
    @message.user = current_user
    @message.save!
    redirect_to user_path(@receiver)
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.receiver == current_user
      @message.destroy
      redirect_to user_path(current_user)
    end
  end

private
  def message_params
    params.require(:message).permit(:content)
  end
end
