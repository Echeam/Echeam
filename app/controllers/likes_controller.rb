class LikesController < ApplicationController
	def create
    @like = Like.create(user_id: current_user.id, protptype_id: params[:protptype_id])
    @likes = Like.where(protptype_id: params[:protptype_id])
    @protptypes = Protptype.all
  end

  def destroy
    like = Protptype.find_by(user_id: current_user.id, protptype_id: params[:protptype_id])
    like.destroy
    @likes = Like.where(protptype_id: params[:protptype_id])
    @protptypes = Protptype.all
  end
end
