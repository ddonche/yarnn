class SharingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create]

  def create
    @user = current_user
    Sharing.create!(user_id: @user.id, post_id: @post.id)
    Notification.create!(post_id: @post.id, recipient_id: @post.user_id, 
                      notified_by_id: current_user.id, notification_type: "share")
    voltaire_up(1, :reputation, @post.user_id)
    Post.create!(parent_id: @post.id, title: @post.title, content: @post.content, 
                  user_id: @user.id, image: @post.image, video: @post.video, audio: @post.audio)
    respond_to do |format|
      @last = current_user.posts.last
      format.html { redirect_to feed_path, notice: "You successfully shared this post." }
      format.js { redirect_to feed_path, notice: "You successfully shared this post." }
    end
  end

  def destroy
    user = current_user
    @post = Post.find(params[:sharing][:post_id])
    sharing = user.sharings.find_by(post_id: @post.id)
    @user_post = user.posts.find_by(parent_id: @post.id)
    @user_post.destroy
    sharing.destroy
    voltaire_down(1, :reputation, @post.user_id)
    respond_to do |format|
      format.html { redirect_to feed_path }
      format.js { redirect_to feed_path }
    end
  end
  
  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end