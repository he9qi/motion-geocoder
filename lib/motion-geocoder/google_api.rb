module MotionGeocoder

  module GoogleApi

    extend self

    def root
      "https://maps.googleapis.com/maps/api/"
    end

    def key
      @key
    end

    def register(key)
      @key = key
    end

  end

end
