class SkinshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user = User.find(params[:like_id])
    current_user.like(user)
    flash[:success] = 'ユーザをお気に入りに追加しました。'
    redirect_to user
  end

  def destroy
    user = User.find(params[:like_id])
    current_user.unlike(user)
    flash[:success] = 'ユーザをお気に入りから解除しました。'
    redirect_to user
  end
end
