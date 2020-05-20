module PostsHelper
    # [Abstract]   PostモデルのExpressionの値から画像のPathに変換するヘルパメソッド
    # [Projection] f: Integer -> String
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

    # 0～9ならば先頭に文字0を付加するメソッド
    # [Projection] f: Integer -> String
    def add_prefix(num)
      if (num >= 0) && (num <= 9)
        "0" + num.to_s
      else
        num.to_s
      end
    end
end
