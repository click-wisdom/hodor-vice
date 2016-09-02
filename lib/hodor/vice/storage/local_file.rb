module Hodor
  class LocalFile

    def initialize(keyid)
      @path = project.resolve(:local_path, keyval)
    end

    def project
      Project.instance()
    end

    def lookup(key)
      nil
    end

  end
end
