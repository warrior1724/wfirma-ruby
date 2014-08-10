# encoding: utf-8
# shared example for testing pagination helpers
require 'w_firma/backend/http/helpers/cool_array_implementation'

# it_behaves_like 'a cool array implementation'
RSpec.shared_examples 'a cool array implementation' do

  context 'example #find payload' do

    let :clear_payload do
      {
        subject.resource_name => {
          "0" => {
            subject.singularized_resource_name => { "id"  => "1"}
          },
          "1" => {
            subject.singularized_resource_name => { "id"  => "2" }
          },
          "2" => {
            subject.singularized_resource_name => { "id"  => "3" }
          }
        }
      }
    end

    let :payload do
      _payload = clear_payload.dup
      _payload[subject.resource_name]["parameters"] = {
        "key" => "value"
      }
      _payload
    end

    let :result do
      [ { id: '1' }, { id: '2' }, { id: '3' } ]
    end

    it '#array_from_xmlized_response' do
      expect(subject.array_from_xmlized_response(payload)).to eql(result)
    end

    it '#array_to_xmlized_response' do
      expect(subject.array_to_xmlized_response(result)).to eql(clear_payload)
    end

  end
end
