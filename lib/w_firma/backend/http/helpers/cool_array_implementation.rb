# encoding: utf-8
require_relative 'resource_name'

class WFirma
  module Backend
    class Http
      module Helpers
        module CoolArrayImplementation
          # Due to great idea about representing array in JSON
          # implemented into WFirma.pl API we must
          # provide proper methods to return
          # valid array

          require 'active_support/core_ext/hash'
          include WFirma::Backend::Http::Helpers::ResourceName

          # Example usage:
          # Input:  { 'orders' => { '0' => {order: {id: 1}}, 'notArray' => { field: 'value' } } }
          # Output: [ {id: 1} ]
          def array_from_xmlized_response(response)
            output = []
            response[resource_name].each do |k,v|
              output.push(v[singularized_resource_name].symbolize_keys) if k =~ /^\d$/
            end
            output
          end

        end
      end
    end
  end
end