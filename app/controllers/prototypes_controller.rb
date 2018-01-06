class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.all.page(params[:page]).per(10)
  end

  def popular
    @prototypes = Prototype.all.order("likes_count DESC").page(params[:page]).per(10)
  end

  def newest
    @prototypes = Prototype.all.order("id DESC").page(params[:page]).per(10)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    @prototype.tags.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    # modelのprototype.rbにtags_first_or_initializeメソッドを記載
    @prototype.tags_first_or_initialize(@prototype)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      flash[:alert] = 'New prototype was unsuccessfully created'
      render :new
     end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @prototype.update(update_prototype_params)
      redirect_to :root, notice: '編集が完了しました'
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy if current_user.id == prototype.user_id
  end


  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status],
      tags_attributes: [:name]
    )
  end

  def update_prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:id, :content, :status]
    )
  end
end
