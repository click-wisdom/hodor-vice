module Hodor::Vice
  class Profile
    attr_reader :name, :key, :secret

    def initialize(name)
      @name = name
      @key, @secret = load_profile(name)
    end

    def load_profile(name)
      [nil, nil]
    end

    class << self
      def find_all()
        []
      end
    end
  end
end
