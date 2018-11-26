# frozen_string_literal: true

require 'rails_helper'

describe Comment do
  let(:comment) { FactoryBot.create :comment }

  it 'should belongs_to user' do
    expect(Comment.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'should belongs_to image' do
    expect(Comment.reflect_on_association(:image).macro).to eq(:belongs_to)
  end

  it 'is invalid without an body' do
    expect(FactoryBot.build(:comment, body: nil)).not_to be_valid
  end

  it 'is invalid without an user' do
    expect(FactoryBot.build(:comment, user: nil)).not_to be_valid
  end
end
