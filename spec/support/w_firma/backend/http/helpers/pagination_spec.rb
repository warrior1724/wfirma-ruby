# encoding: utf-8
# shared example for testing pagination helpers
require 'spec_helper'
require 'w_firma/backend/http/helpers/pagination'

# it_behaves_like 'using http pagination helpers'
RSpec.shared_examples 'a paginated http response' do

  context 'example #find payload' do

    let :payload do
      {
        subject.resource_name => {
          "0" => {
             subject.singularized_resource_name => {
                "id"  => "709035"
            }
          },
          "parameters" => {
            "limit" => "20",
            "total" => "1122",
            "page"  => "1"
          }
        }
      }
    end

    it '#get_pagination_details' do
      expect(subject.get_pagination_details(payload)).to eql(
        { limit: 20, total: 1122, page: 1 }
      )
    end

    it '#pagination_details' do
      expect(subject.pagination_details(payload)).to eql(
        { limit: 20, total: 1122, page: 1 }
      )
    end

    it '#total_pages' do
      expect(subject.total_pages(payload)).to eql 56
    end

    context 'on first page' do
      it '#next_page' do
        expect(subject.next_page(payload)).to eql 2
      end
    end

    context 'on last page' do
      let :last_page_payload do
        new_payload = payload.dup
        new_payload[subject.resource_name]['parameters'].merge!('page' => 56)
        new_payload
      end

      it '#next_page' do
        expect(subject.next_page(last_page_payload)).to eql 56
      end

      it '#last_page?' do
        expect(subject.last_page?(last_page_payload)).to eql true
      end
    end

  end
end
