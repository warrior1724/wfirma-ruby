# encoding: utf-8
require 'active_model'
require_relative 'base_model'

class WFirma
  module Models
    class Good < BaseModel
      include ActiveModel::Validations
      include Hashie::Extensions::MethodAccess
      include Hashie::Extensions::IndifferentAccess
      include Hashie::Extensions::IgnoreUndeclared

      # Find description of fields at
      # https://doc.wfirma.pl/#h2-Modu-y-API-h3-goods-h4-Akcje-do-g-ry

      property :id
      property :name
      property :code
      property :unit
      property :netto
      property :brutto
      property :lumpcode
      property :type
      property :classification
      property :discount
      property :description
      property :notes
      property :documents
      property :tags
      property :created
      property :modified
      property :count
      property :reserved
      property :min
      property :max
      property :secure
      property :visibility
      property :warehouse_type
      property :price_type
      property :vat

      # Check if object is valid
      def valid?

      end

      # Return read only fields
      # (should be only obtained from remote source)
      def read_only_fields
        [ :id, :notes, :documents, :created,
          :modified, :reserved, :warehouse_type ]
      end

    end
  end
end