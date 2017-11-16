class CommentsController < ApplicationController
  before_action :get_prototype_comments, only: [:index, :new,:destroy]


  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to prototype_path(params[:prototype_id])}
      format.json
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.user_id == current_user.id
    redirect_to root_path
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end

  def get_prototype_comments
    @protoype = Prototype.find(params[:prototype_id])
  end


end
