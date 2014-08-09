# encoding: utf-8
require 'spec_helper'

describe WFirma::Version do

  subject { WFirma::Version }

  it 'return string' do
    expect(subject::STRING).to match(/(\d\.\d\.\d)/)
  end

end