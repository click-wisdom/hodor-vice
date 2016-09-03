require_relative "key_space"

module Hodor::Vice
  class Region
    attr_reader :name

    def initialize(name)
      @name = name
      @variables = KeySpace.new(region: name)
    end
  end
end
