class PagesController < ApplicationController
  def show
    @posts = Post.all.order(id: "DESC")
  end
end
