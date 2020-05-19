class PagesController < ApplicationController
  def show
    @posts = Post.all
  end
end
