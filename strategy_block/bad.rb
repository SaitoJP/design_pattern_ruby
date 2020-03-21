class Report
  def initialize(format)
    @format = format
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
    if @format == :html
      puts "<title>#{@title}</title>"
    elsif @format == :markdown
      puts "#{@title}"
    elsif @format == :plain
      puts(@title)
    end
  end

  def body
    if @format == :html
      puts "<body>#{@body}</body>"
    elsif @format == :markdown
      puts "- #{@body}"
    elsif @format == :plain
      puts(@body)
    end
  end
end

Report.new(:html).print
Report.new(:markdown).print
Report.new(:plain).print

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