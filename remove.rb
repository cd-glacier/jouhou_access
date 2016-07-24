#encoding: utf-8

result = []

i = 0
File.open("origin.txt") do |file|
  file.each_line do |line|
    line = line.downcase.delete(",")
    line = line.delete(".")
    line = line.delete(":")
    line = line.delete(";")
    line = line.delete("\'")
    line = line.delete('\"')
    line = line.delete("?")
    line = line.delete("!")
    line = line.delete("-")
    line = line.delete("_")
    line = line.delete("/")
    line = line.delete("”")
    line = line.delete("”")

    line_array = []
    line_array = line.split(" ")

    File.open("stop-word.txt") do |file|
      file.each_line do |sword|
        line_array.delete(sword.chomp)      
      end
    end

    result[i] = ""
    line_array.each do |word|
      result[i] = result[i] + word + " "
    end
    
    i = i + 1

  end
end

puts result

