module Hodor
  class CloudFile

    def initialize(keyid)
      @path = project.resolve(:remote_path, keyval)
    end

    def project
      Project.instance()
    end

    def lookup(key)
      nil
    end
  end
end
