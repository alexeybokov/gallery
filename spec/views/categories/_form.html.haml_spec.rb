# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'categories/_form', type: :view do
  it 'includes a link to new' do
    expect(controller.request.path_parameters[:action]).to be_nil
  end
end
