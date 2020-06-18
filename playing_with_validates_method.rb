class Array
  def extract_options!
    if last.is_a?(Hash) && last.extractable_options?
      pop
    else
      {}
    end
  end
end

class Hash
  def extractable_options?
    instance_of?(Hash)
  end
end

def validates(*attributes)
  puts "\nAttributes are: "
  print attributes
  defaults = attributes.extract_options!.dup
  puts "Defaults is: #{defaults}"

  validations = defaults.slice!(*_validates_default_keys)

  # raise ArgumentError, "You need to supply at least one attribute" if attributes.empty?
  # raise ArgumentError, "You need to supply at least one validation" if validations.empty?

  # defaults[:attributes] = attributes

  # validations.each do |key, options|
  #   next unless options
  #   key = "#{key.to_s.camelize}Validator"

  #   begin
  #     validator = key.include?("::") ? key.constantize : const_get(key)
  #   rescue NameError
  #     raise ArgumentError, "Unknown validator: '#{key}'"
  #   end

  #   validates_with(validator, defaults.merge(_parse_validates_options(options)))
  # end
end

def _validates_default_keys
  [:if, :unless, :on, :allow_blank, :allow_nil, :strict]
end

validates(:content, length: { maximum: 140 })
