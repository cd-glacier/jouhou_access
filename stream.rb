#encoding: utf-8

require "mechanize"

url = "https://www.cis.doshisha.ac.jp/hatano/local/stemmingProcess.html"
post_url = "https://www.cis.doshisha.ac.jp/hatano/local/stemmingProcess.php"
username = "bjstudents"
pass = "doshisha"

agent = Mechanize.new
agent.add_auth(url, username, pass)
page = agent.get(url)

words = []
File.open("result.txt") do |file|
  file.each_line do |line|
    tmp = line.split(" ")
    tmp.each do |word|
      words << word
    end
  end
end

result = []
words.each do |word|
  result_page = page.form_with(:name => "form") do |form|
    form.field_with(:name => "input") do |field|
      field.value = word
    end
  end.submit
result_word = result_page.body.split("result")[2].split("<")[0].split(" ")[1]
result << result_word
end

puts result








