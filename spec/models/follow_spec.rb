# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Follow, type: :model do
  let(:follow) { create :follow }

  it 'is an instance of Follow' do
    expect(subject).to be_an Follow
  end

  describe 'association tests' do
    it 'should belongs_to followable' do
      expect(Follow.reflect_on_association(:followable).macro).to eq(:belongs_to)
    end

    it 'should belongs_to follower' do
      expect(Follow.reflect_on_association(:follower).macro).to eq(:belongs_to)
    end
  end
end
