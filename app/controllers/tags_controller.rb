class TagsController < ApplicationController
  def index
    @tags = Tag.joins(:posts).distinct
  end
end
