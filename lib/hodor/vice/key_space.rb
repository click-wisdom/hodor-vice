require_relative 'storage/cloud_database'
require_relative 'storage/cloud_file'
require_relative 'storage/local_file'

module Hodor::Vice
  class KeySpace

    # Knows how to load its own values in priority order

    def initialize(keyval)
      @cloud_db = CloudDatabase.new(keyval)
      @cloud_file = CloudFile.new(keyval)
      @local_file = LocalFile.new(keyval)
    end

    def lookup_tier(tier, key)
      case tier
      when :local_file; @local_file.lookup(key)
      when :cloud_file; @cloud_file.lookup(key)
      when :cloud_database;  @cloud_db.lookup(key)
      end
    end

    def lookup(key)
      @local_file.lookup(key) || @cloud_db.lookup(key) || @cloud_file.lookup(key)
    end

    def [](key)
      lookup(key)
    end

  end
end
