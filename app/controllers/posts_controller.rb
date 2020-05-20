class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    Post.create(user_id: current_user.id, content: post_params[:content])
    Post.last.update(expression: encode_expression(params))
    redirect_to page_path(current_user.id)
  end

  private
    # [Abstract] ストロングパラメータの設定
    # [Projection] f: none -> params[]
    def post_params
      params.require(:post).permit(:user_id, :content, :expression)
    end
    
    # [Abstract]   POST投稿時にどのボタンから押されたかを判定するメソッド
    # [Projection] f: params[] -> Intetger
    # [Caution]    nameタグで渡されたパラメータの座標の存在性で判定しているためやや強引な方法
    def encode_expression(param_exp)
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
