# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'categories/edit', type: :view do
  it 'infers the controller path' do
    expect(controller.request.path_parameters[:controller]).to eq('categories')
    expect(controller.controller_path).to eq('categories')
  end

  it 'infers the controller action' do
    expect(controller.request.path_parameters[:action]).to eq('edit')
  end

  # before(:each) do
  #   @category = assign(:valid_category, Category.create!)
  # end
  #
  # it "renders the form partial" do
  #   stub_template "categories/_form.html.erb" => "This content"
  #   render
  #   expect(rendered).to match /This content/
  # end
end
