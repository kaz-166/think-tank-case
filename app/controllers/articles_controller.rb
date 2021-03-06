class ArticlesController < ApplicationController
    before_action :authenticate_user!
    def new
        @articles = Article.new
    end

    def create
        prj_id = User.find(current_user.id).current_prj_id
        if prj_id.nil? == false
            Article.create(project_id: prj_id, title: article_params[:title], content: article_params[:content])
        end
        redirect_to page_path(current_user.id)
    end

    def show
        @articles = Article.find(params[:id])
    end

    def update
        prj_id = User.find(current_user.id).current_prj_id
        if prj_id.nil? == false
            @articles = Article.find(params[:id])
            Article.find(params[:id]).update(project_id: prj_id, title: article_params[:title], content: article_params[:content])
        end
        redirect_to page_path(current_user.id)
    end

    def edit
        @articles = Article.find(params[:id])
    end

    def destroy
        Article.find(params[:id]).destroy
        redirect_to page_path(current_user.id)
    end

    private
        # [Abstract] ストロングパラメータの設定
        # [Projection] f: none -> params[] 
        def article_params
            params.require(:article).permit(:title, :content)
        end

end
