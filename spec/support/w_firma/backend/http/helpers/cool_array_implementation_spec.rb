# encoding: utf-8
# shared example for testing pagination helpers
require 'w_firma/backend/http/helpers/cool_array_implementation'

# it_behaves_like 'a cool array implementation'
RSpec.shared_examples 'a cool array implementation' do

  context 'example #find payload' do

    let :payload do
      {
        subject.resource_name => {
          "0" => {
            subject.singularized_resource_name => { "id"  => "1"}
          },
          "1" => {
            subject.singularized_resource_name => { "id"  => "2" }
          },
          "parameters" => {
            "key" => "value"
          },
          "3" => {
            subject.singularized_resource_name => { "id"  => "3" }
          }
        }
      }
    end

    it '#array_from_xmlized_response' do
      expect(subject.array_from_xmlized_response(payload)).to eql(
        [ { id: '1' }, { id: '2' }, { id: '3' } ]
      )
    end


  end
end
