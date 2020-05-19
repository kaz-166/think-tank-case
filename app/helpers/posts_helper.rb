module PostsHelper
    # [Abstract]   PostモデルのExpressionの値から画像のPathに変換するヘルパメソッド
    # [Projection] f: Integer-> String
    # [Caution]    nameタグで渡されたパラメータの座標の存在性で判定しているためやや強引な方法
    def decode_expresssion(exp)
        if exp == 0
            'normal.png'
          elsif exp == 1
            'happy.png'
          elsif exp == 2
            'angry.png'
          elsif exp == 3
            'surprised.png'
          elsif exp == 4
            'confused.png'
          else
            # 不正な値の場合はデフォルトの画像を表示する
            'normal.png'
          end 
    end
end
