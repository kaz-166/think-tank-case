class UsersController < ApplicationController

# [Abstract]   表示プロジェクトを切り替えるメソッド
def switch_project
    project_id = Project.find_by(user_id: current_user.id, name: params[:switch]).id
    User.find(current_user.id).update(current_prj_id: project_id)
    redirect_to page_path(current_user.id)
end

  private
    def user_params
        params.require(:user).permit(:switch)
    end
end