class ProjectsController < ApplicationController

    def new
        @projects = Project.new
    end

    def create
        Project.create(project_params)
        redirect_to page_path(1)
    end

    def destroy
    end

    private
        # [Abstract] ストロングパラメータの設定
        # [Projection] f: none -> params[]
        def project_params
            params.require(:project).permit(:name)
        end

end
