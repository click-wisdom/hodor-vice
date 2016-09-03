module Hodor::Vice
  class LocalFile

    def initialize(keyid)
      @path = project.resolve(:local_path, keyid)
    end

    def project
      Project.instance()
    end

    def lookup(key)
      nil
    end

  end
end
