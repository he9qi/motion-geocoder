module MotionGeocoder

  module GoogleApi

    module Place
      extend self

      def auto_complete(input, &block)
        url = auto_complete_url input

        AFMotion::JSON.get(url) do |res|
          pres = res.object['predictions'].map do |pre|
            { address: pre['description'], place_id: pre['place_id'] }
          end

          block.call pres
        end
      end

      def auto_complete_url(input, params={})
        "#{MotionGeocoder::GoogleApi.root}place/autocomplete/json?key=#{MotionGeocoder::GoogleApi.key}&input=#{input}"
      end

    end


  end

end
