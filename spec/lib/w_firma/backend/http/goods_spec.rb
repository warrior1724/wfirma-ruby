# encoding: utf-8
require 'spec_helper'
require 'w_firma/backend/http/goods'

describe WFirma::Backend::Http::Goods, :vcr do
  it_behaves_like 'a paginated http response'
  it_behaves_like 'a cool array implementation'

  it('#resource_name')              { expect(subject.resource_name).to(eql('goods')) }
  it('#singularized_resource_name') { expect(subject.singularized_resource_name).to(eql('good')) }

  context 'http backend' do
    subject do
      described_class.new(http_backend: WFirma::Backend::Http.new(config: TestingConfiguration.instance))
    end

    context '#get' do
      it 'return Good object' do
        expect(subject.get(id: '709035')).to be_an_instance_of WFirma::Models::Good
      end
    end

    context '#find' do
      let(:find_query) { subject.find }

      it 'return Array' do
        expect(find_query).to be_an_instance_of Array
      end

      it 'include Good object' do
        expect(find_query[0]).to be_an_instance_of WFirma::Models::Good
      end
    end

    context '#create' do
      let(:sample_good) do
        { name: 'marchewka', unit: 'szt.', count: 1,
          netto: 14.0, vat: 23, min: 5, max: 25, secure: 15 }
      end

      let(:create_query) { subject.create(sample_good) }

      it 'return id' do
        expect(create_query.id).not_to be_nil
      end

      it 'return brutto' do
        expect(create_query.brutto).not_to be_nil
      end
    end

    context '#delete' do
      context 'not existing object' do
        let(:good_id) { 129401345 }

        it 'raise error' do
          expect{ subject.delete(id: good_id) }.to raise_error(WFirma::Backend::Http::Error::NotFound)
        end
      end

      context 'existing object' do
        let(:good_id) { 1294031 }

        it 'return deleted instance' do
          expect(subject.delete(id: good_id)).to be_an_instance_of(WFirma::Models::Good)
        end
      end
    end


    context '#update' do
      let(:new_fields) { { name: 'super marchewka' } }

      context 'existing object' do
        let(:good_id) { 1294021 }

        it 'replaces fields' do
          obj = subject.update({id: good_id}.merge(new_fields))
          expect(obj.name).to eql 'super marchewka'
        end


      end

    end

  end

end