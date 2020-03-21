class Report
  attr_writer :formatter

  def initialize(formatter)
    @formatter = formatter
    @title = 'タイトル'
    @body = '内容'
  end

  def print
    puts '---- start ----'
    print_title
    print_content
    puts "---- end ----\n\n"
  end

  private

  def print_title
    @formatter.print_title(@title)
  end

  def print_content
    @formatter.print_content(@body)
  end
end

class HtmlFormatter
  def print_title(title)
    puts "<title>#{title}</title>"
  end

  def print_content(body)
    puts "<body>#{body}</body>"
  end
end

class MarkdownFormatter
  def print_title(title)
    puts "##{title}"
  end

  def print_content(body)
    puts "- #{body}"
  end
end

class PlainFormatter
  def print_title(title)
    puts(title)
  end

  def print_content(body)
    puts(body)
  end
end

report = Report.new(HtmlFormatter.new)
report.print
report.formatter = MarkdownFormatter.new
report.print
report.formatter = PlainFormatter.new
report.print

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