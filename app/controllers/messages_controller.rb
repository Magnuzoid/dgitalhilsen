class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  #before_action :get_user, only: [:edit, :update, :destroy]
  before_action :set_message, only: [:show, :edit, :update, :destroy]


  def new
    @message = Message.new
    #@message = @user.messages.new
  end

  def index
    #@messages.paginate(:page => params[:page])
    #@messages = Message.search(params[:search])

    if params[:search]
      @messages = current_user.messages.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

    else
      @messages = current_user.messages.paginate(:page => params[:page])
    end


  end

  def show
    # if Message.exists?(id: params[:id])
    #   @message = Message.find(params[:id])
    # else
    #   redirect_to messages
    # end

  end

  def create
    @message = Message.new( message_params )
    @message.user = current_user

    if @message.save
        flash[:success] = "Drawing was succesfully added to database"
        #redirect_to message_path(@message)
    else
        render 'new'
    end
    respond_to do |format|
      format.html { redirect_to message_path(@message) }
      format.js
    end
    #redirect_to message_path(@message)
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_path, notice: 'Hilsen hermed slettet.' }
      format.json { head :no_content }
    end
  end

  def save
    @message.save
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  def get_user
    @user = current_user
  end

  def message_params
      params.require(:message).permit(:msg, :user_id)
  end



end
