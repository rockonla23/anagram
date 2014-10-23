get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/*' do

  word = request.path.delete("/")
  # puts word

  sorted_word = word.downcase.split(//).sort.join

  # puts sorted_word

  # Word.where(downcase_words: sorted_word).each do |indiv_word|
  #   puts indiv_word.word
  # end

  matched_words = Word.where(downcase_words: sorted_word)
  matched_words_string = ""

  matched_words.each do |matched_word|
    matched_words_string += matched_word.word + "<br>"
  end

  erb :index, :locals => {:word => word, :matched_words => matched_words_string}
end
