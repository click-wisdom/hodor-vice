require "key_space"

module Hodor
  class Team
    attr_reader name, variables
    attr_reader members

    def initialize(name)
      @name = name
      @variables = KeySpace.new(team: name)
    end

    def add user
      members << user
    end
  end
end
