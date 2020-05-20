class PagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @posts = User.find(current_user.id).posts.all.order(id: "DESC")
    @articles = User.find(current_user.id).projects.last.articles.all
  end

end
