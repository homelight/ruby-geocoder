require 'geocoder/results/base'

module Geocoder::Result
  class HlGeocommons < Base
    def coordinates
      @data['geometry']['coordinates']
    end

    def city
      @data['properties']['city']
    end

    def postal_code
      @data['properties']['zip']
    end
  end
end
