# encoding: utf-8
require 'spec_helper'

describe WFirma::Configuration do

  context 'new instance' do
    let(:sample_value) { "val#{rand(666_666)}" }

    it 'return object' do
      expect(subject).to be_an_instance_of WFirma::Configuration
    end

    it 'set configuration' do
      subject.config.login = sample_value
      expect(subject.config.login).to eql(sample_value)
    end

  end

end