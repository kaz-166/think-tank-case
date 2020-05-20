class ProjectsController < ApplicationController

    def new
        @projects = Project.new
    end

    def create
        Project.create(name: project_params[:name], user_id: current_user.id)
        redirect_to page_path(current_user.id)
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
