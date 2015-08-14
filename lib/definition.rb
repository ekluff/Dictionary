class Definition

  @@definitions = []
  @@counter = 0

  attr_reader(:word, :type, :definition, :id, :creation_time, :include_in_dictionary)
  attr_writer(:include_in_dictionary)

  # instance methods

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @type = attributes.fetch(:type)
    @definition = attributes.fetch(:definition)
    @id = @@counter
    @creation_time = Time.now
    @include_in_dictionary = true
    @@counter += 1
    @@definitions.push(self)
  end






end
