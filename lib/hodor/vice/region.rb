
require "key_space"

module Hodor
  class Region
    attr_reader name

    def initialize
      @name = name
      @variables = KeySpace.new(region: name)
    end
  end
end
