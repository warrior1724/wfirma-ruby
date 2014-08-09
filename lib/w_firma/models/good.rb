# encoding: utf-8
require_relative 'base_model'

class WFirma
  module Models
    class Good < BaseModel
      attr_accessor :id

      # Serialize object to Hash
      def to_hash
        {
          id: @id
        }
      end

      # Check if object is valid
      def valid?
        
      end

    end
  end
end