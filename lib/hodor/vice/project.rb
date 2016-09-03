#require "key_space"
require 'singleton'
require_relative 'key_space'
require_relative 'workspace'

module Hodor::Vice
  class Project
    include Singleton

    attr_reader :name
    attr_reader :variables
    attr_reader :active_workspace

    def initialize()
    end

    def create(name)
      @active_workspace = Workspace.new({
        name: "default" 
      })
      @name = name
      @variables = KeySpace.new(project: name)
    end

    def company
      Company.instance()
    end

    def team
      Team.instance()
    end

    def workspace_by_name(name)
      # lookup workspace by nmae
    end

    def add_workspace(workspace)
    end

    def activate_workspace(workspace)
      @active_workspace = workspace
    end

    def resolve(endpoint, kvp)
      #@variables[:location][kvp.keys.first][endpoint]
    end
  end
end
