module ArticlesHelper
  # [Abstract]   複数行の文字列から先頭N行を取得するヘルパメソッド
  # [Projection] f: (String, Integer) -> String
  def article_subset(content, line)
    s = content.split(/\r\n|\n|\r/)
    s_out = ""
    if line > s.length
      for i in 0..s.length-1
        s_out = s_out +  s[i]
        s_out = s_out + "\n"      
      end
    else
      for i in 0..line-1
        s_out = s_out + s[i]
        s_out = s_out + "\n"      
      end
      s_out = s_out + "..."
    end
    s_out
  end
end
