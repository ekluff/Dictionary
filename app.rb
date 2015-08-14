require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
also_reload('lib/**/*.rb')
require('pry')

get('/') do
  @words = Word.all
  erb(:index)
end

post('/add_word') do
  @word = params.fetch('word')
  type = params.fetch('type')
  definition_text = params.fetch('definition_text')

  Word.new({:word => @word})
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
