# encoding: utf-8
require 'spec_helper'
require 'w_firma/backend/http/goods'

describe WFirma::Backend::Http::Goods do
  it_behaves_like 'a paginated http response'
  it_behaves_like 'a cool array implementation'

  it('#resource_name')              { expect(subject.resource_name).to(eql('goods')) }
  it('#singularized_resource_name') { expect(subject.singularized_resource_name).to(eql('good')) }

end