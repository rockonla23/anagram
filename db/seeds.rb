sql_insert = "INSERT INTO words (word, downcase_words) values "
# i = 0
File.open('dict.txt').each do |row|
  # Word.create(word: row)
  row.delete!("\n")
  sql_insert += "('#{row}','#{row.downcase.split(//).sort.join}'),"
  # i += 1
  # break if i == 10
end
puts sql_insert

sql_insert.gsub!(/,\z/,';')

puts sql_insert
ActiveRecord::Base.connection.execute(sql_insert)