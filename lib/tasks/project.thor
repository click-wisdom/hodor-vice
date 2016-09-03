module Hodor
  module Cli

    class Project < ::Hodor::Command

      desc "list", "Displays a list of available workspaces"
      def list
        say "no workspaces defined"
      end

    end
  end
end
