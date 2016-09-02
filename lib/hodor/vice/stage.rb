require "key_space"

module Hodor
  class Stage
    attr_reader name, variables

    def initialize
      @name = name
      @variables = KeySpace.new(stage: name)
    end
  end
end
