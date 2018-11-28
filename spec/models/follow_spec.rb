# frozen_string_literal: true

require 'rails_helper'

describe Follow, type: :model do
  let(:follow) { FactoryBot.create :follow }

  describe 'association tests' do
    it 'should belongs_to followable' do
      expect(Follow.reflect_on_association(:followable).macro).to eq(:belongs_to)
    end

    it 'should belongs_to follower' do
      expect(Follow.reflect_on_association(:follower).macro).to eq(:belongs_to)
    end
  end
end
