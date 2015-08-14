class('Word')

  @@words = []
  @@counter = 0

  attr_reader(:word, :id, :creation_time, :include_in_dictionary)

  # instance methods

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = attributes.fetch(:id)
    @creation_time = Time.now
    @include_in_dictionary = true
    @definitions = []
  end

  # class methods

  




end
