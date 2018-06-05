class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_user, except: [:index, :reputable]

  def index
    @page_title = "Yarnneys"
    @users = User.confirmed.order('created_at DESC')
  end
  
  def reputable
    @page_title = "Most Reputable Yarnneys"
    @users = User.order(reputation: :desc)
  end
  
  def show
    @page_title = @user.username
    @posts = @user.posts
  end
  
  def following
    @title = "Following"
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers
    render 'show_follow'
  end
  
  private
  
  def set_user
    @user  = User.friendly.find(params[:id])
  end
  
end