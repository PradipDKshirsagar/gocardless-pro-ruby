require_relative './base_service'

# encoding: utf-8
#
# WARNING: Do not edit by hand, this file was generated by Crank:
#
#   https://github.com/gocardless/crank

module GoCardlessPro
  module Services
    # Service for making requests to the RedirectFlow endpoints
    class RedirectFlowsService < BaseService
      # Creates a redirect flow object which can then be used to redirect your
      # customer to the GoCardless hosted payment pages.
      # Example URL: /redirect_flows
      # @param options [Hash] parameters as a hash, under a params key.
      def create(options = {})
        path = '/redirect_flows'

        params = options.delete(:params) || {}
        options[:params] = {}
        options[:params][envelope_key] = params
        response = make_request(:post, path, options)

        return if response.body.nil?

        Resources::RedirectFlow.new(unenvelope_body(response.body), response)
      end

      # Returns all details about a single redirect flow
      # Example URL: /redirect_flows/:identity
      #
      # @param identity       # Unique identifier, beginning with "RE".
      # @param options [Hash] parameters as a hash, under a params key.
      def get(identity, options = {})
        path = sub_url('/redirect_flows/:identity', 'identity' => identity)

        response = make_request(:get, path, options)

        return if response.body.nil?

        Resources::RedirectFlow.new(unenvelope_body(response.body), response)
      end

      # This creates a [customer](#core-endpoints-customers), [customer bank
      # account](#core-endpoints-customer-bank-accounts), and
      # [mandate](#core-endpoints-mandates) using the details supplied by your
      # customer and returns the ID of the created mandate.
      #
      # This will return a
      # `redirect_flow_incomplete` error if your customer has not yet been redirected
      # back to your site, and a `redirect_flow_already_completed` error if your
      # integration has already completed this flow. It will return a `bad_request`
      # error if the `session_token` differs to the one supplied when the redirect
      # flow was created.
      # Example URL: /redirect_flows/:identity/actions/complete
      #
      # @param identity       # Unique identifier, beginning with "RE".
      # @param options [Hash] parameters as a hash, under a params key.
      def complete(identity, options = {})
        path = sub_url('/redirect_flows/:identity/actions/complete', 'identity' => identity)

        params = options.delete(:params) || {}
        options[:params] = {}
        options[:params]['data'] = params
        response = make_request(:post, path, options)

        return if response.body.nil?

        Resources::RedirectFlow.new(unenvelope_body(response.body), response)
      end

      private

      # Unenvelope the response of the body using the service's `envelope_key`
      #
      # @param body [Hash]
      def unenvelope_body(body)
        body[envelope_key] || body['data']
      end

      # return the key which API responses will envelope data under
      def envelope_key
        'redirect_flows'
      end

      # take a URL with placeholder params and substitute them out for the acutal value
      # @param url [String] the URL with placeholders in
      # @param param_map [Hash] a hash of placeholders and their actual values
      def sub_url(url, param_map)
        param_map.reduce(url) do |new_url, (param, value)|
          new_url.gsub(":#{param}", value)
        end
      end
    end
  end
end
