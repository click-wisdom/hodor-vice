require 'json'
require 'hodor/vice'

class Vice::Workspace < ::Hodor::Command

    no_tasks do

      def project
        ::Hodor::Vice::Project.instance()
      end

      def workspace
        project.active_workspace()
      end

    end

    desc "show", "Show details about the active workspace"
    def show
      project.create("hello")
      say "Active Workspace: #{workspace.name}"
    end

    desc "list", "Displays a list of available workspaces"
    def list
      say "workspace: #{workspace.name}"
    end

end
