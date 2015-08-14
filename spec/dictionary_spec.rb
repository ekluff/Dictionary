require('rspec')
require('definition')
require('word')
require('pry')

describe('Word') do

  before() do
    Word.clear
  end

  describe('#initialize') do
    it('creates a new instance of class Word that accepts user input word, assigns ID, saves a creation time, sets include_in_dictionary to true, and creates nested empty array @definitions.') do
      test_word = Word.new({:word => 'tacocat'})
      expect(test_word.word).to(eq('tacocat'))
      expect(test_word.id).to(eq(0))
      expect(test_word.creation_time.class).to(eq(Time))
      expect(test_word.include_in_dictionary).to(eq(true))
      expect(test_word.definitions).to(eq([]))
    end
  end



end
