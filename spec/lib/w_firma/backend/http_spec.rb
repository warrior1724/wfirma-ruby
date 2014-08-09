# encoding: utf-8
require 'spec_helper'
require 'w_firma/backend/http'

describe WFirma::Backend::Http do

  it 'return string' do
    expect(subject).to be_an_instance_of WFirma::Backend::Http
  end

  context '#api_base_url' do
    context 'config missing' do
      it { expect(subject.api_base_url).to eql subject.class::DEFAULT_API_PATH }
    end

    context 'config present' do
      let(:new_api_url) { 'http://new.pl' }
      before { subject.instance_variable_get("@config").wfirma_api_url = new_api_url }
      it { expect(subject.api_base_url).to eql new_api_url }
    end
  end

  it '#user_agent_string' do
    expect(subject.user_agent_string).to be_an_instance_of String
  end

end