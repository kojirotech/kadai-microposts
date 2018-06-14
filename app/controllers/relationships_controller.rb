class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = 'ユーザをフォローしました。'
    redirect_to user
    
    user = User.find(params[:like_id])
    current_user.like(user)
    flash[:success] = 'ユーザをお気に入りに追加しました。'
    redirect_to user
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_to user
    
    user = User.find(params[:like_id])
    current_user.unlike(user)
    flash[:success] = 'ユーザをお気に入りから解除しました。'
    redirect_to user
  end
end
