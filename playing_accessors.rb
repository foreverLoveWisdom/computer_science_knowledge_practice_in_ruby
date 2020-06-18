class Experiment
  #   attr_accessor :reader
  attr_reader :reader
  # attr_writer :reader

  def initialize(**args)
    @reader = args[:reader]
  end

  #   def reader
  #     @reader
  #   end

  def reader=(writer)
    @reader = writer
  end
end

exp = Experiment.new({ reader: 123 })

puts exp.reader

exp.reader = "I am a writer now"
puts exp.reader
