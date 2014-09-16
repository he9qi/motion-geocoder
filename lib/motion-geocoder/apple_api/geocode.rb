module MotionGeocoder
  module AppleApi
    module Geocode
      extend self

      def call(lat, lng, &block)

        start_loc = CLLocation.alloc.initWithLatitude lat, longitude: lng
        geocoder  = CLGeocoder.alloc.init
        geocoder.reverseGeocodeLocation start_loc, completionHandler: lambda {|location, x|
          unless location.empty?
            title = "#{location[0].name} #{location[0].locality}" #{location[0].postalCode}
            block.call title
          end
        }

      end

    end
  end
end
