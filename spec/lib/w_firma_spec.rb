# encoding: utf-8
require 'spec_helper'

describe WFirma do

  context 'new instance' do
    it 'return object' do
      expect(subject).to be_an_instance_of WFirma
    end

    context 'custom configuration' do
      let(:sample_value) { "val#{rand(666_666)}" }

      it { expect(subject).to respond_to(:config) }
      it { expect(subject).to respond_to(:backend) }

      it '#config' do
        subject.config do |c|
          c.login = sample_value
        end

        expect(subject.config.login).to eql(sample_value)
      end
    end

  end

end