class PagesController < ApplicationController
  def show
    @posts = Post.all.order(id: "DESC")
    @articles = Article.all
  end
end
