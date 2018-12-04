# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  controller do
    def index; end
  end

  before do
    sign_in(create(:valid_user))
  end

  context '#set_locale' do
    before do
      get :index, params: { locale: :en }, format: 'text/html'
    end

    it 'should be set locale from params' do
      expect(I18n.locale).to eq :en
    end
  end
end
