class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def new
    @comment = @post.comments.new
    respond_to do |format|               
      format.js
    end
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(allowed_params) 
    @comment.user_id = current_user.id if current_user
    if @comment.save
      redirect_to @post, notice: "Comment created."
    else
      render :new
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(allowed_params)
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was deleted.' }
    end
  end

  private
  
  def allowed_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end