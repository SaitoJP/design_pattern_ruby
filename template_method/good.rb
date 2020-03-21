class Report
  def initialize
    @title = 'タイトル'
    @body = '内容'
  end

  def print
    puts '---- start ----'
    title
    body
    puts "---- end ----\n\n"
  end

  private

  def title
    raise NotImplementedError
  end

  def body
    raise NotImplementedError
  end
end

class HtmlReport < Report
  def title
    puts "<div>#{@title}</div>"
  end

  def body
    puts "<body>#{@body}</body>"
  end
end

class MarkdownReport < Report
  def title
    puts "##{@title}"
  end

  def body
    puts "- #{@body}"
  end
end

class PlainReport < Report
  def title
    puts(@title)
  end

  def body
    puts(@body)
  end
end

HtmlReport.new.print
MarkdownReport.new.print
PlainReport.new.print

# ◯ 出力
# ---- start ----
# <title>タイトル</title>
# <body>内容</body>
# ---- end ----
#
# ---- start ----
# #タイトル
# - 内容
# ---- end ----
#
# ---- start ----
# タイトル
# 内容
# ---- end ----