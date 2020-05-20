class PagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @posts = User.find(current_user.id).posts.all.order(id: "DESC")
    @user = User.find(current_user.id)
    current_project_id = @user.current_prj_id
    if current_project_id.nil? == false
      @project = @user.projects.find(current_project_id)
      @articles = @project.articles.all
    end
  end

end
