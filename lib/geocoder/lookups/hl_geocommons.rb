require 'geocoder/lookups/base'
require "geocoder/results/hl_geocommons"

module Geocoder::Lookup
  class HlGeocommons < Base

    private # ---------------------------------------------------------------

    def results(query, reverse = false)
      return [] unless doc = fetch_data(query, reverse)
      if doc['error'].nil?
        features = doc['features']
        features = [] unless features.kind_of?(Array)
        return features
      else
        warn "HL Geocommons service error: #{doc['error']}."
      end
      return []
    end

    def query_url(query, reverse = false)
      "http://173.230.145.245/json?" + hash_to_query(:q => query)
    end
  end
end

