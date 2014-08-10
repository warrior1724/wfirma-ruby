# encoding: utf-8
require 'hashie'

class WFirma
  module Models
    class BaseModel < Hashie::Trash
      # Base model for WFirma models
      # extending Hash behaviour
    end
  end
end