class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def destroy
  end
end
