
# Wrapper around DynamoDb, or Azure's and Google's equivalent
#
module Hodor::Vice
  class CloudDatabase

    def initialize(keyid)
      @table = project.resolve(:table, keyid)
    end

    def project
      Project.instance()
    end

=begin
    def lookup(key)
      nil
    end

    class << self
      def project
        Project.instance()
      end

      def store(store_type, json)
        @table = project.resolve(store_type)
      end
    end
=end
  end
end
