class CommentsController < ApplicationController
  before_action :get_prototype_comments, only: [:index, :new]


  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end

  def get_prototype_comments
    @protoype = Prototype.find(params[:prototype_id])
  end


end
