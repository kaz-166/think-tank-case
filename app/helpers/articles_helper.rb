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

  # [Abstract]  マークダウン記法の文字列の集合をHTML形式にして返すヘルパメソッド
  # [Projection] f: String -> String
  # [] ユーザ入力のHTMLはエスケープしてシステム付加のエスケープのみを有効にする
  def markdown2html(content)
    s = content.split("<br />") #改行コードで文字列を分割
    s_out = "<div class=\"article-markdown\">"
    for i in 0..s.length-1
      # "# "見出しh1
      if s[i].start_with?("# ")
        s[i].gsub!("# ", "<h1>")
        s[i] += "</h1>"
        s_out += s[i]
      # "## "見出しh2  
      elsif s[i].start_with?("## ")
        s[i].gsub!("## ", "<h2>")
        s[i] += "</h2>"
        s_out += s[i]
      else
        s_out += s[i]
        s_out += "<br>"
      end    
    end
    s_out += "</div>"
    s_out
  end
end
