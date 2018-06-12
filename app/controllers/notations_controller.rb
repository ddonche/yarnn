class NotationsController < ApplicationController
  before_action :set_comment
  before_action :set_post
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @notations = @comment.notations
  end

  def new
    @notation = @comment.notations.new
  end
  
  def create
    @notation = @comment.notations.new(notation_params) 
    @notation.user_id = current_user.id if current_user
    if @notation.save
      Notification.create!(post_id: @post.id, comment_id: @comment.id, 
                                notation_id: @notation.id, recipient_id: @comment.user_id, 
                                notified_by_id: current_user.id, notification_type: "notation")
      redirect_to @post
    else
      render :new
    end
  end
  
  def edit   
    @notation = Notation.find(params[:id])
  end
  
  def update
    respond_to do |format|
      if @notation.update(notation_params)
         format.html { redirect_to :back }
      else
         format.html { render :edit }
      end
    end
  end

  def destroy
    @notation = Notation.find(params[:id])
    @notation.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Reply was deleted.' }
    end
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
  
  def set_post
    @post = Post.find(params[:post_id])
  end
  
  def notation_params
    params.require(:notation).permit(:content, :user_id, :comment_id)
  end
end