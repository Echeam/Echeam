class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      flash[:alert] = 'New prototype was unsuccessfully created'
      render :new
     end
  end

  def show
  end

  def edit
  end

  def update
    Prototype.update(prototype_params)
    flash[:alert] = 'Prototype was successfully updated.'
    render :index
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
      captured_images_attributes: [:content, :status]
    )
  end
end
