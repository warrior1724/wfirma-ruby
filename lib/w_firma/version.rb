# encoding: utf-8
class WFirma
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 1
    BUILD = 'pre1'

    STRING = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')
  end
end