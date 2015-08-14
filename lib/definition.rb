class Definition

  @@definitions = []
  @@counter = 0

  attr_reader(:word, :type, :definition_text, :id, :creation_time, :include_in_dictionary)
  attr_writer(:include_in_dictionary)

  # instance methods

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @type = attributes.fetch(:type)
    @definition_text = attributes.fetch(:definition_text)
    @id = @@counter
    @creation_time = Time.now
    @include_in_dictionary = true
    @@counter += 1
    @@definitions.push(self)
    parent_word = Word.find_word(@word)
    parent_word.add_definition(self) unless parent_word == nil
  end

  # class methods

  define_singleton_method(:clear) do
    @@definitions = []
    @@counter = 0
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_singleton_method(:find_definition) do |definition_id_sought|
    found_definition = nil
    @@definitions.each do |definition_searched|
      if definition_searched.id == definition_id_sought
        found_definition = definition_searched
      end
    end
    found_definition
  end

end
