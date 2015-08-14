class Word

  @@words = []
  @@counter = 0

  attr_reader(:word, :id, :creation_time, :include_in_dictionary, :definitions)

  # instance methods

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@counter
    @creation_time = Time.now
    @include_in_dictionary = true
    @definitions = []
    @@counter += 1
    @@words.push(self)
  end

  # class methods

  define_singleton_method(:clear) do
    @@words = []
    @@counter = 0
  end

  define_singleton_method(:all) do
    @@words
  end





end
