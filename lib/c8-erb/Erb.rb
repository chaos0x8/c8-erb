autoload :ERB, 'erb'

module C8
  module Detail
    def self.empty_binding
      binding
    end
  end

  def erb variables, data, trim_mode: '-'
    b = C8::Detail.empty_binding

    variables.each { |key, value|
      b.local_variable_set(key, value)
    }

    erb = ERB.new(data, nil, trim_mode)
    erb.result b
  end

  module_function :erb
end

