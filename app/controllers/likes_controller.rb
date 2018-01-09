class LikesController < ApplicationController
	def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    redirect_to prototype_path(params[:prototype_id]), notice: 'いいねしました'
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    like.destroy
        redirect_to prototype_path(params[:prototype_id]), notice: 'いいねを削除しました'
  end
end
