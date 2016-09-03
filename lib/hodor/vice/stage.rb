require_relative "key_space"

module Hodor::Vice
  class Stage
    attr_reader :name, :variables

    def initialize(name)
      @name = name
      @variables = KeySpace.new(stage: name)
    end
  end
end
