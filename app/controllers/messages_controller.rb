class MessagesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def new
    @message = Message.new
  end

  def index
    if params[:search]
      @messages = current_user.messages.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @messages = current_user.messages.order("created_at DESC").paginate(:page => params[:page])
    end
  end

  def show


  end

  def create
    @user = current_user
    @message = @user.messages.create( message_params )

    respond_to do |format|
      if @message.save
          flash[:success] = "Drawing was succesfully added to database"
          format.html { redirect_to message_path(@message) }
          format.js { render :js => "window.location = '/messages/#{@message.id}'" }
      else
          format.html { redirect_to new_message_path(@message) }
          format.js# create.js.erb
      end
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

  def message_params
      params.require(:message).permit(:msg, :title)
  end



end
