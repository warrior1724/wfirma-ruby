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

        # Get all available goods
        def find(opts = {})
          connection
        end

        # Create new Good
        def create(opts = {})
          connection
        end

        # Delete existing Good
        def delete(opts = {})
          connection
        end

        # Update existing Good
        def update(opts = {})
          connection
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