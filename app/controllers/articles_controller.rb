class ArticlesController < ApplicationController

    def new
        @articles = Article.new
    end

    def create
        Article.create(project_id: 1, title: article_params[:title], content: article_params[:content])
        redirect_to page_path(1)
    end

    def show
        @articles = Article.find(params[:id])
    end

    def update
        @articles = Article.find(params[:id])
        Article.find(params[:id]).update(project_id: 1, title: article_params[:title], content: article_params[:content])
        redirect_to page_path(1)
    end

    def edit
        @articles = Article.find(params[:id])
    end

    def destroy
    end

    private
        # [Abstract] ストロングパラメータの設定
        # [Projection] f: none -> params[] 
        def article_params
            params.require(:article).permit(:title, :content)
        end

end
