require_relative "key_space"
require 'singleton'

module Hodor::Vice
  class Team
    include Singleton

    attr_reader :name, :variables
    attr_reader :members

    def initialize(name)
      @name = name
      @variables = KeySpace.new(team: name)
    end

    def add user
      (members ||= []) << user
    end
  end
end
