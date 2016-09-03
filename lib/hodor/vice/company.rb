require_relative "key_space"
require 'singleton'

module Hodor::Vice
  class Company
    include Singleton

    attr_reader :name
    attr_reader :variables  # KeySpace

    def initialize(name)
      @name = name
      @variables = KeySpace.new(company: name)
    end

  end
end
