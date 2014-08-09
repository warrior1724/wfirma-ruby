# encoding: utf-8
class WFirma
  module Backend
    class Http
      module Helpers
        module ResourceName
          require 'active_support/core_ext/string'

          # Require resource_name for keeping things DRY
          # Proper implementation should return
          # pluralized resource name
          def resource_name
            raise NoMethodError, 'Define method #resource_name'
          end

          def singularized_resource_name
            resource_name.singularize
          end

        end
      end
    end
  end
end