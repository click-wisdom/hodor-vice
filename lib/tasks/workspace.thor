require 'json'
require 'hodor/vice'

module Hodor
  module Cli

      class Workspace < ::Hodor::Command

        no_tasks do

          def project
            Hodor::Vice::Api::Project.instance()
          end

          def workspace
            project.active_workspace()
          end

        end

        desc "show", "Show details about the active workspace"
        def show
          say "Active Workspace: #{workspace.name}"
        end

        desc "list", "Displays a list of available workspaces"
        def list
          say "workspace: #{workspace.name}"
        end

      end
  end

end
