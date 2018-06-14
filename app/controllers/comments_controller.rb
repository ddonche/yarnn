class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :load_post
  before_action :authenticate_user!, except: [:show]

  def new
    @comment = @post.comments.new
    respond_to do |format|               
      format.js
    end
  end
  
  def create
    @comment = @post.comments.new(allowed_params) 
    @comment.user_id = current_user.id if current_user
    if @comment.save
      unless current_user.id == @post.user_id
      Notification.create!(post_id: @post.id, comment_id: @comment.id, 
                                recipient_id: @post.user_id, notified_by_id: current_user.id, 
                                notification_type: "comment")
      end
      redirect_to @post, notice: "Comment created."
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @comment.update(allowed_params)
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was deleted.' }
    end
  end
  
  def upvote
    if @comment.user_id != current_user.id
      @comment.upvote_by current_user
      
      voltaire_plus(1, :reputation, @comment.user_id)
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
  end
  
  def downvote
    if @comment.user_id != current_user.id
      @comment.downvote_by current_user
      
      voltaire_minus(1, :reputation, @comment.user_id)
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
  end

  private
  
  def allowed_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
  
  def load_post
    @post = Post.find(params[:post_id])
  end
end