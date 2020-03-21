class Report
  def initialize
    @title = 'タイトル'
    @body = '内容'
  end

  def print(&formatter)
    puts '---- start ----'
    formatter.call(@title, @body)
    puts "---- end ----\n\n"
  end
end

report = Report.new
report.print do |title, body|
  puts "<title>#{title}</title>"
  puts "<body>#{body}</body>"
end
report.print do |title, body|
  puts "##{title}"
  puts "- #{body}"
end
report.print do |title, body|
  puts(title)
  puts(body)
end

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