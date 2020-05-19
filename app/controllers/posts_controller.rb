class PostsController < ApplicationController

  def create
    post_params[:expression] = get_expression(params)
    Post.create(post_params)
    redirect_to show_path
  end

  private
    # ストロングパラメータの設定
    def post_params
      params.require(:post).permit(:user_id, :content, :expression)
    end
    
    def get_expression(param_exp)
      if params["normal.x"] != nil
        0
      elsif params["happy.x"] != nil
        1
      elsif params["angry.x"] != nil
        2
      elsif params["surprised.x"] != nil
        3
      elsif params["confused.x"] != nil
        4
      else
      end 
    end 

end
