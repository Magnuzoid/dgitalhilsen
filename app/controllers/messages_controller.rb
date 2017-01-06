class MessagesController < ApplicationController


  def create

  end

  def show
    if Message.exists?(id: params[:id])

      @message = Message.find(params[:id])
      @message.update_attribute('show_at', Time.now.getutc)

      #check if message is expired
      if @message.show_at > @message.created_at.advance(minutes: 120)

        @message.msg = "message expired :("
      else

      end


      #@message[:shown_at] => @last_viewed
    else
      redirect_to "/sorry.html"
    end
  end


end
