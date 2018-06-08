class TagsController < ApplicationController
  
  def index
    @tags = ActsAsTaggableOn::Tag.most_used(100)
  end
  
  def show
    if user_signed_in?
      @post = current_user.posts.build
    end
    @posts = Post.tagged_with(params[:tag]).order('created_at DESC')
    @tag_count = Post.tagged_with(params[:tag]).count
    @tag = ActsAsTaggableOn::Tag.name
    def current_url
      url_for :only_path
    end
  end
  
  private
  
end