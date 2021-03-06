require_relative "key_space"
require_relative "stage"
require_relative "region"
require_relative "user"

# Workspace isn't only a localhost entity. A workspace class could exist at runtime on
# AWS allowing a running lambda to load values from the active workspace as well.
#
# Also, there is exactly one "admin" workspace, that could be password protected
#
module Hodor::Vice
  class Workspace

    # Variables for this workspace
    attr_reader :name
    attr_reader :variables
    attr_reader :constraints  # limits that sub/user workspaces cannot exceed
    attr_reader :stage
    attr_reader :current_user  # user running current command
    attr_reader :members # array of users that can access this workspace. Restricted workspaces 
    attr_reader :region
    attr_reader :sandbox  # set of permissions that define the boundaries of this workspace
    attr_reader :state  # can be deployed, undeployed, hibernating, or stubbed (fake endpoints)

    # restricted workspaces (i.e. production) are more conservative with permissions
    def restricted?
      @restricted
    end

    # is this a user-specific workspace that derives from a shared workspace, or is this a parent/shared workspace
    # derived workspaces are still constrained by the constraints of its parent workspace
    def derived?
      @derived
    end

    # is this an administrative workspace, requires password to enter
    def admin?
      @admin 
    end

    def initialize(props)
      @name = props[:name]
      @variables = KeySpace.new(workspace: @name)
      @stage = Stage.new(@name)
      @region = Region.new(props[:region])
      @derived = props[:derived]
      @user = User.new(props[:profile])
      @state = props[:state]
      @restricted = props[:restricted]
      @constraints = props[:constraints]
      @members = props[:members]
      @admin = props[:admin]
    end

    def project
      Project.instance()
    end

    def company
      project.company
    end

    def team
      project.team
    end

    class << self
      def project
        Project.instance()
      end

      def create()
        # create new workspace
        workspace = Workspace.new( {
         name: 'default'
        })
        project.add_workspace(workspace)
      end

      def enter(name)
        workspace = Workspace.new(CloudDatabase.fetch(workspace: name))
        project.activate_workspace(workspace)
      end
    end

    def lookup_tier(tier, key)
      region.lookup_tier(tier, key) ||
        user.lookup_tier(tier, key) ||
        stage.lookup_tier(tier, key) ||
        this.variables.lookup_tier(tier, key) ||
        project.lookup_tier(tier, key) ||
        team.lookup_tier(tier, key) ||
        company.lookup_tier(tier, key)
    end

    def lookup(key)
      lookup_tier(:local_file, key) ||
        lookup_tier(:cloud_database, key) ||
        lookup_tier(:cloud_file, key)
    end

    def save()
      CloudDatabase.store( {workspace: @name}, this.to_json())
    end

    def diff()
      # check if the remote environment agrees with the state in dynamo_db.  Manually removing
      # resources could cause the workflows stored state to become out of sync with the remote
      # environment
    end

    def grant(requesting_user)
      permbox = @sandbox.expand(this, requesting_user)
      permbox.deploy
    end

    def deploy()
    end

    def undeploy()  # or remove?
    end

    def activate()
    end

    def hibernate()
    end

    def wake()
    end

    def to_json()
    end

  end
end
