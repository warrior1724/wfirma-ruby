# encoding: utf-8
require_relative 'resource_name'

class WFirma
  module Backend
    class Http
      module Helpers
        module Pagination
          # Deliver methods helping with pagination in
          # WFirma specific API

          require 'active_support/core_ext/hash'

          include WFirma::Backend::Http::Helpers::ResourceName

          # TODO: Move to separate module
          class MissingLastApiResponse < StandardError ; end

          # Obtain count of pages in set
          def total_pages(payload = nil)
            details = pagination_details(payload)
            (details[:total] / details[:limit]).ceil
          end

          # Get current page
          def current_page(payload = nil)
            pagination_details(payload)[:page]
          end

          def next_page(payload = nil)
            total_pages = total_pages(payload)

            if (current_page + 1) <= total_pages
              current_page + 1
            else
              current_page
            end
          end

          def last_page?(payload = nil)
            next_page(payload) == current_page(payload)
          end

          # Return hash with pagination details
          # Input: Hash
          def get_pagination_details(payload)
            payload.with_indifferent_access[resource_name]['parameters'].
                    slice(:page, :limit, :total).
                    inject({}) { |h, (k, v)| h[k] = v.to_i; h }.
                    symbolize_keys
          end

          # Cache pagination details and obtain payload
          # from current class instance
          def pagination_details(payload = nil, force = false)
            if @pagination_details.nil? && payload.nil?
              if @last_api_response.nil?
                raise MissingLastApiResponse, "Please provide payload or set @last_api_response"
              else
                payload = @last_api_response
              end
            end

            if @pagination_details.nil? || payload || force
              @pagination_details = get_pagination_details(payload)
            end

            @pagination_details
          end

          # Reset pagination cache
          def clear_pagination_details
            @pagination_details = nil
          end

        end
      end
    end
  end
end