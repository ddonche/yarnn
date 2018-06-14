class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :repost]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      @post = current_user.posts.build
    end
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all.order('created_at DESC')
    end
    respond_to do |format| 
      format.html
      format.js
    end
  end

  def show
    @comments = @post.comments.order("created_at DESC").includes(:notations)
    @comment = Comment.new
    respond_to do |format| 
      format.html
      format.js
    end
  end

  def new
    @post = current_user.posts.build
    respond_to do |format| 
      format.html
      format.js
    end
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        format.js
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def repost
    post = current_user.posts.create(post_id: @post.id, content: "Repost")
    if post.save
      voltaire_plus(1, :reputation, @post.user_id)
      @post.increment!(:share_count)
      Notification.create!(post_id: @post.id, 
                                recipient_id: @post.user_id, notified_by_id: current_user.id, 
                                notification_type: "repost")
      respond_to do |format|
        format.html { redirect_to feed_url, notice: 'Repost was successful.' }
      end
    else
      redirect_to :back, alert: "Unable to repost."
    end
  end
  
  def upvote
    if @post.user != current_user
      @post.upvote_by current_user
    
      voltaire_plus(1, :reputation, @post.user_id)
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
  end
  
  def downvote
    if @post.user != current_user
      @post.downvote_by current_user
  
      voltaire_minus(1, :reputation, @post.user_id)
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :url, :content, :user_id, :tag_list, 
                                    :image, :video, :audio, :type, :post_id)
    end
end
