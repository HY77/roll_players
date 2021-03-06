class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(5).includes(:player, :favorites)
  end

  def favorite_order
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(5).includes(:player, :favorites).favorite_sort
    render "show"
  end

  def user_favorite_articles
    @user = User.find(params[:id])
    @articles = @user.my_favorite_articles.page(params[:page]).per(5)
      .includes(:user, :player, :favorites).my_favorite_articles_sort
    render "show"
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(10)
    render "show_follow"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render "show_follow"
  end
end
