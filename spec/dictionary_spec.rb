require('rspec')
require('definition')
require('word')
require('pry')

describe('Word') do

  before() do
    Word.clear
  end

  describe('#initialize') do
    it('creates a new instance of class Word') do
      test_word = Word.new({:word => 'tacocat'})
      expect(test_word.word).to(eq('tacocat'))
    end
  end

end
