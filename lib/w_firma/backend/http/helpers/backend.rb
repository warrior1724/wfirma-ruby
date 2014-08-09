# encoding: utf-8
class WFirma
  module Backend
    class Http
      module Helpers
        module Backend

          def connection
            if @backend.respond_to?(:connection)
              @backend.connection
            else
              raise Exception, 'Http backend does not supply #connection method'
            end
          end

          def backend
            unless @backend.nil?
              @backend
            else
              raise Exception, "Http backend connection is not mounted'"
            end
          end

        end
      end
    end
  end
end