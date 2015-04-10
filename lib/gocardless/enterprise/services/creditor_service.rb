require_relative './base_service'



# encoding: utf-8
#
# WARNING: Do not edit by hand, this file was generated by Crank:
#
#   https://github.com/gocardless/crank

module GoCardless
  module Services
    class CreditorService < BaseService

    
      

            # Creates a new creditor.
        # Example URL: /creditors
        # @param options: any query parameters, in the form of a hash
        def create(
          options = {}
        )
        path = nil
        
          path = "/creditors"
        

        
        
          new_options = {}
          new_options[envelope_key] = options
          options = new_options
        
        
        response = make_request(:post, path, options)
        
          Resources::Creditor.new(unenvelope_body(response.body))
        
        end

        
        
      

            # Returns a
    # [cursor-paginated](https://developer.gocardless.com/pro/#overview-cursor-pagination)
    # list of your creditors.
        # Example URL: /creditors
        # @param options: any query parameters, in the form of a hash
        def list(
          options = {}
        )
        path = nil
        
          path = "/creditors"
        

        
        
        
        response = make_request(:get, path, options)
        
          ListResponse.new(
            raw_response: response,
            unenveloped_body: unenvelope_body(response.body),
            resource_class: Resources::Creditor
          )
        
        end

        
        def all(options = {})
          Paginator.new(
            service: self,
            path: "/creditors",
            options: options
          ).enumerator
        end
        
        
      

            # Retrieves the details of an existing creditor.
        # Example URL: /creditors/:identity
        #
        # @param identity:       # Unique identifier, beginning with "CR". }}
        # @param options: any query parameters, in the form of a hash
        def get(
          identity, options = {}
        )
        path = nil
        
          path = sub_url("/creditors/:identity", { 
            "identity" => identity
          })
        

        
        
        
        response = make_request(:get, path, options)
        
          Resources::Creditor.new(unenvelope_body(response.body))
        
        end

        
        
      

            # Updates a creditor object. Supports all of the fields supported when
    # creating a creditor.
        # Example URL: /creditors/:identity
        #
        # @param identity:       # Unique identifier, beginning with "CR". }}
        # @param options: any query parameters, in the form of a hash
        def update(
          identity, options = {}
        )
        path = nil
        
          path = sub_url("/creditors/:identity", { 
            "identity" => identity
          })
        

        
        
        
          new_options = {}
          new_options[envelope_key] = options
          options = new_options
        
        response = make_request(:put, path, options)
        
          Resources::Creditor.new(unenvelope_body(response.body))
        
        end

        
        

        def unenvelope_body(body)
          body[envelope_key] || body["data"]
        end

        private

        def envelope_key
          "creditors"
        end

        def sub_url(url, param_map)
          param_map.reduce(url) do |new_url, (param, value)|
            new_url.gsub(":#{param}", value)
          end
        end
    end
  end
end

