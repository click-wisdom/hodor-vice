require_relative "key_space"
require_relative "profile"

module Hodor::Vice
  class User
    attr_reader :name, :variables, :profile

    def initialize name
      @name = name
      @variables = KeySpace.new(user: name)
      @profile = Profile.new(name)
    end
  end
end
