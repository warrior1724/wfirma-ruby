# encoding: utf-8
require_relative 'helpers/backend'
require_relative 'helpers/cool_array_implementation'
require_relative 'helpers/pagination'

class WFirma
  module Backend
    class Http
      class Goods

        # This class is responsible for shipping
        # methods for managing with goods (magazine) section

        include Helpers::Backend
        include Helpers::Pagination
        include Helpers::CoolArrayImplementation

        def initialize(opts = {})
          @backend = opts[:http_backend]
        end


        # Get given goods
        # Required keys: :id
        def get(opts = {})
          response = connection.get("/goods/get/#{opts[:id]}")
          results  = array_from_xmlized_response(response.body)
          WFirma::Models::Good.new(results[0]) if results.size > 0
        end

        # Get all available goods
        def find(opts = {})
          opts[:limit] ||= 20
          opts[:page]  ||= 1

          response = connection.get("/goods/find", opts)
          body     = set_last_response(response.body)
          results  = array_from_xmlized_response(response.body).map do |good|
            WFirma::Models::Good.new(good)
          end
        end

        # Create new Good
        def create(opts = {})
          good_obj = WFirma::Models::Good.new(opts)
          response = connection.post("/goods/add", array_to_xmlized_response([good_obj.to_hash]))
          body     = array_from_xmlized_response(response.body)
          if body.size > 0
            WFirma::Models::Good.new(body[0])
          end
        end

        # Delete existing Good
        def delete(opts = {})
          response = connection.delete("/goods/delete/#{opts[:id]}")
          body     = array_from_xmlized_response(response.body)

          if body.size > 0
            WFirma::Models::Good.new(body[0].merge(deleted: true))
          end
        end

        # Update existing Good
        def update(opts = {})
          good_obj = WFirma::Models::Good.new(opts)
          response = connection.post("/goods/edit/#{good_obj.id}", array_to_xmlized_response([good_obj.to_hash]))
          body     = array_from_xmlized_response(response.body)

          if body.size > 0
            WFirma::Models::Good.new(body[0].merge(deleted: true))
          end
        end

        def resource_name
          'goods'
        end

        private

        def default_find_opts
          { limit: 20 }
        end

      end
    end
  end
end