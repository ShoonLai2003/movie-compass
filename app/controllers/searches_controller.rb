class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @word.blank?
      return
    end

    if @range == "User"
      @users = User.where("name LIKE ?", "%#{@word}%")
    elsif @range == "Tag"
      @posts = Tag.search_posts_for(@word, "perfect")
    else
      @posts = Post.where("title LIKE ?", "%#{@word}%")
    end
  end
end