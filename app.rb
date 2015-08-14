require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
also_reload('lib/**/*.rb')
require('pry')

before do
  cache_control :public, :must_revalidate
end

get('/') do
  @words = Word.all
  erb(:index)
end

post('/add_word') do
  @word = params.fetch('word')
  type = params.fetch('type')
  definition_text = params.fetch('definition_text')

  if Word.find_word(@word) == nil
    Word.new({:word => @word})
  end
  Definition.new({:word => @word, :type => type, :definition_text => definition_text})

  @all_word_definitions = Word.find_word(@word).definitions

  erb(:word_detail)
end

post('/add_definition/:word') do
  @word = params.fetch('word')
  type = params.fetch('type')
  definition_text = params.fetch('definition_text')

  Definition.new({:word => @word, :type => type, :definition_text => definition_text})

  @all_word_definitions = Word.find_word(@word).definitions

  erb(:word_detail)
end

get('/word_detail/:word') do
  @word = params.fetch('word')

  @all_word_definitions = Word.find_word(@word).definitions

  erb(:word_detail)
end

get('/search') do
  search_word = params.fetch('search_word')
  found_word = Word.find_word(search_word)

  if found_word == nil
    @word = nil
  else
    @word = found_word.word
    @all_word_definitions = found_word.definitions
  end

  erb(:word_detail)
end
