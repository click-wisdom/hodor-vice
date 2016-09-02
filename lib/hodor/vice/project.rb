require "key_space"

module Hodor
  class Project
    include Singleton

    attr_reader name
    attr_reader variables
    attr_reader active_workspace

    def initialize(name)
      @name = name
      @variables = KeySpace.new(project: name)
    end

    def company
      Company.instance()
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
      @variables[:location][kvp.keys.first][endpoint]
    end

  end
end
