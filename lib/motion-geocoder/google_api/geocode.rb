module MotionGeocoder

  module GoogleApi

    module Geocode
      extend self

      def call(lat, lng, &block)
        url = reverse_geo_url lat, lng

        AFMotion::JSON.get(url) do |res|
          block.call formatted_address(res)
        end
      end

      def formatted_address(res)
        case res.object['status']
        when "OK"
          res.object['results'][0]['formatted_address']
        else
          nil
        end
      end

      def reverse_geo_url(lat, lng)
        "#{MotionGeocoder::GoogleApi.root}geocode/json?latlng=#{lat},#{lng}&key=#{MotionGeocoder::GoogleApi.key}"
      end

    end

  end

end
