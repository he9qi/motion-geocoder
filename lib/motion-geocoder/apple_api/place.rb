module MotionGeocoder
  module AppleApi
    module Place
      @@local_search = nil

      def self.auto_complete(input, params={}, &block)
        lat = params[:lat]
        lng = params[:lng]
        rad = params[:radius] || 5000

        @@local_search.cancel if !!@@local_search

        region = MKCoordinateRegionMakeWithDistance \
          CLLocationCoordinate2DMake(lat, lng), rad, rad
        request = MKLocalSearchRequest.alloc.init
        request.region = region
        request.naturalLanguageQuery = NSString.stringWithUTF8String(input)

        @@local_search = MKLocalSearch.alloc.initWithRequest request
        @@local_search.startWithCompletionHandler lambda {|response, e|
          if response && !response.mapItems.empty?
            results = response.mapItems.map do |item|
              {
                name: item.name,
                address: item.placemark.title,
                coordinate: {
                    lat: item.placemark.coordinate.latitude,
                    lng: item.placemark.coordinate.longitude
                  }
              }
            end
            block.call results
          end
        }

      end

    end
  end

end
