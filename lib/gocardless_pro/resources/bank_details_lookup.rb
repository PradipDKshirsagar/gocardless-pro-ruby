

# encoding: utf-8
#
# WARNING: Do not edit by hand, this file was generated by Crank:
#
#   https://github.com/gocardless/crank
#
require 'uri'

module GoCardlessPro
  # A module containing classes for each of the resources in the GC Api
  module Resources
    # Look up the name and reachability of a bank.
    # Represents an instance of a bank_details_lookup resource returned from the API
    class BankDetailsLookup
      attr_reader :available_debit_schemes

      attr_reader :bank_name
      # initialize a resource instance
      # @param object [Hash] an object returned from the API
      def initialize(object, response = nil)
        @object = object

        @available_debit_schemes = object['available_debit_schemes']
        @bank_name = object['bank_name']
        @response = response
      end

      def api_response
        ApiResponse.new(@response)
      end

      # Provides the resource as a hash of all it's readable attributes
      def to_h
        @object
      end
    end
  end
end
