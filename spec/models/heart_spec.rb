# frozen_string_literal: true

require 'rails_helper'

describe Heart do
  let(:heart) { FactoryBot.create :heart }

  it 'should belongs_to user' do
    expect(Heart.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'should belongs_to image' do
    expect(Heart.reflect_on_association(:image).macro).to eq(:belongs_to)
  end

  it 'is invalid without an user_id' do
    expect(FactoryBot.build(:heart, user_id: nil)).not_to be_valid
  end
end
