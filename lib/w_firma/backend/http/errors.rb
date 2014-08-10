# encoding: utf-8
class WFirma
  module Backend
    class Http
      module Error

        # List of generic errors that could occur in http api
        # for wFirma.pl services

        class WFirmaHttpApiError < StandardError ; end

        class ActionNotFound < WFirmaHttpApiError ; end
        class NotFound < WFirmaHttpApiError ; end
        class AuthenticationFailure < WFirmaHttpApiError ; end
        class AccessTemporaryDisabled < WFirmaHttpApiError ; end
        class FatalError < WFirmaHttpApiError ; end
        class InputError < WFirmaHttpApiError ; end
        class OtherError < WFirmaHttpApiError ; end
        class OutOfService < WFirmaHttpApiError ; end
        class DeniedScopeRequested < WFirmaHttpApiError ; end

      end
    end
  end
end