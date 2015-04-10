require_relative './base_service'



# encoding: utf-8
#
# WARNING: Do not edit by hand, this file was generated by Crank:
#
#   https://github.com/gocardless/crank

module GoCardless
  module Services
    class RedirectFlowService < BaseService

    
      

            # Creates a redirect flow object which can then be used to redirect your
    # customer to the GoCardless Pro hosted payment pages.
        # Example URL: /redirect_flows
        # @param options: any query parameters, in the form of a hash
        def create(
          options = {}
        )
        path = nil
        
          path = "/redirect_flows"
        

        
        
          new_options = {}
          new_options[envelope_key] = options
          options = new_options
        
        
        response = make_request(:post, path, options)
        
          Resources::RedirectFlow.new(unenvelope_body(response.body))
        
        end

        
        
      

            # Returns all details about a single redirect flow
        # Example URL: /redirect_flows/:identity
        #
        # @param identity:       # Unique identifier, beginning with "RE" }}
        # @param options: any query parameters, in the form of a hash
        def get(
          identity, options = {}
        )
        path = nil
        
          path = sub_url("/redirect_flows/:identity", { 
            "identity" => identity
          })
        

        
        
        
        response = make_request(:get, path, options)
        
          Resources::RedirectFlow.new(unenvelope_body(response.body))
        
        end

        
        
      

            # This creates a
    # [customer](https://developer.gocardless.com/pro/#api-endpoints-customers),
    # [customer bank
    # account](https://developer.gocardless.com/pro/#api-endpoints-customer-bank-account),
    # and
    # [mandate](https://developer.gocardless.com/pro/#api-endpoints-mandates)
    # using the details supplied by your customer and returns the ID of the
    # created mandate.
    # 
    # This will return a
    # `redirect_flow_incomplete` error if your customer has not yet been
    # redirected back to your site, and a `redirect_flow_already_completed`
    # error if your integration has already completed this flow. It will return
    # a `bad_request` error if the `session_token` differs to the one supplied
    # when the redirect flow was created.
        # Example URL: /redirect_flows/:identity/actions/complete
        #
        # @param identity:       # Unique identifier, beginning with "RE" }}
        # @param options: any query parameters, in the form of a hash
        def complete(
          identity, options = {}
        )
        path = nil
        
          path = sub_url("/redirect_flows/:identity/actions/complete", { 
            "identity" => identity
          })
        

        
        
          new_options = {}
          new_options[envelope_key] = options
          options = new_options
        
        
        response = make_request(:post, path, options)
        
          Resources::RedirectFlow.new(unenvelope_body(response.body))
        
        end

        
        

        def unenvelope_body(body)
          body[envelope_key] || body["data"]
        end

        private

        def envelope_key
          "redirect_flows"
        end

        def sub_url(url, param_map)
          param_map.reduce(url) do |new_url, (param, value)|
            new_url.gsub(":#{param}", value)
          end
        end
    end
  end
end

