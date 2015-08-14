require('rspec')
require('definition')
require('word')
require('pry')

describe('Word') do

  before() do
    Word.clear
  end

  describe('.clear') do
    it('is empty at first') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.all') do
    it('returns Word@@words') do
      Word.new({:word => 'tacocat'})
      Word.new({:word => 'burritodog'})
      expect(Word.all[0].word).to(eq('tacocat'))
      expect(Word.all[1].word).to(eq('burritodog'))
    end
  end

  describe('#initialize') do
    it('creates a new instance of class Word that accepts user input word, assigns ID, saves a creation time, sets include_in_dictionary to true, and creates nested empty array @definitions.') do
      test_word = Word.new({:word => 'tacocat'})
      expect(test_word.word).to(eq('tacocat'))
      expect(test_word.id).to(eq(0))
      expect(test_word.creation_time.class).to(eq(Time))
      expect(test_word.include_in_dictionary).to(eq(true))
      expect(test_word.definitions).to(eq([]))
      expect(Word.all[0].word).to(eq('tacocat'))
    end
  end

  describe('.find_word') do
    it('returns a word object based on attribute "word"') do
      Word.new({:word => 'tacocat'})
      Word.new({:word => 'burritodog'})
      Word.new({:word => 'empanadafish'})
      expect(Word.find_word('burritodog').word).to(eq('burritodog'))
    end
  end

  describe('#include_in_dictionary') do
    it('calls the value of the attribute by same name, and can set the value to true or false') do
      Word.new({:word => 'tacocat'})
      test_word = Word.find_word('tacocat')
      test_word.include_in_dictionary = false
      expect(test_word.include_in_dictionary).to(eq(false))
    end
  end

end

describe('Definition') do

  before() do
    Word.clear
    Definition.clear
  end

  describe('.clear') do
    it('is empty at first') do
      expect(Word.all).to(eq([]))
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#initialize') do
    it('creates a new definition including word, definition text, type, id, creation time, and include in dictionary status.') do
      test_definition = Definition.new({:word => 'tacocat', :type => 'noun', :definition_text => 'A cat that likes tacos.'})
      expect(test_definition.word).to(eq('tacocat'))
      expect(test_definition.type).to(eq('noun'))
      expect(test_definition.definition_text).to(eq('A cat that likes tacos.'))
      expect(test_definition.id).to(eq(0))
      expect(test_definition.creation_time.class).to(eq(Time))
      expect(test_definition.include_in_dictionary).to(eq(true))
      expect(Definition.all[0].word).to(eq('tacocat'))
    end
  end






end
