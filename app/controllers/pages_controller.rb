class PagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @posts = User.find(current_user.id).posts.all.order(id: "DESC")
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(Settings.paginate_length.thinks) # ページネーション
    @user = User.find(current_user.id)
    current_project_id = @user.current_prj_id
    if current_project_id.nil? == false
      @project = @user.projects.find(current_project_id)
      @articles = @project.articles.all.order(id: "DESC")
      @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(Settings.paginate_length.proceeds)
    end
  end

end
