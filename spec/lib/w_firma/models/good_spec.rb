# encoding: utf-8
require 'spec_helper'
require 'w_firma/models/good'

describe WFirma::Models::Good do

  context 'new instance' do
    it 'return object' do
      expect(subject).to be_an_instance_of WFirma::Models::Good
    end

    it '#id' do
      subject.id = 123
      expect(subject.id).to eql 123
    end

  end

end