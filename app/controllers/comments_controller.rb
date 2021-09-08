class CommentsController < ApplicationController
  

  def create
    # ------------------------------------------------------------------------
      @event = Event.find(params[:event_id])
      @comment = Comment.new(comment_params)         # データベース内の処理
       if @comment.save
      # @comment = Comment.create(text: params[:text]) 
      # render json:{post: text}
    # ------------------------------------------------------------------------
    # ------------------------------------------------------------------------
      respond_to do |format|
        format.html  # { redirect_to event_path(params[:event_id]) }
        format.json # { render json: @comment}                        # データベースの処理が終わったあとどうするのか
      end
    else
      flash.now[:alert] = 'メッセージを入力または画像を送信してください'
      redirect_to "/events/#{comment.event.id}"
    end
    # ------------------------------------------------------------------------
   
    
    end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to "/events/#{comment.event.id}"
  end  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
