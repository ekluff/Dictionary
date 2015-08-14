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
  end

  # class methods






end
