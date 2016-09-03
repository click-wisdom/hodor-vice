module Hodor::Vice
  class CloudFile

    def initialize(keyid)
      @path = project.resolve(:remote_path, keyid)
    end

    def project
      Project.instance()
    end

    def lookup(key)
      nil
    end
  end
end
